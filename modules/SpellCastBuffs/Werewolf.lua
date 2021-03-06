--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

local SCB = LUIE.SpellCastBuffs

local callLater = zo_callLater
local eventManager = EVENT_MANAGER

local moduleName = LUIE.name .. "_SpellCastBuffs"

local g_werewolfName = "" -- Name for current Werewolf Transformation morph
local g_werewolfIcon = "" -- Icon for current Werewolf Transformation morph
local g_werewolfId = "" -- AbilityId for Werewolf Transformation morph
local g_werewolfDevour = false -- Flag set when Devouring corpses as WW - toggled on/off by EVENT_EFFECT_CHANGED
local g_werewolfCounter = 0 -- Counter for Werewolf transformation events
local g_werewolfQuest = 0 -- Counter for Werewolf transformation events (Quest)
local g_lastWerewolfPower = 0 -- Tracker for last amount of werewolf power - used to freeze counter when using Devour or entering a Werewolf Shrine

-- Function to determine what container to put the icon in (if we have it set to prominent or not)
local function ResolveContainerContext(abilityId, effectName)
    local context
    if (SCB.SV.PromDebuffTable[abilityId] or SCB.SV.PromDebuffTable[effectName]) then
        context = "promd_player"
    elseif (SCB.SV.PromBuffTable[abilityId] or SCB.SV.PromBuffTable[effectName]) then
        context = "promb_player"
    else
        context = "player1"
    end

    return context
end

-- Function to pull Werewolf Cast Bar / Buff Aura Icon based off the players morph choice
local function SetWerewolfIcon()
    local skillType, skillIndex, abilityIndex, morphChoice, rankIndex = GetSpecificSkillAbilityKeysByAbilityId(32455)
    g_werewolfName, g_werewolfIcon = GetSkillAbilityInfo(skillType, skillIndex, abilityIndex)
    g_werewolfId = GetSkillAbilityId(skillType, skillIndex, abilityIndex, false)
end

-- Setup Werewolf Timer Icon (Active)
local function SetWerewolfIconTimer(currentTime)
    SetWerewolfIcon()
    local currentPower = GetUnitPower("player", POWERTYPE_WEREWOLF)
    local duration = ( currentPower / 27 )
    -- Round up by 1 from any decimal number
    local durationFormatted = math.floor(duration + 0.999) * 1000
    local currentTime = GetGameTimeMilliseconds()
    local endTime = currentTime + durationFormatted
    local context = ResolveContainerContext(g_werewolfId, g_werewolfName)
    LUIE.EffectsList[context]["Werewolf Indicator"] = {
        target="player", type=1,
        id = g_werewolfId, name=g_werewolfName, icon=g_werewolfIcon,
        dur=38000, starts=currentTime, ends=endTime, -- ends=nil : last buff in sorting
        forced = "short",
        restart=true, iconNum=0, overrideDur = 38000
    }
end

-- Setup Werewolf Timr Icon (Frozen)
function SCB.SetWerewolfIconFrozen()
    SetWerewolfIcon()
    local context = ResolveContainerContext(g_werewolfId, g_werewolfName)
    LUIE.EffectsList[context]["Werewolf Indicator"] = {
        type=1,
        id = g_werewolfId, name=g_werewolfName, icon=g_werewolfIcon,
        dur=0, starts=1, ends=nil, -- ends=nil : last buff in sorting
        forced = "short",
        restart=true, iconNum=0
    }
end

-- Get Werewolf State for Werewolf Buff Tracker
function SCB.WerewolfState(eventCode, werewolf, onActivation)
    if werewolf then
        for i = 1, 4 do
            name, _, discovered, skillLineId = GetSkillLineInfo(SKILL_TYPE_WORLD, i)
            if skillLineId == 50 and discovered then
                g_werewolfCounter = g_werewolfCounter + 1
                if g_werewolfCounter == 3 or onActivation then
                    local currentTime = GetGameTimeMilliseconds()
                    SetWerewolfIconTimer(currentTime)
                    eventManager:RegisterForEvent(moduleName, EVENT_POWER_UPDATE, SCB.OnPowerUpdate)
                    eventManager:AddFilterForEvent(moduleName, EVENT_POWER_UPDATE, REGISTER_FILTER_POWER_TYPE, POWERTYPE_WEREWOLF, REGISTER_FILTER_UNIT_TAG, "player")
                    eventManager:RegisterForUpdate(moduleName .. "WerewolfTicker", 2000, SCB.PowerTrailer) -- Register power throttle trailer (in case player transforms into Werewolf in a shrine and no power change event occurs)
                    g_werewolfCounter = 0
                end
                return
            end
        end

        g_werewolfQuest = g_werewolfQuest + 1
        -- If we didn't return from the above statement this must be quest based werewolf transformation - so just display an unlimited duration passive as the counter.
        if g_werewolfQuest == 2 or onActivation then
            SCB.SetWerewolfIconFrozen()
            g_werewolfCounter = 0
        end
    else
        local context = ResolveContainerContext(g_werewolfId, g_werewolfName)
        LUIE.EffectsList[context]["Werewolf Indicator"] = nil
        eventManager:UnregisterForEvent(moduleName, EVENT_POWER_UPDATE)
        eventManager:UnregisterForUpdate(moduleName .. "WerewolfTicker")
        g_werewolfCounter = 0
        -- Delay resetting this value - as the quest werewolf transform event causes werewolf true, false, true in succession.
        callLater(function() g_werewolfQuest = 0 end, 5000)
    end
end

-- Power Trailer for Werewolf Buff - Sets the icon to frozen if power drain stops for 1.1 seconds (Werewolf drains power every 1 second)
function SCB.PowerTrailer()
    SCB.SetWerewolfIconFrozen()
    eventManager:UnregisterForUpdate(moduleName .. "WerewolfTicker")
end

-- EVENT_POWER_UPDATE handler for Werewolf Buff Tracker
function SCB.OnPowerUpdate(eventCode, unitTag, powerIndex, powerType, powerValue, powerMax, powerEffectiveMax)
    if g_lastWerewolfPower > powerValue then
        eventManager:UnregisterForUpdate(moduleName .. "WerewolfTicker")
    end

    -- Ignore gain from Blood Rage when hit while devouring
    local context = ResolveContainerContext(g_werewolfId, g_werewolfName)
    if LUIE.EffectsList[context]["Werewolf Indicator"] and LUIE.EffectsList[context]["Werewolf Indicator"].ends == nil then
        --if (powerValue == g_lastWerewolfPower + 99) or g_werewolfDevour then
        if g_werewolfDevour then
            return
        end
    end
    g_lastWerewolfPower = powerValue

    local currentTime = GetGameTimeMilliseconds()
    if powerValue > 0 then
        SetWerewolfIconTimer(currentTime)
    else
        local context = ResolveContainerContext(g_werewolfId, g_werewolfName)
        LUIE.EffectsList[context]["Werewolf Indicator"] = nil
    end
    eventManager:RegisterForUpdate(moduleName .. "WerewolfTicker", 1100, SCB.PowerTrailer)

    -- Remove indicator if power reaches 0 - Needed for when the player is in WW form but dead/reincarnating
    if powerValue == 0 then
        local context = ResolveContainerContext(g_werewolfId, g_werewolfName)
        LUIE.EffectsList[context]["Werewolf Indicator"] = nil
        eventManager:UnregisterForEvent(moduleName, EVENT_POWER_UPDATE)
        eventManager:UnregisterForUpdate(moduleName .. "WerewolfTicker")
        g_werewolfCounter = 0
        -- Delay resetting this value - as the quest werewolf transform event causes werewolf true, false, true in succession.
        callLater(function() g_werewolfQuest = 0 end, 5000)
    end
end

-- EVENT_EFFECT_CHANGED Listener for Werewolf Devour/De-Werewolf Tracking
function SCB.DevourEffectListener(eventCode, changeType, _, _, unitTag, _, _, _, _, _, _, _, _,_,_, abilityId, castByPlayer)
    -- Update WW icon while devouring
    if abilityId == 33208 then
        if changeType ~= EFFECT_RESULT_FADED then
            SCB.SetWerewolfIconFrozen()
            g_werewolfDevour = true
        else
            local currentTime = GetGameTimeMilliseconds()
            SetWerewolfIconTimer(currentTime)
            g_werewolfDevour = false
        end
    end

    -- Remove form icon if player cancels early
    if abilityId == 39477 and changeType == EFFECT_RESULT_GAINED then
        local context = ResolveContainerContext(g_werewolfId, g_werewolfName)
        LUIE.EffectsList[context]["Werewolf Indicator"] = nil
        eventManager:UnregisterForEvent(moduleName, EVENT_POWER_UPDATE)
        eventManager:UnregisterForUpdate(moduleName .. "WerewolfTicker")
        g_werewolfCounter = 0
    end
end
