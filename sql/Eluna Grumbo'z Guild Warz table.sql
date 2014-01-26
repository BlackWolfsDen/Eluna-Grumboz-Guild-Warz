-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.9-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-01-23 15:41:34
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for guild_warz
DROP DATABASE IF EXISTS `guild_warz`;
CREATE DATABASE IF NOT EXISTS `guild_warz` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `guild_warz`;


-- Dumping structure for table guild_warz.commands
DROP TABLE IF EXISTS `commands`;
CREATE TABLE IF NOT EXISTS `commands` (
  `guild` varchar(50) NOT NULL DEFAULT '' COMMENT 'Do Not Touch',
  `commands` varchar(10) NOT NULL DEFAULT 'commands',
  `info_loc` varchar(10) NOT NULL DEFAULT 'info',
  `list_loc` varchar(10) NOT NULL DEFAULT 'list',
  `tele` varchar(6) NOT NULL DEFAULT 'gtele',
  `version` varchar(15) NOT NULL DEFAULT 'ver',
  `buy_loc` varchar(15) NOT NULL DEFAULT 'buy area',
  `buy_farm` varchar(15) NOT NULL DEFAULT 'buy house',
  `buy_barack` varchar(15) NOT NULL DEFAULT 'buy barrack',
  `buy_hall` varchar(15) NOT NULL DEFAULT 'buy hall',
  `buy_pig` varchar(15) NOT NULL DEFAULT 'buy pig',
  `buy_guard` varchar(15) NOT NULL DEFAULT 'buy guard',
  `sell_loc` varchar(15) NOT NULL DEFAULT 'sell area',
  `sell_farm` varchar(15) NOT NULL DEFAULT 'sell farm',
  `sell_barrack` varchar(15) NOT NULL DEFAULT 'sell barrack',
  `sell_hall` varchar(15) NOT NULL DEFAULT 'sell hall',
  `sell_pig` varchar(15) NOT NULL DEFAULT 'sell pig',
  `sell_guard` varchar(15) NOT NULL DEFAULT 'fire guard',
  `GLD_lvlb` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum Required Guild member level to access Guild Master buy commands. Guild Master = 0 , anything over + is rank below Guild master.',
  `GLD_lvls` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum Required Guild member level to access Guild Master sell commands. Guild Master = 0 , anything over + is rank below Guild master.',
  `reset_loc` varchar(50) NOT NULL DEFAULT 'reset area' COMMENT 'defaults location back to Server.',
  `reset_farm` varchar(50) NOT NULL DEFAULT 'reset farm' COMMENT 'defaults house count to 0.',
  `reset_barrack` varchar(50) NOT NULL DEFAULT 'reset barrack' COMMENT 'defaults house count to 0.',
  `reset_hall` varchar(50) NOT NULL DEFAULT 'reset all' COMMENT 'defaults house count to 0.',
  `reset_pig` varchar(50) NOT NULL DEFAULT 'reset pig' COMMENT 'defaults pig count to 0.',
  `reset_guard` varchar(50) NOT NULL DEFAULT 'reset guard' COMMENT 'defaults guard count to 0.',
  `respawn_flag` varchar(50) NOT NULL DEFAULT 'spawn flag' COMMENT 'GM command spawns and assigns a flag to a guild owned area. will return an error if location is owned by SERVER',
  `details_loc` varchar(50) NOT NULL DEFAULT 'loc' COMMENT 'GM command gives more info about location.',
  `load_table` varchar(50) NOT NULL DEFAULT 'reload table' COMMENT 'GM command reloads GW table.',
  `GM_admin` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT 'GM rank of server admin',
  `GM_minimum` tinyint(1) unsigned NOT NULL DEFAULT '4' COMMENT 'Minimum Required Gm security level to use GM level commands.',
  `currency` bigint(20) unsigned NOT NULL DEFAULT '62006' COMMENT 'item id for currency used.',
  `loc_cost` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT 'price for basic empty zone.',
  `farm_cost` smallint(5) unsigned NOT NULL DEFAULT '5' COMMENT 'price for small cheezy government issued house.',
  `barrack_cost` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT 'price for small cheezy government issued house.',
  `hall_cost` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT 'price for small cheezy government issued house.',
  `pig_cost` smallint(5) NOT NULL DEFAULT '1' COMMENT 'price for one of these porkerz',
  `guard_cost` smallint(5) NOT NULL DEFAULT '1' COMMENT 'how much is your back worth guarding?',
  `farm_L` smallint(5) NOT NULL DEFAULT '1' COMMENT 'how many houses per location.',
  `barrack_L` smallint(5) NOT NULL DEFAULT '1' COMMENT 'how many houses per location.',
  `hall_L` smallint(5) NOT NULL DEFAULT '1' COMMENT 'how many houses per location.',
  `pig_L` smallint(5) NOT NULL DEFAULT '20' COMMENT 'how many pigs per location.',
  `guard_L` smallint(5) NOT NULL DEFAULT '10' COMMENT 'how many guards per location.',
  `pig_payz` bigint(20) NOT NULL DEFAULT '100000' COMMENT 'amount in copper that each pig payz. hence "pig payz". default 100000 = 10g ',
  `gift_count` tinyint(3) NOT NULL DEFAULT '25' COMMENT 'how many of currency item to give to guildmaster of newly created guild.',
  `flag_require` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'does capturing a flag require killing all guards? default  == 0 no ; 1 == yes',
  `Server` varchar(6) NOT NULL DEFAULT 'SERVER' COMMENT 'Do Not Touch',
  `flag_id` mediumint(8) NOT NULL DEFAULT '187432' COMMENT 'Do Not Touch',
  `farm_id` mediumint(8) NOT NULL DEFAULT '500000' COMMENT 'Do Not Touch',
  `barrack_id` mediumint(8) NOT NULL DEFAULT '500002' COMMENT 'Do Not Touch',
  `hall_id` mediumint(8) NOT NULL DEFAULT '500004' COMMENT 'Do Not Touch',
  `pig_id` mediumint(8) NOT NULL DEFAULT '49000' COMMENT 'Do Not Touch',
  `guard_id` mediumint(8) NOT NULL DEFAULT '49001' COMMENT 'Do Not Touch',
  `walla_id` mediumint(8) NOT NULL DEFAULT '111111' COMMENT 'Do Not Touch',
  `wallb_id` mediumint(8) NOT NULL DEFAULT '111111' COMMENT 'Do Not Touch',
  `wallc_id` mediumint(8) NOT NULL DEFAULT '111111' COMMENT 'Do Not Touch',
  `trainer1_id` mediumint(8) NOT NULL DEFAULT '111111' COMMENT 'Do Not Touch',
  `trainer2_id` mediumint(8) NOT NULL DEFAULT '111111' COMMENT 'Do Not Touch',
  `vendor1_id` mediumint(8) NOT NULL DEFAULT '111111' COMMENT 'Do Not Touch',
  `vendor2_id` mediumint(8) NOT NULL DEFAULT '111111' COMMENT 'Do Not Touch',
  `peon_id` mediumint(8) NOT NULL DEFAULT '111111' COMMENT 'Do Not Touch',
  `command_set` varchar(50) NOT NULL DEFAULT 'set' COMMENT 'Do Not Touch ',
  PRIMARY KEY (`guild`),
  UNIQUE KEY `guild` (`guild`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table guild_warz.commands: ~2 rows (approximately)
DELETE FROM `commands`;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` (`guild`, `commands`, `info_loc`, `list_loc`, `tele`, `version`, `buy_loc`, `buy_farm`, `buy_barack`, `buy_hall`, `buy_pig`, `buy_guard`, `sell_loc`, `sell_farm`, `sell_barrack`, `sell_hall`, `sell_pig`, `sell_guard`, `GLD_lvlb`, `GLD_lvls`, `reset_loc`, `reset_farm`, `reset_barrack`, `reset_hall`, `reset_pig`, `reset_guard`, `respawn_flag`, `details_loc`, `load_table`, `GM_admin`, `GM_minimum`, `currency`, `loc_cost`, `farm_cost`, `barrack_cost`, `hall_cost`, `pig_cost`, `guard_cost`, `farm_L`, `barrack_L`, `hall_L`, `pig_L`, `guard_L`, `pig_payz`, `gift_count`, `flag_require`, `Server`, `flag_id`, `farm_id`, `barrack_id`, `hall_id`, `pig_id`, `guard_id`, `walla_id`, `wallb_id`, `wallc_id`, `trainer1_id`, `trainer2_id`, `vendor1_id`, `vendor2_id`, `peon_id`, `command_set`) VALUES
	('SERVER', 'commands', 'info', 'list', 'gtele', 'ver', 'buy area', 'buy house', 'buy barrack', 'buy hall', 'buy pig', 'buy guard', 'sell area', 'sell farm', 'sell barrack', 'sell hall', 'sell pig', 'fire guard', 0, 0, 'reset area', 'reset farm', 'reset barrack', 'reset all', 'reset pig', 'reset guard', 'spawn flag', 'loc', 'reload table', 5, 4, 62006, 10, 5, 10, 100, 1, 1, 1, 1, 1, 20, 10, 100000, 25, 0, 'SERVER', 187432, 500000, 500002, 500004, 49000, 49001, 111111, 111111, 111111, 111111, 111111, 111111, 111111, 111111, 'set');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;


-- Dumping structure for table guild_warz.help
DROP TABLE IF EXISTS `help`;
CREATE TABLE IF NOT EXISTS `help` (
  `entry` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(1028) DEFAULT NULL,
  `example` varchar(1028) DEFAULT NULL,
  `command_level` varchar(1028) DEFAULT NULL,
  UNIQUE KEY `entry` (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table guild_warz.help: ~63 rows (approximately)
DELETE FROM `help`;
/*!40000 ALTER TABLE `help` DISABLE KEYS */;
INSERT INTO `help` (`entry`, `name`, `description`, `example`, `command_level`) VALUES
	(1, 'guild', 'Guild name for command entry . non-modifyable >>>>>DO NOT CHANGE<<<<<<', 'LOCKED', '7'),
	(2, 'commands', 'produces a list of accessible commands by level.', 'set comm', '1'),
	(3, 'info_loc', 'produces a basic description of current location.', 'set info_loc look', '1'),
	(4, 'list_loc', 'produces a list of all locations own by player guild sshowing the loocation id, houses, guards, pigs, and value then provides a tally at the end.', 'set list_loc lands', '1'),
	(5, 'tele', 'allows guild members to teleport to guild location flags using location id\'s.', 'set tele goto', '1'),
	(6, 'version', 'allows player to view the system versions.', 'set version intelect', '1'),
	(7, 'buy_loc', 'allows guild members to purchase locations based on its value.', 'set buy_loc buyit', '2'),
	(8, 'buy_farm', 'allows guild members to purchase houses for guild locations.', 'set buy_house buy_crib', '2'),
	(9, 'buy_barracks', 'allows guild members to purchasebarracks to produce guards for guild locations.', 'set buy_barrack buy_power', '2'),
	(10, 'buy_hall', 'allows guild members to purchase a guild hall for guild locations.', 'set buy_hall tower', '2'),
	(11, 'buy_pig', 'allows guild members to purchase guild pigs for guild locations.', 'set buy_pig sell_porker', '2'),
	(12, 'buy_guard', 'allows guildmembers to purchase guards for locations', 'set buy_guard muscle', '2'),
	(13, 'sell_loc', 'allows guild members to sell guild locations for locations value.', 'set sell_loc sell_land', '3'),
	(14, 'sell_farm', 'allows guild members to sell location houses for house price.', 'set sell_house sell_crib', '3'),
	(15, 'sell_barrack', 'allows guild members to sell location barracks for barracks  price.', 'set sell_barrack sell_crib', '3'),
	(16, 'sell_hall', 'allows guild member to sell hall.', 'set sell_hall sell_tower', '3'),
	(17, 'sell_pig', 'allows guild member to sell selected guild pig for value of 1 pig.', 'set sell_pig make_bacon', '3'),
	(18, 'sell_guard', 'allows guild member to remove sellected guard from guild location', 'set sell_guard kill_guard', '3'),
	(19, 'GLD_lvlb', 'allows rank x access to guild master buy commands. guildmaster==0 any number above 0 is a lower guild rank i.e. officer==1.', 'set GLD_lvlb 2', '4'),
	(20, 'GLD_lvls', 'allows rank x access to guild master sell commands. same as LGD_lvlb guild master == 0 officer == 1 etc.. etc..etc...', 'set GLD_lvls 1', '4'),
	(21, 'reset_loc', 'allows GM of minimum rank to reset a location onwner to "SERVER" and able to be purchased.', 'set reset_loc clean', '5'),
	(22, 'reset_farm', 'allows GM of minimum rank to reset house count of a location to 0', 'set reset_house clear', '5'),
	(23, 'reset_barrack', 'allows GM of minimum rank to reset barrack count of a location to 0', 'set reset_barrack clear', '5'),
	(24, 'reset_hall', 'allows GM of minimum rank to reset hall count of a location to 0', 'set reset_hall clear', '5'),
	(25, 'reset_pig', 'allows GM of minimum rank to reset pig countof a location to 0', 'set reset_pig no_more', '5'),
	(26, 'reset_guard', 'allows GM of minimum rank to reset guard count of a location to 0', 'set reset_guard kickem', '5'),
	(27, 'respawn_flag', 'allows GM of minimum rank to spawn a missing flag and bind it to current location. if location owned by "SERVER" then an error WILL happen.', 'set respawn_flag mark_it', '5'),
	(28, 'details_loc', 'allows a GM of minimum rank to list detailed information about current location.', 'set details_loc sniff', '5'),
	(29, 'load_table', 'allows a GM of minimum rank to re-load all the guild warrz tables', 'set load_table re_think', '5'),
	(30, 'GM_admin', 'system setting for GM rank of ADMIN acct.', 'set GM_admin 5', '6'),
	(31, 'GM_minimum', 'system setting for GM required minimum rank to access GM commands.', 'set GM_minimum 3', '6'),
	(32, 'currency', 'system setting>>CANNOT BE CHANGED<<', 'LOCKED', '7'),
	(33, 'loc_cost', 'system setting how much x of currency is required to purchase a basic empty location.', 'set loc_cost 10', '6'),
	(34, 'farm_cost', 'system setting how much x of currency to buy 1 house', 'set house_cost 5', '6'),
	(35, 'barrack_cost', 'system setting how much x of currency to buy 1 barrack', 'set barrack_cost 10', '6'),
	(36, 'hall_cost', 'system setting how much x of currency to buy 1 hall', 'set hall_cost 100', '6'),
	(37, 'pig_cost', 'system setting how much x of currency to buy 1 guild pig.', 'set pig_cost 1', '6'),
	(38, 'guard_cost', 'system setting how much x of currency to buy 1 guard.', 'set guard_cost 1', '6'),
	(39, 'farm_L', 'system setting limit how many farms per location', 'set farm_L 1', '6'),
	(40, 'barrack_L', 'system setting limit how many barracks per location', 'set barrack_L 1', '6'),
	(41, 'hall_L', 'system setting limit how many halls per location', 'set hall_L 1', '6'),
	(42, 'pig_L', 'system setting limit how may pigs per location.', 'set pig_L 20', '6'),
	(43, 'guard_L', 'system setting limit how many guards per location.', 'set guard_L 10', '6'),
	(44, 'pig_payz', 'system setting how much each pig payz in copper per half hour. 10g == 100000', 'set pig_payz 100000', '6'),
	(45, 'gift_count', 'system setting how much currency to gift to newly created guilds.', 'set gift_count 25', '6'),
	(46, 'flag_require', 'system setting switch does system require all guards dead to capture flag? default == 0 no; 1 == yes', 'set flag_require 1', '6'),
	(47, 'Server', 'game core ID for guild ID storage of game master level commands  >>>>> DO NOT CHANGE  <<<<<', 'LOCKED', '7'),
	(48, 'flag_id', 'game core ID for ally flag id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(49, 'farm_id', 'game core ID for guild house id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(50, 'barrack_id', 'game core ID for guild barrack id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(51, 'hall_id', 'game core ID for guild hall id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(52, 'pig_id', 'game core ID for guild pig id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(53, 'guard_id', 'game core ID for guild guard id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(54, 'walla_id', 'game core ID for wall #a >>>>>>DO NOT CHANGE<<<<<<<<', 'LOCKED', '7'),
	(55, 'wallb_id', 'game core ID for wall #b >>>>>>DO NOT CHANGE<<<<<<<<', 'LOCKED', '7'),
	(56, 'wallc_id', 'game core ID for wall #c >>>>>>DO NOT CHANGE<<<<<<<<', 'LOCKED', '7'),
	(57, 'barrack_id', 'game core ID for barracks ID >>>>>>DO NOT CHANGE<<<<<<<<', 'LOCKED', '7'),
	(58, 'trainer1_id', 'game core ID for trainer npc id ', 'LOCKED', '7'),
	(59, 'trainer2_id', 'game core ID for trainer npc id ', 'LOCKED', '7'),
	(60, 'vendor1_id', 'game core ID for vendor npc id', 'LOCKED', '7'),
	(61, 'vendor2_id', 'game core ID for vendor npc id', 'LOCKED', '7'),
	(62, 'peon_id', 'game core ID for ally peon npc', 'LOCKED', '7'),
	(63, 'command_set', 'game core command for modifying custom commands   >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7');
/*!40000 ALTER TABLE `help` ENABLE KEYS */;


-- Dumping structure for table guild_warz.zones
DROP TABLE IF EXISTS `zones`;
CREATE TABLE IF NOT EXISTS `zones` (
  `entry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `map_id` bigint(10) unsigned DEFAULT '0',
  `area_id` bigint(10) unsigned DEFAULT '0',
  `zone_id` bigint(10) unsigned DEFAULT '0',
  `guild_name` varchar(50) DEFAULT 'SERVER',
  `team` smallint(10) unsigned DEFAULT '2',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `farm_count` tinyint(10) unsigned DEFAULT '0',
  `barrack_count` tinyint(10) unsigned DEFAULT '0',
  `hall_count` tinyint(10) unsigned DEFAULT '0',
  `pig_count` tinyint(10) unsigned DEFAULT '0',
  `guard_count` tinyint(10) unsigned DEFAULT '0',
  `flag_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`),
  UNIQUE KEY `entry` (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table guild_warz.zones: ~2 rows (approximately)
DELETE FROM `zones`;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` (`entry`, `map_id`, `area_id`, `zone_id`, `guild_name`, `team`, `x`, `y`, `z`, `farm_count`, `barrack_count`, `hall_count`, `pig_count`, `guard_count`, `flag_id`) VALUES
	(1, 0, 0, 0, 'SERVER', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
