--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

-- Cast Bar Table namespace
LUIE.CastBarTable = {}
local CBT = LUIE.CastBarTable

--------------------------------------------------------------------------------------------------------------------------------
-- When a hard CC effect is successfully applied to the player, instantly stop any in progress Casts
--------------------------------------------------------------------------------------------------------------------------------
CBT.CastBreakingStatus = {
    [ACTION_RESULT_STAGGERED] = true,
    [ACTION_RESULT_STUNNED] = true,
    [ACTION_RESULT_KNOCKBACK] = true,
    [ACTION_RESULT_LEVITATED] = true,
    [ACTION_RESULT_FEARED] = true,
    [ACTION_RESULT_DISORIENTED] = true,
}

--------------------------------------------------------------------------------------------------------------------------------
-- List of abilityId's that should immediately cancel the Cast Bar if detected
--------------------------------------------------------------------------------------------------------------------------------
CBT.CastBreakingActions = {
    [28549] = true, -- Roll Dodge
    [14890] = true, -- Block
    --[20309] = true, -- Hidden
    [973] = true, -- Sprint
    [33439] = true, -- Mount Sprint
}

CBT.BreakCastOnMove = {
    -- Innate
    [6811] = true, -- Recall
    [69293] = true, -- Sigil of Imperial Retreat

    -- Misc Items
    [63427] = true, -- Clean Fish (Filet Fish)

    ----------------------------------------------------------------
    -- CYRODIIL ----------------------------------------------------
    ----------------------------------------------------------------

    [12256] = true, -- Pack Siege (Siege Weapons)

    [29673] = true, -- Create Ballista Bolt... (Ballista)
    [29672] = true, -- Create Ballista Bolt... (Ballista)
    [29671] = true, -- Create Ballista Bolt... (Ballista)

    [30611] = true, -- Create Ballista Fire Bolt... (Fire Ballista)
    [30607] = true, -- Create Ballista Fire Bolt... (Fire Ballista)
    [16751] = true, -- Create Ballista Fire Bolt... (Fire Ballista)

    [30612] = true, -- Create Ballista Lightning Bolt ... (Lightning Ballista)
    [30608] = true, -- Create Ballista Lightning Bolt ... (Lightning Ballista)
    [16752] = true, -- Create Ballista Lightning Bolt ... (Lightning Ballista)

    [39914] = true, -- Create Trebuchet... (Stone Trebuchet)
    [39917] = true, -- Create Trebuchet... (Stone Trebuchet)
    [39910] = true, -- Create Trebuchet... (Stone Trebuchet)

    [39913] = true, -- Create Trebuchet... (Iceball Trebuchet)
    [39916] = true, -- Create Trebuchet... (Iceball Trebuchet)
    [39909] = true, -- Create Trebuchet... (Iceball Trebuchet)

    [13665] = true, -- Create Trebuchet... (Firepot Trebuchet)
    [13664] = true, -- Create Trebuchet... (Firepot Trebuchet)
    [13663] = true, -- Create Trebuchet... (Firepot Trebuchet)

    [30613] = true, -- Create Catapult Meatbag (Meatbag Catapult)
    [30609] = true, -- Create Catapult Meatbag (Meatbag Catapult)
    [16755] = true, -- Create Catapult Meatbag (Meatbag Catapult)

    [30614] = true, -- Create Catapult Oil Jar... (Oil Catapult)
    [30610] = true, -- Create Catapult Oil Jar... (Oil Catapult)
    [16754] = true, -- Create Catapult Oil Jar... (Oil Catapult)

    [39915] = true, -- Create Catapult Meatbag (Scattershot Catapult)
    [39918] = true, -- Create Catapult Oil Jar... (Scattershot Catapult)
    [39911] = true, -- Create Trebuchet... (Scattershot Catapult)

    [66438] = true, -- Create Trebuchet... (Cold Stone Trebuchet)
    [66439] = true, -- Create Trebuchet... (Cold Stone Trebuchet)
    [66440] = true, -- Create Trebuchet... (Cold Stone Trebuchet)

    [66434] = true, -- Create Trebuchet... (Cold Fire Trebuchet)
    [66388] = true, -- Create Trebuchet... (Cold Fire Trebuchet)
    [66387] = true, -- Create Trebuchet... (Cold Fire Trebuchet)

    [66437] = true, -- Create Ballista... (Cold Fire Ballista)
    [66436] = true, -- Create Ballista... (Cold Fire Ballista)
    [66435] = true, -- Create Ballista... (Cold Fire Ballista)

    [22570] = true, -- Create Boiling Oil... (Flaming Oil)
    [15876] = true, -- Create Large Ram... (Battering Ram)
    [16171] = true, -- Create Large Ram... (Battering Ram)
    [16170] = true, -- Create Large Ram... (Battering Ram)

    [13853] = true, -- Wall Repair Kit
    [16723] = true, -- Door Repair Kit
    [13601] = true, -- Advanced Siege Repair Kit
    [112975] = true, -- Wall Repair Kit (Bridge and Milegate Repair Kit)

    [19039] = true, -- Ebonheart Forward Camp
    [19040] = true, -- Aldmeri Forward Camp
    [19041] = true, -- Daggerfall Forward Camp

    -- [12355] = true, -- Destroy Siege Weapon (Doesn't show up due to Cyrodiil Limitations)

    -- Siege Warfare
    [33348] = true, -- Practice Siege Repair Kit (Practice Siege Repair Kit)

    ----------------------------------------------------------------
    -- QUESTS ------------------------------------------------------
    ----------------------------------------------------------------

    -- Aldmeri Quests
    [21364] = true, -- Casting... (The Serpent's Beacon)
    [21409] = true, -- Reading... (The Serpent's Beacon)
    [21393] = true, -- Q4220 PC Chooses to Rescue
    [22931] = true, -- Freeing Spirit... (An Act of Kindness)
}

CBT.IgnoreCastBreakingActions = {
    --[21112] = true, -- Q4220 PC Forced to L0
}

--------------------------------------------------------------------------------------------------------------------------------
--  List of abilities flagged for CombatInfo to show as a Channel on the Cast Bar
--------------------------------------------------------------------------------------------------------------------------------
CBT.CastChannelOverride = {
    ----------------------------------------------------------------
    -- PLAYER ABILITIES --------------------------------------------
    ----------------------------------------------------------------

    -- Innate
    [32346] = true, -- Skyshard Collect
    [47270] = true, -- Ritual of Mara
    [14031] = true, -- Mundus Use
    [4197] = true, -- Recovering (NPC Duel)

    -- Seasonal Mementos & Items
    [86792] = true, -- Eating (High Hrothgar Festival Mints)
    [86739] = true, -- Drinking (Sailor's Warning Festival Grog)
    [85355] = true, -- Flame Juggling (Consumable Version)
    [85354] = true, -- Dagger Juggling (Consumable Verison)
    [85353] = true, -- Sword Swallowing (Consumable Version)
    [102077] = true, -- Jester's Festival Scintillator (Jester's Scintillator)

    -- Memento (Crown)
    [85347] = true, -- Storm Orb Juggle (Atronach Juggling)
    [97273] = true, -- TROPHY Death Crate Mem 1 (Crow's Calling)
    [99318] = true, -- TROPHY Flame Crate Mem 1 (Fiery Orb)
    [99319] = true, -- Flame Crate Memento 2 (Flame Pixie)
    [99320] = true, -- TROPHY Flame Crate Mem 3 (Flame Eruption)
    [101874] = true, -- _CRWN Dragon Priest Mem2 Ice T (Scalecaller Frost Shard)
    [101877] = true, -- _CRWN Dragon Priest Mem1 Fl/St (Scalecaller Rune of Levitation)
    [101872] = true, -- _CRWN Dragon Priest Memento3 (Bone Dragon Summons Focus)
    [104324] = true, -- Psijic Pearl Summon (Psijic Celestial Orb)
    [104323] = true, -- Psijic Hourglass (Psijic Tautology Glass)
    [104325] = true, -- Psijic Disintegrate (Sapiarchic Discorporation Lens)
    [110482] = true, -- Rind-Renewing Pumpkin (Rind-Renewing Pumpkin)
    [110481] = true, -- Gourd-Gallows Stump (Gourd-Gallows Stump)
    [113288] = true, -- U20 Crown Memento 1 (Mire Drum)
    [113291] = true, --  U20 Crown Memento 2 (Vossa-satl)

    -- Memento (Base)
    [43700] = true, -- Wand of Finding (Lena's Wand of Finding)
    [42076] = true, -- Tear (Mezha-dro's Sealing Amulet)
    [34578] = true, -- Nirnroot Wine (Nirnroot Wine)
    [42053] = true, -- Yokudan Salute (Yokudan Totem)

    -- Memento (DLC)
    [89550] = true, -- TROPHY Azura's Light (Twilight Shard)
    [79510] = true, -- TROPHY Blood Oath (Blade of the Blood Oath)

    -- Sets
    [90940] = true, -- Eternal Warrior
    [90937] = true, -- Immortal Warrior
    [90935] = true, -- Phoenix

    -- Vampire
    [33175] = true, -- Feed (Vampire)
    [40350] = true, -- Feed (Vampire - Bite Player)

    ----------------------------------------------------------------
    -- QUEST ABILITIES ---------------------------------------------
    ----------------------------------------------------------------

    -- Vampire Quest
    [39507] = true, -- VampInitStun_Profane (Scion of the Blood Matron)

    -- MSQ
    [39367] = true, -- Altar Use (Shadow of Sancre Tor)
    [36421] = true, -- Drink with Lyris (Council of the Five Companions)
    [35192] = true, -- Q4620 Use Lodestone (Cast Adrift)
    [34567] = true, -- Q4621 PC Storm Drain (The Tempest Unleashed)
    [34701] = true, -- Q4621 Destory Horn (The Tempest Unleashed)
    [21364] = true, -- Casting... (The Serpent's Beacon)
    [22889] = true, -- Purifying... (Corruption Stones)
    [21968] = true, -- Binding Bear... (Silent Village)
    [22931] = true, -- Freeing Spirit... (An Act of Kindness)
    [23187] = true, -- Q4236 PC Untie Palith (The Veiled Choice)
    [47301] = true, -- Stunned (Passage Denied)
    [36710] = true, -- Q4833 Apply Snake Buff (Bosmer Insight)
    [36841] = true, -- Q4833 Apply Wolf Buff (Bosmer Insight)
    [36824] = true, -- Q4833 Apply Tiger Buff (Bosmer Insight)
    [37062] = true, -- Exorcise (The Unquiet Dead)
    [36996] = true, -- Bind Spirit (The Unquiet Dead)
    [37205] = true, -- Animus Geode (Eyes of Azura)
    [37211] = true, -- Q4854 Empower Heart (Eyes of Azura)
    [38246] = true, -- Animus Geode (Eyes of Azura)

    ----------------------------------------------------------------
    -- SEASONAL QUEST ----------------------------------------------
    ----------------------------------------------------------------

    -- New Life Festival
    [84847] = true, -- Celebratory Belch (Stonetooth Bash)
    [84125] = true, -- Breton Male Dance (Lava Foot Stomp)
    [84126] = true, -- Breton Female Dance (Lava Foot Stomp)
    [84127] = true, -- Dunmer Male Dance (Lava Foot Stomp)
    [84128] = true, -- Dunmer Female Dance (Lava Foot Stomp)
    [84130] = true, -- Altmer Male Dance (Lava Foot Stomp)
    [84131] = true, -- Altmer Female Dance (Lava Foot Stomp)
    [84133] = true, -- Nord Dance (Lava Foot Stomp)
    [84528] = true, -- Flame Juggling (Castle Charm Challenge)
    [84506] = true, -- Dagger Juggling (Castle Charm Challenge)
    [84533] = true, -- Sword Swallowing (Castle Charm Challenge)
}

--------------------------------------------------------------------------------------------------------------------------------
--  Duration update for any effects that are converted to casts (A lot of stun effects in PVE Quests with casting animations)
--------------------------------------------------------------------------------------------------------------------------------
CBT.CastDurationFix = {
    ----------------------------------------------------------------
    -- PLAYER ABILITIES --------------------------------------------
    ----------------------------------------------------------------

    -- Necromancer
    [115478] = 1200, -- Bone Goliath Self Snare (Bone Goliath Transformation)
    [118673] = 1200, -- Pummeling Goliath Self Snare (Pummeling Goliath)
    [118287] = 1200, -- Ravenous Goliath Self Snare (Ravenous Goliath)

    -- Innate
    [37059] = 1165, -- Mount Up
    [14644] = 4000, -- Revive (Death Dialogue)
    [32346] = 5800, -- Skyshard Collect
    [47270] = 5600, -- Ritual of Mara
    [14031] = 5000, -- Mundus Use
    [4197] = 4000, -- Recovering (NPC Duel)

    -- Misc Items
    [89469] = 5000, -- 68235 Stun (Create crafting station)
    [89645] = 5000, -- 68235 Stun (Create crafting station)
    [105217] = 5000, -- 68235 Stun (Create crafting station)
    [89654] = 5000, -- 68235 Stun (Create crafting station)
    [113432] = 5000, -- 68235 Stun (Nascent Indrik)

    -- Seasonal Mementos and Items
    [86792] = 3000, -- Eating (High Hrothgar Festival Mints)
    [86739] = 3000, -- Drinking (Sailor's Warning Festival Grog)
    [85355] = 12000, -- Flame Juggling (Consumable Version)
    [85354] = 12000, -- Dagger Juggling (Consumable Verison)
    [85353] = 12000, -- Sword Swallowing (Consumable Version)
    [102077] = 2000, -- Jester's Festival Scintillator (Jester's Scintillator)
    [81575] = 2000, -- Event - WitchFest Cauldron (Witchmother's Whistle)

    -- Memento (Crown)
    [85347] = 12000, -- Storm Orb Juggle (Atronach Juggling)
    [97273] = 9000, -- TROPHY Death Crate Mem 1 (Crow's Calling)
    [99318] = 9000, -- TROPHY Flame Crate Mem 1 (Fiery Orb)
    [99319] = 8000, -- Flame Crate Memento 2 (Flame Pixie)
    [99320] = 2000, -- TROPHY Flame Crate Mem 3 (Flame Eruption)
    [101874] = 10000, -- _CRWN Dragon Priest Mem2 Ice T (Scalecaller Frost Shard)
    [101877] = 9000, -- _CRWN Dragon Priest Mem1 Fl/St (Scalecaller Rune of Levitation)
    [101872] = 5000, -- _CRWN Dragon Priest Memento3 (Bone Dragon Summons Focus)
    [104324] = 7500, -- Psijic Pearl Summon (Psijic Celestial Orb)
    [104323] = 6000, -- Psijic Hourglass (Psijic Tautology Glass)
    [104325] = 6500, -- Psijic Disintegrate (Sapiarchic Discorporation Lens)
    [110482] = 9000, -- Rind-Renewing Pumpkin (Rind-Renewing Pumpkin)
    [110481] = 1500, -- Gourd-Gallows Stump (Gourd-Gallows Stump)
    [113288] = 10000, -- U20 Crown Memento 1 (Mire Drum)
    [113291] = 13000, --  U20 Crown Memento 2 (Vossa-satl)

    -- Memento (Base)
    [42076] = 8000, -- Tear (Mezha-dro's Sealing Amulet)
    [34578] = 8000, -- Nirnroot Wine (Nirnroot Wine)
    [42053] = 10000, -- Yokudan Salute (Yokudan Totem)

    -- Memento (DLC)
    [89550] = 9000, -- TROPHY Azura's Light (Twilight Shard)
    [79510] = 6500, -- TROPHY Blood Oath (Blade of the Blood Oath)
    [74151] = 2500, -- Stun (Hidden Pressure Vent)
    [92862] = 4500, -- Ringing Bell (Dreamer's Chime)

    [33175] = 6300, -- Feed (Vampire)
    [40350] = 5300, -- Feed (Vampire - Bite Player)
    [33208] = 3000, -- Devour (Werewolf)
    [39033] = 1100, -- Werewolf Transform Setup (Werewolf)
    [39477] = 1500, -- De-Werewolf (Werewolf)
    [75008] = 6500, -- Werewolf Transformation (Werewolf - Quest Transformation)

    -- Sets
    [90940] = 3000, -- Eternal Warrior
    [90937] = 3000, -- Immortal Warrior
    [90935] = 3000, -- Phoenix

    ----------------------------------------------------------------
    -- QUEST ABILITIES ---------------------------------------------
    ----------------------------------------------------------------

    -- Vampire Quest
    [39507] = 23000, -- VampInitStun_Profane (Scion of the Blood Matron)

    -- Main Story Quest
    [39367] = 10000, -- Altar Use (Shadow of Sancre Tor)
    [36421] = 3000, -- Drink with Lyris (Council of the Five Companions)

    -- Aldmeri Quests
    [34701] = 1950, -- Q4621 Destory Horn (The Tempest Unleashed)
    [22448] = 3000, -- Q4266 Tie up Hendil (The First Patient)
    [21393] = 2500, -- Q4220 PC Chooses to Rescue (The Mallari-Mora)
    --[21112] = 1500, -- Q4220 PC Forced to L0
    [22271] = 3000, -- Teleport Scroll AB (Depths of Madness)
    [23187] = 2000, -- Q4236 PC Untie Palith (The Veiled Choice)
    [47301] = 3000, -- Stunned (Passage Denied)
    [40504] = 3500, -- Q4922 Use Mantle on Device (The Orrery of Elden Root)
    [40557] = 3500, -- (12127) CFX_4922 Mantle Cast S (The Orrery of Elden Root)
    [36710] = 4000, -- Q4833 Apply Snake Buff (Bosmer Insight)
    [36841] = 4000, -- Q4833 Apply Wolf Buff (Bosmer Insight)
    [36824] = 4000, -- Q4833 Apply Tiger Buff (Bosmer Insight)
    [33701] = 1000, -- BurrowEND (Throne of the Wilderking)

    ----------------------------------------------------------------
    -- SEASONAL QUEST ----------------------------------------------
    ----------------------------------------------------------------

    -- New Life Festival
    [84847] = 5000, -- Celebratory Belch (Stonetooth Bash)
    [84125] = 10000, -- Breton Male Dance (Lava Foot Stomp)
    [84126] = 10000, -- Breton Female Dance (Lava Foot Stomp)
    [84127] = 10000, -- Dunmer Male Dance (Lava Foot Stomp)
    [84128] = 10000, -- Dunmer Female Dance (Lava Foot Stomp)
    [84130] = 10000, -- Altmer Male Dance (Lava Foot Stomp)
    [84131] = 10000, -- Altmer Female Dance (Lava Foot Stomp)
    [84133] = 10000, -- Nord Dance (Lava Foot Stomp)
    [84528] = 12000, -- Flame Juggling (Castle Charm Challenge)
    [84506] = 12000, -- Dagger Juggling (Castle Charm Challenge)
    [84533] = 12000, -- Sword Swallowing (Castle Charm Challenge)
    [83775] = 2000, -- Event - Q5742 WitchFest Intro (The Witchmother's Bargain)
}

--------------------------------------------------------------------------------------------------------------------------------
--  List of abilities flagged for CombatInfo to show on the Cast Bar
--------------------------------------------------------------------------------------------------------------------------------
CBT.IsCast = {
    ----------------------------------------------------------------
    -- PLAYER ABILITIES --------------------------------------------
    ----------------------------------------------------------------

    -- Innate
    [6811] = true, -- Recall
    [69293] = true, -- Sigil of Imperial Retreat
    [37059] = true, -- Mount Up
    [14031] = true, -- Mundus Use
    [14644] = true, -- Revive (Death Dialogue)
    [32346] = true, -- Skyshard Collect
    [47270] = true, -- Ritual of Mara

    -- Misc Items
    [89469] = true, -- 68235 Stun (Create furniture station)
    [89645] = true, -- 68235 Stun (Create furniture station)
    [105217] = true, -- 68235 Stun (Create furniture station)
    [89654] = true, -- 68235 Stun (Create furniture station)
    [113432] = true, -- 68235 Stun (Nascent Indrik)
    [63427] = true, -- Clean Fish (Filet Fish)
    [78052] = true, -- Minor Pardon (Counterfeit Pardon Edict)
    [76350] = true, -- Moderate Pardon (Leniency Edict)
    [76349] = true, -- Full Pardon (Grand Amnesty Edict)

    -- Seasonal Mementos and Items
    [86792] = true, -- Eating (High Hrothgar Festival Mints)
    [86739] = true, -- Drinking (Sailor's Warning Festival Grog)

    -- Memento (Seasonal)
    [85355] = true, -- Flame Juggling (Consumable Version)
    [85354] = true, -- Dagger Juggling (Consumable Verison)
    [85353] = true, -- Sword Swallowing (Consumable Version)
    [87964] = true, -- Jester's Festival Illusion Daz (Sparkwreath Dazzler)
    [87965] = true, -- Jester's Festival Illusion Daz (Plume Dazzler)
    [87966] = true, -- Jester's Festival Illusion Daz (Spiral Dazzler)
    [88374] = true, -- Jester's Festival Illusion Daz (Sparkly Hat Dazzler)
    [116879] = true, -- Alliance Pie (Revelry Pie)
    [87963] = true, -- Bestowed Cherry Blossoms (Cherry Blossom Branch)
    [102077] = true, -- Jester's Festival Scintillator (Jester's Scintillator)
    [81575] = true, -- Event - WitchFest Cauldron (Witchmother's Whistle)
    [104324] = true, -- Psijic Pearl Summon (Psijic Celestial Orb)
    [104323] = true, -- Psijic Hourglass (Psijic Tautology Glass)
    [104325] = true, -- Psijic Disintegrate (Sapiarchic Discorporation Lens)
    [110482] = true, -- Rind-Renewing Pumpkin (Rind-Renewing Pumpkin)
    [110481] = true, -- Gourd-Gallows Stump (Gourd-Gallows Stump)
    [113288] = true, -- U20 Crown Memento 1 (Mire Drum)
    [113291] = true, --  U20 Crown Memento 2 (Vossa-satl)

    -- Memento (Crown)
    [85347] = true, -- Storm Orb Juggle (Atronach Juggling)
    [97273] = true, -- TROPHY Death Crate Mem 1 (Crow's Calling)
    [99318] = true, -- TROPHY Flame Crate Mem 1 (Fiery Orb)
    [99319] = true, -- Flame Crate Memento 2 (Flame Pixie)
    [99320] = true, -- TROPHY Flame Crate Mem 3 (Flame Eruption)
    [101874] = true, -- _CRWN Dragon Priest Mem2 Ice T (Scalecaller Frost Shard)
    [101877] = true, -- _CRWN Dragon Priest Mem1 Fl/St (Scalecaller Rune of Levitation)
    [101872] = true, -- _CRWN Dragon Priest Memento3 (Bone Dragon Summons Focus)

    -- Memento (Base)
    [26736] = true, -- Bear Trap (Battered Bear Trap)
    [16846] = true, -- Blackfeather Court Whistle (Blackfeather Court Whistle)
    [41988] = true, -- Bonesnap Binding Stone (Bonesnap Binding Stone)
    [41948] = true, -- Glanir's Smoke Bomb (Glanir's Smoke Bomb)
    [43700] = true, -- Wand of Finding (Lena's Wand of Finding)
    [42076] = true, -- Tear (Mezha-dro's Sealing Amulet)
    [42105] = true, -- Nanwen's Sword (Nanwen's Sword)
    [34578] = true, -- Nirnroot Wine (Nirnroot Wine)
    [25369] = true, -- Sanguine's Goblet (Sanguine's Goblet)
    [42008] = true, -- Blessing of Root Sunder (Token of Root Sunder)
    [42053] = true, -- Yokudan Salute (Yokudan Totem)

    -- Memento (DLC)
    [89550] = true, -- TROPHY Azura's Light (Twilight Shard)
    [79510] = true, -- TROPHY Blood Oath (Blade of the Blood Oath)
    [73686] = true, -- Old Orsinium Trophy (Malacath's Wrathful Flame)
    [74151] = true, -- Stun (Hidden Pressure Vent)
    [92862] = true, -- Ringing Bell (Dreamer's Chime)

    -- Sorcerer
    [43714] = true, -- Crystal Shard (Sorcerer)
    [46331] = true, -- Crystal Blast (Sorcerer)
    [46324] = true, -- Crystal Fragments (Sorcerer)
    [24584] = true, -- Dark Exchange (Sorcerer)
    [24595] = true, -- Dark Deal (Sorcerer)
    [24589] = true, -- Dark Conversion (Sorcerer)
    [23304] = true, -- Summon Unstable Familiar (Sorcerer)
    [23319] = true, -- Summon Unstable Clannfear (Sorcerer)
    [23316] = true, -- Summon Volatile Familiar (Sorcerer)
    [24613] = true, -- Summon Winged Twilight (Sorcerer)
    [24636] = true, -- Summon Twilight Tormentor (Sorcerer)
    [24639] = true, -- Summon Twilight Matriarch (Sorcerer)

    -- Templar
    [26114] = true, -- Puncturing Strikes (Templar)
    [26792] = true, -- Biting Jabs (Templar)
    [26797] = true, -- Puncturing Sweep (Templar)
    [22057] = true, -- Solar Flare (Templar)
    [22110] = true, -- Dark Flare (Templar)
    [63029] = true, -- Radiant Destruction (Templar)
    [63044] = true, -- Radiant Glory (Templar)
    [63046] = true, -- Radiant Oppression (Templar)
    [22223] = true, -- Rite of Passage (Templar)
    [22229] = true, -- Remembrance (Templar)
    [22226] = true, -- Practiced Incantation (Templar)

    -- Warden
    [85982] = true, -- Feral Guardian (Warden)
    [85986] = true, -- Eternal Guardian (Warden)
    [85990] = true, -- Wild Guardian (Warden)

    -- Necromancer
    [115478] = true, -- Bone Goliath Self Snare (Bone Goliath Transformation)
    [118673] = true, -- Pummeling Goliath Self Snare (Pummeling Goliath)
    [118287] = true, -- Ravenous Goliath Self Snare (Ravenous Goliath)

    -- Two Handed
    [28279] = true, -- Uppercut (Two Handed)
    [38814] = true, -- Dizzying Swing (Two Handed)
    [38807] = true, -- Wrecking Blow (Two Handed)

    -- Dual Wield
    [28607] = true, -- Flurry (Dual Wield)
    [38857] = true, -- Rapid Strikes (Dual Wield)
    [38846] = true, -- Bloodthirst (Duel Wield)

    -- Bow
    [28882] = true, -- Snipe (Bow)
    [38685] = true, -- Lethal Arrow (Bow)
    [38687] = true, -- Focused Aim (Bow)
    [83465] = true, -- Rapid Fire (Bow)
    [85257] = true, -- Toxic Barrage (Bow)

    -- Restoration Staff
    [31531] = true, -- Force Siphon (Restoration Staff)
    [40109] = true, -- Siphon Spirit (Restoration Staff)

    -- Soul Magic
    [39270] = true, -- Soul Strike (Soul Magic)
    [40420] = true, -- Soul Assault (Soul Magic)
    [40414] = true, -- Shatter Soul (Soul Magic)

    -- Vampire
    [33175] = true, -- Feed (Vampire)
    [40350] = true, -- Feed (Vampire - Bite Player)
    [39692] = true, -- Feed (Vampire - Quest)
    [32893] = true, -- Drain Essence (Vampire)
    [32986] = true, -- Mist Form (Vampire)
    [38963] = true, -- Elusive Mist (Vampire)
    [38965] = true, -- Baleful Mist (Vampire)
    [38949] = true, -- Invigorating Drain (Vampire)
    [38956] = true, -- Accelerating Drain (Vampire)

    -- Werewolf
    [33208] = true, -- Devour (Werewolf)
    [39033] = true, -- Werewolf Transform Setup (Werewolf)
    [39477] = true, -- De-Werewolf (Werewolf)
    [40515] = true, -- Devour (Werewolf - Bite Player)
    [75008] = true, -- Werewolf Transformation (Werewolf - Quest Transformation)
    [40124] = true, -- Devour (Werewolf - Quest)

    -- Guild
    [103488] = true, -- Time Stop (Psijic Order)
    [104059] = true, -- Borrowed Time (Psijic Order)
    [103706] = true, -- Channeled Acceleration (Psijic Order)
    [39489] = true, -- Blood Altar (Undaunted)
    [41967] = true, -- Sanguine Altar (Undaunted)
    [41958] = true, -- Overflowing Altar (Undaunted)

    -- Alliance War
    [61487] = true, -- Magicka Detonation (Assault)
    [61491] = true, -- Inevitable Detonation (Assault)

    -- Sets
    [90940] = true, -- Eternal Warrior
    [90937] = true, -- Immortal Warrior
    [90935] = true, -- Phoenix

    ----------------------------------------------------------------
    -- NPC ABILITIES -----------------------------------------------
    ----------------------------------------------------------------

    -- Shared/Innate
    [4197] = true, -- Recovering (NPC Duel)

    ----------------------------------------------------------------
    -- CYRODIIL ----------------------------------------------------
    ----------------------------------------------------------------

    [12256] = true, -- Pack Siege (Siege Weapons)

    [29673] = true, -- Create Ballista Bolt... (Ballista)
    [29672] = true, -- Create Ballista Bolt... (Ballista)
    [29671] = true, -- Create Ballista Bolt... (Ballista)

    [30611] = true, -- Create Ballista Fire Bolt... (Fire Ballista)
    [30607] = true, -- Create Ballista Fire Bolt... (Fire Ballista)
    [16751] = true, -- Create Ballista Fire Bolt... (Fire Ballista)

    [30612] = true, -- Create Ballista Lightning Bolt ... (Lightning Ballista)
    [30608] = true, -- Create Ballista Lightning Bolt ... (Lightning Ballista)
    [16752] = true, -- Create Ballista Lightning Bolt ... (Lightning Ballista)

    [39914] = true, -- Create Trebuchet... (Stone Trebuchet)
    [39917] = true, -- Create Trebuchet... (Stone Trebuchet)
    [39910] = true, -- Create Trebuchet... (Stone Trebuchet)

    [39913] = true, -- Create Trebuchet... (Iceball Trebuchet)
    [39916] = true, -- Create Trebuchet... (Iceball Trebuchet)
    [39909] = true, -- Create Trebuchet... (Iceball Trebuchet)

    [13665] = true, -- Create Trebuchet... (Firepot Trebuchet)
    [13664] = true, -- Create Trebuchet... (Firepot Trebuchet)
    [13663] = true, -- Create Trebuchet... (Firepot Trebuchet)

    [30613] = true, -- Create Catapult Meatbag (Meatbag Catapult)
    [30609] = true, -- Create Catapult Meatbag (Meatbag Catapult)
    [16755] = true, -- Create Catapult Meatbag (Meatbag Catapult)

    [30614] = true, -- Create Catapult Oil Jar... (Oil Catapult)
    [30610] = true, -- Create Catapult Oil Jar... (Oil Catapult)
    [16754] = true, -- Create Catapult Oil Jar... (Oil Catapult)

    [39915] = true, -- Create Catapult Meatbag (Scattershot Catapult)
    [39918] = true, -- Create Catapult Oil Jar... (Scattershot Catapult)
    [39911] = true, -- Create Trebuchet... (Scattershot Catapult)

    [66438] = true, -- Create Trebuchet... (Cold Stone Trebuchet)
    [66439] = true, -- Create Trebuchet... (Cold Stone Trebuchet)
    [66440] = true, -- Create Trebuchet... (Cold Stone Trebuchet)

    [66434] = true, -- Create Trebuchet... (Cold Fire Trebuchet)
    [66388] = true, -- Create Trebuchet... (Cold Fire Trebuchet)
    [66387] = true, -- Create Trebuchet... (Cold Fire Trebuchet)

    [66437] = true, -- Create Ballista... (Cold Fire Ballista)
    [66436] = true, -- Create Ballista... (Cold Fire Ballista)
    [66435] = true, -- Create Ballista... (Cold Fire Ballista)

    [22570] = true, -- Create Boiling Oil... (Flaming Oil)
    [15876] = true, -- Create Large Ram... (Battering Ram)
    [16171] = true, -- Create Large Ram... (Battering Ram)
    [16170] = true, -- Create Large Ram... (Battering Ram)

    [13853] = true, -- Wall Repair Kit
    [16723] = true, -- Door Repair Kit
    [13601] = true, -- Advanced Siege Repair Kit
    [112975] = true, -- Wall Repair Kit (Bridge and Milegate Repair Kit)

    [19039] = true, -- Ebonheart Forward Camp
    [19040] = true, -- Aldmeri Forward Camp
    [19041] = true, -- Daggerfall Forward Camp

    -- [12355] = true, -- Destroy Siege Weapon (Doesn't show up due to Cyrodiil Limitations)

    -- Siege Warfare
    [33348] = true, -- Practice Siege Repair Kit (Practice Siege Repair Kit)

    ----------------------------------------------------------------
    -- QUEST ABILITIES ---------------------------------------------
    ----------------------------------------------------------------

    -- Vampire Quest
    [39507] = true, -- VampInitStun_Profane (Scion of the Blood Matron)

    -- Main Story Quest
    [39367] = true, -- Altar Use (Shadow of Sancre Tor)
    [37827] = true, -- Stendarr's Protection (Shadow of Sancre Tor)
    [36421] = true, -- Drink with Lyris (Council of the Five Companions)
    [47186] = true, -- CHT Portal Killer (The Weight of Three Crown)
    [35192] = true, -- Q4620 Use Lodestone (Cast Adrift)
    [34567] = true, -- Q4621 PC Storm Drain (The Tempest Unleashed)
    [34701] = true, -- Q4621 Destory Horn (The Tempest Unleashed)
    [21364] = true, -- Casting... (The Serpent's Beacon)
    [21409] = true, -- Reading... (The Serpent's Beacon)
    [22889] = true, -- Purifying... (Corruption Stones)
    [22448] = true, -- Q4266 Tie up Hendil (The First Patient)
    [22271] = true, -- Teleport Scroll AB (Depths of Madness)
    [21968] = true, -- Binding Bear... (Silent Village)
    [21393] = true, -- Q4220 PC Chooses to Rescue (The Mallari-Mora)
    --[21112] = true, -- Q4220 PC Forced to L0
    [22931] = true, -- Freeing Spirit... (An Act of Kindness)
    [23187] = true, -- Q4236 PC Untie Palith (The Veiled Choice)
    [47301] = true, -- Stunned (Passage Denied)
    [37463] = true, -- The Grips of Madness
    [37583] = true, -- Q4868 Unlock Chapel
    [40504] = true, -- Q4922 Use Mantle on Device (The Orrery of Elden Root)
    [40557] = true, -- (12127) CFX_4922 Mantle Cast S (The Orrery of Elden Root)
    [35984] = true, -- Q4436 Summon Pirate (Luck of the Albatross)
    [43151] = true, -- Q4768 Use Bucket
    [36710] = true, -- Q4833 Apply Snake Buff (Bosmer Insight)
    [36841] = true, -- Q4833 Apply Wolf Buff (Bosmer Insight)
    [36824] = true, -- Q4833 Apply Tiger Buff (Bosmer Insight)
    [37062] = true, -- Exorcise (The Unquiet Dead)
    [36996] = true, -- Bind Spirit (The Unquiet Dead)
    [37205] = true, -- Animus Geode (Eyes of Azura)
    [37211] = true, -- Q4854 Empower Heart (Eyes of Azura)
    [38246] = true, -- Animus Geode (Eyes of Azura)
    [41325] = true, -- Blacksap's Brew (The Blacksap's Hold)
    [33066] = true, -- Q4586_ChangeClothes (The Witcher of Silatar)
    [33701] = true, -- BurrowEND (Throne of the Wilderking)

    ----------------------------------------------------------------
    -- SEASONAL QUEST ----------------------------------------------
    ----------------------------------------------------------------

    -- Jester's Festival
    [87474] = true, -- Flower Garland (Springtime Flair)
    [88095] = true, -- Illusion Dazzler (Royal Revelry)
    [88123] = true, -- Illusion Dazzler (Royal Revelry)
    [88124] = true, -- Illusion Dazzler (Royal Revelry)

    -- New Life Festival
    [84847] = true, -- Celebratory Belch (Stonetooth Bash)
    [84125] = true, -- Breton Male Dance (Lava Foot Stomp)
    [84126] = true, -- Breton Female Dance (Lava Foot Stomp)
    [84127] = true, -- Dunmer Male Dance (Lava Foot Stomp)
    [84128] = true, -- Dunmer Female Dance (Lava Foot Stomp)
    [84130] = true, -- Altmer Male Dance (Lava Foot Stomp)
    [84131] = true, -- Altmer Female Dance (Lava Foot Stomp)
    [84133] = true, -- Nord Dance (Lava Foot Stomp)
    [84528] = true, -- Flame Juggling (Castle Charm Challenge)
    [84506] = true, -- Dagger Juggling (Castle Charm Challenge)
    [84533] = true, -- Sword Swallowing (Castle Charm Challenge)

    -- Witches Festival
    [83775] = true, -- Event - Q5742 WitchFest Intro (The Witchmother's Bargain)

    ----------------------------------------------------------------
    -- DUNGEONS ----------------------------------------------------
    ----------------------------------------------------------------
}

--------------------------------------------------------------------------------------------------------------------------------
-- Fix for a few goofy events that channel onto the player (or just where we need it)
--------------------------------------------------------------------------------------------------------------------------------
CBT.CastOverride = {
    [4197] = true, -- Recovering (NPC Duel)
    [47186] = true, -- CHT Portal Killer (The Weight of Three Crown)
}

--------------------------------------------------------------------------------------------------------------------------------
-- Some abilities cast into a channeled stun effect - we want these abilities to display the cast and channel if flagged.
--------------------------------------------------------------------------------------------------------------------------------
CBT.MultiCast = {
    [42076] = true, -- Tear (Mezha-dro's Sealing Amulet)
    [42053] = true, -- Yokudan Salute (Yokudan Totem)
}

--------------------------------------------------------------------------------------------------------------------------------
-- If one of these abilities stuns the player - we ignore the standard effect of breaking the cast bar. In some cases a cast event is also applied with a stun for certain quest events, etc.
--------------------------------------------------------------------------------------------------------------------------------
CBT.IgnoreCastBarStun = {
    -- Player
    [36434] = true, -- Mount Stun
    [74232] = true, -- Stun (Malacath's Wrathful Flame)
    [92863] = true, -- Stun (Dreamer's Chime)
    [51401] = true, -- Immortal Warrior (Immortal Yokeda)
    [81529] = true, -- Eternal Warrior (Eternal Yokeda)
    [68938] = true, -- Phoenix (of the Phoenix)

    -- Quests
}

--------------------------------------------------------------------------------------------------------------------------------
-- Abilities flagged to break when EFFECT_RESULT_FADED is detected with the source as the player
--------------------------------------------------------------------------------------------------------------------------------
CBT.CastBreakOnRemoveEffect = {
    -- Werewolf
    [33208] = true, -- Devour (Werewolf)

    -- Vampire
    [33152] = true, -- Feed (Vampire)
    [32893] = true, -- Drain Essence (Vampire)
    [38949] = true, -- Invigorating Drain (Vampire)
    [38956] = true, -- Accelerating Drain (Vampire)
    [32986] = true, -- Mist Form (Vampire)
    [38963] = true, -- Elusive Mist (Vampire)
    [38965] = true, -- Baleful Mist (Vampire)

    -- Quests
    [39692] = true, -- Feed (Scion of the Blood Matron)
}

--[[
-- Possibly use later if any cast removal events need to rely on EVENT_COMBAT_EVENT
CBT.CastBreakOnRemoveEvent = {
}
]]--

--------------------------------------------------------------------------------------------------------------------------------
-- Convert a cast time ability to channeled, since our function detects Casts/Channels automatically and tries to sort them, we need to add a forced override for certain things we want to show as a channel when it makes sense
--------------------------------------------------------------------------------------------------------------------------------
CBT.CastChannelConvert = {
    -- Cyrodiil
    [12256] = true, -- Pack Siege (Siege Weapons)

    -- Memementos
    [73686] = true, -- Old Orsinium Trophy (Malacath's Wrathful Flame)
    [92862] = true, -- Ringing Bell (Dreamer's Chime)
}
