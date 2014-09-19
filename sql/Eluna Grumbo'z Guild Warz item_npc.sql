// these are created from an Ace based Core. so you may need to change some of the column names.
// i slimmed them down to just the required data but you still may need to change column names.

REPLACE INTO `creature_template` (`entry`, `modelid1`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `faction_A`, `faction_H`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `family`, `type`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RegenHealth`, `flags_extra`, `WDBVerified`) VALUES 
(49000, 193, 'Guild War\'z Pig', 'Alliance', NULL, 80, 80, 84, 83, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 1, 0, 12340),
(49001, 744, 'Guild War\'z Pig', 'Horde', NULL, 80, 80, 83, 84, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 1, 0, 12340),
(49002, 26725, 'Guild War\'z Guard', 'Alliance', 'Attack', 80, 80, 84, 83, 1.5, 2.5, 1, 4, 5000, 50000, 0, 0, 4, 1200, 0, 1, 520, 17, 7, 'AggressorAI', 1, 7, 1, 1, 1, 1, 1, 33024, 12340),
(49003, 26725, 'Guild War\'z Guard', 'Horde', 'Attack', 80, 80, 83, 84, 1.5, 2.5, 1, 4, 5000, 50000, 0, 0, 4, 1200, 0, 1, 520, 17, 7, 'AggressorAI', 1, 7, 1, 1, 1, 1, 1, 33024, 12340);

REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data14`, `data18`, `data22`, `AIName`, `ScriptName`, `WDBVerified`) VALUES 
(187432, 10, 5651, 'Alliance Guild Flag', 'interact', '', '', 35, 0, 4, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(187433, 10, 5652, 'Horde Guild Flag', 'interact', '', '', 35, 0, 4, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(500000, 10, 8060, 'Alliance Guild farm', 'Interact', '', '', 35, 6553632, 0.6, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(500001, 10, 8060, 'Horde Guild farm', 'Interact', '', '', 35, 6553632, 0.6, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(500002, 10, 8057, 'Alliance Guild Barracks', 'Interact', '', '', 35, 6553632, 0.3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(500003, 10, 8057, 'Horde Guild Barracks', 'Interact', '', '', 35, 6553632, 0.3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(500004, 33, 7900, 'Tiff\'s Guild Hall', 'Interact', '', '', 35, 6553632, 0.3, 5000, 35074, 0, 19669, 1, 25000, 1, 1, 0, 19672, 1, 1, 19675, 39, 19678, '', '', 12340),
(500005, 33, 7878, 'Grumbo\'z Guild Hall', 'Interact', '', '', 35, 6553632, 0.3, 5000, 35074, 0, 19669, 1, 25000, 1, 1, 0, 19672, 1, 1, 19675, 39, 19678, '', '', 12340);

REPLACE INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `maxcount`, `stackable`, `bonding`, `description`, `RequiredDisenchantSkill`, `ScriptName`, `WDBVerified`) VALUES 
(62006, 0, 8, -1, 'Guild Coin', 34104, 4, 0, 0, 1, 500000000, 500000000, 0, -1, -1, 2147483647, 2147483647, 0, 'Grumbo\'z Guild Warz', -1, '', 1);
