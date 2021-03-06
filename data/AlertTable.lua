--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

local U = LUIE.UnitNames
local A = LUIE.GetAbility()

local STUN = 1
local DISORIENT = 2
local FEAR = 3
local STAGGER = 4
local SILENCE = 5
local SNARE = 6
local UNBREAKABLE = 7

LUIE.AlertTable = {
    -- PRIORITY NOTES:
    -- 1 = VMA/Trial/Dungeon
    -- 2 = ELITE NPC/QUEST BOSS
    -- 3 = Normal NPC

    -- bs = true -- Add indicator for Block Stagger to effect
    -- auradetect = true -- Detect aura application rather than using targeting info
    -- eventdetect = true -- Detect combat event application rather than using targeting info
    -- refire = "x" -- refire duration
    -- fakeName = string -- Set this name for the source
    -- skipcheck = true -- display on any event fired rather than just event started
    -- skipcheck -- DEPRICATE
    -- eventDetect -- doesn't need a result, ignoreRefresh = ignores refresh event here
    -- result = ONLY ON THIS ACTION RESULT!!!!

    --------------------------------------------------
    -- JUSTICE NPC'S ---------------------------------
    --------------------------------------------------

    [63157] = { block = true, dodge = true, priority = 2, bs = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Heavy Blow (Justice Guard 1H)
    [63261] = { block = true, dodge = true, priority = 2, bs = true, result = ACTION_RESULT_BEGIN, duration = 1250, cc = STUN }, -- Heavy Blow (Justice Guard 2H)
    [63179] = { block = true, dodge = true, interrupt = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1000, cc = STUN }, -- Flame Shard (Justice Guard 2H)
    [78743] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Flare (Justice Guard - Any)

    [74862] = { block = true, avoid = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Teleport Trap (Mage Guard)

    [62409] = { avoid = true, interrupt = true, priority = 3, eventdetect = true, refire = 1500, result = ACTION_RESULT_BEGIN, duration = 3500 }, -- Fiery Wind (Justice Mage NPC)
    [62472] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1000 }, -- Stab (Justice Dagger NPC)

    [78265] = { power = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Alarm (Estate Marshal) (DB DLC)

    [52471] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 2300, cc = SILENCE }, -- Nullify (Estate Spellbreaker) (DB DLC)

    [73229] = { power = true, priority = 2, auradetect = true, ignoreRefresh = true }, -- Hurried Ward (Guard - DB Mage)

    --------------------------------------------------
    -- STANDARD NPC'S --------------------------------
    --------------------------------------------------

    -- Shared
    [39058] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = UNBREAKABLE }, -- Bear Trap (Bear Trap)

    -- Synergy
    [12439] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Burning Arrow (Synergy)
    [10805] = { avoid = true, interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Ignite (Synergy)

    -- Abilities
    [29378] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1600, cc = STUN }, -- Uppercut (Ravager)

    [28408] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1533 }, -- Whirlwind (Skirmisher)

    [37108] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000, cc = SNARE }, -- Arrow Spray (Archer)
    [28628] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 6800 }, -- Volley (Archer)
    [74978] = { block = true, dodge = true, interrupt = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 9000, cc = STUN }, -- Taking Aim (Archer)

    [14096] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1250 }, -- Heavy Attack (Footsoldier)
    [28499] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200, cc = SNARE }, -- Throw Dagger (Footsoldier)

    [29400] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1400, cc = DISORIENT }, -- Power Bash (Guard)
    [29761] = { power = true, priority = 3, auradetect = true, alwaysShowInterrupt = true }, -- Brace (Guard)

    [13701] = { block = true, dodge = true, priority = 3, eventdetect = true, bs = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Focused Charge (Brute)

    [35164] = { block = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1333, cc = STUN }, -- Agony (Berserker)

    [29510] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Thunder Hammer (Thundermaul)
    [17867] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Shock Aura (Thundermaul)
    [81215] = { block = true, interrupt = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1000, cc = STUN }, -- Shock Aura (Thundermaul - Boss)
    [81195] = { avoid = true, priority = 2, auradetect = true, cc = SNARE }, -- Agonizing Fury (Thundermaul - Boss)
    [81217] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1533 }, -- Thunder Hammer (Thundermaul - Boss)

    [36470] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 2500, cc = STUN }, -- Veiled Strike (Nightblade)
    --[44345] = { block = true, avoid = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Soul Tether (Nightblade)

    [34742] = { block = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Fiery Breath (Dragonknight)
    [34646] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1800 }, -- Lava Whip (Dragonknight)
    [44227] = { avoid = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Dragonknight Standard (Dragonknight - Elite)
    [52041] = { block = true, dodge = true, priority = 2, bs = true, result = ACTION_RESULT_BEGIN, duration = 1667, cc = STUN }, -- Blink Strike (Dragonknight - Elite)

    [88251] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Call Ally (Pet Ranger)
    [88248] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Call Ally (Pet Ranger)
    [89425] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Call Ally (Pet Ranger)
    [44301] = { dodge = true, priority = 3, auradetect = true , ignoreRefresh = true, cc = SNARE }, -- Trap Beast (Pet Ranger)

    [15164] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Heat Wave (Fire Mage)
    [47095] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Fire Rune (Fire Mage)

    [29471] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1800 }, -- Thunder Thrall (Storm Mage)

    [12459] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = SNARE }, -- Winter's Reach (Frost Mage)

    [35151] = { interrupt = true, priority = 3, auradetect = true, duration = 8000, effectOnlyInterrupt = true }, -- Spell Absorption (Spirit Mage)
    [14472] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Burdening Eye (Spirit Mage)

    [36985] = { avoid = true, interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Void (Time Bomb Mage)

    [37087] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Lightning Onslaught (Battlemage)
    [37129] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, cc = SNARE }, -- Ice Cage (Battlemage)
    [44216] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, cc = SILENCE }, -- Negate Magic (Battlemage - Elite)

    [88554] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Summon the Dead (Necromancer)
    [88555] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Summon the Dead (Necromancer)
    [88556] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Summon the Dead (Necromancer)
    [13397] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, duration = 5000 }, -- Empower Undead (Necromancer)

    [14350] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1667, cc = FEAR }, -- Aspect of Terror (Fear Mage)

    [44250] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Dark Shade (Dreadweaver)

    [44323] = { power = true, priority = 3, auradetect = true }, -- Dampen Magic (Soulbrander)
    [44258] = { power = true, priority = 3, auradetect = true }, -- Radiant Magelight (Soulbrander)

    [35387] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, cc = SNARE }, -- Defiled Grave (Bonelord)
    [88506] = { summon = true, priority = 2, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, fakeName = "" }, -- Summon Abomination (Bonelord)
    [88507] = { summon = true, priority = 2, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, fakeName = "" }, -- Summon Abomination (Bonelord)

    [50966] = { power = true, auradetect = true, priority = 2, alwaysShowInterrupt = true, duration = 5000 }, -- Healer Immune (Healer - Craglorn/DLC)
    [44328] = { interrupt = true, priority = 2, auradetect = true, duration = 4500 }, -- Rite of Passage (Healer)

    [29520] = { destroy = true, auradetect = true, priority = 2 }, -- Aura of Protection (Shaman)

    [68866] = { power = true, auradetect = true, refire = 1000, priority = 2 }, -- War Horn (Faction NPC)
    [43644] = { avoid = true, priority = 3, auradetect = true }, -- Barrier [monster synergy]  (Faction NPCs)
    [43645] = { avoid = true, priority = 3, auradetect = true }, -- Barrier [monster synergy]  (Faction NPCs)
    [43646] = { avoid = true, priority = 3, auradetect = true }, -- Barrier [monster synergy]  (Faction NPCs)

    [70070] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1250 }, -- Heavy Strike (Winterborn Warrior)
    [64980] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200, cc = STAGGER }, -- Javelin (Winterborn Warrior)
    [65033] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_EFFECT_GAINED, duration = 1000, cc = STAGGER }, -- Retaliation (Winterborn Warrior)

    [55909] = { dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = SNARE }, -- Grasping Vines (Winterborn Mage)
    [64704] = { block = true, avoid = true, interrupt = true, priority = 3, eventdetect = true, refire = 1500, result = ACTION_RESULT_BEGIN, duration = 4500 }, -- Flames (Winterborn Mage)

    [65235] = { power = true, auradetect = true, priority = 2 }, -- Enrage (Vosh Rakh Devoted)
    [53987] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 3000 }, -- Rally (Vosh Rakh Devoted)
    [54027] = { block = true, dodge = true, priority = 3, refire = 1600, result = ACTION_RESULT_BEGIN, duration = 4000, cc = STUN, neverShowInterrupt = true }, -- Divine Leap (Vosh Rakh Devoted)

    [51000] = { power = true, auradetect = true, priority = 2 }, -- Cleave Stance (Dremora Caitiff) (Craglorn)

    [72725] = { power = true, auradetect = true, priority = 2 }, -- Fool Me Once (Sentinel) (TG DLC)

    [76089] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Snipe (Archer) (TG DLC)
    --[72220] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Snipe (Archer) (TG DLC) -- This is cast from stealth - so for the time being, maybe hide.
    [72222] = { power = true, auradetect = true, priority = 2 }, -- Shadow Cloak (Archer) (TG DLC)

    [77472] = { power = true, auradetect = true, priority = 2 }, -- Til Death (Bodyguard) (DB DLC)
    [77554] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1000 }, -- Shard Shield (Bodyguard) (DB DLC)
    [77473] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1000, cc = STAGGER }, -- Shield Charge (Bodyguard) (DB DLC)

    [77089] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1250, cc = STUN }, -- Basilisk Powder (Tracker) (Morrowind)
    [77087] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Basilisk Powder (Tracker) (Morrowind)
    [77019] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 766, cc = SNARE }, -- Pin (Tracker) (Morrowind)
    [78432] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Lunge (Tracker) (Morrowind)

    [88371] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1000 }, -- Dive (Beastcaller) (Morrowind)
    [88394] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1000, cc = STUN }, -- Gore (Beastcaller) (Morrowind)
    [88409] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Raise the Earth (Beastcaller)

    [87901] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Bombard (Arbalest) (Morrowind)
    [87422] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, cc = SNARE }, -- Chilled Ground (Arbalest) (Morrowind)
    [87713] = { block = true, avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1300, cc = STAGGER }, -- Quakeshot (Arbalest) (Morrowind)

    [85359] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1267 }, -- Reverse Slash (Drudge)

    [87064] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000, cc = STUN }, -- Volcanic Debris (Fire-Binder) (Morrowind)
    [88845] = { interrupt = true, priority = 3, auradetect = true, duration = 15000, effectOnlyInterrupt = true }, -- Empower Atronach (Fire-Binder) (Morrowind)

    [76621] = { block = true, avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Shadeway (Voidbringer) (Morrowind)
    [76619] = { avoid = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Pool of Shadow (Voidbringer) (Morrowind)
    [76979] = { block = true, avoid = true, priority = 3, auradetect = true, duration = 5000, cc = STUN, neverShowInterrupt = true }, -- Shadowy Duplicate (Voidbringer) (Morrowind)

    [88327] = { block = true, avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Shadeway (Skaafin Masquer) (Morrowind)
    [88325] = { avoid = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Pool of Shadow (Skaafin Masquer) (Morrowind)
    [88348] = { block = true, avoid = true, priority = 3, auradetect = true, duration = 5000, cc = STUN, neverShowInterrupt = true }, -- Shadowy Duplicate (Skaafin Masquer) (Morrowind)

    [84818] = { interrupt = true, priority = 3, auradetect = true, duration = 4000 }, -- Fiendish Healing (Skaafin Witchling) (Morrowind)

    [84835] = { avoid = true, priority = 2, eventdetect = true }, -- Broken Pact (Skaafin) (Morrowind)

    -- ANIMALS
    [5452] = { block = true, dodge = true, priority = 3, bs = true, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STAGGER }, -- Lacerate (Alit)

    [4415] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1600, cc = STUN }, -- Crushing Swipe (Bear)
    [4416] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 2000, cc = STAGGER }, -- Savage Blows (Bear)

    [70366] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 2167, cc = STUN }, -- Slam (Great Bear)

    [4591] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 970 }, -- Sweep (Crocodile)
    [4594] = { power = true, auradetect = true, priority = 2, ignoreRefresh = true, refire = 500 }, -- Ancient Skin (Crocodile)

    [8977] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1721 }, -- Sweep (Duneripper)

    [7227] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1100 }, -- Rotbone (Durzog)

    [6308] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 2500, cc = STAGGER }, -- Shocking Touch (Dreugh)
    [6328] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, refire = 2000, duration = 3600 }, -- Shocking Rake (Dreugh)

    [54375] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1300, cc = STAGGER }, -- Shockwave (Echatere)
    [54380] = { block = true, dodge = true, priority = 3, bs = true, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1300, cc = STUN }, -- Headbutt (Echatere)

    [4632] = { block = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200, cc = STUN }, -- Screech (Giant Bat)
    [4630] = { dodge = true, interrupt = true, priority = 3, refire = 1500, result = ACTION_RESULT_BEGIN, duration = 1800 }, -- Draining Bite (Giant Bat)

    [5240] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2600, cc = STAGGER }, -- Lash (Giant Snake)
    [5242] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Kiss of Poison (Giant Snake)
    [5244] = { interrupt = true, priority = 3, auradetect = true, duration = 5000 }, -- Shed Skin (Giant Snake)

    [5441] = { block = true, dodge = true, priority = 3, bs = true, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STAGGER }, -- Dive (Guar)

    [14196] = { block = true, dodge = true, priority = 3, bs = true, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Charge (Kagouti)
    [5363] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STAGGER }, -- Chomp (Kagouti)
    [5926] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Toss (Kagouti)
    [87276] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STAGGER }, -- Chomp (Kagouti Whelp)

    [7161] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Double Strike (Lion)

    [8601] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, refire = 600, duration = 6000 }, -- Vigorous Swipe (Mammoth)
    [8600] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_EFFECT_GAINED, duration = 3000, cc = STAGGER }, -- Stomp (Mammoth)
    [23230] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Charge (Mammoth)

    [4200] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Unforgiving Claws (Mudcrab)

    [16690] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 2000, cc = STAGGER }, -- Thrust (Netch)
    [16697] = { avoid = true, interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, refire = 1800, duration = 7500 }, -- Poisonbloom (Netch)

    [7268] = { interrupt = true, priority = 3, refire = 500, result = ACTION_RESULT_BEGIN, duration = 5650 }, -- Leech
    [7273] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = SNARE }, -- Dampworm (Nix-Hound)

    [21904] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Rend (Skeever)

    [21951] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 4900, neverShowInterrupt = true }, -- Repulsion Shock (Wamasu)
    [21949] = { block = true, dodge = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1400, cc = STUN, neverShowInterrupt = true }, -- Sweep (Wamasu)
    [21957] = { block = true, dodge = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Charge (Wamasu)
    [22045] = { power = true, auradetect = true, priority = 2 }, --- Static (Wamasu)

    [55866] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 4900, neverShowInterrupt = true }, -- Repulsion Shock (Wamasu - Boss)
    [55868] = { block = true, dodge = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1200, cc = STUN, neverShowInterrupt = true }, -- Sweep (Wamasu - Boss)
    [55850] = { avoid = true, interrupt = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Impending Storm (Wamasu - Boss)
    [55860] = { dodge = true, interrupt = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1700, cc = SNARE }, -- Storm Bound (Storm Atronach)

    [44791] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1800 }, -- Rear Kick (Welwa)
    [50714] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, cc = STUN }, -- Charge (Welwa)

    [42844] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1100 }, -- Rotbone (Wolf)
    [14523] = { dodge = true, interrupt = true, priority = 3, refire = 1000, result = ACTION_RESULT_BEGIN, duration = 6800, cc = SNARE }, -- Helljoint (Wolf)
    [14272] = { summon = true, auradetect = true, priority = 2, fakeName = "" }, -- Call of the Pack (Wolf)
    [26658] = { summon = true, auradetect = true, priority = 2, fakeName = "" }, -- Call of the Pack (Jackal)

    [72793] = { dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1767, cc = SNARE }, -- Toxic Mucus (Haj Mota)
    [72796] = { block = true, dodge = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Bog Burst (Haj Mota)
    [72789] = { avoid = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1667, cc = STAGGER }, -- Shockwave (Haj Mota)

    [76307] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1467 }, -- Lunge (Dire Wolf)
    [76324] = { power = true, auradetect = true, priority = 2, refire = 1000 }, -- Baleful Call (Dire Wolf)

    [85201] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1167, cc = STAGGER }, -- Bite (Nix-Ox)
    [85084] = { block = true, avoid = true, priority = 3, eventdetect = true, refire = 750, result = ACTION_RESULT_BEGIN, duration = 500, cc = STAGGER }, -- Shriek (Nix-Ox)
    [90765] = { avoid = true, priority = 3, eventdetect = true, refire = 1000, result = ACTION_RESULT_BEGIN }, -- Acid Spray (Nix-Ox)
    [90809] = { avoid = true, priority = 3, eventdetect = true, refire = 1000, result = ACTION_RESULT_BEGIN }, -- Acid Spray (Nix-Ox)
    [85172] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 500, cc = STUN }, -- Winnow (Nix-Ox)
    [85203] = { power = true, auradetect = true, priority = 2, refire = 1000 }, -- Nix-Call (Nix-Ox)

    [85395] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, cc = STUN, duration = 1333 }, -- Dive (Cliff Strider)
    [85399] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Retch (Cliff Strider)
    [85390] = { block = true, dodge = true, priority = 3, eventdetect = true, refire = 750, result = ACTION_RESULT_BEGIN, duration = 1600, cc = SNARE }, -- Slash (Cliff Strider)

    -- INSECTS
    [6137] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 800 }, -- Laceration (Assassin Beetle)
    [5268] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = SNARE }, -- Collywobbles (Assassin Beetle)

    [6757] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Blurred Strike (Giant Scorpion)
    [6756] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = SNARE }, -- Paralyze (Giant Scorpion)
    [6758] = { power = true, auradetect = true, priority = 2, ignoreRefresh = true, refire = 500 }, -- Hardened Carapace (Giant Scorpion)

    [44086] = { avoid = true, priority = 3, auradetect = true, ignoreRefresh = true }, -- Fire Runes (Giant Spider)
    [5685] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Corrosive Bite (Giant Spider)
    [8087] = { avoid = true, priority = 3, eventdetect = true, refire = 1200, result = ACTION_RESULT_BEGIN, duration = 5100 }, -- Poison Spray (Giant Spider)
    [4737] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = SNARE }, -- Encase (Giant Spider)
    [13382] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Devour (Giant Spider)

    [9226] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1400 }, -- Sting (Wasp)
    [25110] = { block = true, dodge = true, priority = 3, bs = true, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Focused Charge (Giant Wasp)
    [9229] = { dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000, cc = UNBREAKABLE }, -- Inject Larva (Giant Wasp)

    [6800] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Bloodletting (Hoarvor)
    [6795] = { interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 7850 }, -- Latch On (Hoarvor)

    [61244] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Fevered Retch (Necrotic Hoarvor)
    [61360] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 5500 }, -- Infectious Swarm (Necrotic Hoarvor)
    [61427] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, duration = 1200, cc = SNARE, neverShowInterrupt = true }, -- Necrotic Explosion (Necrotic Hoarvor)

    [14841] = { block = true, dodge = true, priority = 3, bs = true, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Focused Charge (Kwama Worker)

    [9769] = { block = true, dodge = true, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 3267 }, -- Excavation (Kwama Warrior)

    [5260] = { avoid = true, priority = 3, eventdetect = true, refire = 750, result = ACTION_RESULT_BEGIN, duration = 2700 }, -- Flamethrower (Shalk)
    [5252] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1100 }, -- Fire Bite (Shalk)
    [5262] = { avoid = true, interrupt = true, priority = 3, auradetect = true, duration = 4000 }, -- Burning Ground (Shalk)

    [8429] = { interrupt = true, priority = 3, refire = 750, result = ACTION_RESULT_BEGIN, duration = 4600 }, -- Zap (Thunderbug)
    [26412] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Thunderstrikes (Thunderbug)

    [73172] = { dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 3667, cc = SNARE }, -- Swarm (Kotu Gava Broodmother)
    [73199] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, cc = SNARE }, -- Swarmburst (Kotu Gava Broodmother)

    [87022] = { summon = true, auradetect = true, priority = 3, fakeName = "" }, -- Summon Swarm (Fetcherfly Nest)
    [85645] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1000 }, -- Bombard (Fetcherfly Nest)
    [87125] = { avoid = true, interrupt = true, priority = 3, auradetect = true, duration = 8000 }, -- Heat Vents (Fetcherfly Nest)

    [92078] = { destroy = true, priority = 2, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED }, -- Colonize (Fetcherfly Hive Golem)
    [87062] = { block = true, avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 4000, cc = SILENCE }, -- Fetcherfly Storm (Fetcherfly Hive Golem)
    [87030] = { block = true, avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 867 }, -- Focused Swarm (Fetcherfly Hive Golem)

    -- DAEDRA
    [31115] = { destroy = true, refire = 1000, priority = 2, auradetect = true }, -- Summon Dark Anchor (Daedric Synergy)
    [68449] = { avoid = true, refire = 1000, priority = 3, duration = 500 }, -- Explosive Charge (Daedric Synergy)

    [48121] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Heavy Attack (Air Atronach)
    [48137] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Tornado (Air Atronach)

    [51262] = { power = true, auradetect = true, priority = 2 }, -- Air Atronach Flame (Air Atronach)
    [51271] = { power = true, auradetect = true, priority = 2 }, -- Air Atronach Flame (Air Atronach)
    [51269] = { power = true, auradetect = true, priority = 2 }, -- Air Atronach Flame (Air Atronach)

    [51281] = { avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, refire = 1500, duration = 3250 }, -- Flame Tornado (Air Atronach)
    [50021] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = SNARE }, -- Ice Vortex (Air Atronach)
    [50023] = { block = true, interrupt = true, priority = 3, refire = 800, result = ACTION_RESULT_BEGIN, duration = 4600 }, -- Lightning Rod (Air Atronach)

    [9747] = { block = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Dire Wound (Banekin)
    [9748] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 3000 }, -- Envelop (Banekin)

    [4799] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1000, cc = STAGGER }, -- Tail Spike (Clannfear)
    [93745] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Rending Leap (Clannfear)

    [26641] = { avoid = true, interrupt = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Soul Flame (Daedric Titan)
    [34405] = { block = true, avoid = true, priority = 2, auradetect = true, duration = 2200 }, -- Swallowing Souls (Daedric Titan)
    [26554] = { block = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1000, cc = STUN }, -- Wing Gust (Daedric Titan)

    [4771] = { avoid = true, priority = 3, eventdetect = true, refire = 1250, result = ACTION_RESULT_BEGIN, duration = 3100 },-- Fiery Breath (Daedroth)
    [91946] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1000, cc = STAGGER }, -- Ground Tremor (Daedroth)
    [91937] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1767, cc = STUN }, -- Burst of Embers (Daedroth)

    [26324] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1300 }, -- Lava Geyser (Flame Atronach)
    [50216] = { block = true, avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, refire = 250, duration = 2000, neverShowInterrupt = true }, -- Combustion (Flame Atronach)

    [5017] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 2500, cc = STUN }, -- Hoarfrost Fist (Frost Atronach)
    [33502] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, cc = SNARE }, -- Frozen Ground (Frost Atronach)

    [50626] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 2750 }, -- Shadow Strike (Grevious Twilight)
    [65889] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 2750 }, -- Shadow Strike (Grevious Twilight)

    [4829] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Fire Brand (Flesh Atronach)
    [4817] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Unyielding Mace (Flesh Atronach)

    [67870] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1700, cc = STAGGER }, -- Tremor AOE (Flesh Colossus)
    [66869] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Pin (Flesh Colossus)
    [67872] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1600, cc = STUN }, -- Sweep (Flesh Colossus)
    [76139] = { block = true, dodge = true, priority = 2, auradetect = true, cc = STUN }, -- Stumble Forward (Flesh Colossus)
    --[67772] = { power = true, priority = 2, auradetect = true }, -- Enraged (Flesh Colossus)
    [49430] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1750 }, -- Smash (Flesh Colossus)
    [49429] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1250 }, -- Claw (Flesh Colossus)

    [11079] = { avoid = true, interrupt = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1300, cc = STAGGER }, -- Black Winter (Harvester)
    [26017] = { summon = true, priority = 2, auradetect = true, fakeName = "", refire = 1000 }, -- Creeping Doom (Harvester)

    [8205] = { interrupt = true, priority = 3, auradetect = true, duration = 6000 }, -- Regeneration (Ogrim)
    [24690] = { block = true, dodge = true, priority = 3, bs = true, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Focused Charge (Ogrim)
    [91848] = { dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1970, cc = SNARE }, -- Stomp (Ogrim)
    [91855] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000, cc = STUN }, -- Boulder Toss (Ogrim)

    [6166] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500 }, -- Heat Wave (Scamp)
    [6160] = { avoid = true, interrupt = true, priority = 3, auradetect = true, duration = 5000 }, -- Rain of Fire (Scamp)

    [8779] = { block = true, interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Lightning Onslaught (Spider Daedra)
    [89306] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, cc = SNARE }, -- Web (Spiderling)
    [8782] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Lightning Storm (Spider Daedra)
    [8773] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Summon Spiderling (Spider Daedra)

    [35220] = { avoid = true, interrupt = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Impending Storm (Storm Atronach)
    --[4864] = { dodge = true, priority = 2, result = ACTION_RESULT_EFFECT_GAINED, refire = 100, cc = SNARE }, -- Storm Bound (Storm Atronach)

    [7095] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1400 }, -- Heavy Attack (Xivilai)
    [88947] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Lightning Grasp (Xivilai)
    [7100] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1333 }, -- Hand of Flame (Xivilai)
    [25726] = { summon = true, priority = 2, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, fakeName = "" }, -- Summon Daedra (Xivilai)

    [4653] = { block = true, avoid = true, priority = 2, eventdetect = true, cc = SNARE }, -- Shockwave (Watcher)
    [9219] = { block = true, avoid = true, priority = 2, eventdetect = true, refire = 1750, cc = STUN }, -- Doom-Truth's Gaze (Watcher)
    [14425] = { block = true, avoid = true, priority = 2, cc = STUN }, -- Doom-Truth's Gaze (Watcher)

    [6410] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1700 }, -- Tail Clip (Winged Twilight)
    [6412] = { block = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200, cc = STUN }, -- Dusk's Howl (Winged Twilight)

    [94903] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, eventdetect = true, duration = 1200, cc = STAGGER }, -- Spring (Hunger)
    [87237] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, eventdetect = true, duration = 667, cc = STAGGER }, -- Spring (Hunger)
    [87252] = { power = true, refire = 400, priority = 2, auradetect = true, noSelf = true, duration = 6000, cc = STUN, effectOnlyInterrupt = true }, -- Devour (Hunger)
    [84944] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, eventdetect = true, duration = 2300, cc = STUN }, -- Hollow (Hunger)
    [87269] = { avoid = true, eventdetect = true, priority = 2, result = ACTION_RESULT_BEGIN, eventdetect = true, duration = 1400, cc = STUN }, -- Torpor (Hunger)

    [88282] = { avoid = true, eventdetect = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 767 }, -- Rock Stomp (Iron Atronach)
    [88261] = { block = true, eventdetect = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 800 }, -- Lava Wave (Iron Atronach)
    [88297] = { avoid = true, auradetect = true, priority = 2, duration = 6000, effectOnlyInterrupt }, -- Blast Furnace (Iron Atronach)

    -- UNDEAD
    [8569] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN, duration = 1300, cc = STAGGER }, -- Devastating Leap (Bloodfiend)

    [5050] = { block = true, dodge = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STAGGER }, -- Bone Saw (Bone Colossus)
    [5030] = { summon = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, fakeName = "" }, -- Voice to Wake the Dead (Bone Colossus)
    [17207] = { block = true, dodge = true, priority = 3, auradetect = true, duration = 2500, neverShowInterrupt = true }, -- Necromantic Implosion (Risen Dead)

    [18514] = { block = true, dodge = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200, cc = SNARE }, -- Chill Touch (Ghost)
    [19137] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, cc = FEAR }, -- Haunting Spectre (Ghost)

    [73925] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, cc = STUN }, -- Soul Cage (Lich)

    [50182] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Consuming Energy (Spellfiend)

    [68735] = { interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 6000 }, -- Vampiric Drain (Vampire)

    [2867] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1400, cc = STAGGER }, -- Crushing Leap (Werewolf)
    [3415] = { block = true, dodge = true, priority = 3, eventdetect = true, refire = 1100, result = ACTION_RESULT_BEGIN, duration = 4667, cc = STUN }, -- Flurry (Werewolf)
    [44055] = { interrupt = true, priority = 3, auradetect = true, duration = 4000 }, -- Devour (Werewolf)
    [5785] = { power = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Blood Scent (Werewolf)

    [4337] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = SNARE }, -- Winter's Reach (Wraith)

    [2969] = { block = true, dodge = true, bs = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200, cc = STAGGER }, -- Pound (Zombie)
    [2960] = { block = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2100 }, -- Vomit (Zombie)

    [72979] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Dissonant Blow (Defiled Aegis)
    [72995] = { interrupt = true, dodge = true, priority = 2, eventdetect = true, refire = 1100, result = ACTION_RESULT_BEGIN, duration = 6100 }, -- Symphony of Blades (Defiled Aegis) -- Higher priority because damage is very high
    [76180] = { summon = true, auradetect = true, priority = 2, fakeName = "" }, -- Shattered Harmony (Defiled Aegis)

    -- MONSTERS
    [10270] = { block = true, avoid = true, priority = 2, eventdetect = true, refire = 1000, result = ACTION_RESULT_BEGIN, duration = 2550 }, -- Quake (Gargoyle)
    [10256] = { block = true, bs = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Lacerate (Gargoyle)

    [26124] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 1800 }, -- Shatter (Giant)
    [15715] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, duration = 3000, cc = STUN }, -- Obliterate (Giant)

    [2786] = { interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, refire = 1250, duration = 6100 }, -- Steal Essence (Hag)
    [2821] = { block = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 700, cc = STUN }, -- Luring Snare (Hag)
    [3349] = { power = true, priority = 2, auradetect = true, duration = 8000 }, -- Reflective Shadows (Hag)

    [10615] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1800, cc = STAGGER }, -- Raven Storm (Hagraven)
    [10613] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2050, neverShowInterrupt = true }, -- Fire Bomb (Hagraven)
    [64808] = { power = true, priority = 2, auradetect = true }, -- Briarheart Ressurection (Hagraven)

    [4123] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1200 }, -- Wing Slice (Harpy)
    [13515] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1800, cc = STUN }, -- Wind Gust (Harpy)
    [24604] = { avoid = true, interrupt = true, eventdetect = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 8000 }, -- Charged Ground (Harpy)
    [4689] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1300 }, -- Lightning Gale (Harpy)

    [43809] = { avoid = true, priority = 3, auradetect = true, duration = 1750, cc = STUN, neverShowInterrupt = true }, -- Shard Burst (Ice Wraith)
    [24866] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, cc = SNARE }, -- Focused Charge (Ice Wraith)

    [17703] = { block = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, refire = 750, duration = 4550 }, -- Flame Ray (Imp - Fire)
    [8884] = { block = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, refire = 750, duration = 4550 }, -- Zap (Imp - Lightning)
    [81794] = { block = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, refire = 750, duration = 4600 }, -- Frost Ray (Imp - Frost)

    [9671] = { block = true, bs = true, eventdetect = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STAGGER }, -- Howling Strike (Lamia)
    [9674] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STAGGER }, -- Resonate (Lamia)
    [7835] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, duration = 2000 }, -- Convalescence (Lamia)
    [7831] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN, refire = 2500, duration = 5000 }, -- Harmony (Lamia)
    [9680] = { summon = true, auradetect = true, priority = 2, fakeName = "" }, -- Summon Spectral Lamia

    [3860] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 500, cc = STAGGER }, -- Pulverize (Lurcher)
    [3855] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 1500, cc = STUN }, -- Crushing Limbs (Lurcher)
    [3767] = { avoid = true, interrupt = true, priority = 3, eventdetect = true, refire = 1100, result = ACTION_RESULT_BEGIN, duration = 5600 }, -- Choking Pollen (Lurcher)

    [5559] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN, duration = 2200, neverShowInterrupt = true }, -- Icy Geyser (Nereid)
    [5540] = { avoid = true, interrupt = true, priority = 3, auradetect = true, duration = 8000, cc = SNARE }, -- Hurricane (Nereid)

    [24985] = { power = true, auradetect = true, priority = 3 }, -- Intimidating Roar (Ogre)
    [5881] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Smash (Ogre)
    [5256] = { block = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Shockwave (Ogre)

    [53142] = { destroy = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Ice Pillar (Ogre Shaman)
    [64540] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Freeze Wounds (Ogre Shaman)
    [53137] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Freeze Wounds (Ogre Shaman)

    [21582] = { block = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Nature's Swarm (Spriggan)
    [13475] = { interrupt = true, priority = 3, auradetect = true }, -- Healing Salve (Spriggan)
    [13477] = { interrupt = true, priority = 3, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED }, -- Control Beast (Spriggan)
    [89119] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Summon Beast (Spriggan)
    [89102] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Summon Beast (Spriggan)

    [9346] = { interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Strangle (Strangler)
    [9322] = { avoid = true, priority = 3, auradetect = true }, -- Poisoned Ground (Strangler)
    [9321] = { block = true, priority = 3, result = ACTION_RESULT_BEGIN, refire = 500 }, -- Grapple (Strangler)

    [44736] = { block = true, dodge = true, priority = 2, eventdetect = true, refire = 2000, result = ACTION_RESULT_BEGIN }, -- Swinging Cleave (Troll)
    [9009] = { avoid = true, priority = 2, eventdetect = true, refire = 300, result = ACTION_RESULT_BEGIN }, -- Tremor (Troll)

    [76268] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Lope (River Troll)
    [76277] = { interrupt = true, priority = 2, eventdetect = true, refire = 1000, result = ACTION_RESULT_BEGIN, duration = 5233 }, -- Close Wounds (River Troll)
    [76295] = { block = true, avoid = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Crab Toss (River Troll)

    [48256] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Boulder Toss (Troll - Ranged)
    [48282] = { interrupt = true, avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Consuming Omen (Troll - Ranged)

    [4309] = { block = true, avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Dying Blast (Wisp)

    [7976] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Rain of Wisps (Wispmother)
    [18040] = { power = true, priority = 2, auradetect = true }, -- Clone (Wispmother)

    [75867] = { block = true, bs = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Clobber (Minotaur)
    [75917] = { block = true, dodge = true, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Ram (Minotaur)
    [79541] = { block = true, dodge = true, priority = 2, auradetect = true, result = ACTION_RESULT_BEGIN }, -- Flying Leap (Minotaur)
    [75925] = { power = true, auradetect = 2, priority = 2, ignoreRefresh = true }, -- Elemental Weapon (Minotaur)

    [75951] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Brimstone Hailfire (Minotaur Shaman)
    [75955] = { avoid = true, priority = 2, eventdetect = true, refire = 1000, result = ACTION_RESULT_BEGIN }, -- Pillars of Nirn (Minotaur Shaman)
    [75994] = { power = true, priority = 2, auradetect = true, ignoreRefresh = true }, -- Molten Armor (Minotaur Shaman)

    [49499] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Spear Throw (Mantikora)
    [49404] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Rear Up (Mantikora)
    [49402] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Tail Whip (Mantikora)
    [50187] = { power = true, priority = 2, auradetect = true }, -- Enrage (Mantikora)
    [56689] = { power = true, priority = 2, auradetect = true }, -- Enraged (Mantikora)

    [104479] = { block = true, bs = true, dodge = true, interrupt = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Reave (Yaghra Strider)
    [105214] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Lunge (Yaghra Strider)
    [105330] = { interrupt = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Frenzy (Yaghra Strider)

    [103804] = { interrupt = true, avoid = true, eventdetect = true, priority = 2, result = ACTION_RESULT_BEGIN, refire = 800 }, -- Deluge (Yaghra Strider)
    [103931] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Luminescent Mark (Yaghra Spewer)

    -- DWEMER
    [16031] = { avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Ricochet Wave (Dwemer Sphere)
    [7520] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Steam Wall (Dwemer Sphere)
    [7544] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Quake (Dwemer Sphere)

    [11247] = { block = true, dodge = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Sweeping Spin (Dwemer Centurion)
    [11246] = { avoid = true, priority = 2, eventdetect = true, refire = 2000, result = ACTION_RESULT_BEGIN }, -- Steam Breath (Dwemer Centurion)

    [20507] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Double Strike (Dwemer Spider)
    [7717] = { block = true, avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED }, -- Detonation (Dwemer Spider)
    [19970] = { power = true, priority = 3, auradetect = true }, -- Static Field (Dwemer Spider - Overcharge Synergy)
    --[20207] = { interrupt = true, priority = 3, eventdetect = true }, -- Overcharge (Dwemer Spider - Overcharge Synergy)
    [20505] = { block = true, avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, refire = 250 }, -- Overcharge (Dwemer Spider - Overcharge Synergy)
    [20222] = { block = true, avoid = true, priority = 3, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, refire = 250 }, -- Overcharge (Dwemer Spider - Overcharge Synergy)

    [64479] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Thunderbolt (Dwemer Sentry)

    [88668] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Impulse Mine (Dwemer Arquebus)
    [85270] = { interrupt = true, priority = 3, refire = 1500, result = ACTION_RESULT_BEGIN }, -- Shock Barrage (Dwemer Arquebus)
    [85319] = { avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Siege Ballista (Dwemer Arquebus)
    [85326] = { interrupt = true, priority = 3, eventdetect = true, refire = 1000, result = ACTION_RESULT_BEGIN }, -- Polarizing Field (Dwemer Arquebus)

    --------------------------------------------------
    -- FRIENDLY NPC ----------------------------------
    --------------------------------------------------

    [42905] = { power = true, priority = 1, auradetect = true }, -- Recover (Friendly NPC)

    --------------------------------------------------
    -- MAIN QUEST ------------------------------------
    --------------------------------------------------

    -- MSQ Tutorial (Soul Shriven in Coldharbour)
    -- [61748] = { block = true, priority = 1}, -- Heavy Attack (Tutorial) -- Default game tutorials display regardless
    -- [61916] = { interrupt = true, priority = 1}, -- Heat Wave (Tutorial) -- Default game tutorials display regardless
    [63269] = { block = true, avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Heat Wave (Tutorial)
    [63737] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN }, -- Heavy Attack (Tutorial)
    [63684] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN }, -- Uppercut (Tutorial)
    [63761] = { block = true, dodge = true, priority = 3, bs = true, result = ACTION_RESULT_BEGIN }, -- Pound (Tutorial)
    [63752] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Vomit (Tutorial)
    [63755] = { block = true, avoid = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Heat Wave (Tutorial)
    [63521] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Bone Crush (Tutorial)

    -- MSQ 2 (Daughter of Giants)
    [27767] = { block = true, bs = true, dodge = true, priority = 2 }, -- Rending Leap (Ancient Clannfear)
    [28788] = { block = true, priority = 2, eventdetect = true }, -- MQ2_Boss1_Doom-Truth'sGaze (Manifestation of Terror)
    [28723] = { avoid = true, priority = 2, eventdetect = true, refire = 500 }, -- Gravity Well (Manifestation of Terror)

    -- MSQ 4 (Castle of the Worm)
    [34484] = { block = true, avoid = true, priority = 2, skipcheck = true, refire = 500 }, -- Soul Cage (Mannimarco)

    -- MSQ 6 (Halls of Torment)
    [36858] = { interrupt = true, avoid = true, priority = 2, eventdetect = true, refire = 1500 }, -- Swordstorm (Tharn Doppleganger)
    [37173] = { interrupt = true, priority = 2, eventdetect = true }, -- Flame Shield (Duchess of Anguish)
    [38729] = { block = true, interrupt = true, priority = 2, refire = 500 }, -- Royal Strike (Duchess of Anguish)

    -- MSQ 7 (Shadow of Sancre Tor)
    [39302] = { interrupt = true, priority = 2, eventdetect = true, refire = 1000 }, -- Necromantic Revival
    [38215] = { interrupt = true, priority = 2, refire = 1000 }, -- Death's Gaze (Mannimarco)
    [40425] = { avoid = true, priority = 2 }, -- Impending Doom (Mannimarco)
    [40973] = { power = true, priority = 2, eventdetect = true }, -- Portal Spawn (Mannimarco)
    [40978] = { power = true, priority = 2, eventdetect = true }, -- Portal Spawn (Mannimarco)
    [40981] = { power = true, priority = 2, eventdetect = true }, -- Portal Spawn (Mannimarco)

    --------------------------------------------------
    -- GUILD QUESTS ----------------------------------
    --------------------------------------------------

    -- The Prismatic Core
    [39577] = { block = true, interrupt = true, priority = 2 }, -- Palolel's Rage (Queen Palolel)

    -- Will of the Council
    [28939] = { avoid = true, priority = 2, eventdetect = true, refire = 2000 }, -- Heat Wave (Sees-All-Colors)

    -- The Mad God's Bargain
    [39555] = { interrupt = true, priority = 2, eventdetect = true, refire = 1500 }, -- Summon Scamp (Haskill)
    [39527] = { interrupt = true, avoid = true, block = true, priority = 2, refire = 1500 }, -- Skeleton Trap (Haskill)
    [35533] = { interrupt = true, priority = 2, refire = 1500 }, -- Polymorph (Haskill)
    [39391] = { interrupt = true, priority = 2, eventdetect = true, refire = 1500 }, -- Summon Pig (Haskill)

    --------------------------------------------------
    -- AD QUESTS -------------------------------------
    --------------------------------------------------

    -- World Boss - Seaside Scarp Camp
    [84283] = { block = true, dodge = true, priority = 1, eventdetect = true }, -- Coursing Bones (Oskana)

    -- World Boss - Heretic's Summons
    [83150] = { block = true, dodge = true, priority = 1 }, -- Tail Whip (Snapjaw)
    [83009] = { block = true, dodge = true, priority = 1 }, -- Rending Leap (Snapjaw)
    [83040] = { block = true, dodge = true, bs = true, priority = 1, eventdetect = true, skipcheck = true }, -- Focused Charge (Clannfear - Snapjaw)
    [83016] = { block = true, priority = 1, refire = 1000, eventdetect = true, skipcheck = true }, -- Necrotic Explosion (Clannfear - Snapjaw)

    -- Sever All Ties
    [44138] = { interrupt = true, avoid = true, priority = 2, eventdetect = true }, -- Q4261 Estre Knockback (High Kinlady Estre)

    -- World Boss - Nindaeril's Perch
    [83515] = { block = true, bs = true, dodge = true, priority = 1 }, -- Hunter's Pounce (Bavura the Blizzard)
    [83832] = { block = true, dodge = true, priority = 1, eventdetect = true }, -- Frenzied Charge (Nindaeril the Monsoon)
    [83548] = { interrupt = true, avoid = true, priority = 1, eventdetect = true }, -- Mighty Roar (Nindaeril the Monsoon)

    -- The Grips of Madness
    [38748] = { block = true, interrupt = true, priority = 2 }, -- Aulus's Tongue (Mayor Aulus)
    [40702] = { avoid = true, priority = 2, eventdetect = true }, -- Q4868 Aulus Knockback (Mayor Aulus)

    -- The Orrery of Elden Root
    [43820] = { dodge = true, avoid = true, priority = 2, eventdetect = true }, -- Quaking Stomp (Prince Naemon)
    [43827] = { avoid = true, priority = 2, auradetect = true }, -- Projectile Vomit (Prince Naemon)

    -- World Boss - Gathongor's Mine
    [84205] = { avoid = true, priority = 1 }, -- Stinging Sputum (Gathongor the Mauler)
    [84196] = { avoid = true, priority = 1 }, -- Marsh Masher (Gathongor the Mauler)
    [84209] = { block = true, dodge = true, priority = 1 }, -- Wrecking Jaws (Gathongor the Mauler)
    [84212] = { avoid = true, priority = 1 }, -- Bog Slam (Gathongor the Mauler)

    -- World Boss - Thodundor's View
    [83155] = { block = true, bs = true, dodge = true, priority = 1 }, -- Thunderous Smash (Thodundor of the Hill)
    [83160] = { block = true, avoid = true, priority = 1 }, -- Stone Crusher (Thodundor of the Hill)
    [83136] = { block = true, avoid = true, priority = 1 }, -- Ground Shock (Thodundor of the Hill)

    --------------------------------------------------
    -- VVARDENFELL -----------------------------------
    --------------------------------------------------

    -- Tutorial
    -- [83416] = { block = true, priority = 1}, -- Heavy Attack (Tutorial) -- Default game tutorials display regardless
    -- [92233] = { interrupt = true, priority = 1}, -- Throw Dagger (Tutorial) -- Default game tutorials display regardless
    [92668] = { block = true, dodge = true, priority = 3, eventdetect = true, result = ACTION_RESULT_BEGIN }, -- Whirlwind (Slaver Cutthroat)

    -- Main Quest
    [87958] = { avoid = true, interrupt = true, priority = 2 }, -- Ash Storm (Divine Delusions)
    [90139] = { block = true, dodge = true, priority = 2, bs = true }, -- Empowered Strike (Divine Intervention)
    [90181] = { avoid = true, priority = 2 , refire = 1500 }, -- Oily Smoke (Divine Restoration)
    [87038] = { block = true, dodge = true, priority = 2, bs = true}, -- Spinning Blades (Divine Restoration)
    [87047] = { block = true, dodge = true, priority = 2, refire = 1500 }, -- Lunge (Divine Restoration)
    [87090] = { block = true, dodge = true, priority = 2}, -- Barbs (Divine Restoration)
    [90616] = { block = true, avoid = true, priority = 2, refire = 10000, skipcheck = true}, -- Divine Hijack (Divine Restoration)

    -- Sidequests
    [92720] = { block = true, avoid = true, priority = 2}, -- Necrotic Wave (Ancestral Adversity)
    [77541] = { block = true, dodge = true, priority = 2}, -- Brand's Cleave (The Heart of a Telvanni)

    -- Delves/Public Dungeons/World
    [88427] = { block = true, dodge = true, priority = 3, bs = true, auradetect = true}, -- Charge (Kwama Worker - Matus-Akin Egg Mine)

    [86983] = { interrupt = true, priority = 2}, -- Succubus Touch (Echoes of a Fallen House)
    [86930] = { block = true, dodge = true, interrupt = true, priority = 2}, -- Volcanic Debris (The Forgotten Wastes)
    [92702] = { block = true, dodge = true, interrupt = true, priority = 2}, -- Volcanic Debris (The Forgotten Wastes)

    [89210] = { block = true, avoid = true, priority = 3}, -- Boulder Toss (Nchuleftingth - Mud-Tusk)

    [86570] = { block = true, dodge = true, priority = 3}, -- Shield Charge (Nchuleftingth - Renduril the Hammer)
    [90597] = { block = true, avoid = true, priority = 2}, -- Overcharge Expulsion

    --------------------------------------------------
    -- SUMMERSET -------------------------------------
    --------------------------------------------------

    [105601] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Explosive Toxins (Yaghra Larva)

    [107282] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Impale (Yaghra Nightmare)
    [105867] = { avoid = true, priority = 2, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Pustulant Explosion (Yaghra Nightmare)

    --------------------------------------------------
    -- ARENAS ----------------------------------------
    --------------------------------------------------

    -- Dragonstar Arena

    -- Stage 1
    [52729] = { power = true, priority = 1, auradetect = true }, -- Expert Hunter (Fighters Guild Swordmaster)
    [52738] = { power = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Ring of Preservation (Fighters Guild Gladiator)
    [82996] = { power = true, priority = 1, auradetect = true }, -- Enrage (Fighters Guild Gladiator)

    [52746] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.Boss_Champion_Marcauld }, -- Flawless Dawnbreaker (Champion Marcauld)

    -- Stage 2 - The Frozen Ring
    [53264] = { power = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true }, -- Rally (Sovngarde Slayer)
    [53313] = { avoid = true, interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 1500 }, -- Volley (Sovngarde Slayer)

    [53286] = { interrupt = true, block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Crushing Shock (Sovngarde Icemage)
    [53274] = { avoid = true, priority = 1, auradetect = true, bossMatch = U.Boss_Katti_Ice_Turner }, -- Unstable Wall of Frost (Sovngarde Icemage)

    [53250] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Wrecking Blow (Yavni Frost-Skin)
    [53301] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossMatch = U.Boss_Katti_Ice_Turner }, -- Icy Pulsar (Katti Ice-Turner)

    -- Stage 3 - The Marsh
    [8244] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Devastate (Corprus Husk)
    [8247] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, refire = 1750 }, -- Vomit (Corprus Husk)
    [22109] = { avoid = true, priority = 3, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, refire = 250 }, -- Contaminate (Corprus Husk)

    [83493] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 1000 }, -- CLST - Poison Cloud (Poison Cloud)

    [56796] = { power = true, priority = 1, auradetect = true }, -- Bound Aegis (Dragonclaw Hedge Wizard)

    [53613] = { power = true, priority = 1, auradetect = true }, -- Thundering Presence (Nak'tah)
    [53624] = { avoid = true, priority = 1, auradetect = true, bossMatch = U.Boss_Nak_tah }, -- Lightning Flood (Nak'tah)
    [53659] = { block = true, avoid = true, interrupt = true, priority = 1, auradetect = true }, -- Power Overload Heavy Attack (Nak'tah)

    -- Stage 4 - The Slave Pit
    [54160] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, refire = 750, eventdetect = true, fakeName = U.NPC_House_Dres_Slaver }, -- Berserker Frenzy (House Dres Slaver)
    [83774] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, refire = 750 }, -- Enslavement (House Dres Slaver)

    [54056] = { power = true, priority = 1, auradetect = true, refire = 500 }, -- Molten Armaments (Earthen Heart Knight)
    [54065] = { power = true, priority = 1, auradetect = true, ignoreRefresh = true }, -- Igneous Shield (Earthen Heart Knight)
    [54077] = { avoid = true, priority = 1, auradetect = true, bossMatch = U.Boss_Earthen_Heart_Knight }, -- Cinder Storm (Earthen Heart Knight)
    [54053] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Stone Giant (Earthen Heart Knight)
    [54083] = { power = true, priority = 1, auradetect = true }, -- Corrosive Armor (Earthen Heart Knight)
    [54067] = { block = true, interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Fossilize (Earth Heart Knight)

    -- Stage 5 - The Celestial Ring
    [51352] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Petrify (Gargoyle)
    [54411] = { power = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.NPC_Anka_Ra_Shadowcaster }, -- Celestial Blast (Anka-Ra Shadowcaster)
    [54404] = { unmit = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, fakeName = U.NPC_Anka_Ra_Shadowcaster }, -- Celestial Blast (Anka-Ra Shadowcaster)
    [52897] = { avoid = true, priority = 1, auradetect = true, bossName = true }, -- Standard of Might (Anal'a Tu'wha)
    [52891] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, bossMatch = U.Boss_Anala_tuwha }, -- Flames of Oblivion (Anal'a Tu'wha)

    -- Stage 6 - The Grove
    [54608] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Drain Resource (Pacthunter Ranger)
    --[54512] = { power = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true }, -- Regeneration Aura (Nature's Blessing)
    [52820] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Acid Spray (Pishna Longshot)
    [52825] = { block = true, dodge = true, interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Lethal Arrow (Pishna Longshot)

    -- Stage 7 - Circle of Rituals
    [56946] = { power = true, priority = 1, auradetect = true }, -- Dragon Fire Scale (Bloodwraith Kynval)
    [54634] = { summon = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, auradetect = true }, -- CLDA - Sacrifice (Daedric Sacrifice)
    [54635] = { summon = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, auradetect = true }, -- CLDA - Sacrifice (Daedric Sacrifice)
    [54612] = { summon = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, auradetect = true }, -- CLDA - Sacrifice (Daedric Sacrifice)

    [52907] = { block = true, dodge = true, interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Dark Flare (Shadow Knight)
    [52912] = { interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Purifying Light (Shadow Knight)
    [52927] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, fakeName = U.Boss_Shadow_Knight, bossMatch = U.Boss_Hiath_the_Battlemaster }, -- Solar Disturbance (Shadow Knight)

    [54792] = { block = true, dodge = true, interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Crystal Blast (Dark Mage)
    [54819] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, bossMatch = U.Boss_Dark_Mage }, -- Daedric Minefield (Dark Mage)
    [54829] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, fakeName = U.Boss_Dark_Mage, bossMatch = U.Boss_Hiath_the_Battlemaster }, -- Suppression Field (Dark Mage)
    [54809] = { interrupt = true, priority = 1, auradetect = true }, -- Dark Deal (Dark Mage)

    -- Stage 8 - Steamworks
    [25211] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Whirlwind Function (Dwarven Fire Centurion)
    [54841] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Ice Charge (Dwarven Ice Centurion)
    [56065] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, noSelf = true }, -- Ice Charge (Dwarven Ice Centurion)
    [72180] = { avoid = true, interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.NPC_Dwarven_Sphere }, -- Electric Wave (Dwarven Sphere)

    [52773] = { block = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED }, -- Ice Comet (Mavus Talnarith)
    [52765] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, fakeName = U.Boss_Mavus_Talnarith }, -- Volcanic Rune (Mavus Talnarith)

    -- Stage 9 - Crypts of the Lost
    [56985] = { power = true, priority = 1, auradetect = true }, -- Spirit Shield (Zakael/Rubyn Jonnicent)
    [55089] = { avoid = true, priority = 1, auradetect = true}, -- Poison Mist (Vampire Lord Thisa)
    [55090] = { avoid = true, priority = 1, auradetect = true}, -- Devouring Swarm (Vampire Lord Thisa)
    [55081] = { interrupt = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, noSelf = true, fakeName = U.Boss_Vampire_Lord_Thisa }, -- Vampire Lord Thisa

    [55479] = { block = true, interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Malefic Wreath (Hiath the Battlemaster)
    [55496] = { power = true, priority = 1, auradetect = true }, -- Power Extraction (Hiath the Battlemaster)
    [55174] = { unmit = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED }, -- Marked for Death (Hiath the Battlemaster)

    -- Maelstrom Arena

    -- Stage 1 - Vale of the Surreal
    [70892] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Bone Cage (Maxus the Many)
    [72148] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Bone Cage (Maxus the Many)
    [67765] = { summon = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Multiply (Maxus the Many)
    [67656] = { summon = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Multiply (Maxus the Many)
    [69515] = { summon = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Multiply (Maxus the Many)
    [67691] = { power = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Reunite (Maxus the Many)

    -- Stage 2 - Seht's Balcony
    --[71047] = { block = true, avoid = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Thunderbolt (Clockwork Sentry)
    [72067] = { power = true, priority = 2, auradetect = true }, -- Energizing (Clockwork Sentry)
    [69364] = { avoid = true, priority = 1, auradetect = true }, -- Barrage Function (Centurion Champion)
    [66904] = { power = true, priority = 1, auradetect = true }, -- Full Defense (Centurion Champion)

    -- Stage 3 - The Drome of Toxic Shock
    [67635] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Shock Water (Lamia Queen)
    [73879] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED }, -- Lightning X (Lamia Queen)
    [67757] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Queen's Poison (Lamia Queen)
    [68357] = { power = true, priority = 1, auradetect = true }, -- Queen's Radiance (Lamia Queen)
    [73876] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 1000 }, -- Piercing Shriek (Lamia Queen)

    -- Stage 4 - Seht's Flywheel
    [71045] = { power = true, priority = 1, auradetect = true }, -- Turret Mode (Clockwork Sentry)
    [71050] = { power = true, priority = 1, auradetect = true, ignoreRefresh = true }, -- Static Shield (Clockwork Sentry)
    [73850] = { power = true, priority = 1, auradetect = true, ignoreRefresh = true }, -- Static Shield (Clockwork Sentry)
    [69268] = { power = true, priority = 1, auradetect = true }, -- Enrage (Achelir)

    [72157] = { power = true, priority = 2, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, fakeName = U.NPC_Dwarven_Spider }, -- Static Field (Dwarven Spider)
    [72166] = { block = true, avoid = true, priority = 2, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, refire = 250 }, -- Overcharge (Dwarven Spider)
    [72174] = { block = true, avoid = true, priority = 2, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, refire = 250 }, -- Overcharge (Dwarven Spider)

    [68524] = { power = true, priority = 1, auradetect = true }, -- Overcharged (The Control Guardian)
    [68539] = { power = true, priority = 1, auradetect = true }, -- Overheated (The Control Guardian)
    [68558] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, refire = 20000 }, -- Overheated Volley (The Control Guardian)

    [72195] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Thunder Hammer (Scavenger Thunder-Smith)
    [72198] = { block = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Wrecking Blow (Scavenger Thunder-Smith)
    [72202] = { avoid = true, priority = 2, eventdetect = true, result = ACTION_RESULT_BEGIN, fakeName = U.NPC_Scavenger_Thunder_Smith }, -- Overcharge (Scavenger Thunder-Smith)

    -- Stage 5 - Rink of Frozen Blood

    [70898] = { summon = true, priority = 2, auradetect = true, fakeName = "" }, -- Call Ally (Huntsman Chillbane)
    [71939] = { block = true, avoid = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Frost Breath (Huntsman Chillbane)
    [71937] = { block = true, avoid = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Frost Nova (Huntsman Chillbane)

    [72446] = { interrupt = true, priority = 1, auradetect = true }, -- Smash Iceberg (Troll Breaker)
    [71926] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Frenzy of Blows (Angirgoth)

    [72438] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Shatter (Giant)
    [68439] = { power = true, priority = 1, auradetect = true }, -- Enrage (Aki/Vigi)
    [74130] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Intimidating Roar (Aki/Vigi)

    [66378] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Sweep (Matriarch Runa)
    [72749] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Freezing Stomp (Matriarch Runa)
    [67088] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Intimidating Roar (Matriarch Runa)
    [66325] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Shatter (Matriarch Runa)
    [72409] = { avoid = true, priority = 1, auradetect = true }, -- Taunt (Matriarch Runa)

    --------------------------------------------------
    -- DUNGEONS --------------------------------------
    --------------------------------------------------

    -- Banished Cells I
    [19028] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, refire = 1500 }, -- Drain Essence (Cell Haunter)
    [47587] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Tail Smite (Shadowrend)
    [21886] = { summon = true, priority = 1, auradetect = true }, -- Summon Dark Proxy (Shadowrend)
    [18772] = { interrupt = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossName = true }, -- Feeding (Shadowrend)
    [18708] = { summon = true, priority = 1, auradetect = true }, -- Summon Clannfear (Angata the Clannfear Handler)
    [19025] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Dead Zone (Skeletal Destroyer)

    [33189] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Crushing Blow (High Kinlord Rilis)
    [18840] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Soul Blast (High Kinlord Rilis)
    [18875] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Daedric Tempest (High Kinlord Rilis)

    -- Banished Cells II
    [49150] = { block = true, avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 1500, bossName = true }, -- Cone of Rot (Maw of the Infernal)
    [27826] = { block = true, bs = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Crushing Blow (Keeper Voranil)
    [29018] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, refire = 750, eventdetect = true, bossName = true }, -- Berserker Frenzy (Keeper Voranil)
    [28750] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Essence Siphon (Keeper Voranil)
    [29143] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Daedric Blast (Keeper Imiril)
    [28962] = { power = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED }, -- Sister's Love (Sister Sihna / Sister Vera)
    [48799] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 1500, bossName = true }, -- Daedric Tempest (High Kinlord Rilis)
    [48814] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 1500, bossName = true }, -- Daedric Tempest (High Kinlord Rilis)
    [28570] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Levitate (High Kinlord Rilis)
    [28462] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Levitate (High Kinlord Rilis)

    -- Elden Hollow I
    [16834] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Executioner's Strike (Akash gra-Mal)
    [15999] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Leaping Strike (Akash gra-Mal)
    [16016] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Berserker Frenzy (Akash gra-Mal)

    [9910] = { destroy = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossName = true }, -- Summon Saplings (Chokethorn)
    [9930] = { interrupt = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, refire = 1000, fakeName = U.NPC_Strangler_Saplings }, -- Heal Spores (Chokethorn)
    [9875] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossName = true }, -- Fungal Burst (Chokethorn)

    [44223] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.Boss_Leafseether }, -- Inhale (Leafseether)

    [9845] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Rotting Bolt (Canonreeve Oraneth)
    [16262] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Necrotic Circle (Canonreeve Oraneth)
    [9944] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Necrotic Burst (Canonreeve Oraneth)
    [9839] = { power = true, priority = 1, auradetect = true, ignoreRefresh = true }, -- Bone Hurricane (Canonreeve Oraneth)

    -- Elden Hollow II
    [34376] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, refire = 1500 }, -- Flame Geyser (Dubroze the Infestor)
    [32707] = { summon = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Summon Guardians (Dark Root)
    [33334] = { interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.NPC_Frenzied_Guardian }, -- Latch On Stamina (Frenzied Guardian)
    [33337] = { interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.NPC_Mystic_Guardian }, -- Latch On Magicka (Mystic Guardian)
    [32890] = { power = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Gleaming Light (Dark Root)
    [33533] = { power = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Glaring Light (Dark Root)
    [33535] = { power = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Brightening Light (Dark Root)

    [33170] = { destroy = true, priority = 1, auradetect = true }, -- Hate (Shadow Tendril)

    [33052] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Shadow Stomp (Murklight)
    [32832] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 1750, bossName = true }, -- Consuming Shadow (Murklight)
    [32975] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Eclipse (Murklight)

    [33102] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 1250, bossName = true }, -- Spout Shadow (The Shadow Guard)

    [33432] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Daedric Flame (Bogdan the Nightflame)
    [33480] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Pulverize (Bogdan the Nightflame)
    [33492] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Pulverize (Bogdan the Nightflame)
    [33494] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Pulverize (Bogdan the Nightflame)
    [34260] = { destroy = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, fakeName = U.Boss_Nova_Tendril, refire = 1000 }, -- Shadow (Nova Tendril)

    -- City of Ash I
    [31101] = { block = true, avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Cleave (Golor the Banekin Handler)
    [25034] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Crushing Blow (Golor the Banekin Handler)
    [33604] = { summon = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Summon Banekin (Golor the Banekin Handler)

    [34607] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Measured Uppercut (Warden of the Shrine)
    [34654] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, auradetect = true, bossName = true }, -- Fan of Flames (Warden of the Shrine)
    [34620] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, auradetect = true, bossName = true }, -- Fan of Flames (Warden of the Shrine)

    [34190] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Thorny Backhand (Infernal Guardian)
    [34189] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Ground Slam (Infernal Guardian)
    [35061] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Consuming Fire (Infernal Guardian)
    [34183] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Tunneling Roots (Infernal Guardian)

    [44278] = { block = true, avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED }, -- Lava Geyser (Dark Ember)

    [34198] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true}, -- Burning Field (Rothariel Flameheart)
    [34205] = { power = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, auradetect = true }, -- Deception (Rothariel Flameheart)

    [34901] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Blazing Arrow (Razor Master Erthas)
    [34805] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Release Flame (Razor Master Erthas)
    [34623] = { summon = true, priority = 1, auradetect = true, bossName = true }, -- Summon Flame Atronach (Razor Master Erthas)
    [34780] = { summon = true, priority = 1, auradetect = true, bossName = true }, -- Summon Flame Atranach (Razor Master Erthas)

    -- City of Ash II
    [53999] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, fakeName = A.Skill_Oblivion_Gate }, -- Summon (Flame Atronach)
    [54021] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Release Flame (Marruz)
    [53976] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Blazing Arrow (Marruz)
    [54025] = { interrupt = true, priority = 1, auradetect = true, fakeName = U.Boss_Akezel }, -- Spell Absorption (Akezel)
    [53994] = { interrupt = true, priority = 1, eventdetect = true, fakeName = U.Boss_Akezel, result = ACTION_RESULT_BEGIN }, -- Focused Healing (Akezel)
    [54096] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.Boss_Rukhan }, -- Pyrocasm (Rukhan)

    [56811] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.NPC_Xivilai_Ravager }, -- Pyrocasm (Xivilai Ravager)

    [56414] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Fire Runes (Urata the Legion)
    [54225] = { summon = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Multiply (Urata the Legion)
    [56098] = { summon = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Multiply (Urata the Legion)
    [56104] = { summon = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Multiply (Urata the Legion)
    [56131] = { power = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Reunite (Urata the Legion)

    [56186] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, fakeName = U.NPC_Flame_Colossus }, -- Voice to Wake the Dead (Bone Colossus)

    [55203] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Seismic Tremor (Horvantud the Fire Maw)
    [56002] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Seismic Tremor (Horvantud the Fire Maw)
    [55312] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Slag Breath (Horvantud the Fire Maw)
    [55333] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Fiery Breath (Horvantud the Fire Maw)
    [55320] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Fiery Breath (Horvantud the Fire Maw)
    [55335] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Fiery Breath (Horvantud the Fire Maw)
    [55326] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Fiery Breath (Horvantud the Fire Maw)
    [55337] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Fiery Breath (Horvantud the Fire Maw)
    [57618] = { power = true, priority = 1, auradetect = true, ignoreRefresh = true }, -- Damage Shield (Horvantud the Fire Maw)

    [55315] = { power = true, priority = 1, auradetect = true }, -- Slag Breath (Horvantud the Fire Maw)
    [55324] = { power = true, priority = 1, auradetect = true }, -- Enrage 2 (Horvantud the Fire Maw)
    [55329] = { power = true, priority = 1, auradetect = true }, -- Enrage 3 (Horvantud the Fire Maw)

    [54218] = { block = true, dodge = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossName = true }, -- Monstrous Cleave (Ash Titan)
    [54895] = { block = true, avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossName = true }, -- Molten Rain (Ash Titan)
    [54699] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, bossName = true }, -- Fire Swarm (Ash Titan)

    [58468] = { power = true, auradetect = true, priority = 1 }, -- Shadow Cloak (Ash Titan)
    [54783] = { power = true, auradetect = true, priority = 1 }, -- Air Atronach Flame (Air Atronach)
    [54366] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, refire = 1500, fakeName = U.NPC_Air_Atronach }, -- Flame Tornado (Air Atronach)

    [58280] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, bossName = true }, -- Scary Summon 1 (Xivilai Fulminator / Boltaic)
    [56601] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, bossName = true }, -- Scary Summon 2 (Xivilai Fulminator / Boltaic)

    [55513] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Flame Bolt (Valkyn Skoria)
    [55387] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Meteor Strike (Valkyn Skoria)
    [55514] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Call the Flames (Valkyn Skoria)
    [55426] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Magma Prison (Valkyn Skoria)
    [55024] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Lava Quake (Valkyn Skoria)
    [55500] = { power = true, priority = 1, auradetect = true, ignoreRefresh = true }, -- Rock Shield (Valkyn Skoria)

    -- Tempest Island
    [46732] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true, refire = 1000 }, -- Sonic Scream (Sonolia the Matriarch)

    [26370] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Slash (Valaran Stormcaller)
    [26628] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Enervating Bolt (Valaran Stormcaller)
    [26592] = { summon = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, bossName = true }, -- Lightning Avatar (Valaran Stormcaller)

    [6106] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Lightning Storm (Yalorasse the Speaker)

    [26748] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true, refire = 1000 }, -- Enervating Stone (Stormfist)
    [26714] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Skyward Slam (Stormfist)
    [26833] = { summon = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Summon Storm Atronach (Stormfist)
    [26790] = { power = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true, refire = 60000 }, -- Unstable Explosion (Stormfist)

    [27039] = { interrupt = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true, refire = 600 }, -- Ethereal Chain (Commodore Ohmanil)

    [27596] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Lightning Strike (Stormreeve Neider)
    [26741] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Swift Wind (Stormreeve Neider)
    [26712] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Gust of Wind (Stormreeve Neider)

    -- Selene's Web
    [30909] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, refire = 2000, bossName = true }, -- Ensnare (Treethane Kerninn)
    [30907] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Summon Primal Swarm (Treethane Kerninn)

    [30781] = { power = true, priority = 1, auradetect = true }, -- Mirror Ward (Longclaw)
    [30772] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true, refire = 1250 }, -- Arrow Rain (Longclaw)
    [30779] = { summon = true, priority = 1, auradetect = true, refire = 500, fakeName = "" }, -- Spirit Form (Senche Spirit)
    [31096] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Poison Burst (Longclaw)

    [31202] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Venomous Burst (Queen Aklayah)
    [31205] = { power = true, priority = 1, auradetect = true, noSelf = true }, -- Venomous Burst (Queen Aklayah)

    [30996] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Vicious Maul (Foulhide)
    [30812] = { avoid = true, block = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Trampling Charge (Foulhide)
    [31002] = { summon = true, priority = 1, auradetect = true, fakeName = "", refire = 5000 }, -- Intro (Selene's Rose)

    [31241] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED, bossName = true }, -- Summon Spiders (Mennir Many-Legs)

    [31052] = { power = true, priority = 1, auradetect = true, noSelf = true }, -- Web Wrap (Selene)
    [30731] = { block = true, dodge = true, priority = 1, auradetect = true }, -- Summon Primal Spirit (Selene)
    [30896] = { dodge = true, priority = 1, auradetect = true, bossName = true }, -- Summon Senche Spirit (Selene)

    [31986] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED }, -- Summon Melee (Selene)
    [31984] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED }, -- Summon Healer (Selene)
    [31985] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_EFFECT_GAINED }, -- Summon Archer (Selene)

    -- Spindleclutch I
    [46147] = { summon = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossName = true }, -- Summon Swarm (Spindlekin)

    [22034] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Inject Poison (Swarm Mother)
    [17964] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Impeding Webs (Swarm Mother)
    [17960] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Arachnid Leap (Swarm Mother)
    [18559] = { summon = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, eventdetect = true, refire = 1000, bossName = true }, -- Spawn Broodling (Swarm Mother)

    [18111] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Arachnophobia (Swarm Mother)
    [18078] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Web Blast (Swarm Mother)
    [35572] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Grappling Web (Swarm Mother)
    [18058] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Daedric Explosion (Swarm Mother)

    -- Spindleclutch II
    [28093] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Vicious Smash (Blood Spawn)
    [27995] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Cave-In (Blood Spawn)
    [47331] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true, refire = 60000 }, -- Cave-In (Blood Spawn)
    [47198] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, auradetect = true, refire = 5000, fakeName = "" }, -- Falling Rocks (Cave In)

    [28438] = { summon = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Dummy (Praxin Douare)
    [18036] = { block = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, fakeName = U.NPC_The_Whisperer_Nightmare, refire = 2500 }, -- Grappling Web (The Whisperer Nightmare)

    [27965] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Despair (Praxin Douare)
    [27741] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Despair (Praxin Douare)
    [27703] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Harrowing Ring (Praxin Douare)
    [61443] = { power = true, priority = 1, auradetect = true, noSelf = true }, -- Harrowing Ring (Praxin Douare)

    [27435] = { power = true, priority = 1, auradetect = true }, -- Monstrous Growth (Flesh Atronach)
    [27437] = { power = true, priority = 1, auradetect = true }, -- Monstrous Growth (Flesh Atronach)

    [27600] = { avoid = true, priority = 1, result = ACTION_RESULT_EFFECT_GAINED, auradetect = true }, -- Blood Pool (Urvan Veleth)

    [27905] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Blood Pool (Vorenor Winterbourne)
    [27897] = { unmit = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Open Wounds (Vorenor Winterbourne)
    [27791] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Blood Frenzy (Vorenor Winterbourne)

    [31672] = { power = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true, refire = 2500 }, -- Thrall Feast (Vorenor Winterbourne)

    -- Wayrest Sewers I
    [34846] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Primal Sweep (Slimecraw)

    [9441] = { block = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Dark Lance (Investigator Garron)
    [25593] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true, bossName = true }, -- Summon Necrotic Orb (Investigator Garron)
    [9740] = { summon = true, priority = 1, auradetect = true, bossName = true }, -- Tormented Summoning (Restless Soul)

    [25548] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Smite (Varaine Pellingare)
    [9648] = { block = true, dodge = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossName = true }, -- Spinning Cleave (Varaine Pellingare)
    [36435] = { avoid = true, priority = 1, eventdetect = true, result = ACTION_RESULT_BEGIN, bossName = true }, -- Tidal Slash (Varaine Pellingare)
    [9656] = { dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Poisoned Blade (Varaine Pellingare)

    [11752] = { block = true, bs = true, dodge = true, priority = 1, result = ACTION_RESULT_BEGIN }, -- Penetrating Daggers (Allene Pellingare)
    [35006] = { power = true, priority = 1, auradetect = true }, -- Hallucinogenic Fumes (Allene Pellingare)
    [35021] = { power = true, priority = 1, auradetect = true }, -- Mind-Bending Mist (Allene Pellingare)
    [35041] = { power = true, priority = 1, auradetect = true }, -- Mind-Bending Mist (Allene Pellingare)

    -- Frostvault
    [109574] = { block = true, interrupt = true, priority = 3, result = ACTION_RESULT_BEGIN, refire = 3250 }, -- Fire Power (Coldsnap Harrier)
    [117352] = { block = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Whirlwind (Coldsnap Snowstalker)

    [117290] = { block = true, avoid = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Shockwave (Coldsnap Ogre)
    [117287] = { block = true, bs = true, dodge = true, priority = 2, result = ACTION_RESULT_BEGIN }, -- Crushing Blow (Coldsnap Ogre)

    [117326] = { block = true, priority = 3, result = ACTION_RESULT_EFFECT_GAINED, refire = 250 }, -- Ice Comet (Coldsnap Skysplitter)

    [109827] = { block = true, avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Boulder Toss (Icestalker)
    [109811] = { avoid = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Ground Slam (Icestalker)
    [109837] = { interrupt = true, priority = 1,  result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Frenzied Pummeling (Icestalker)
    [109806] = { block = true, priority = 1, result = ACTION_RESULT_BEGIN, eventdetect = true }, -- Frozen Aura (Icestalker)
    [83430] = { block = true, bs = true, dodge = true, priority = 3, result = ACTION_RESULT_BEGIN }, -- Skeletal Smash (Ice Wraith)
}
