-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.9-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- Grumboz Guild Warz            3.3.5a WotlK Eluna
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `guild_warz_335` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `guild_warz_335`;

CREATE TABLE IF NOT EXISTS `commands` (
  `guild` varchar(50) NOT NULL DEFAULT '' COMMENT 'Do Not Touch',
  `commands` varchar(10) NOT NULL DEFAULT 'commands',
  `info_loc` varchar(10) NOT NULL DEFAULT 'info',
  `list_loc` varchar(10) NOT NULL DEFAULT 'list',
  `tele` varchar(6) NOT NULL DEFAULT 'gtele',
  `version` varchar(15) NOT NULL DEFAULT 'ver',
  `loc` varchar(15) NOT NULL DEFAULT 'area',
  `farm` varchar(15) NOT NULL DEFAULT 'farm',
  `barrack` varchar(15) NOT NULL DEFAULT 'barrack',
  `hall` varchar(15) NOT NULL DEFAULT 'hall',
  `pig` varchar(15) NOT NULL DEFAULT 'pig',
  `guard` varchar(15) NOT NULL DEFAULT 'guard',
  `buffer` varchar(15) NOT NULL DEFAULT 'buffer',
  `GLD_lvlb` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum Required Guild member level to access Guild Master buy commands. Guild Master = 0 , anything over + is rank below Guild master.',
  `GLD_lvls` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum Required Guild member level to access Guild Master sell commands. Guild Master = 0 , anything over + is rank below Guild master.',
  `respawn_flag` varchar(50) NOT NULL DEFAULT 'flag' COMMENT 'GM command spawns and assigns a flag to a guild owned area. will return an error if location is owned by SERVER',
  `details_loc` varchar(50) NOT NULL DEFAULT 'loc' COMMENT 'GM command gives more info about location.',
  `table` varchar(50) NOT NULL DEFAULT 'table' COMMENT 'GM command reloads GW table.',
  `GM_admin` tinyint(3) unsigned NOT NULL DEFAULT '4' COMMENT 'GM rank of server admin',
  `GM_minimum` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT 'Minimum Required Gm security level to use GM level commands.',
  `currency` bigint(20) unsigned NOT NULL DEFAULT '62006' COMMENT 'item id for currency used.',
  `loc_cost` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT 'price for basic empty zone.',
  `farm_cost` smallint(5) unsigned NOT NULL DEFAULT '5' COMMENT 'price for small cheezy government issued house.',
  `barrack_cost` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT 'price for small cheezy government issued house.',
  `hall_cost` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT 'price for small cheezy government issued house.',
  `pig_cost` smallint(5) NOT NULL DEFAULT '1' COMMENT 'price for one of these porkerz',
  `guard_cost` smallint(5) NOT NULL DEFAULT '1' COMMENT 'how much is your back worth guarding?',
  `buffer_cost` smallint(5) NOT NULL DEFAULT '25',
  `farm_L` smallint(5) NOT NULL DEFAULT '1' COMMENT 'how many farms per location.',
  `barrack_L` smallint(5) NOT NULL DEFAULT '1' COMMENT 'how many barracks per location.',
  `hall_L` smallint(5) NOT NULL DEFAULT '1' COMMENT 'how many houses per location.',
  `pig_L` smallint(5) NOT NULL DEFAULT '20' COMMENT 'how many pigs per farm.',
  `guard_L` smallint(5) NOT NULL DEFAULT '10' COMMENT 'how many guards per location.',
  `buffer_L` smallint(5) NOT NULL DEFAULT '1',
  `pig_payz` bigint(20) NOT NULL DEFAULT '100000' COMMENT 'amount in copper that each pig payz. hence "pig payz". default 100000 = 10g ',
  `pig_payz_timer` bigint(20) NOT NULL DEFAULT '1800000' COMMENT 'timer for pig payz. default  1800000 = 30 minutes.',
  `gift_count` tinyint(3) NOT NULL DEFAULT '25' COMMENT 'how many of currency item to give to guildmaster of newly created guild.',
  `flag_require` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'does capturing a flag require killing all guards? default  == 0 no ; 1 == yes',
  `Server` varchar(6) NOT NULL DEFAULT 'SERVER' COMMENT 'Do Not Touch',
  `flag_id` mediumint(8) NOT NULL DEFAULT '187432' COMMENT 'Do Not Touch',
  `farm_id` mediumint(8) NOT NULL DEFAULT '500000' COMMENT 'Do Not Touch',
  `barrack_id` mediumint(8) NOT NULL DEFAULT '500002' COMMENT 'Do Not Touch',
  `hall_id` mediumint(8) NOT NULL DEFAULT '500004' COMMENT 'Do Not Touch',
  `pig_id` mediumint(8) NOT NULL DEFAULT '49000' COMMENT 'Do Not Touch',
  `guard_id` mediumint(8) NOT NULL DEFAULT '49002' COMMENT 'Do Not Touch',
  `buffer_id` mediumint(8) NOT NULL DEFAULT '49004' COMMENT 'Do Not Touch',
  `x2` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Do Not Touch',
  `x3` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Do Not Touch',
  `command_set` varchar(50) NOT NULL DEFAULT 'set' COMMENT 'Do Not Touch ',
  `anarchy` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'pure GvG PvP no faction filter.',
  `f_timer` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'applies a cooldown-timer when a flag spaws. 0=off::1=on',
  `s_timer` smallint(5) unsigned NOT NULL DEFAULT '300' COMMENT 'no-tag-flag timer cooldown time in seconds. i.e. 5 minutes = 300 seconds.',
  `guild_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'guild id',
  `guild_invite` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'guild invite system. 0 == off :: 1 == on',
  `color_1` varchar(10) NOT NULL DEFAULT '|cff00cc00' COMMENT 'Command color GREEN',
  `color_2` varchar(10) NOT NULL DEFAULT '|cffFFFF00' COMMENT 'Value color YELLOW',
  `color_3` varchar(10) NOT NULL DEFAULT '|cffFFFFFF' COMMENT 'Info color WHITE',
  `color_4` varchar(10) NOT NULL DEFAULT '|cff3399FF' COMMENT 'Alliance color BLUE',
  `color_5` varchar(10) NOT NULL DEFAULT '|cffFF0000' COMMENT 'Horde color RED',
  `color_6` varchar(10) NOT NULL DEFAULT '|cffFFFF00' COMMENT 'For Sale color YELLOW',
  `color_7` varchar(10) NOT NULL DEFAULT '|cffFF0000' COMMENT 'LOCKED color RED',
  `color_8` varchar(10) NOT NULL DEFAULT '|cffC0C0C0' COMMENT 'Titles color GREY',
  `color_9` varchar(10) NOT NULL DEFAULT '|cff000000' COMMENT 'Separators color BLACK',
  `color_10` varchar(10) DEFAULT '|cff00cc00' COMMENT 'HELP Commands color GREEN',
  `color_11` varchar(10) NOT NULL DEFAULT '|cffFFFF00' COMMENT 'HELP Description color YELLOW',
  `color_12` varchar(10) NOT NULL DEFAULT '|cffFF0000' COMMENT 'SET Error color RED',
  `color_13` varchar(10) NOT NULL DEFAULT '|cffFFFFFF' COMMENT 'SET Values color WHITE',
  `color_14` varchar(10) NOT NULL DEFAULT '|cff00cc00' COMMENT 'Good Announcements color GREEN',
  `color_15` varchar(10) NOT NULL DEFAULT '|cffFF0000' COMMENT 'Bad Annoucements RED',
  PRIMARY KEY (`guild`),
  UNIQUE KEY `guild` (`guild`)
)
COMMENT='version 1.76'
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;

REPLACE INTO `commands` (`guild`, `commands`, `info_loc`, `list_loc`, `tele`, `version`, `loc`, `farm`, `barrack`, `hall`, `pig`, `guard`, `buffer`, `GLD_lvlb`, `GLD_lvls`, `respawn_flag`, `details_loc`, `table`, `GM_admin`, `GM_minimum`, `currency`, `loc_cost`, `farm_cost`, `barrack_cost`, `hall_cost`, `pig_cost`, `guard_cost`, `buffer_cost`, `farm_L`, `barrack_L`, `hall_L`, `pig_L`, `guard_L`, `buffer_L`, `pig_payz`, `pig_payz_timer`, `gift_count`, `flag_require`, `Server`, `flag_id`, `farm_id`, `barrack_id`, `hall_id`, `pig_id`, `guard_id`, `buffer_id`, `x2`, `x3`, `command_set`, `anarchy`, `f_timer`, `s_timer`, `guild_id`, `guild_invite`, `color_1`, `color_2`, `color_3`, `color_4`, `color_5`, `color_6`, `color_7`, `color_8`, `color_9`, `color_10`, `color_11`, `color_12`, `color_13`, `color_14`, `color_15`) VALUES
('SERVER', 'commands', 'info', 'list', 'gtele', 'ver', 'area', 'farm', 'barrack', 'hall', 'pig', 'guard', 'buffer', 0, 0, 'flag', 'loc', 'table', 4, 3, 62006, 10, 5, 10, 100, 1, 1, 25, 1, 1, 1, 20, 10, 1, 100000, 1800000, 25, 0, 'SERVER', 187432, 500000, 500002, 500004, 49000, 49002, 49004, 1, 1, 'set', 0, 0, 300, 0, 0, '|cff00cc00', '|cffFFFF00', '|cffFFFFFF', '|cff3399FF', '|cffFF0000', '|cffFFFF00', '|cffFF0000', '|cffC0C0C0', '|cff000000', '|cff00cc00', '|cffFFFF00', '|cffFF0000', '|cffFFFFFF', '|cff00cc00', '|cffFF0000');

CREATE TABLE IF NOT EXISTS `help` 
(
  `entry` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(1028) DEFAULT NULL,
  `example` varchar(1028) DEFAULT NULL,
  `command_level` varchar(1028) DEFAULT NULL,
  UNIQUE KEY `entry` (`entry`)
)
COMMENT='version 1.76'
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;

REPLACE INTO `help` (`entry`, `name`, `description`, `example`, `command_level`) VALUES
	(1, 'guild', 'Guild name for command entry . non-modifyable >>>>>DO NOT CHANGE<<<<<<', 'LOCKED', '7'),
	(2, 'commands', 'produces a list of accessible commands by level.', 'set commands comm', '1'),
	(3, 'info_loc', 'produces a basic description of current location.', 'set info_loc look', '1'),
	(4, 'list_loc', 'produces a list of all locations own by player guild sshowing the loocation id, houses, guards, pigs, and value then provides a tally at the end.', 'set list_loc lands', '1'),
	(5, 'tele', 'allows guild members to teleport to guild location flags using location id\'s.', 'set tele goto', '1'),
	(6, 'version', 'allows player to view the system versions.', 'set version intelect', '1'),
	(7, 'loc', 'allows guild members to purchase locations based on its value.', 'LOCKED', '4'),
	(8, 'farm', 'allows guild members to purchase farms to support pigs for guild locations.', 'set farm mudhole', '4'),
	(9, 'barrack', 'allows guild members to purchasebarracks to produce guards for guild locations.', 'LOCKED', '4'),
	(10, 'hall', 'allows guild members to purchase a guild hall for guild locations.', 'LOCKED', '4'),
	(11, 'pig', 'allows guild members to purchase guild pigs for guild locations.', 'LOCKED', '4'),
	(12, 'guard', 'allows guildmembers to purchase guards for locations', 'LOCKED', '4'),
	(13, 'buffer', 'allows guildmembers to purchase a buff npc for locations', 'LOCKED', '4'),
	(14, 'buy', 'allows guild member to buy.', 'LOCKED', '7'),
	(15, 'sell', 'allows guild member to sell.', 'LOCKED', '7'),
	(16, 'GLD_lvlb', 'allows rank x access to guild master buy commands. guildmaster==0 any number above 0 is a lower guild rank i.e. officer==1.', 'set GLD_lvlb 2', '4'),
	(17, 'GLD_lvls', 'allows rank x access to guild master sell commands. same as LGD_lvlb guild master == 0 officer == 1 etc.. etc..etc...', 'set GLD_lvls 1', '4'),
	(18, 'reset loc', 'allows GM of minimum rank to reset a location onwner to "SERVER" and able to be purchased.', 'LOCKED', '5'),
	(19, 'reset farm', 'allows GM of minimum rank to reset house count of a location to 0', 'LOCKED', '5'),
	(20, 'reset barrack', 'allows GM of minimum rank to reset barrack count of a location to 0', 'LOCKED', '5'),
	(21, 'reset hall', 'allows GM of minimum rank to reset hall count of a location to 0', 'LOCKED', '5'),
	(22, 'reset pig', 'allows GM of minimum rank to reset pig countof a location to 0', 'LOCKED', '5'),
	(23, 'reset guard', 'allows GM of minimum rank to reset guard count of a location to 0', 'LOCKED', '5'),
	(24, 'reset buffer', 'allows GM of minimum rank to reset buff vendor count of a location to 0', 'LOCKED', '5'),
	(25, 'respawn flag', 'allows GM of minimum rank to spawn a missing flag and bind it to current location. if location owned by "SERVER" then an error WILL happen.', 'LOCKED', '5'),
	(26, 'details_loc', 'allows a GM of minimum rank to list detailed information about current location.', 'set details_loc sniff', '5'),
	(27, 'table', 'allows a GM of minimum rank to re-load all the guild warrz tables', 'set table brain', '5'),
	(28, 'GM_admin', 'system setting for GM rank of ADMIN acct.', 'set GM_admin 5', '6'),
	(29, 'GM_minimum', 'system setting for GM required minimum rank to access GM commands.', 'set GM_minimum 3', '6'),
	(30, 'currency', 'system setting>>CANNOT BE CHANGED<<', 'LOCKED', '7'),
	(31, 'loc_cost', 'system setting how much x of currency is required to purchase a basic empty location.', 'set loc_cost 10', '6'),
	(32, 'farm_cost', 'system setting how much x of currency to buy 1 house', 'set house_cost 5', '6'),
	(33, 'barrack_cost', 'system setting how much x of currency to buy 1 barrack', 'set barrack_cost 10', '6'),
	(34, 'hall_cost', 'system setting how much x of currency to buy 1 hall', 'set hall_cost 100', '6'),
	(35, 'pig_cost', 'system setting how much x of currency to buy 1 guild pig.', 'set pig_cost 1', '6'),
	(36, 'guard_cost', 'system setting how much x of currency to buy 1 guard.', 'set guard_cost 1', '6'),
	(37, 'buffer_cost', 'system setting how much x of currency to buy 1 buff vendor.', 'set buffer_cost 1', '6'),
	(38, 'farm_L', 'system setting limit how many farms per location', 'set farm_L 1', '6'),
	(39, 'barrack_L', 'system setting limit how many barracks per farm', 'set barrack_L 1', '6'),
	(40, 'hall_L', 'system setting limit how many halls per location', 'set hall_L 1', '6'),
	(41, 'pig_L', 'system setting limit how may pigs per farm.', 'set pig_L 20', '6'),
	(42, 'guard_L', 'system setting limit how many guards per barrack.', 'set guard_L 10', '6'),
	(43, 'buffer_L', 'system setting limit how many buff vendors per location.', 'set buffer_L 2', '6'),
	(44, 'pig_payz', 'system setting how much each pig payz in copper per half hour. 10g == 100000', 'set pig_payz 100000', '6'),
	(45, 'pig_payz_timer', 'system setting timer for pig payz.', 'set pig_payz 1800000', '6'),
	(46, 'gift_count', 'system setting how much currency to gift to newly created guilds.', 'set gift_count 25', '6'),
	(47, 'flag_require', 'system setting switch does system require all guards dead to capture flag? default == 0 no; 1 == yes', 'set flag_require 1', '6'),
	(48, 'Server', 'game core ID for guild ID storage of game master level commands  >>>>> DO NOT CHANGE  <<<<<', 'LOCKED', '7'),
	(49, 'flag_id', 'game core ID for ally flag id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(50, 'farm_id', 'game core ID for guild house id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(51, 'barrack_id', 'game core ID for guild barrack id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(52, 'hall_id', 'game core ID for guild hall id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(53, 'pig_id', 'game core ID for guild pig id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(54, 'guard_id', 'game core ID for guild guard id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(55, 'buffer_id', 'game core ID for buff vendor id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(56, 'x2', 'game core ID for x2 ', 'LOCKED', '7'),
	(57, 'x3', 'game core ID for x3', 'LOCKED', '7'),
	(58, 'command_set', 'game core command for modifying custom commands   >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(59, 'lock', 'ADMIN command to lock an area from purchase.', 'LOCKED', '6'),
	(60, 'anarchy', 'game core setting allows same team invasions . 0 = off :: 1 = on', 'set anarchy 1', '6'),
	(61, 'f_timer', 'no-tag-flag system  0 = off :: 1 = on', 'set f_timer 1', '6'),
	(62, 's_timer', 'no-tag-flag-timer time in ms.', 'set s_timer 180000', '6'),
	(63, 'guild_id', 'guild id', 'LOCKED', '7'),
	(64, 'guild_invite', 'Guild Level Setting. Guild invite system 0 == off :: 1 == on // default on.', 'set guild_invite 1', '4'),
	(65, 'color_1', 'command color GuildMaster Level', 'set color_1 cff000000', '4'),
	(66, 'color_2', 'Setting Value color  GuildMaster Level', 'set color_2 cff000000', '4'),
	(67, 'color_3', 'Info color  GuildMaster Level HEX CODE', 'set color_3 cff000000', '4'),
	(68, 'color_4', 'Alliance color  GuildMaster Level HEX CODE', 'set color_4 cff000000', '4'),
	(69, 'color_5', 'Horde color  GuildMaster Level HEX CODE', 'set color_5 cff000000', '4'),
	(70, 'color_6', 'For Sale color  GuildMaster Level HEX CODE', 'set color_6 cff000000', '4'),
	(71, 'color_7', 'LOCKED color  GuildMaster Level HEX CODE', 'set color_7 cff000000', '4'),
	(72, 'color_8', 'Titles color  GuildMaster Level HEX CODE', 'set color_8 cff000000', '4'),
	(73, 'color_9', 'Separator color  GuildMaster Level HEX CODE', 'set color_9 cff000000', '4'),
	(74, 'color_10', 'Help Commands color  GuildMaster Level HEX CODE', 'set color_10 cff000000', '4'),
	(75, 'color_11', 'Help Description color  GuildMaster Level HEX CODE', 'set color_11 cff000000', '4'),
	(76, 'color_12', 'Set Error color  GuildMaster Level HEX CODE', 'set color_12 cff000000', '4'),
	(77, 'color_13', 'Set Values color  GuildMaster Level HEX CODE', 'set color_13 cff000000', '4'),
	(78, 'color_14', 'Good Announcements  color  GuildMaster Level HEX CODE', 'set color_14 cff000000', '4'),
	(79, 'color_15', 'Bad Announcements  color  GuildMaster Level HEX CODE', 'set color_15 cff000000', '4');

CREATE TABLE IF NOT EXISTS `zones` (
	`entry` BIGINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`map_id` BIGINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`area_id` BIGINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`zone_id` BIGINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`guild_name` VARCHAR(50) NOT NULL DEFAULT 'SERVER',
	`team` SMALLINT(10) UNSIGNED NOT NULL DEFAULT '2',
	`x` FLOAT NOT NULL DEFAULT '0',
	`y` FLOAT NOT NULL DEFAULT '0',
	`z` FLOAT NOT NULL DEFAULT '0',
	`farm_count` TINYINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`barrack_count` TINYINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`hall_count` TINYINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`pig_count` TINYINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`guard_count` TINYINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`buffer_count` TINYINT(10) UNSIGNED NOT NULL DEFAULT '0',
	`flag_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	`fs_time` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'time in seconds when the flag was spawned.',
	`guild_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'guild id',
	PRIMARY KEY (`entry`)
)
COMMENT='version 1.76'
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;

REPLACE INTO `zones` (`entry`, `map_id`, `area_id`, `zone_id`, `guild_name`, `team`, `x`, `y`, `z`, `farm_count`, `barrack_count`, `hall_count`, `pig_count`, `guard_count`, `buffer_count`, `flag_id`, `fs_time`, `guild_id`) VALUES
(1, 0, 0, 0, 'SERVER', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
