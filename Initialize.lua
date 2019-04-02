--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

-- Performance Enhancement
local strfmt        = string.format
local strformat     = zo_strformat

local eventManager   = EVENT_MANAGER

-- Load saved settings
local function LoadSavedVars()
    -- Addon options
    LUIE.SV = ZO_SavedVars:NewAccountWide(LUIE.SVName, LUIE.SVVer, nil, LUIE.D)

    if LUIE.SV.CharacterSpecificSV then
        LUIE.SV = ZO_SavedVars:New(LUIE.SVName, LUIE.SVVer, nil, LUIE.D)
    end
end

-- Load additional fonts and status bar textures from LMP if it is present in environment
local function LoadMedia()
    local LMP = LibStub("LibMediaProvider-1.0")
    if LMP == nil then
        return
    end

    -- Update Fonts
    for _, f in pairs(LMP:List(LMP.MediaType.FONT)) do
        if not LUIE.Fonts[f] then
            LUIE.Fonts[f] = LMP:Fetch(LMP.MediaType.FONT, f)
        end
    end

    -- Update StatusBar textures
    for _, s in pairs(LMP:List(LMP.MediaType.STATUSBAR)) do
        if not LUIE.StatusbarTextures[s] then
            LUIE.StatusbarTextures[s] = LMP:Fetch(LMP.MediaType.STATUSBAR, s)
        end
    end

    for _, a in pairs(LMP:List(LMP.MediaType.SOUND)) do
        if not LUIE.StatusbarTextures[a] then
            LUIE.Sounds[a] = LMP:Fetch(LMP.MediaType.SOUND, a)
        end
    end
end

-- Startup Info string
local function LoadScreen()
    eventManager:UnregisterForEvent(LUIE.name, EVENT_PLAYER_ACTIVATED)

    if not LUIE.SV.StartupInfo then
        LUIE.PrintToChat(strfmt("|cFEFEFE%s by|r |c00C000%s|r |cFEFEFEv%s|r", LUIE.name, LUIE.author, LUIE.version), true)
    end
end

local function RegisterEvents()
    eventManager:RegisterForEvent(LUIE.name, EVENT_PLAYER_ACTIVATED, LoadScreen)
    -- Keep track of guilds for the /ginvite commands & Chat Announcement EVENT_GUILD_SELF_LEFT_GUILD handler
    if LUIE.SV.SlashCommands_Enable or LUIE.SV.ChatAnnouncements_Enable then
        LUIE.UpdateGuildData()
        eventManager:RegisterForEvent(moduleName, EVENT_GUILD_SELF_JOINED_GUILD, LUIE.UpdateGuildData)
        eventManager:RegisterForEvent(moduleName, EVENT_GUILD_SELF_LEFT_GUILD, LUIE.UpdateGuildData)
    end
end

-- LuiExtended Initialization
local function OnAddonOnLoaded(eventCode, addonName)
    -- Only initialize our own addon
    if LUIE.name ~= addonName then
        return
    end
    -- Once we know it's ours, lets unregister the event listener
    eventManager:UnregisterForEvent(addonName, eventCode)

    -- Load additional media from LMP and other addons
    LoadMedia()

    -- Load saved variables
    LoadSavedVars()

    -- Display changelog screen
    LUIE_ChangelogScreen()

    LUIE.PlayerNameRaw = GetRawUnitName("player")
    LUIE.PlayerNameFormatted = strformat(SI_UNIT_NAME, GetUnitName("player"))
    LUIE.PlayerDisplayName = strformat(SI_UNIT_NAME, GetUnitDisplayName("player"))

    -- Initialize this addon modules according to user preferences
    LUIE.ChatAnnouncements.Initialize( LUIE.SV.ChatAnnouncements_Enable )
    LUIE.CombatInfo.Initialize( LUIE.SV.CombatInfo_Enabled )
    LUIE.CombatText.Initialize ( LUIE.SV.CombatText_Enabled )
    LUIE.InfoPanel.Initialize( LUIE.SV.InfoPanel_Enabled )
    LUIE.UnitFrames.Initialize( LUIE.SV.UnitFrames_Enabled )
    LUIE.SpellCastBuffs.Initialize( LUIE.SV.SpellCastBuff_Enable )
    LUIE.SlashCommands.Initialize( LUIE.SV.SlashCommands_Enable )

    -- Load Timetamp Color
    LUIE.UpdateTimeStampColor()

    -- Create settings menu for our addon
    LUIE.CreateSettings()

    -- Register global event listeners
    RegisterEvents()

    -- Hooks
    LUIE.InitializeHooks()

end

-- Hook initialization
eventManager:RegisterForEvent(LUIE.name, EVENT_ADD_ON_LOADED, OnAddonOnLoaded)