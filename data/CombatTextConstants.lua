--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

-- CombatTextConstants namespace
LUIE.CombatTextConstants = {}

local CombatTextConstants = {
    -- Damage & Healing
    isDamage = {
        [ACTION_RESULT_DAMAGE]              = true,
        [ACTION_RESULT_FALL_DAMAGE]         = true,
    },
    isDamageCritical = {
        [ACTION_RESULT_CRITICAL_DAMAGE]     = true,
    },
    isHealing = {
        [ACTION_RESULT_HEAL]                = true,
    },
    isHealingCritical = {
        [ACTION_RESULT_CRITICAL_HEAL]       = true,
    },
    isEnergize = {
        [ACTION_RESULT_POWER_ENERGIZE]      = true,
    },
    isDrain = {
        [ACTION_RESULT_POWER_DRAIN]         = true,
    },
    isDot = {
        [ACTION_RESULT_DOT_TICK]            = true,
    },
    isDotCritical = {
        [ACTION_RESULT_DOT_TICK_CRITICAL]   = true,
    },
    isHot = {
        [ACTION_RESULT_HOT_TICK]            = true,
    },
    isHotCritical = {
        [ACTION_RESULT_HOT_TICK_CRITICAL]   = true,
    },
    damageType = {
        [DAMAGE_TYPE_NONE]                  = true,
        [DAMAGE_TYPE_GENERIC]               = true,
        [DAMAGE_TYPE_PHYSICAL]              = true,
        [DAMAGE_TYPE_FIRE]                  = true,
        [DAMAGE_TYPE_SHOCK]                 = true,
        [DAMAGE_TYPE_OBLIVION]              = true,
        [DAMAGE_TYPE_COLD]                  = true,
        [DAMAGE_TYPE_EARTH]                 = true,
        [DAMAGE_TYPE_MAGIC]                 = true,
        [DAMAGE_TYPE_DROWN]                 = true,
        [DAMAGE_TYPE_DISEASE]               = true,
        [DAMAGE_TYPE_POISON]                = true,
    },
    -- Mitigation
    mitigationType                          = { "Single Line", "Multiple Lines" },
    isMiss = {
        [ACTION_RESULT_MISS]                = true,
    },
    isImmune = {
        [ACTION_RESULT_IMMUNE]              = true,
    },
    isParried = {
        [ACTION_RESULT_PARRIED]             = true,
    },
    isReflected = {
        [ACTION_RESULT_REFLECTED]           = true,
    },
    isDamageShield = {
        [ACTION_RESULT_DAMAGE_SHIELDED]     = true,
    },
    isDodged = {
        [ACTION_RESULT_DODGED]              = true,
    },
    isBlocked = {
        [ACTION_RESULT_BLOCKED_DAMAGE]      = true,
    },
    isInterrupted = {
        [ACTION_RESULT_INTERRUPT]           = true,
    },
    -- Crowd Control
    -- TODO: WHAT IS ACTION RESULT FOR SNARE AND IMMOBILIZE?? ROOTED DOES NOT WORK
    isDisoriented = {
        [ACTION_RESULT_DISORIENTED]         = true,
    },
    isFeared = {
        [ACTION_RESULT_FEARED]              = true,
    },
    isOffBalanced = {
        [ACTION_RESULT_OFFBALANCE]          = true,
    },
    isSilenced = {
        [ACTION_RESULT_SILENCED]            = true,
    },
    isStunned = {
        [ACTION_RESULT_STUNNED]             = true,
    },
    -- Player Checks
    isPlayer = {
        [COMBAT_UNIT_TYPE_PLAYER]           = true,
        [COMBAT_UNIT_TYPE_PLAYER_PET]       = true,
    },
    -- Event Types
    eventType = {
        ALERT                       = "LUIE_CombatText_EVENT_ALERT",
        COMBAT                      = "LUIE_CombatText_EVENT_COMBAT",
        POINT                       = "LUIE_CombatText_EVENT_POINT",
        CROWDCONTROL                = "LUIE_CombatText_EVENT_CROWDCONTROL",
        RESOURCE                    = "LUIE_CombatText_EVENT_RESOURCE",
        DEATH                       = "LUIE_CombatText_EVENT_DEATH",
    },
    alertType = {
        BLOCK                       = "LUIE_CombatText_Alert_TYPE_BLOCK",
        BLOCKSTAGGER                = "LUIE_CombatText_Alert_TYPE_BLOCKSTAGGER",
        DODGE                       = "LUIE_CombatText_Alert_TYPE_DODGE",
        AVOID                       = "LUIE_CombatText_Alert_TYPE_AVOID",
        INTERRUPT                   = "LUIE_CombatText_Alert_TYPE_INTERRUPT",
        UNMIT                       = "LUIE_CombatText_Alert_TYPE_UNMIT",
        EXPLOIT                     = "LUIE_CombatText_Alert_TYPE_EXPLOIT",
        DESTROY                     = "LUIE_CombatText_Alert_TYPE_DESTROY",
        POWER                       = "LUIE_CombatText_Alert_TYPE_POWER",
        SUMMON                      = "LUIE_CombatText_Alert_TYPE_SUMMON",
        SHARED                      = "LUIE_CombatText_Alert_TYPE_SHARED",
    },
    combatType = {
        INCOMING                    = "LUIE_CombatText_COMBAT_TYPE_INCOMING",
        OUTGOING                    = "LUIE_CombatText_COMBAT_TYPE_OUTGOING",
    },
    crowdControlType = {
        DISORIENTED                 = "LUIE_CombatText_CROWDCONTROL_TYPE_DISORIENTED",
        FEARED                      = "LUIE_CombatText_CROWDCONTROL_TYPE_FEARED",
        OFFBALANCED                 = "LUIE_CombatText_CROWDCONTROL_TYPE_OFFBALANCED",
        SILENCED                    = "LUIE_CombatText_CROWDCONTROL_TYPE_SILENCED",
        STUNNED                     = "LUIE_CombatText_CROWDCONTROL_TYPE_STUNNED",
    },
    pointType = {
        ALLIANCE_POINTS             = "LUIE_CombatText_Point_TYPE_ALLIANCE_POINTS",
        EXPERIENCE_POINTS           = "LUIE_CombatText_Point_TYPE_EXPERIENCE_POINTS",
        CHAMPION_POINTS             = "LUIE_CombatText_Point_TYPE_CHAMPION_POINTS",
        IN_COMBAT                   = "LUIE_CombatText_Point_TYPE_IN_COMBAT",
        OUT_COMBAT                  = "LUIE_CombatText_Point_TYPE_OUT_COMBAT",
    },
    resourceType = {
        LOW_HEALTH                  = "LUIE_CombatText_Resource_TYPE_LOW_HEALTH",
        LOW_MAGICKA                 = "LUIE_CombatText_Resource_TYPE_LOW_MAGICKA",
        LOW_STAMINA                 = "LUIE_CombatText_Resource_TYPE_LOW_STAMINA",
        ULTIMATE                    = "LUIE_CombatText_Resource_TYPE_ULTIMATE",
        POTION                      = "LUIE_CombatText_Resource_TYPE_POTION",
    },
    poolType = {
        CONTROL                     = "LUIE_CombatText_POOL_TYPE_CONTROL",
        ANIMATION_CLOUD             = "LUIE_CombatText_POOL_TYPE_ANIMATION_CLOUD",
        ANIMATION_CLOUD_CRITICAL    = "LUIE_CombatText_POOL_TYPE_ANIMATION_CLOUD_CRITICAL",
        ANIMATION_CLOUD_FIREWORKS   = "LUIE_CombatText_POOL_TYPE_ANIMATION_CLOUD_FIREWORKS",
        ANIMATION_SCROLL            = "LUIE_CombatText_POOL_TYPE_ANIMATION_SCROLL",
        ANIMATION_SCROLL_CRITICAL   = "LUIE_CombatText_POOL_TYPE_ANIMATION_SCROLL_CRITICAL",
        ANIMATION_ELLIPSE_X         = "LUIE_CombatText_POOL_TYPE_ANIMATION_ELLIPSE_X",
        ANIMATION_ELLIPSE_Y         = "LUIE_CombatText_POOL_TYPE_ANIMATION_ELLIPSE_Y",
        ANIMATION_ELLIPSE_X_CRIT    = "LUIE_CombatText_POOL_TYPE_ANIMATION_ELLIPSE_X_CRITICAL",
        ANIMATION_ELLIPSE_Y_CRIT    = "LUIE_CombatText_POOL_TYPE_ANIMATION_ELLIPSE_Y_CRITICAL",
        ANIMATION_ALERT             = "LUIE_CombatText_POOL_TYPE_ANIMATION_ALERT",
        ANIMATION_COMBATSTATE       = "LUIE_CombatText_POOL_TYPE_ANIMATION_COMBATSTATE",
        ANIMATION_POINT             = "LUIE_CombatText_POOL_TYPE_ANIMATION_POINT",
        ANIMATION_RESOURCE          = "LUIE_CombatText_POOL_TYPE_ANIMATION_RESOURCE",
        ANIMATION_DEATH             = "LUIE_CombatText_POOL_TYPE_ANIMATION_DEATH",
    },

    -- Animation & Fonts
    outlineType                     = { "none", "outline", "thin-outline", "thick-outline", "shadow", "soft-shadow-thin", "soft-shadow-thick" },
    animationType                   = { "cloud", "hybrid", "scroll", "ellipse" },
    directionType                   = { "up", "down" },
    iconSide                        = { "none", "left", "right"},
}

-- Export string data to global namespace
LUIE.CombatTextConstants = CombatTextConstants
