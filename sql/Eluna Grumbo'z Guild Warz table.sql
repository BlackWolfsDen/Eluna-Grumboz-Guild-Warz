-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.9-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- Dumping data for table guild_warz.commands: ~1 rows (approximately)
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
REPLACE INTO `commands` (`guild`, `commands`, `info_loc`, `list_loc`, `tele`, `version`, `loc`, `farm`, `barrack`, `hall`, `pig`, `guard`, `GLD_lvlb`, `GLD_lvls`, `respawn_flag`, `details_loc`, `table`, `GM_admin`, `GM_minimum`, `currency`, `loc_cost`, `farm_cost`, `barrack_cost`, `hall_cost`, `pig_cost`, `guard_cost`, `farm_L`, `barrack_L`, `hall_L`, `pig_L`, `guard_L`, `pig_payz`, `pig_payz_timer`, `gift_count`, `flag_require`, `Server`, `flag_id`, `farm_id`, `barrack_id`, `hall_id`, `pig_id`, `guard_id`, `x1`, `x2`, `x3`, `command_set`, `anarchy`, `f_timer`, `s_timer`, `guild_id`, `guild_invite`) VALUES
	('SERVER', 'commands', 'info', 'list', 'gtele', 'ver', 'area', 'farm', 'barrack', 'hall', 'pig', 'guard', 0, 0, 'flag', 'loc', 'table', 5, 4, 62006, 10, 5, 10, 100, 1, 1, 1, 1, 1, 20, 10, 100000, 1800000, 25, 0, 'SERVER', 187432, 500000, 500002, 500005, 49000, 49002, 1, 1, 1, 'set', 1, 1, 300, 0, 0);
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;

-- Dumping data for table guild_warz.help: ~60 rows (approximately)
/*!40000 ALTER TABLE `help` DISABLE KEYS */;
REPLACE INTO `help` (`entry`, `name`, `description`, `example`, `command_level`) VALUES
	(1, 'guild', 'Guild name for command entry . non-modifyable >>>>>DO NOT CHANGE<<<<<<', 'LOCKED', '7'),
	(2, 'commands', 'produces a list of accessible commands by level.', 'set comm', '1'),
	(3, 'info_loc', 'produces a basic description of current location.', 'set info_loc look', '1'),
	(4, 'list_loc', 'produces a list of all locations own by player guild sshowing the loocation id, houses, guards, pigs, and value then provides a tally at the end.', 'set list_loc lands', '1'),
	(5, 'tele', 'allows guild members to teleport to guild location flags using location id\'s.', 'set tele goto', '1'),
	(6, 'version', 'allows player to view the system versions.', 'set version intelect', '1'),
	(7, 'loc', 'allows guild members to purchase locations based on its value.', 'LOCKED', '4'),
	(8, 'farm', 'allows guild members to purchase houses for guild locations.', 'set farm mudhole', '4'),
	(9, 'barrack', 'allows guild members to purchasebarracks to produce guards for guild locations.', 'LOCKED', '4'),
	(10, 'hall', 'allows guild members to purchase a guild hall for guild locations.', 'LOCKED', '4'),
	(11, 'pig', 'allows guild members to purchase guild pigs for guild locations.', 'LOCKED', '4'),
	(12, 'guard', 'allows guildmembers to purchase guards for locations', 'LOCKED', '4'),
	(13, 'buy', 'allows guild member to buy.', 'LOCKED', '7'),
	(14, 'sell', 'allows guild member to sell.', 'LOCKED', '7'),
	(15, 'GLD_lvlb', 'allows rank x access to guild master buy commands. guildmaster==0 any number above 0 is a lower guild rank i.e. officer==1.', 'set GLD_lvlb 2', '4'),
	(16, 'GLD_lvls', 'allows rank x access to guild master sell commands. same as LGD_lvlb guild master == 0 officer == 1 etc.. etc..etc...', 'set GLD_lvls 1', '4'),
	(17, 'reset loc', 'allows GM of minimum rank to reset a location onwner to "SERVER" and able to be purchased.', 'LOCKED', '5'),
	(18, 'reset farm', 'allows GM of minimum rank to reset house count of a location to 0', 'LOCKED', '5'),
	(19, 'reset barrack', 'allows GM of minimum rank to reset barrack count of a location to 0', 'LOCKED', '5'),
	(20, 'reset hall', 'allows GM of minimum rank to reset hall count of a location to 0', 'LOCKED', '5'),
	(21, 'reset pig', 'allows GM of minimum rank to reset pig countof a location to 0', 'LOCKED', '5'),
	(22, 'reset guard', 'allows GM of minimum rank to reset guard count of a location to 0', 'LOCKED', '5'),
	(23, 'respawn flag', 'allows GM of minimum rank to spawn a missing flag and bind it to current location. if location owned by "SERVER" then an error WILL happen.', 'LOCKED', '5'),
	(24, 'details_loc', 'allows a GM of minimum rank to list detailed information about current location.', 'set details_loc sniff', '5'),
	(25, 'table', 'allows a GM of minimum rank to re-load all the guild warrz tables', 'set table brain', '5'),
	(26, 'GM_admin', 'system setting for GM rank of ADMIN acct.', 'set GM_admin 5', '6'),
	(27, 'GM_minimum', 'system setting for GM required minimum rank to access GM commands.', 'set GM_minimum 3', '6'),
	(28, 'currency', 'system setting>>CANNOT BE CHANGED<<', 'LOCKED', '7'),
	(29, 'loc_cost', 'system setting how much x of currency is required to purchase a basic empty location.', 'set loc_cost 10', '6'),
	(30, 'farm_cost', 'system setting how much x of currency to buy 1 house', 'set house_cost 5', '6'),
	(31, 'barrack_cost', 'system setting how much x of currency to buy 1 barrack', 'set barrack_cost 10', '6'),
	(32, 'hall_cost', 'system setting how much x of currency to buy 1 hall', 'set hall_cost 100', '6'),
	(33, 'pig_cost', 'system setting how much x of currency to buy 1 guild pig.', 'set pig_cost 1', '6'),
	(34, 'guard_cost', 'system setting how much x of currency to buy 1 guard.', 'set guard_cost 1', '6'),
	(35, 'farm_L', 'system setting limit how many farms per location', 'set farm_L 1', '6'),
	(36, 'barrack_L', 'system setting limit how many barracks per location', 'set barrack_L 1', '6'),
	(37, 'hall_L', 'system setting limit how many halls per location', 'set hall_L 1', '6'),
	(38, 'pig_L', 'system setting limit how may pigs per location.', 'set pig_L 20', '6'),
	(39, 'guard_L', 'system setting limit how many guards per location.', 'set guard_L 10', '6'),
	(40, 'pig_payz', 'system setting how much each pig payz in copper per half hour. 10g == 100000', 'set pig_payz 100000', '6'),
	(41, 'pig_payz_timer', 'system setting timer for pig payz.', 'set pig_payz 1800000', '6'),
	(42, 'gift_count', 'system setting how much currency to gift to newly created guilds.', 'set gift_count 25', '6'),
	(43, 'flag_require', 'system setting switch does system require all guards dead to capture flag? default == 0 no; 1 == yes', 'set flag_require 1', '6'),
	(44, 'Server', 'game core ID for guild ID storage of game master level commands  >>>>> DO NOT CHANGE  <<<<<', 'LOCKED', '7'),
	(45, 'flag_id', 'game core ID for ally flag id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(46, 'farm_id', 'game core ID for guild house id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(47, 'barrack_id', 'game core ID for guild barrack id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(48, 'hall_id', 'game core ID for guild hall id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(49, 'pig_id', 'game core ID for guild pig id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(50, 'guard_id', 'game core ID for guild guard id >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(51, 'x1', 'game core ID for x1 ', 'LOCKED', '7'),
	(52, 'x2', 'game core ID for x2 ', 'LOCKED', '7'),
	(53, 'x3', 'game core ID for x3', 'LOCKED', '7'),
	(54, 'command_set', 'game core command for modifying custom commands   >>>>>DO NOT CHANGE<<<<<', 'LOCKED', '7'),
	(55, 'lock', 'ADMIN command to lock an area from purchase.', 'LOCKED', '6'),
	(56, 'anarchy', 'game core setting allows same team invasions . 0 = off::1 = on', 'set anarchy 1', '6'),
	(57, 'f_timer', 'no-tag-flag system  on/off == 0/1', 'set f_timer 1', '6'),
	(58, 's_timer', 'no-tag-flag-timer time in ms.', 'set s_timer 180000', '6'),
	(59, 'guild_id', 'guild id', 'LOCKED', '7'),
	(60, 'guild_invite', 'Guild Level Setting. Guild invite system 0 == off :: 1 == on // default on.', 'set guild_invite 1', '4');
/*!40000 ALTER TABLE `help` ENABLE KEYS */;

-- Dumping data for table guild_warz.zones: ~1 rows (approximately)
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
REPLACE INTO `zones` (`entry`, `map_id`, `area_id`, `zone_id`, `guild_name`, `team`, `x`, `y`, `z`, `farm_count`, `barrack_count`, `hall_count`, `pig_count`, `guard_count`, `flag_id`, `fs_time`, `guild_id`) VALUES
	(1, 0, 0, 0, 'SERVER', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
