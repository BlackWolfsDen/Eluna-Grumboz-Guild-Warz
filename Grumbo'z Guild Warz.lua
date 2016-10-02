-- **g****************************************s***
-- ********© Grumbo'z Guild Warz System™ ©********	
-- ********** Brought to you by Grumbo  *******l**
-- **r*************** slp13at420 ****p************
-- ***Foereaper***  Ty Eluna guyz  ****Rochet2****
-- ****************  Emudevs.com  **********1*****
-- **u******************♠*********3***************
-- *********************♠*************************
-- ********** This is NOT a C++ SCRIPT **a********
-- ***m***********  This is For  *****************
-- ************* TRINITY/ELUNA ONLY *t************
-- *♠*******************4***********************♠*
-- *b* Please Do Not Rem©ve any of the credits ***
-- **** and/or attempt to release as your own **2*
-- ***o******************©*************0**********
-- **************** First Public *****************
-- ********** release date 03-10-2013 ************
-- ***********************************************
 
print("\n-----------------------------------")
print("Grumbo'z Guild Warz System Loading:\n")
print("For TC2 WotLK 3.3.5a\n")

local start = os.clock()

if(GetLuaEngine()~="ElunaEngine")then
	print("err: "..GetLuaEngine().." Detected.\n");
	print("!!..LOAD HALTED..?!!");
	print("\nXXX XXX XXX XXX XXX XXX XXX XXX XXX");
	print("-----------------------------------");
	return false;
else
	print("Approved: Eluna Detected.\n");
end

local Guard_Died_Drop = 20558; -- wsg's
local table_version = 2.75;  
local core_version = 6.65;  
local pigpayz_version = 2.50;
local tele_version = 1.50;
local pvp_version = 4.80;
local vendor_version = 1.52;

local SERVER_GUILD_NAME = "SERVER";
local SERVER_GUILD_ID = 0;
local SERVER_PRE_MESSAGE = "[GuildWarz]";

local guild_warz_DB = "guild_warz_335"; -- Must match unique name if running on multiple cores i.e. guild_warz_335_1 

-- -----------------------------------------------------
-- built-in vendors operational switches and item tables
-- -----------------------------------------------------
local vendor1 = 1; -- use built-in vendor 1 0/1 no/yes.
local vendor2 = 1; -- use built-in vendor 2 0/1 no/yes.
local vendor3 = 1; -- use built-in vendor 3 0/1 no/yes.

-- vendor buffs {spell_id, "menu selection name"}, last entry must be the `{0, "good bye"}` entry -- vendor1
local Vendor1 = {{23767, "Armor + 10%"},{23768, "Damage + (1 - 10)%"},{23769, "Resistances + 25"},{23736, "Agility + 10%"},{23766, "Intelligence + 10%"},{23738, "Spirit + 10%"},{23735, "Strength + 10%"},{23737, "Stamina + 10%"},{25840, "Heal Me"},{0, "good bye"},};

-- vendor items {item_id, custom_cost}, if no custom cost then use 0.(vendor item limit = 10 items per page, limit 15 pages) -- vendor2, vendor3
local Vendor2 = {{7734,0},{6948,0},{49912,0},{34498,0},{46693,0},{34499,0},{35557,0},{37431,0},{17202,0},{21038,0},{46783,0},}; -- funny items
local Vendor3 = {{32837,0},{32838,0},{22736,0},{19019,0},{51858,0},{24550,0},{2000,0},{50730,0},{50070,0},{34196,0},{30906,0},}; -- misc gear
-- -----------------------------------------------------

GWCOMM = {};
GWARZ = {};
GWHELP = {};
GGWC = {};
GGW = {};

local function LoadGWtable()

local Ghsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".help;");

	if(Ghsql)then
	
		repeat
			GWHELP[Ghsql:GetUInt32(0)] = {
				entry = Ghsql:GetUInt32(0),
				command = Ghsql:GetString(1),
				description = Ghsql:GetString(2),
				example = Ghsql:GetString(3),
				command_level = Ghsql:GetUInt32(4),
			};
		until not Ghsql:NextRow()
	end

local Gcsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".commands;");

	if(Gcsql)then
		repeat
			GWCOMM[Gcsql:GetUInt32(1)] = {
				guild = Gcsql:GetString(0),
				guild_id = Gcsql:GetUInt32(1),
				team = Gcsql:GetUInt8(2),
				commands = Gcsql:GetString(3),
				info_loc = Gcsql:GetString(4),
				list_loc = Gcsql:GetString(5),
				tele = Gcsql:GetString(6),
				version = Gcsql:GetString(7),
				GLD_lvlb = Gcsql:GetUInt8(8),
				GLD_lvls = Gcsql:GetUInt8(9),
				respawn_flag = Gcsql:GetString(10),
				details_loc = Gcsql:GetString(11),
				table = Gcsql:GetString(12),
				GM_admin = Gcsql:GetUInt8(13),
				GM_minimum = Gcsql:GetUInt8(14),
				currency = Gcsql:GetUInt32(15),
				pig_payz = Gcsql:GetUInt32(16),
				pig_payz_timer = Gcsql:GetUInt32(17),
				gift_count = Gcsql:GetUInt16(18),
				flag_require = Gcsql:GetUInt8(19),
				Server = Gcsql:GetString(20),
				command_set = Gcsql:GetString(21),
				anarchy = Gcsql:GetUInt8(22),			
				flag_timer = Gcsql:GetUInt8(23),
				spawn_timer = Gcsql:GetUInt32(24),
				guild_invite = Gcsql:GetUInt8(25),
				loc = Gcsql:GetString(26),
				loc_cost = Gcsql:GetUInt8(27),
				flag_id = Gcsql:GetUInt32(28),
				farm = Gcsql:GetString(29),
				farm_cost = Gcsql:GetUInt8(30),
				farm_L = Gcsql:GetUInt8(31),
				farm_id = Gcsql:GetUInt32(32),
				barrack = Gcsql:GetString(33),
				barrack_cost = Gcsql:GetUInt8(34),
				barrack_L = Gcsql:GetUInt8(35),
				barrack_id = Gcsql:GetUInt32(36),
				hall = Gcsql:GetString(37),
				hall_cost = Gcsql:GetUInt8(38),
				hall_L = Gcsql:GetUInt8(39),
				hall_id = Gcsql:GetUInt32(40),
				pig = Gcsql:GetString(41),
				pig_cost = Gcsql:GetUInt8(42),
				pig_L = Gcsql:GetUInt8(43),
				pig_id = Gcsql:GetUInt32(44),
				guard = Gcsql:GetString(45),
				guard_cost = Gcsql:GetUInt8(46),
				guard_L = Gcsql:GetUInt8(47),
				guard_id = Gcsql:GetUInt32(48),
				vendor1 = Gcsql:GetString(49),
				vendor1_cost = Gcsql:GetUInt8(50),
				vendor1_L = Gcsql:GetUInt8(51),
				vendor1_id = Gcsql:GetUInt32(52),
				vendor2 = Gcsql:GetString(53),
				vendor2_cost = Gcsql:GetUInt8(54),
				vendor2_L = Gcsql:GetUInt8(55),
				vendor2_id = Gcsql:GetUInt32(56),
				vendor3 = Gcsql:GetString(57),
				vendor3_cost = Gcsql:GetUInt8(58),
				vendor3_L = Gcsql:GetUInt8(59),
				vendor3_id = Gcsql:GetUInt32(60),
				cannon = Gcsql:GetString(61),
				cannon_cost = Gcsql:GetUInt8(62),
				cannon_L = Gcsql:GetUInt8(63),
				cannon_id = Gcsql:GetUInt32(64),
				vault = Gcsql:GetString(65),
				vault_cost = Gcsql:GetUInt8(66),
				vault_L = Gcsql:GetUInt8(67),
				vault_id = Gcsql:GetUInt32(68),
				mailbox = Gcsql:GetString(69),
				mailbox_cost = Gcsql:GetUInt8(70),
				mailbox_L = Gcsql:GetUInt8(71),
				mailbox_id = Gcsql:GetUInt32(72),
				setup = Gcsql:GetString(73),
				color_1 = Gcsql:GetString(74),
				color_2 = Gcsql:GetString(75),
				color_3 = Gcsql:GetString(76),
				color_4 = Gcsql:GetString(77),
				color_5 = Gcsql:GetString(78),
				color_6 = Gcsql:GetString(79),
				color_7 = Gcsql:GetString(80),
				color_8 = Gcsql:GetString(81),
				color_9 = Gcsql:GetString(82),
				color_10 = Gcsql:GetString(83),
				color_11 = Gcsql:GetString(84),
				color_12 = Gcsql:GetString(85),
				color_13 = Gcsql:GetString(86),
				color_14 = Gcsql:GetString(87),
				color_15 = Gcsql:GetString(88),
			};
		until not Gcsql:NextRow();
	end

	local Gwsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".zones;");

	if(Gwsql)then
		repeat
			GWARZ[Gwsql:GetUInt32(0)] = {
				entry = Gwsql:GetUInt32(0),
				map_id = Gwsql:GetUInt32(1),
				area_id = Gwsql:GetUInt32(2),
				zone_id = Gwsql:GetUInt32(3),
				guild_name = Gwsql:GetString(4),
				team = Gwsql:GetUInt8(5),
				x = Gwsql:GetFloat(6),
				y = Gwsql:GetFloat(7),
				z = Gwsql:GetFloat(8),
				farm_count = Gwsql:GetUInt32(9),
				barrack_count = Gwsql:GetUInt32(10),
				hall_count = Gwsql:GetUInt32(11),
				pig_count = Gwsql:GetUInt32(12),
				guard_count = Gwsql:GetUInt32(13),
				vendor1_count = Gwsql:GetUInt32(14),
				vendor2_count = Gwsql:GetUInt32(15),
				vendor3_count = Gwsql:GetUInt32(16),
				cannon_count = Gwsql:GetUInt32(17),
				vault_count = Gwsql:GetUInt32(18),
				mailbox_count = Gwsql:GetUInt32(19),
				flag_id = Gwsql:GetUInt32(20),
				spawn_time = Gwsql:GetUInt32(21),
				guild_id = Gwsql:GetUInt32(22),
			};
		until not Gwsql:NextRow();
	end
end

LoadGWtable()

local function LoadGWCOMMTable(id)

local Gcsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".commands WHERE `guild_id`='"..id.."';");

	if(Gcsql)then
		GWCOMM[Gcsql:GetUInt32(1)] = {
			guild = Gcsql:GetString(0),
			guild_id = Gcsql:GetUInt32(1),
			team = Gcsql:GetUInt8(2),
			commands = Gcsql:GetString(3),
			info_loc = Gcsql:GetString(4),
			list_loc = Gcsql:GetString(5),
			tele = Gcsql:GetString(6),
			version = Gcsql:GetString(7),
			GLD_lvlb = Gcsql:GetUInt8(8),
			GLD_lvls = Gcsql:GetUInt8(9),
			respawn_flag = Gcsql:GetString(10),
			details_loc = Gcsql:GetString(11),
			table = Gcsql:GetString(12),
			GM_admin = Gcsql:GetUInt8(13),
			GM_minimum = Gcsql:GetUInt8(14),
			currency = Gcsql:GetUInt32(15),
			pig_payz = Gcsql:GetUInt32(16),
			pig_payz_timer = Gcsql:GetUInt32(17),
			gift_count = Gcsql:GetUInt16(18),
			flag_require = Gcsql:GetUInt8(19),
			Server = Gcsql:GetString(20),
			command_set = Gcsql:GetString(21),
			anarchy = Gcsql:GetUInt8(22),			
			flag_timer = Gcsql:GetUInt8(23),
			spawn_timer = Gcsql:GetUInt32(24),
			guild_invite = Gcsql:GetUInt8(25),
			loc = Gcsql:GetString(26),
			loc_cost = Gcsql:GetUInt8(27),
			flag_id = Gcsql:GetUInt32(28),
			farm = Gcsql:GetString(29),
			farm_cost = Gcsql:GetUInt8(30),
			farm_L = Gcsql:GetUInt8(31),
			farm_id = Gcsql:GetUInt32(32),
			barrack = Gcsql:GetString(33),
			barrack_cost = Gcsql:GetUInt8(34),
			barrack_L = Gcsql:GetUInt8(35),
			barrack_id = Gcsql:GetUInt32(36),
			hall = Gcsql:GetString(37),
			hall_cost = Gcsql:GetUInt8(38),
			hall_L = Gcsql:GetUInt8(39),
			hall_id = Gcsql:GetUInt32(40),
			pig = Gcsql:GetString(41),
			pig_cost = Gcsql:GetUInt8(42),
			pig_L = Gcsql:GetUInt8(43),
			pig_id = Gcsql:GetUInt32(44),
			guard = Gcsql:GetString(45),
			guard_cost = Gcsql:GetUInt8(46),
			guard_L = Gcsql:GetUInt8(47),
			guard_id = Gcsql:GetUInt32(48),
			vendor1 = Gcsql:GetString(49),
			vendor1_cost = Gcsql:GetUInt8(50),
			vendor1_L = Gcsql:GetUInt8(51),
			vendor1_id = Gcsql:GetUInt32(52),
			vendor2 = Gcsql:GetString(53),
			vendor2_cost = Gcsql:GetUInt8(54),
			vendor2_L = Gcsql:GetUInt8(55),
			vendor2_id = Gcsql:GetUInt32(56),
			vendor3 = Gcsql:GetString(57),
			vendor3_cost = Gcsql:GetUInt8(58),
			vendor3_L = Gcsql:GetUInt8(59),
			vendor3_id = Gcsql:GetUInt32(60),
			cannon = Gcsql:GetString(61),
			cannon_cost = Gcsql:GetUInt8(62),
			cannon_L = Gcsql:GetUInt8(63),
			cannon_id = Gcsql:GetUInt32(64),
			vault = Gcsql:GetString(65),
			vault_cost = Gcsql:GetUInt8(66),
			vault_L = Gcsql:GetUInt8(67),
			vault_id = Gcsql:GetUInt32(68),
			mailbox = Gcsql:GetString(69),
			mailbox_cost = Gcsql:GetUInt8(70),
			mailbox_L = Gcsql:GetUInt8(71),
			mailbox_id = Gcsql:GetUInt32(72),
			setup = Gcsql:GetString(73),
			color_1 = Gcsql:GetString(74),
			color_2 = Gcsql:GetString(75),
			color_3 = Gcsql:GetString(76),
			color_4 = Gcsql:GetString(77),
			color_5 = Gcsql:GetString(78),
			color_6 = Gcsql:GetString(79),
			color_7 = Gcsql:GetString(80),
			color_8 = Gcsql:GetString(81),
			color_9 = Gcsql:GetString(82),
			color_10 = Gcsql:GetString(83),
			color_11 = Gcsql:GetString(84),
			color_12 = Gcsql:GetString(85),
			color_13 = Gcsql:GetString(86),
			color_14 = Gcsql:GetString(87),
			color_15 = Gcsql:GetString(88),
		};
	end
end

print("Guild Warz tables version: "..table_version);

local Currencyname = GetItemLink(GWCOMM[SERVER_GUILD_ID].currency);

-- ******************************************************
-- ************** CORE : custom functions ***************
-- ******************************************************

local function GetLocationId(player)
	for i = 1, #GWARZ do
		if(GWARZ[i].map_id == player:GetMapId() and GWARZ[i].area_id == player:GetAreaId() and GWARZ[i].zone_id == player:GetZoneId()) then
			return i;
		end
	end
end

local function PreparedStatements(key, ...)
	local Query = {
		[1] = "UPDATE "..guild_warz_DB..".zones SET `%s` = '%s' WHERE `entry` = '%s';",
		[2] = "DELETE FROM %s WHERE `guid` = '%s';",
		[3] = "UPDATE "..guild_warz_DB..".commands SET `%s` = '%s' WHERE `guild` = '%s';",
		[4] = "DELETE FROM "..guild_warz_DB..".commands WHERE `%s` = '%s';",
	}
	
	if(key == 1) then
		local subtable, value, loc = ...;
		local qs = string.format(Query[key], subtable, value, loc)
		WorldDBQuery(qs)
		GWARZ[loc][subtable] = value;
	end
	
	if(key == 2) then
		local qs = string.format(Query[key], ...)
		WorldDBQuery(qs)
	end
	
	if(key == 3) then
		local subtable, value, guild = ...;
		local qs = string.format(Query[key], ...)
		WorldDBQuery(qs)
		GWCOMM[guild][subtable] = value;
	end
	
	if(key == 4) then
		local subtable, name = ...;
		local qs = string.format(Query[key], ...)
		GWCOMM[subtable] = nil;
		WorldDBQuery(qs)
	end
	
end

function CreateLocation(map, area, zone)
	local CLentry = (#GWARZ+1)
	WorldDBQuery("INSERT INTO "..guild_warz_DB..".zones SET `entry` = '"..CLentry.."';");
	LoadGWtable()
	print("Location: "..CLentry.." : created.")	
	
	-- Push values to Table Update after creation
	PreparedStatements(1, "map_id", map, CLentry)
	PreparedStatements(1, "area_id", area, CLentry)
	PreparedStatements(1, "zone_id", zone, CLentry)
	PreparedStatements(1, "guild_name", SERVER_GUILD_NAME, CLentry)
	PreparedStatements(1, "team", 2, CLentry)
	PreparedStatements(1, "x", 0, CLentry)
	PreparedStatements(1, "y", 0, CLentry)
	PreparedStatements(1, "z", 0, CLentry)
	PreparedStatements(1, "farm_count", 0, CLentry)
	PreparedStatements(1, "pig_count", 0, CLentry)
	PreparedStatements(1, "guard_count", 0, CLentry)
	PreparedStatements(1, "flag_id", 0, CLentry)
	PreparedStatements(1, "guild_id", SERVER_GUILD_ID, CLentry)
	return CLentry;
end

function CreateGcommands(guild)
local name = guild:GetName();
local gid = guild:GetId();
local guild_team = guild:GetLeader():GetTeam();

	if(gid ~= 0)then
		local CLentry = (#GWCOMM+1) -- should create varchar entry of guild name
	
		WorldDBQuery("INSERT INTO "..guild_warz_DB..".commands (`guild`, `guild_id`) VALUES ('"..name.."', '"..gid.."');")
		LoadGWCOMMTable(gid)	
		print("commands for: "..name.." : created.")
		return guild;
	end
end

local GW_version = ((table_version+core_version+pigpayz_version+tele_version+pvp_version+vendor_version)/4);

function Newguildgift(eventId, guild, leader, name) -- idea provided by creativextent . wrote by BlackWolf
	CreateGcommands(guild)
	leader:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].gift_count)
	SendWorldMessage(GWCOMM[SERVER_GUILD_ID].color_13.."The Guild "..name.." lead by "..leader:GetName().." has entered exsistance..!! NOW Prepair to hold your lands!!|r")
end

RegisterGuildEvent(5, Newguildgift)

local function OnGuildDelete(event, guild) -- clears a guilds commands from the table since guild id can be re-used.
	local PLAYER_GUILD_NAME = guild:GetName();
	PreparedStatements(4, "guild", PLAYER_GUILD_NAME)
end

RegisterGuildEvent(6, OnGuildDelete) 

function PlrFaction(eventId, player)

local xFaction = player:GetFaction()

GGW[player:GetAccountId()] = {
		faction = xFaction,
		team = player:GetTeam(),
};

	if(player:GetGuildName())then
		
		local PLAYER_GUILD_ID = player:GetGuildId();
		local Guild = player:GetGuild();
		
			if(GWCOMM[PLAYER_GUILD_ID] == nil)then
				Gcommands = CreateGcommands(Guild)
			end
	
		player:SendBroadcastMessage(GWCOMM[SERVER_GUILD_ID].color_14.."Use '/guild "..GWCOMM[SERVER_GUILD_ID].commands.."' for a list of GGW commands.")	
	end
end
								
RegisterPlayerEvent(3, PlrFaction)

local function DespawnCreature(event, creature)

	if(GGWC[creature:GetGUIDLow()] == 1)then
		creature:DespawnOrUnsummon();
	end
end

RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].cannon_id, 5, DespawnCreature)
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].cannon_id+1, 5, DespawnCreature)

-- ****************************************************
-- ******************* CORE ENGINE ********************
-- ****************************************************

function GWcommands(event, player, msg, type, language)
local k = 0
local ChatCache = {}

	for word in string.gmatch(msg, "[%w_]+") do
	        k = k+1
	        ChatCache[k] = word
	end

math.randomseed(tonumber(os.time()*os.time()))

local guild = player:GetGuild();
local PLAYER_GUILD_NAME = player:GetGuildName();
local PLAYER_GUILD_ID = player:GetGuildId();
local PLAYER_TEAM_ID = player:GetTeam();
local LocId = GetLocationId(player);
local pGuildRank = player:GetGuildRank();
local pGMRank = player:GetGMRank();
local pName = player:GetName();

	if(LocId == nil)then
		LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId());
	end
	
	if(GWCOMM[PLAYER_GUILD_ID] == nil)then
		Gcommands = CreateGcommands(guild);
	end
	
	local Zoneprice = (GWCOMM[SERVER_GUILD_ID].loc_cost)+(GWCOMM[SERVER_GUILD_ID].farm_cost*GWARZ[LocId].farm_count)+(GWCOMM[SERVER_GUILD_ID].barrack_cost*GWARZ[LocId].barrack_count)+(GWCOMM[SERVER_GUILD_ID].hall_cost*GWARZ[LocId].hall_count)+(GWCOMM[SERVER_GUILD_ID].pig_cost*GWARZ[LocId].pig_count)+(GWCOMM[SERVER_GUILD_ID].vendor1_cost*GWARZ[LocId].vendor1_count)+(GWCOMM[SERVER_GUILD_ID].vendor2_cost*GWARZ[LocId].vendor2_count)+(GWCOMM[SERVER_GUILD_ID].vendor3_cost*GWARZ[LocId].vendor3_count)+(GWCOMM[SERVER_GUILD_ID].cannon_cost*GWARZ[LocId].cannon_count)+(GWCOMM[SERVER_GUILD_ID].vault_cost*GWARZ[LocId].vault_count)+(GWCOMM[SERVER_GUILD_ID].mailbox_cost*GWARZ[LocId].mailbox_count);
	local yentry = 0
	local ypigcnt = 0
	local yvalue = 0
	
-- ****************************************************
-- ************** CORE : Guild Commands ***************
-- ****************************************************

	if(player:IsInGuild()==true)then
		
		if(ChatCache[1] == GWCOMM[PLAYER_GUILD_ID].commands)then

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."*********************************************");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."*  -Grumbo'z Guild Warz Commands:-  *");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."*********************************************");
			player:SendBroadcastMessage("(Guild: "..PLAYER_GUILD_NAME..")");
			player:SendBroadcastMessage("(Name: "..pName..") (Guild Rank: "..pGuildRank..") (GAME Rank: "..pGMRank..")");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.." Guild Member Commands:");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1..""..GWCOMM[PLAYER_GUILD_ID].commands.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."list guild commands.");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1..""..GWCOMM[PLAYER_GUILD_ID].info_loc.."|r                     "..GWCOMM[PLAYER_GUILD_ID].color_3.."lists area info.");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1..""..GWCOMM[PLAYER_GUILD_ID].list_loc.."|r                      "..GWCOMM[PLAYER_GUILD_ID].color_3.."lists areas owned");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|r                             "..GWCOMM[PLAYER_GUILD_ID].color_3.."by your guild.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1..""..GWCOMM[PLAYER_GUILD_ID].tele.." `location_id`|r   "..GWCOMM[PLAYER_GUILD_ID].color_3.."teleport to area");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|r                             "..GWCOMM[PLAYER_GUILD_ID].color_3.."by location id.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00"..GWCOMM[PLAYER_GUILD_ID].version.."|r                    "..GWCOMM[PLAYER_GUILD_ID].color_3.."-displays Core versions.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00"..GWCOMM[PLAYER_GUILD_ID].setup.."|r                    "..GWCOMM[PLAYER_GUILD_ID].color_3.."-displays System base setup.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************");

			if(pGuildRank <= GWCOMM[PLAYER_GUILD_ID].GLD_lvlb)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].color_8.."Guild Master level Commands:Rank: "..GWCOMM[PLAYER_GUILD_ID].color_2..GWCOMM[PLAYER_GUILD_ID].GLD_lvlb..GWCOMM[PLAYER_GUILD_ID].color_8.." access.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].loc.."|r         "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase area.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].farm.."|r       "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase a guild farm.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].barrack.."|r       "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase a barracks for guards.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].hall.."|r       "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase a guild hall.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].pig.."|r           "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase a pig.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].guard.."|r      "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase a disposable guard.");
				
				if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].cannon.."|r      "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase a cannon.");end
				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].vendor1.."|r      "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase vendor1.");end
				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].vendor2.."|r      "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase vendor2.");end
				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."buy "..GWCOMM[PLAYER_GUILD_ID].vendor3.."|r      "..GWCOMM[PLAYER_GUILD_ID].color_3.."- purchase vendor3.");end

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************");
			end
			
			if(pGuildRank <= GWCOMM[PLAYER_GUILD_ID].GLD_lvls)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].color_8.."Guild Master level Commands:Rank: "..GWCOMM[PLAYER_GUILD_ID].color_2..GWCOMM[PLAYER_GUILD_ID].GLD_lvls..GWCOMM[PLAYER_GUILD_ID].color_8.." access.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].loc.."|r         "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sell area for its TOTAL value.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].farm.."|r       "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sell farm.|r")	;	
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].barrack.."|r       "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sell barracks.|r");		
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].hall.."|r       "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sell hall.|r");	
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].pig.."|r           "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sell a pig to market.|r");		
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].guard.."|r  "..GWCOMM[PLAYER_GUILD_ID].color_3.."- removes a selected guard.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|r                        "..GWCOMM[PLAYER_GUILD_ID].color_3.."guards are disposable.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|r                        "..GWCOMM[PLAYER_GUILD_ID].color_3.."no cash back.|r");
		
				if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].cannon.."|r  "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sell a selected cannon.|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00sell "..GWCOMM[PLAYER_GUILD_ID].vendor1.."|r  "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sells a selected vendor1.|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00sell "..GWCOMM[PLAYER_GUILD_ID].vendor2.."|r  "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sells a selected vendor2.|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00sell "..GWCOMM[PLAYER_GUILD_ID].vendor3.."|r  "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sells a selected vendor3.|r");end

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].vault.."|r  "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sells a guild vault.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."sell "..GWCOMM[PLAYER_GUILD_ID].mailbox.."|r  "..GWCOMM[PLAYER_GUILD_ID].color_3.."- sells a guild mailbox.|r");

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************");
			end
			
			if(pGuildRank == 0)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Guild Master settings:");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild Buy. minimum required guild rank|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[PLAYER_GUILD_ID].GLD_lvlb.."");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild Sell. minimum required guild rank|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[PLAYER_GUILD_ID].GLD_lvls.."");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild invite system|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[PLAYER_GUILD_ID].guild_invite.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."0 = off 1 = on.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************")
			end

			if(pGuildRank == 0)or(pGMRank == GWCOMM[SERVER_GUILD_ID].GM_admin)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Guild Master/Game Master/Admin special Commands:")
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1..""..GWCOMM[SERVER_GUILD_ID].command_set.."|r      "..GWCOMM[PLAYER_GUILD_ID].color_3.."used to modify commands and settings.|r")
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."help "..GWCOMM[SERVER_GUILD_ID].command_set.."|r    "..GWCOMM[PLAYER_GUILD_ID].color_3.."lists commands and settings you may change.|r")
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************")
			end
			
			if(pGuildRank <= GWCOMM[PLAYER_GUILD_ID].GLD_lvlb)or(pGMRank >= GWCOMM[SERVER_GUILD_ID].GM_minimum)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Prices in "..Currencyname..""..GWCOMM[PLAYER_GUILD_ID].color_8.."'s:|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Zone price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].loc_cost.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."base location price.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Farm price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].farm_cost.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Barracks price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].barrack_cost.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Hall price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].hall_cost.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Pig price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].pig_cost.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guard price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].guard_cost.."|r - "..GWCOMM[PLAYER_GUILD_ID].color_14.."These Dont increase location price.");
				
				if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."cannon price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].cannon_cost.."|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor1 price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor1_cost.."|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor2 price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor2_cost.."|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor3 price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor3_cost.."|r");end

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vault price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vault_cost.."|r "..GWCOMM[PLAYER_GUILD_ID].color_14.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Mailbox price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].mailbox_cost.."|r "..GWCOMM[PLAYER_GUILD_ID].color_14.."|r");

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************")
			end

			if(pGuildRank <= GWCOMM[PLAYER_GUILD_ID].GLD_lvlb)or(pGMRank >= GWCOMM[SERVER_GUILD_ID].GM_minimum)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Location Limits:");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Farm limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].farm_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Pig limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].pig_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per farm. Require a farm.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Barrack limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].barrack_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per farm. Require a farm.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guard limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].guard_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per barrack. Require a barrack.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Hall limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].hall_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a barrack.|r");
				
				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vendor1 limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor1_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vendor2 limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor2_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vendor3 limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor3_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");end
				if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Cannon limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].cannon_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per hall. Require a hall.|r");end

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild Vault limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vault_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild MailBox limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].mailbox_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************");
			end
			
			if(pGMRank >= GWCOMM[SERVER_GUILD_ID].GM_minimum)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Game Master Commands:")
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1..""..GWCOMM[SERVER_GUILD_ID].details_loc.."|r                   "..GWCOMM[PLAYER_GUILD_ID].color_3.."-location info.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].loc.."|r           "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location to server.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reload "..GWCOMM[SERVER_GUILD_ID].table.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Reloads GW tables.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].farm.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location farm count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].barrack.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location barrack count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].hall.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location hall count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].pig.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location pig count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].guard.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location guard count to 0.|r");

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].vendor1.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location vendor 1 count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].vendor2.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location vendor 2 count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].vendor3.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location vendor 3 count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].cannon.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location cannon count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].vault.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location vault count to 0.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."reset "..GWCOMM[SERVER_GUILD_ID].mailbox.."|r          "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Resets location mailbox count to 0.|r");
	
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."spawn "..GWCOMM[SERVER_GUILD_ID].respawn_flag.."|r         "..GWCOMM[PLAYER_GUILD_ID].color_3.."- Spawns new flag if current|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|r                         "..GWCOMM[PLAYER_GUILD_ID].color_3.."flag is missing.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."lock "..GWCOMM[SERVER_GUILD_ID].loc.."|r         "..GWCOMM[PLAYER_GUILD_ID].color_3.."- locks a location from purchase.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************");
			end
				
			if(pGMRank == GWCOMM[SERVER_GUILD_ID].GM_admin)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."ADMIN settings:")
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."ADMIN Level Access|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].GM_admin.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Minimum GM Level Access|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].GM_minimum.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Pig Payz|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].pig_payz.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."copper.|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."New Guild Gift amount|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].gift_count.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Flag require|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].flag_require.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Anarchy|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].anarchy.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."No-Tag-Flag|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].flag_timer.."|r");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."No-Tag-Flag-Timer|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].spawn_timer.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."- in seconds");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."************************************************************")
			end
			return false;
		end

		if((ChatCache[1]==GWCOMM[PLAYER_GUILD_ID].setup)and not(ChatCache[2]))then
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."****************************");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."System setup details:");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Costs:|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Prices in "..Currencyname..""..GWCOMM[PLAYER_GUILD_ID].color_8.."'s:|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."---------------------------------");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Zone price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].loc_cost.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."base location price.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Farm price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].farm_cost.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Barracks price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].barrack_cost.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Hall price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].hall_cost.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Pig price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].pig_cost.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guard price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].guard_cost.."|r - "..GWCOMM[PLAYER_GUILD_ID].color_14.."These Dont increase location price.");
				
				if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."cannon price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].cannon_cost.."|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor1 price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor1_cost.."|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor2 price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor2_cost.."|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor3 price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor3_cost.."|r");end

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vault price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vault_cost.."|r "..GWCOMM[PLAYER_GUILD_ID].color_14.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Mailbox price|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].mailbox_cost.."|r "..GWCOMM[PLAYER_GUILD_ID].color_14.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Location Limits:");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Farm limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].farm_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Pig limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].pig_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per farm. Require a farm.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Barrack limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].barrack_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per farm. Require a farm.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guard limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].guard_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per barrack. Require a barrack.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Hall limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].hall_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a barrack.|r");
				
				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vendor1 limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor1_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vendor2 limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor2_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");end
				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vendor3 limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vendor3_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");end
				if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Cannon limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].cannon_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per hall. Require a hall.|r");end

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild Vault limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].vault_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild MailBox limit|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].mailbox_L.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."per location. Require a hall.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Rewards:|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Pig Payz|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].pig_payz.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."copper every |r"..GWCOMM[PLAYER_GUILD_ID].color_2..""..((GWCOMM[SERVER_GUILD_ID].pig_payz_timer / 1000) / 60).."|r"..GWCOMM[PLAYER_GUILD_ID].color_3.." minutes.");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."New Guild Gift amount|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].gift_count.."|r"..GWCOMM[PLAYER_GUILD_ID].color_8.." "..Currencyname..""..GWCOMM[PLAYER_GUILD_ID].color_8.."'s:|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."System features:|r");

				if(GWCOMM[SERVER_GUILD_ID].flag_require~=0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Flag require|r: "..GWCOMM[PLAYER_GUILD_ID].color_2.."Enabled. |r"..GWCOMM[PLAYER_GUILD_ID].color_3.."All guards MUST be cleared before a flag can be tagged.|r");end;
				if(GWCOMM[SERVER_GUILD_ID].anarchy~=0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Anarchy|r: "..GWCOMM[PLAYER_GUILD_ID].color_2.."Enabled. |r"..GWCOMM[PLAYER_GUILD_ID].color_3.."Same faction invasions allowed.|r");end;

				if(GWCOMM[SERVER_GUILD_ID].flag_timer ~= 0)then 
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."No-Tag-Flag|r: Enabled. |r"..GWCOMM[PLAYER_GUILD_ID].color_3.."un-taggable flag Cooldown timer.");
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."No-Tag-Flag-Timer Duration|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWCOMM[SERVER_GUILD_ID].spawn_timer.."|r "..GWCOMM[PLAYER_GUILD_ID].color_3.."- in seconds");
				end;

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."-------------------------------------------");

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."****************************");
			return false;
		end

		if(ChatCache[1]==GWCOMM[PLAYER_GUILD_ID].info_loc)then
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."****************************");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Location details:");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."---------------------------------");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00Loc ID:|r "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].entry.."|r");

			if(GWARZ[LocId].team==0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Owner|r: "..GWCOMM[PLAYER_GUILD_ID].color_4..""..GWARZ[LocId].guild_name.."|r.");end;
			if(GWARZ[LocId].team==1)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Owner|r: "..GWCOMM[PLAYER_GUILD_ID].color_5..""..GWARZ[LocId].guild_name.."|r.");end;
			if(GWARZ[LocId].team==2)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Owner|r: "..GWCOMM[PLAYER_GUILD_ID].color_6..""..GWARZ[LocId].guild_name.."|r.");end;
			if(GWARZ[LocId].team==3)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Owner|r: "..GWCOMM[PLAYER_GUILD_ID].color_7..""..GWARZ[LocId].guild_name.."|r.");end;
			
			if(GWARZ[LocId].team==0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Faction|r: "..GWCOMM[PLAYER_GUILD_ID].color_4.."Alliance.|r");end;
			if(GWARZ[LocId].team==1)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Faction|r: "..GWCOMM[PLAYER_GUILD_ID].color_5.."Horde.|r");end;
			if(GWARZ[LocId].team==2)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Faction|r: "..GWCOMM[PLAYER_GUILD_ID].color_6.."For Sale.|r");end;
			if(GWARZ[LocId].team==3)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Faction|r: "..GWCOMM[PLAYER_GUILD_ID].color_7.."LOCKED|r");end;

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00Farms|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].farm_count.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00Hall|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].hall_count.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00pigs|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].pig_count.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."|cff00cc00Value|r: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..Zoneprice.." "..GWCOMM[PLAYER_GUILD_ID].color_3..""..Currencyname.."'s.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."****************************");
			return false;
		end
		
		if(ChatCache[1]==GWCOMM[PLAYER_GUILD_ID].list_loc)then

			local Gloc;

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."**********************************************************************");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Loc ID:     farm:     barracks:     Hall:     Guards:     Pigs:          Zone value:|r");
			
				for k,_ in ipairs(GWARZ) do
				
					Gloc = GWARZ[k].entry;
	
						if(GWARZ[Gloc].guild_id == PLAYER_GUILD_ID)then
						
							local Xzoneprice = (GWCOMM[SERVER_GUILD_ID].loc_cost)+(GWCOMM[SERVER_GUILD_ID].farm_cost*GWARZ[Gloc].farm_count)+(GWCOMM[SERVER_GUILD_ID].barrack_cost*GWARZ[Gloc].barrack_count)+(GWCOMM[SERVER_GUILD_ID].hall_cost*GWARZ[Gloc].hall_count)+(GWCOMM[SERVER_GUILD_ID].pig_cost*GWARZ[Gloc].pig_count)+(GWCOMM[SERVER_GUILD_ID].vendor1_cost*GWARZ[Gloc].vendor1_count)+(GWCOMM[SERVER_GUILD_ID].cannon_cost*GWARZ[Gloc].cannon_count);
					
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_2..""..Gloc.."             "..GWARZ[Gloc].farm_count.."             "..GWARZ[Gloc].barrack_count.."             "..GWARZ[Gloc].hall_count.."             "..GWARZ[Gloc].guard_count.."             "..GWARZ[Gloc].pig_count.."                  "..Xzoneprice.."|r");
					
							yentry = yentry+1;
							ypigcnt = ypigcnt+GWARZ[Gloc].pig_count;
							yvalue = yvalue+Xzoneprice;
						end
	
				end
			
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."**********************************************************************");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."total locations: "..GWCOMM[PLAYER_GUILD_ID].color_2..""..yentry.."|r      "..GWCOMM[PLAYER_GUILD_ID].color_1.."total pigs:|r "..GWCOMM[PLAYER_GUILD_ID].color_2..""..ypigcnt.."|r      "..GWCOMM[PLAYER_GUILD_ID].color_1.."Total value:|r "..GWCOMM[PLAYER_GUILD_ID].color_2..""..yvalue.."|r "..GWCOMM[PLAYER_GUILD_ID].color_1..""..Currencyname.."'s.|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."**********************************************************************");
	
			return false;
		end
		
		if(ChatCache[1]==GWCOMM[PLAYER_GUILD_ID].version)then
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."****************************************");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."*                 "..GWCOMM[PLAYER_GUILD_ID].color_1.."Eluna                "..GWCOMM[PLAYER_GUILD_ID].color_9.."*");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Grumbo'z Guild Warz. VER : "..GW_version.."|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Core :: "..core_version..".|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."PigPayz :: "..pigpayz_version..".|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Teleport :: "..tele_version..".|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."PvP :: "..pvp_version..".|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Vendor :: "..vendor_version..".|r");
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."****************************************");
			return false;
		end
	
		if (ChatCache[1] == GWCOMM[SERVER_GUILD_ID].command_set) then
		
			if(ChatCache[2])then
			
				for i = 1, #GWHELP do
	
					if(ChatCache[2]==tostring(GWHELP[i].command))then
						
						if(ChatCache[3])then
					
							if(GWHELP[i].command_level<=4)then
							
								if(pGuildRank == 0)then
									PreparedStatements(3, ChatCache[2], ChatCache[3], PLAYER_GUILD_ID)
									player:SendBroadcastMessage("guild cmd "..ChatCache[2].." set to "..ChatCache[3]..".");
									return false;
								else
								
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."GLD CMD ACCESS ERROR.:|r "..pGuildRank);
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1].." "..ChatCache[2].." "..ChatCache[3]);
									return false;
								end
							end
				
							if(GWHELP[i].command_level<=6)and(GWHELP[i].command_level>=5)then
								
								if(pGMRank == GWCOMM[SERVER_GUILD_ID].GM_admin)then
									PreparedStatements(3, ChatCache[2], ChatCache[3], SERVER_GUILD_ID)
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10.."GM cmd "..ChatCache[2].." set to "..ChatCache[3].."|r.");
									return false;
								else
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."GM CMD ACCESS ERROR.: |r"..pGMRank);
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1].." "..ChatCache[2].." "..ChatCache[3]);
									return false;
								end
							end
							
						else
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1].." "..ChatCache[2]..""..GWCOMM[PLAYER_GUILD_ID].color_15.." NO value entered.");
							return false;
						end
						
						return false;
					end
				end	
			else
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1]..""..GWCOMM[PLAYER_GUILD_ID].color_15.." NO target command entered.");
				return false;
			end
			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1]);
		end
		
		if (ChatCache[1] == "help")then
		
			for i = 1, #GWHELP do
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].command_set)and(ChatCache[3]==nil)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10.."command id      -     description");
						
						for b = 1, #GWHELP do

							if((pGuildRank == 0)and(GWHELP[b].command_level<=4))then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10..""..GWHELP[b].command.."     -     "..GWCOMM[PLAYER_GUILD_ID].color_11..""..GWHELP[b].description.."|r");
							end
							
							if(pGMRank == GWCOMM[SERVER_GUILD_ID].GM_admin)and(GWHELP[b].command_level>=5)and(GWHELP[b].command_level<=6)then
	                        	player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10..""..GWHELP[b].command.."     -     "..GWCOMM[PLAYER_GUILD_ID].color_11..""..GWHELP[b].description.."|r");
	                        end
						end
				return false;
				end
				
				if(ChatCache[3] == tostring(GWHELP[i].command))then
				
					if(pGuildRank == 0)and(GWHELP[i].command_level<=4)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10..""..GWHELP[i].command.."      -      |cff00cc00"..GWHELP[i].description.."|r");
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10.."Example:|r /g "..GWCOMM[PLAYER_GUILD_ID].color_11..""..GWHELP[i].example.."");
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10.."Current:|r "..GWCOMM[PLAYER_GUILD_ID].color_13..""..GWCOMM[PLAYER_GUILD_ID][GWHELP[i].command].."");
						return false;
					end
					
					if(pGMRank == GWCOMM[SERVER_GUILD_ID].GM_admin)and(GWHELP[i].command_level>=5)and(GWHELP[i].command_level<=6)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10..""..GWHELP[i].command.."      -      |cff00cc00"..GWHELP[i].description.."|r");
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10.."Example:|r /g "..GWCOMM[PLAYER_GUILD_ID].color_11..""..GWHELP[i].example.."");
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_10.."Current:|r "..GWCOMM[PLAYER_GUILD_ID].color_13..""..GWCOMM[PLAYER_GUILD_ID][GWHELP[i].command].."");
						return false;
					end
				end
			end
		player:SendBroadcastMessage("err...");
		return false;
		end

-- ****************************************************
-- ************ CORE: Guild Master Commands ***********
-- ****************************************************

		if(pGuildRank <= GWCOMM[PLAYER_GUILD_ID].GLD_lvlb and ChatCache[1] == "buy")then

-- ******************* Buy commands *******************

			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].loc)then
		
				if(GWARZ[LocId].guild_id ~= SERVER_GUILD_ID)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You cannot purchase this area.")
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14..""..GWARZ[LocId].guild_name.." owns this area.");
					return false;

				else
				
					if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < Zoneprice)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You do not have enough "..Currencyname.."'s.");
						return false;
					else

						if(GWARZ[LocId].team==3)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."THIS AREA IS OFF LIMITS")
							return false;
						else

							local Gflag = PerformIngameSpawn(2, (GWCOMM[SERVER_GUILD_ID].flag_id + PLAYER_TEAM_ID), (player:GetMapId()), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn()); -- , true, 0, 1);
							local GflagId = Gflag:GetDBTableGUIDLow();
							
							PreparedStatements(1, "guild_name", PLAYER_GUILD_NAME, LocId)
							PreparedStatements(1, "team", PLAYER_TEAM_ID, LocId)
							PreparedStatements(1, "x", player:GetX(), LocId)
							PreparedStatements(1, "y", player:GetY(), LocId)
							PreparedStatements(1, "z", player:GetZ(), LocId)
							PreparedStatements(1, "flag_id", GflagId, LocId)
							PreparedStatements(1, "fs_time", GetCurrTime(), LocId)							
							PreparedStatements(1, "guild_id", PLAYER_GUILD_ID, LocId)
							
							player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, Zoneprice)
						
							if(player:GetGender()==0)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Congratulations King "..pName..". you have expanded "..PLAYER_GUILD_NAME.."'s land.|r");
							else
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Congratulations Queen "..pName..". you have expanded "..PLAYER_GUILD_ID.."'s land.|r");
							end
						return false;
						end
					end
				end
			end
	
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].farm)then

				if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
					return false;
				else

					if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].farm_cost)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You require more "..Currencyname.."'s.");
						return false;
					else

						if(GWARZ[LocId].farm_count >= GWCOMM[SERVER_GUILD_ID].farm_L)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have  "..GWARZ[LocId].farm_count.." farm\'s at this location.");
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only purchase "..GWCOMM[SERVER_GUILD_ID].farm_L.." farm\'s per location.");
							return false;
						else

							if(GWARZ[LocId].pig_count < (GWARZ[LocId].farm_count * GWCOMM[SERVER_GUILD_ID].pig_L))then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."you still need to finish populating your other farm.");
								return false;
							else

								PerformIngameSpawn(2, GWCOMM[SERVER_GUILD_ID].farm_id+GWARZ[LocId].team, (player:GetMapId()), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());

								PreparedStatements(1, "farm_count", GWARZ[LocId].farm_count+1, LocId)

								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].farm_cost)

								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Congratulations Grunt "..pName..".|r");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14..""..PLAYER_GUILD_NAME.." has added a farm at location: "..LocId..".|r");
								return false;
							end
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].barrack)then

				if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
					return false;
				else

					if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].barrack_cost)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You require more "..Currencyname.."'s.");
						return false;
					else

						if(GWARZ[LocId].barrack_count >= (GWCOMM[SERVER_GUILD_ID].farm_L * GWCOMM[SERVER_GUILD_ID].barrack_L))then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have  "..GWARZ[LocId].barrack_count.." barrack\'s at this location.");
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only purchase "..GWCOMM[SERVER_GUILD_ID].farm_L*GWCOMM[SERVER_GUILD_ID].barrack_L.." barrack\'s per location.");
							return false;
						else

							if(GWARZ[LocId].barrack_count >= GWARZ[LocId].farm_count*GWCOMM[SERVER_GUILD_ID].barrack_L)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each farm supports "..GWCOMM[SERVER_GUILD_ID].barrack_L.." barracks. You need another farm.");
								return false;
							else

								PerformIngameSpawn(2, GWCOMM[SERVER_GUILD_ID].barrack_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());

								PreparedStatements(1, "barrack_count", GWARZ[LocId].barrack_count+1, LocId)
								
								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].barrack_cost)
								
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Congratulations Commander "..pName..".|r");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14..""..PLAYER_GUILD_NAME.." has added a barracks at location: "..LocId..".|r");
								return false;
							end
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].hall)then

				if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
					return false;
				else

					if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].hall_cost)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each hall costs "..GWCOMM[SERVER_GUILD_ID].hall_cost.." "..Currencyname..". You dont have eough.");
						return false;
					else

						if(GWARZ[LocId].hall_count >= GWCOMM[SERVER_GUILD_ID].hall_L)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..GWARZ[LocId].hall_count.." hall at this location.");				
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..GWCOMM[SERVER_GUILD_ID].hall_L.." hall per area.");	
							return false;
						else

							if(GWARZ[LocId].barrack_count == 0)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each Hall require's 1 barracks per location to provide guards for defensive support.");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Gotta protect your HQ.");
								return false;
							else

								PerformIngameSpawn(2, GWCOMM[SERVER_GUILD_ID].hall_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());

								PreparedStatements(1, "hall_count", GWARZ[LocId].hall_count+1, LocId)

								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].hall_cost)

								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Congradulations!.|r");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Commandant "..pName..".|r");
								return false;
							end
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].pig)then

				if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
					return false;
				else

					if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].pig_cost)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each pig costs "..GWCOMM["SERVER"].pig_cost.." "..Currencyname..".");
						return false;
					else

						if(GWARZ[LocId].pig_count >= (GWCOMM[SERVER_GUILD_ID].pig_L * GWCOMM[SERVER_GUILD_ID].farm_L))then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..(GWARZ[LocId].pig_count*GWCOMM[SERVER_GUILD_ID].farm_L).." pigs at this location.")	;			
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..GWCOMM[SERVER_GUILD_ID].pig_L.." pig's per farm and "..GWCOMM[SERVER_GUILD_ID].farm_L.." farm's per location.")	;
							return false;
						else

							if(GWARZ[LocId].pig_count < GWCOMM[SERVER_GUILD_ID].pig_L)and(GWARZ[LocId].farm_count==0)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must first have a farm here before you can add pigs.");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Piggies gotta live somewhere...");
								return false;
							else

								if(GWARZ[LocId].pig_count >= (GWARZ[LocId].farm_count * GWCOMM[SERVER_GUILD_ID].pig_L))then
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You require another farm before you can add any more pigs.");
									return false;
								else								

									PerformIngameSpawn(1, GWCOMM[SERVER_GUILD_ID].pig_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());
								
									PreparedStatements(1, "pig_count", GWARZ[LocId].pig_count+1, LocId);
								
									player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].pig_cost);
								
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Congradulations!.|r");
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Farmer "..pName..".|r");
									return false;
								end
							end
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].guard)then

				if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
					return false;
				else

					if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].guard_cost)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each guard costs "..GWCOMM[SERVER_GUILD_ID].guard_cost.." "..Currencyname..".");
						return false;
					else

						if(GWARZ[LocId].guard_count >= (GWCOMM[SERVER_GUILD_ID].guard_L * (GWCOMM[SERVER_GUILD_ID].barrack_L * GWCOMM[SERVER_GUILD_ID].farm_L)))then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..GWARZ[LocId].guard_count.." guards at this location.");
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..(GWCOMM[SERVER_GUILD_ID].guard_L*GWCOMM[SERVER_GUILD_ID].farm_L).." per location.");
							return false;
						else

							if(GWARZ[LocId].guard_count >= (GWARZ[LocId].barrack_count * GWCOMM[SERVER_GUILD_ID].guard_L))then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must add another barracks to produce more guards.");
								return false;
							else

								PerformIngameSpawn(1, GWCOMM[SERVER_GUILD_ID].guard_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());
							
								PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count+1, LocId);
							
								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].guard_cost);
							
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Guard added by Commander "..pName..".|r");
								return false;
							end
						end
					end
				end
			end

			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].vendor1)then

				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then
				
					if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
						return false;
					else

						if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].vendor1_cost)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each vendor1 costs "..GWCOMM[SERVER_GUILD_ID].vendor1_cost.." "..Currencyname..".");
							return false;
						else

							if(GWARZ[LocId].vendor1_count >= GWCOMM[SERVER_GUILD_ID].vendor1_L)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..GWARZ[LocId].vendor1_count.." vendor1's at this location.");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..GWCOMM[SERVER_GUILD_ID].vendor1_L.." per location.");
								return false;
							else

								PerformIngameSpawn(1, GWCOMM[SERVER_GUILD_ID].vendor1_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());
								
								PreparedStatements(1, "vendor1_count", GWARZ[LocId].vendor1_count+1, LocId);
								
								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].vendor1_cost);
							
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Vendor1 added by Commander "..pName..".|r");
								return false;
							end
						end
					end
				else
					player:SendBroadcastMessage("Vendor1 is NOT enabled..")
					return false;
				end
			end

			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].vendor2)then
			
				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then
				
					if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
						return false;
					else

						if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].vendor2_cost)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each vendor2 costs "..GWCOMM[SERVER_GUILD_ID].vendor2_cost.." "..Currencyname..".");
							return false;
						else

							if(GWARZ[LocId].vendor2_count >= GWCOMM[SERVER_GUILD_ID].vendor2_L)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..GWARZ[LocId].vendor2_count.." vendor2's at this location.");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..GWCOMM[SERVER_GUILD_ID].vendor2_L.." per location.");
								return false;
							else

								PerformIngameSpawn(1, GWCOMM[SERVER_GUILD_ID].vendor2_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());
								
								PreparedStatements(1, "vendor2_count", GWARZ[LocId].vendor2_count+1, LocId)
								
								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].vendor2_cost)
								
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Vendor2 added by Commander "..pName..".|r");
								return false;
							end
						end
					end
				else
					player:SendBroadcastMessage("Vendor2 is NOT enabled..")
					return false;
				end				
			end

			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].vendor3)then
			
				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then
				
					if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
						return false;
					else
						if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].vendor3_cost)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each vendor3 costs "..GWCOMM[SERVER_GUILD_ID].vendor3_cost.." "..Currencyname..".");
							return false;
						else
							if(GWARZ[LocId].vendor3_count >= GWCOMM[SERVER_GUILD_ID].vendor3_L)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..GWARZ[LocId].vendor3_count.." vendor3's at this location.");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..GWCOMM[SERVER_GUILD_ID].vendor3_L.." per location.");
								return false;
							else
								PerformIngameSpawn(1, GWCOMM[SERVER_GUILD_ID].vendor3_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());
							
								PreparedStatements(1, "vendor3_count", GWARZ[LocId].vendor3_count+1, LocId);
							
								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].vendor3_cost);
							
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Vendor3 added by Commander "..pName..".|r");
								return false;
							end
						end
					end
				else
					player:SendBroadcastMessage("Vendor3 is NOT enabled..")
					return false;
				end				
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].cannon)then
			
				if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then
				
					if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
						return false;
					else
						if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].cannon_cost)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each cannon costs "..GWCOMM[SERVER_GUILD_ID].cannon_cost.." "..Currencyname..".");
							return false;
						else
							if(GWARZ[LocId].cannon_count >= GWCOMM[SERVER_GUILD_ID].cannon_L)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..GWARZ[LocId].cannon_count.." "..GWCOMM[PLAYER_GUILD_ID].cannon.."'s at this location.");
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..GWCOMM[SERVER_GUILD_ID].cannon_L.." per location.");
								return false;
							else
								if(GWARZ[LocId].hall_count == 0)then
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Cannons require a Hall per location.");
									return false;
								else
									PerformIngameSpawn(1, GWCOMM[SERVER_GUILD_ID].cannon_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());
							
									PreparedStatements(1, "cannon_count", GWARZ[LocId].cannon_count+1, LocId);
							
									player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].cannon_cost);
							
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."cannon added by Commander "..pName..".|r");
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."!! Its a cannon !!|r");
									return false;
								end
							end
						end
					end
				else
					player:SendBroadcastMessage("cannon's NOT enabled..")
					return false;
				end				
			end

			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].vault)then
			
				if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
					return false;
				else
					if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].vault_cost)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each vault costs "..GWCOMM[SERVER_GUILD_ID].cannon_cost.." "..Currencyname..".");
						return false;
					else
						if(GWARZ[LocId].vault_count >= GWCOMM[SERVER_GUILD_ID].vault_L * GWARZ[LocId].hall_count)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..GWARZ[LocId].vault_count.." "..GWCOMM[PLAYER_GUILD_ID].vault.."'s at this location.");
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..GWCOMM[SERVER_GUILD_ID].vault_L.." per hall.");
							return false;
						else
							if(GWARZ[LocId].hall_count == 0)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Vaults require a Hall.");
								return false;
							else
								PerformIngameSpawn(2, GWCOMM[SERVER_GUILD_ID].vault_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());

								PreparedStatements(1, "vault_count", GWARZ[LocId].vault_count+1, LocId)
							
								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].vault_cost)
							
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Vault added by Comissioner "..pName..".|r");
								return false;
							end
						end
					end
				end
			end

			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].mailbox)then
			
				if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your Guild does not own this land.");
					return false;
				else
					if(player:GetItemCount(GWCOMM[SERVER_GUILD_ID].currency) < GWCOMM[SERVER_GUILD_ID].mailbox_cost)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Each mailbox costs "..GWCOMM[SERVER_GUILD_ID].mailbox_cost.." "..Currencyname..".");
						return false;
					else
						if(GWARZ[LocId].mailbox_count >= GWCOMM[SERVER_GUILD_ID].mailbox_L * GWARZ[LocId].hall_count)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You have "..GWARZ[LocId].mailbox_count.." "..GWCOMM[PLAYER_GUILD_ID].mailbox.."'s at this location.");
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You can only have "..GWCOMM[SERVER_GUILD_ID].mailbox_L.." per hall.");
							return false;
						else
							if(GWARZ[LocId].hall_count == 0)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Mailboxs require a Hall.");
								return false;
							else
								PerformIngameSpawn(2, GWCOMM[SERVER_GUILD_ID].mailbox_id+GWARZ[LocId].team, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn());
					
								PreparedStatements(1, "mailbox_count", GWARZ[LocId].mailbox_count+1, LocId);
					
								player:RemoveItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].mailbox_cost);
					
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Mailbox added by Comissioner "..pName..".|r");
								return false;
							end
						end
					end
				end
			end

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1].." "..ChatCache[2]);
			return false;
		end

-- ******************* Sell commands ******************

		if(pGuildRank <= GWCOMM[PLAYER_GUILD_ID].GLD_lvls)and(ChatCache[1] == "sell")then
		
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].loc)then
			
				if(GWARZ[LocId].guild_id ~= PLAYER_GUILD_ID)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
					return false;
				else

					if(player:GetNearestGameObject(1, GWCOMM[SERVER_GUILD_ID].flag_id+player:GetTeam()) == nil)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must be next to your guild flag.");
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."move closer and try again.");
						return false;
					else

						local flag = player:GetNearestGameObject(1, (GWCOMM[SERVER_GUILD_ID].flag_id+player:GetTeam()));
						local flagid = flag:GetGUIDLow();
	
						flag:Despawn();
						flag:RemoveFromWorld(1); 
						
						PreparedStatements(1, "guild_name", SERVER_GUILD_NAME, LocId);
						PreparedStatements(1, "team", 2, LocId);
						PreparedStatements(1, "flag_id", 0, LocId);
						PreparedStatements(1, "fs_time", 0, LocId);
						PreparedStatements(1, "guild_id", SERVER_GUILD_ID, LocId);
						
						player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, Zoneprice);

						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."!Congratulations! Realtor "..pName.." has sold this land. For "..Zoneprice.." "..Currencyname.."'s.|r");
						return false;
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].farm)then

				if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
					return false;
				else
					if(GWARZ[LocId].farm_count == 0)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own a farm at this location.");
						return false;
					else

						if(GWARZ[LocId].pig_count > ((GWCOMM[SERVER_GUILD_ID].pig_L) * (GWARZ[LocId].farm_count-1)))then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must sell off all the pigs first before removing there housing.");
							return false;
						else	

							if(((player:GetNearestGameObject(5, GWCOMM[SERVER_GUILD_ID].farm_id))or(player:GetNearestGameObject(5, GWCOMM[SERVER_GUILD_ID].farm_id+1))) == nil)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must be closer.")
								return false;
							else

								local farm = (player:GetNearestGameObject(5, GWCOMM[SERVER_GUILD_ID].farm_id))or(player:GetNearestGameObject(5, GWCOMM[SERVER_GUILD_ID].farm_id+1));
								local farmspawnid = farm:GetGUIDLow(); -- use this to avoid ghost respawns

								farm:Despawn();
								farm:RemoveFromWorld(1);
													
								PreparedStatements(2, "gameobject", farmspawnid);
								PreparedStatements(1, "farm_count", GWARZ[LocId].farm_count-1, LocId);

								player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].farm_cost);

								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."!Congratulations!"..PLAYER_GUILD_NAME.." has sold a guild farm. For "..GWCOMM[SERVER_GUILD_ID].farm_cost.." "..Currencyname.."'s.|r");
								return false;
							end
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].barrack)then

				if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
					return false;
				else

					if(GWARZ[LocId].barrack_count == 0)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own a barracks at this location.");
						return false;
					else

						if(GWARZ[LocId].guard_count > ((GWCOMM[SERVER_GUILD_ID].guard_L) * (GWARZ[LocId].barrack_count-1)))then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must remove more guards before removing there housing.");
							return false;
						else	

							if(((player:GetNearestGameObject(5, GWCOMM[SERVER_GUILD_ID].barrack_id))or(player:GetNearestGameObject(5, GWCOMM[SERVER_GUILD_ID].barrack_id+1))) == nil)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must be closer.");
								return false;
							else

								local barrack = (player:GetNearestGameObject(5, GWCOMM[SERVER_GUILD_ID].barrack_id))or(player:GetNearestGameObject(5, GWCOMM[SERVER_GUILD_ID].barrack_id+1));
								local barrackspawnid = barrack:GetGUIDLow() -- use this to avoid ghost respawns

								barrack:Despawn();
								barrack:RemoveFromWorld(1);

								PreparedStatements(2, "gameobject", barrackspawnid)
								PreparedStatements(1, "barrack_count", GWARZ[LocId].barrack_count-1, LocId)

								player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].barrack_cost)

								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."!Congratulations! Builder "..PLAYER_GUILD_NAME.." has sold a garrison. For "..GWCOMM[SERVER_GUILD_ID].barrack_cost.." "..Currencyname.."'s.|r");
								return false;
							end
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].hall)then

				if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
					return false;
				else

					if(GWARZ[LocId].hall_count <= 0)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own a hall at this location.");
						return false;
					else

						if(((player:GetNearestGameObject(7, GWCOMM[SERVER_GUILD_ID].hall_id))or(player:GetNearestGameObject(7, GWCOMM[SERVER_GUILD_ID].hall_id+1))) == nil)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must be near to your hall to sell it.");
							return false;
						else

							local hall = ((player:GetNearestGameObject(7, GWCOMM[SERVER_GUILD_ID].hall_id))or(player:GetNearestGameObject(7, GWCOMM[SERVER_GUILD_ID].hall_id+1)));
							local hallspawnid = hall:GetGUIDLow(); -- use this to avoid ghost respawns

							hall:Despawn();
							hall:RemoveFromWorld(1);

							PreparedStatements(2, "gameobject", hallspawnid)
							PreparedStatements(1, "hall_count", GWARZ[LocId].hall_count-1, LocId)

							player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].hall_cost)

							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."!Congratulations!"..PLAYER_GUILD_NAME.." has sold a Hall. For "..GWCOMM[SERVER_GUILD_ID].hall_cost.." "..Currencyname.."'s.|r");
							return false;
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].pig)then

				if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
					return false;
				else
					if(GWARZ[LocId].pig_count == 0)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You DONT have any pigs in this area.");
						return false;
					else
						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a pig.");
							return false;
						else

							local Pnpc = player:GetSelection():GetEntry();
							local pig = GWCOMM[SERVER_GUILD_ID].pig_id;
							
							if not((Pnpc == pig)or(Pnpc == pig+1))then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."you must select a guild pig.");
								return false;
							else

								local pigspawnid = player:GetSelection():GetGUIDLow();

								player:GetSelection():DespawnOrUnsummon();

								PreparedStatements(2, "creature", pigspawnid);
								PreparedStatements(1, "pig_count", GWARZ[LocId].pig_count-1, LocId);

								player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].pig_cost);

								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Butcher "..pName.." sold 1 pig to the market.|r");
								return false;
							end
						end
					end
				end
			end
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].guard)then

				if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
					return false;
				else

					if(GWARZ[LocId].guard_count == 0)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You DONT have any guards in this area.");
						return false;
					else

						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a guard.");
							return false;
						else

							local Gnpc = player:GetSelection():GetEntry();
							local guard = GWCOMM[SERVER_GUILD_ID].guard_id;
							
							if not((Gnpc == guard)or(Gnpc == guard+1))then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a guild guard.");
								return false;
							else

								local guardspawnid = player:GetSelection():GetGUIDLow();
								player:GetSelection():SetPhaseMask(0); 
								player:GetSelection():DespawnOrUnsummon();

								PreparedStatements(2, "creature", guardspawnid);
								PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count-1, LocId);

								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Guard removed.|r");
								return false;
							end
						end
					end
				end
			end	
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].vendor1)then

				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then
				
					if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
				
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
						return false;
					else

						if(GWARZ[LocId].vendor1_count == 0)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You DONT have any vendor1's in this area.");
							return false;
						else
	
							if(player:GetSelection() == nil)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a Vendor1.");
								return false;
							else
							
								local Bnpc = player:GetSelection():GetEntry();
								local vendor1 = GWCOMM[SERVER_GUILD_ID].vendor1_id;
								
								if not((Bnpc == vendor1)or(Bnpc == vendor1+1))then
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a Vendor1.");
									return false;
								else

									local vendorspawnid1 = player:GetSelection():GetGUIDLow();
									player:GetSelection():SetPhaseMask(0); 
									player:GetSelection():DespawnOrUnsummon();

									PreparedStatements(2, "creature", vendorspawnid1);
									PreparedStatements(1, "vendor1_count", GWARZ[LocId].vendor1_count-1, LocId);

									player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].vendor1_cost);

									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Vendor1 sold.|r");
									return false;
								end
							end
						end
					end
				else
					player:SendBroadcastMessage("Vendor1 is NOT enabled..")
					return false;
				end
			end	
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].vendor2)then

				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then
				
					if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
						return false;
					else

						if(GWARZ[LocId].vendor2_count == 0)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You DONT have any vendor2's in this area.");
							return false;
						else
	
							if(player:GetSelection() == nil)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a Vendor2.");
								return false;
							else
							
								local Bnpc = player:GetSelection():GetEntry();
								local vendor2 = GWCOMM[SERVER_GUILD_ID].vendor2_id;
								
								if not((Bnpc == vendor2)or(Bnpc == vendor2+1))then
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a Vendor2.");
									return false;
								else

									local vendorspawnid2 = player:GetSelection():GetGUIDLow();
									player:GetSelection():SetPhaseMask(0); 
									player:GetSelection():DespawnOrUnsummon();

									PreparedStatements(2, "creature", vendorspawnid2);
									PreparedStatements(1, "vendor2_count", GWARZ[LocId].vendor2_count-1, LocId);

									player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].vendor2_cost);

									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Vendor2 sold.|r");
									return false;
								end
							end
						end
					end
				else
					player:SendBroadcastMessage("Vendor2 is NOT enabled..")
					return false;
				end
			end	
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].vendor3)then

				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then
				
					if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
						return false;
					else

						if(GWARZ[LocId].vendor3_count == 0)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You DONT have any vendor3's in this area.");
							return false;
						else
	
							if(player:GetSelection() == nil)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a Vendor3.");
								return false;
							else
							
								local Bnpc = player:GetSelection():GetEntry();
								local vendor3 = GWCOMM[SERVER_GUILD_ID].vendor3_id;
								
								if not((Bnpc == vendor3)or(Bnpc == vendor3+1))then
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a Vendor3.");
									return false;
								else

									local vendorspawnid3 = player:GetSelection():GetGUIDLow();
									player:GetSelection():SetPhaseMask(0); 
									player:GetSelection():DespawnOrUnsummon();

									PreparedStatements(2, "creature", vendorspawnid3);
									PreparedStatements(1, "vendor3_count", GWARZ[LocId].vendor3_count-1, LocId);

									player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].vendor3_cost);

									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Vendor3 sold.|r");
									return false;
								end
							end
						end
					end
				else
					player:SendBroadcastMessage("Vendor3 is NOT enabled..")
					return false;
				end
			end	
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].cannon)then

				if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then
				
					if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
						return false;
					else

						if(GWARZ[LocId].cannon_count == 0)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You DONT have any cannon's in this area.");
							return false;
						else
	
							if(player:GetSelection() == nil)then
								player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a cannon.");
								return false;
							else
							
								local Cnnn = player:GetSelection():GetEntry();
								local cannon = GWCOMM[SERVER_GUILD_ID].cannon_id;
								
								if not((Cnnn == cannon)or(Cnnn == cannon+1))then
									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must select a cannon.");
									return false;
								else

									local cCannon =  player:GetSelection();
									local cannonspawnid = cCannon:GetGUIDLow();
									GGWC[cannonspawnid] = 1;
									cCannon:DespawnOrUnsummon();

									PreparedStatements(2, "creature", cannonspawnid);
									PreparedStatements(1, "cannon_count", GWARZ[LocId].cannon_count-1, LocId);

									player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].cannon_cost);

									player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Cannon sold.|r");
									return false;
								end
							end
						end
					end
				else
					player:SendBroadcastMessage("Cannon's NOT enabled..")
					return false;
				end
			end	
			
			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].vault)then

				if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
					return false;
				else

					if(GWARZ[LocId].vault_count <= 0)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own a vault at this location.");
						return false;
					else

						if(((player:GetNearestGameObject(2, GWCOMM[SERVER_GUILD_ID].vault_id))or(player:GetNearestGameObject(2, GWCOMM[SERVER_GUILD_ID].vault_id+1))) == nil)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must be near to your vault to sell it.");
							return false;
						else

							local vault = ((player:GetNearestGameObject(2, GWCOMM[SERVER_GUILD_ID].vault_id))or(player:GetNearestGameObject(2, GWCOMM[SERVER_GUILD_ID].vault_id+1)));
							local vaultspawnid = vault:GetGUIDLow(); -- use this to avoid ghost respawns
							vault:Despawn();
							vault:RemoveFromWorld();

							PreparedStatements(2, "gameobject", vaultspawnid);
							PreparedStatements(1, "vault_count", GWARZ[LocId].vault_count-1, LocId);

							player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].vault_cost);

							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."!Congratulations!"..pName.." has sold a vault. For "..GWCOMM[SERVER_GUILD_ID].vault_cost.." "..Currencyname.."'s.|r");
							return false;
						end
					end
				end
			end

			if(ChatCache[2] == GWCOMM[PLAYER_GUILD_ID].mailbox)then

				if(PLAYER_GUILD_ID ~= GWARZ[LocId].guild_id)then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own this land.");
					return false;
				else

					if(GWARZ[LocId].mailbox_count <= 0)then
						player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."Your guild does not own a mailbox at this location.");
						return false;
					else

						if(((player:GetNearestGameObject(2, GWCOMM[SERVER_GUILD_ID].mailbox_id))or(player:GetNearestGameObject(2, GWCOMM[SERVER_GUILD_ID].mailbox_id+1))) == nil)then
							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."You must be near to your mailbox to sell it.");
							return false;
						else

							local mailbox = ((player:GetNearestGameObject(2, GWCOMM[SERVER_GUILD_ID].mailbox_id))or(player:GetNearestGameObject(2, GWCOMM[SERVER_GUILD_ID].mailbox_id+1)));
							local mailboxspawnid = mailbox:GetGUIDLow(); -- use this to avoid ghost respawns
							mailbox:Despawn();
							mailbox:RemoveFromWorld();

							PreparedStatements(2, "gameobject", mailboxspawnid);
							PreparedStatements(1, "mailbox_count", GWARZ[LocId].mailbox_count-1, LocId);

							player:AddItem(GWCOMM[SERVER_GUILD_ID].currency, GWCOMM[SERVER_GUILD_ID].mailbox_cost);

							player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."!Congratulations!"..pName.." has sold a mailbox. For "..GWCOMM[SERVER_GUILD_ID].vault_cost.." "..Currencyname.."'s.|r");
							return false;
						end
					end
				end
			end

			player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1].." "..ChatCache[2]);
			return false;
		end
		
-- ****************************************************
-- **************** Game Master Commands **************
-- ****************************************************
		
		if(pGMRank >= GWCOMM[SERVER_GUILD_ID].GM_minimum)then
		
			if(ChatCache[1] == "lock")and(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].loc)then
				PreparedStatements(1, "guild_id", SERVER_GUILD_ID, LocId)
				PreparedStatements(1, "guild_name", SERVER_GUILD_NAME, LocId)
				PreparedStatements(1, "team", 3, LocId)
				PreparedStatements(1, "flag_id", 0, LocId)
				PreparedStatements(1, "fs_time", 0, LocId)
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Area: "..GWARZ[LocId].entry.." succesfully |r"..GWCOMM[PLAYER_GUILD_ID].color_7.."LOCKED|r.");
			return false;
			end
--
			if(ChatCache[1] == "reset")then
			
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].loc)then
					PreparedStatements(1, "guild_id", SERVER_GUILD_ID, LocId)
					PreparedStatements(1, "guild_name", SERVER_GUILD_NAME, LocId)
					PreparedStatements(1, "team", 2, LocId)
					PreparedStatements(1, "flag_id", 0, LocId)
					PreparedStatements(1, "fs_time", 0, LocId)
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_14.."Area: "..GWARZ[LocId].entry.." succesfully reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].farm)then
					PreparedStatements(1, "farm_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." farm count reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].barrack)then
					PreparedStatements(1, "barrack_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." barrack count reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].hall)then
					PreparedStatements(1, "hall_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." hall count reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].pig)then
					PreparedStatements(1, "pig_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." pig count reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].guard)then
					PreparedStatements(1, "guard_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." guard count reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].vendor1)then
					PreparedStatements(1, "vendor1_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." vendor1 count reset.|r");
				return false;
				end
		
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].vendor2)then
					PreparedStatements(1, "vendor2_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." vendor2 count reset.|r");
				return false;
				end
		
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].vendor3)then
					PreparedStatements(1, "vendor3_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." vendor3 count reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].cannon)then
					PreparedStatements(1, "cannon_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." cannon count reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].vault)then
					PreparedStatements(1, "vault_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." vault count reset.|r");
				return false;
				end
				
				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].mailbox)then
					PreparedStatements(1, "mailbox_count", 0, LocId)
					player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." mailbox count reset.|r");
				return false;
				end
				
				if(ChatCache[1] == "reset")then
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1].." "..ChatCache[2]);
					return false;
				end
			end
--			
			if(ChatCache[1] == "reload")then

				if(ChatCache[2] == GWCOMM[SERVER_GUILD_ID].table)then
					GWtable = {};
					LoadGWtable();
					player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz Tables Reloaded.|r");
				return false;
				end

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1].." "..ChatCache[2]);
				return false;
			end
--
			if(ChatCache[1]=="spawn")then
				
				if(ChatCache[2]=="flag")then
				
					if(GWARZ[LocId].team >= 2)then
						player:SendBroadcastMessage("|cffFF0000The SERVER_GUILD_ID controls This Land. !! NO NEW FLAG SPAWNED !!|r");
					
					else
						local GMFlag = PerformIngameSpawn(2, (GWCOMM[SERVER_GUILD_ID].flag_id + GWARZ[LocId].team), (player:GetMapId()), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), true, 0, player:GetPhaseMaskForSpawn()); -- , true, 0, 1);
						local GMFlagid = GMFlag:GetDBTableGUIDLow();

						PreparedStatements(1, "flag_id", GMFlagid, LocId)
						PreparedStatements(1, "fs_time", GetGameTime(), LocId)
			
						player:SendBroadcastMessage("|cff00cc00New flag spawned for Guild Warz location: "..GWARZ[LocId].entry.."|r");
						return false;
					end
					player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_15.."CMD ERROR:|r "..ChatCache[1].." "..ChatCache[2]);
					return false;
				end
			end
--		
			if(ChatCache[1] == GWCOMM[SERVER_GUILD_ID].details_loc)then
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."*************************************");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_8.."Location details:");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Location ID:|r "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].entry.."|r.");

				if(GWARZ[LocId].team==0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild Name|r: "..GWCOMM[PLAYER_GUILD_ID].color_4..""..GWARZ[LocId].guild_name.."|r.");end
				if(GWARZ[LocId].team==1)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild Name|r: "..GWCOMM[PLAYER_GUILD_ID].color_5..""..GWARZ[LocId].guild_name.."|r.");end
				if(GWARZ[LocId].team==2)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild Name|r: "..GWCOMM[PLAYER_GUILD_ID].color_6..""..GWARZ[LocId].guild_name.."|r.");end
				if(GWARZ[LocId].team==3)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild Name|r: "..GWCOMM[PLAYER_GUILD_ID].color_7..""..GWARZ[LocId].guild_name.."|r.");end

				if(GWARZ[LocId].team==0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Faction|r: "..GWCOMM[PLAYER_GUILD_ID].color_4.."Alliance.|r");end
				if(GWARZ[LocId].team==1)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Faction|r: "..GWCOMM[PLAYER_GUILD_ID].color_5.."Horde.|r");end
				if(GWARZ[LocId].team==2)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Faction|r: "..GWCOMM[PLAYER_GUILD_ID].color_6.."For Sale.|r");end
				if(GWARZ[LocId].team==3)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Faction|r: "..GWCOMM[PLAYER_GUILD_ID].color_7.."LOCKED|r");end

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Team:|r  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].team.."|r.");

				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Farm count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].farm_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Barrack count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].barrack_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Hall count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].hall_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Pig count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].pig_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."guard count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].guard_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."cannon count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].cannon_count.."|r.");
			
				if(GWCOMM[SERVER_GUILD_ID].vendor1_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor1 count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].vendor1_count.."|r.");end
				if(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor2 count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].vendor2_count.."|r.");end
				if(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vendor3 count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].vendor3_count.."|r.");end
				
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."vault count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].vault_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."mailbox count|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].mailbox_count.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."flag spawn id|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].flag_id.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."flag spawn time|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].spawn_time.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Guild ID|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GWARZ[LocId].guild_id.."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_1.."Game Time|r:  "..GWCOMM[PLAYER_GUILD_ID].color_2..""..GetCurrTime().."|r.");
				player:SendBroadcastMessage(GWCOMM[PLAYER_GUILD_ID].color_9.."*************************************");
			return false;
			end
		end
	end
end
	
RegisterPlayerEvent(21, GWcommands)

print ("Guild Warz core version: "..core_version)

-- ****************************************************
-- Pig Payz System -- Ty rochet2 of EmuDevs.com  Vork is gonna luv this .
-- ****************************************************

local function pig_payz(eventid, timer, cycles, player)

	if(player:IsInGuild() == true)then
		
		local pig = 0
		local Glocdb = WorldDBQuery("SELECT `entry` FROM "..guild_warz_DB..".zones WHERE `guild_name` = '"..player:GetGuildName().."' AND `pig_count` > '0';");

		if(Glocdb==nil)then
			player:SendBroadcastMessage("PigPayz: 0 gold.", 0);
			player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."Zorkster says:Your guild does not own any pigs.", 0);
			player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."Zorkster says:Inform Your guild master to start some farms.", 0);
		else
			repeat
				local Gloc = Glocdb:GetUInt32(0)
				local Pigcnt = GWARZ[Gloc].pig_count
				pig = (pig+Pigcnt)

			until Glocdb:NextRow()~=true;

			Pigpayz = (GWCOMM[SERVER_GUILD_ID].pig_payz*pig);
			player:ModifyMoney(Pigpayz);
			player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."DemiiGods says:|cff00cc00Your Guild\'s hard work pays off.|r");
			player:SendBroadcastMessage("|cff00cc00PigPayz: "..Pigpayz / '10000'.." gold.|r");
		end
		return false;
	else
		player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."Requin shouts:|cffff0000Join a guild to earn hourly rewards from Grumbo\'z Guild Warz.|r");
	end
end

local function pig_payz_timer(eventid, player)

	player:RegisterEvent(pig_payz, GWCOMM[SERVER_GUILD_ID].pig_payz_timer, 0) 

end

RegisterPlayerEvent(3, pig_payz_timer)

print ("Pig Payz version: "..pigpayz_version);

-- ****************************************************
-- ********** Guild Warz teleporter system ************
-- ** a mild mutation of Grandelf1's guild teleporter *
-- ****************************************************

function Guildteleport(event, player, message, type, language)

local ChatMsg = GWCOMM[player:GetGuildId()].tele
local startpos, endpos = string.find(message, ChatMsg)

	if(startpos == 1) then
		local text = message:gsub(ChatMsg, "")

		if(player:IsInGuild()==true)then
			local Loc = tonumber(text)

			if(GWARZ[Loc]==nil)then
				player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."Grumbo says:|cffcc0000error.... teleport entry doesn't exsist.|r");

			else

				if(GWARZ[Loc].guild_name == player:GetGuildName())or((player:IsGM())and(player:GetGMRank() >= GWCOMM[SERVER_GUILD_ID].GM_minimum))then
					player:Teleport(GWARZ[Loc].map_id, GWARZ[Loc].x, GWARZ[Loc].y, GWARZ[Loc].z, 1.0)
			
					player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."DeadByDawn says:|cff00cc00Teleport complete.|r");

				else
					player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."Raider says:Your guild doesn't own that area.");
					player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."Raider says:You cannot teleport there.");
				end
			end
		end
	return false;
	end
end

RegisterPlayerEvent(21, Guildteleport)

print("Teleporter version: "..tele_version);

-- ****************************************************
-- *************** GUILD WARZ PvP System **************
-- ****************************************************

-- ************* Guild Warz Flag actions **************

function TransferFlag(player, locid, go)

local locid = GetLocationId(player);
local gGuid = go:GetDBTableGUIDLow();

	if(gGuid ~= GWARZ[locid].flag_id)then

		go:Despawn();
		go:RemoveFromWorld(1); 

		player:SendBroadcastMessage(SERVER_PRE_MESSAGE..":|cffcc0000error.... Phantom flag removed.|r");
		PreparedStatements(2, "gameobject", gGuid)

		return false;
	end
	
	if(player:IsInGuild()==false)then
		
		if(GWCOMM[GWARZ[locid].guild_name].guild_invite == 1)then
			player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System:|r")
			player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location "..player:GetName()..".|r");
			player:SendBroadcastMessage("|cff00cc00Join a Guild to participate in Grumbo\'z Guild Warz System.|r");
			player:SendBroadcastMessage("|cff00cc00Brought to you by Grumbo.|r");
			Gwarz_Guild_Flag_Hello(1, player, go)
			return false;
		else
			player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System:|r");
			player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location "..player:GetName()..".|r");
			player:SendBroadcastMessage("|cff00cc00Join a Guild to participate in Grumbo\'z Guild Warz System.|r");
			player:SendBroadcastMessage("|cff00cc00Brought to you by Grumbo.|r");
			player:SendBroadcastMessage("|cff00cc00This Guild Master has disabled the guild\'s invite system.|r");
			return false;
		end
	end

	if((player:GetGuildName()==GWARZ[locid].guild_name)or((GWCOMM[SERVER_GUILD_ID].anarchy==0)and(player:GetTeam()==GWARZ[locid].team)))then
		player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location.|r");
		player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System.|r");
		return false;
	end
	
	if((player:GetTeam()~=GWARZ[locid].team)and(player:IsInGuild()==true))or((player:GetTeam()==GWARZ[locid].team)and(player:IsInGuild()==true)and(GWCOMM[SERVER_GUILD_ID].anarchy==1))then

		if((GWARZ[locid].spawn_time+GWCOMM[SERVER_GUILD_ID].spawn_timer > GetGameTime())and(GWCOMM[SERVER_GUILD_ID].flag_timer==1))then
			player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."|cffff0000!!..Cooldown Timer in Affect..!!|r");
		else

			if(GWARZ[locid].guard_count~=0)and(GWCOMM[SERVER_GUILD_ID].flag_require==1)then  -- this lil check added to make it tougher to take the land. idea by renatokeys
				player:SendBroadcastMessage(SERVER_PRE_MESSAGE.."!!..You must clear ALL guards..!!");
			else
				if(	player:GetNearestGameObject(2, (GWCOMM[SERVER_GUILD_ID].flag_id+GWARZ[locid].team)))then

					if(((GWARZ[locid].guard_count==0)and(GWCOMM[SERVER_GUILD_ID].flag_require==1))or(GWCOMM[SERVER_GUILD_ID].flag_require==0))then

						player:GetNearestGameObject(2, (GWCOMM[SERVER_GUILD_ID].flag_id+GWARZ[locid].team)):Despawn();
						Nflag = (PerformIngameSpawn(2, (GWCOMM[SERVER_GUILD_ID].flag_id)+(player:GetTeam()), player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1):GetGUIDLow());
						
						PreparedStatements(2, "gameobject", go:GetGUIDLow());
						PreparedStatements(1, "guild_name", player:GetGuildName(), locid);
						PreparedStatements(1, "team", player:GetTeam(), locid);
						PreparedStatements(1, "x", player:GetX(), locid);
						PreparedStatements(1, "y", player:GetY(), locid);
						PreparedStatements(1, "z", player:GetZ(), locid);
						PreparedStatements(1, "flag_id", Nflag, locid);
						PreparedStatements(1, "flag_id", Nflag, locid);
						PreparedStatements(1, "fs_time", GetGameTime(), locid);
						PreparedStatements(1, "guild_id", player:GetGuildId(), locid);

						SendWorldMessage(SERVER_PRE_MESSAGE.."|cffff0000!! "..player:GetGuildName().." takes location:"..GWARZ[locid].entry.." from "..GWARZ[locid].guild_name.." !!|r", 1);
					end
				end
			end
		end
	end
	return false;
end

function Tagflag(event, player, go)
	if(player ~= nil)then
		local LocId = GetLocationId(player)
		TransferFlag(player, LocId, go)
	end
end

RegisterGameObjectGossipEvent(GWCOMM[SERVER_GUILD_ID].flag_id, 1, Tagflag)
RegisterGameObjectGossipEvent(GWCOMM[SERVER_GUILD_ID].flag_id+1, 1, Tagflag)

-- *********** Guild Invite Flag Action ***********

function Gwarz_Guild_Flag_Hello(eventid, player, object)
	local locid = GetLocationId(player)
	player:GossipClearMenu()
	player:GossipMenuAddItem(1,"Join "..GWARZ[locid].guild_name..".",0,10)
	player:GossipMenuAddItem(1,"Nevermind.",0,11)
	player:GossipSendMenu(1, object)
end

function Gwarz_Guild_Flag_Select(eventid, player, object, sender, intid, code)
local locid = GetLocationId(player)
	if (intid == 10) then
		GetGuildByName(GWARZ[locid].guild_name):AddMember(player, 255) -- attempts to add the new member at lowest(255) guild level.
	end
	if (intid == 11) then
	end
player:GossipComplete()
end

RegisterGameObjectGossipEvent(GWCOMM[SERVER_GUILD_ID].flag_id, 2, Gwarz_Guild_Flag_Select)
RegisterGameObjectGossipEvent(GWCOMM[SERVER_GUILD_ID].flag_id+1, 2, Gwarz_Guild_Flag_Select)

-- *********** Guild Guard combat actions *************
-- these are just basic scripts for the guards. if some one can script a good guard script with the idea in mind to have them guard the flag. I would love to add it.

local function FactionReset(event, timer, cycle, player)

local LocId = GetLocationId(player);
local guild = player:GetGuildName();
local acctid = player:GetAccountId();

	if(LocId == nil)then
		LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
	end

	if(faction_reset)then player:RemoveEventById(faction_reset);end

	if((guild ~= GWARZ[LocId].guild_name)and(GWARZ[LocId].team < 2))then
		
		local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
	else

		player:SetFFA(0)
		player:SetPvP(0)
		player:SetFaction(GGW[acctid].faction)
	end
end

local function Watcher(eventid, creature, player)

local LocId = GetLocationId(player);

	if(player:GetObjectType()=="Player")then
	
	local Pteam = GGW[player:GetAccountId()].team;
	local LocId = GetLocationId(player);
	
		if(LocId == nil)then
			LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
		end
	
		if(player:IsInGuild()==true)then

		local guildname = player:GetGuildName();

			if(guildname ~= GWARZ[LocId].guild_name)then

				if(Pteam == GWARZ[LocId].team)then
				
					creature:SetFaction(84-Pteam); -- 84 A
				else
					creature:SetFaction(83+Pteam); -- 83 H
				end
			else
				creature:SetFaction(84+Pteam);
			end

			if((Pteam~=GWARZ[LocId].team)and(guildname~=GWARZ[LocId].guild_name))or((GWCOMM[SERVER_GUILD_ID].anarchy==1)and(Pteam==GWARZ[LocId].team)and(guildname~=GWARZ[LocId].guild_name))then

				player:SetFFA(1)
				player:SetPvP(1)

				if(GWARZ[LocId].team < 2)then

					if(creature:IsWithinDistInMap(player, 50))then

						if(GWARZ[LocId].team==0)then

							player:SetFaction(85)
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
						else

							player:SetFaction(84)
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
						end
					end
				else
				end
			end
		else
		end
	else
	end
end

RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].pig_id, 27, Watcher)
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].pig_id+1, 27, Watcher)

if(GWCOMM[SERVER_GUILD_ID].cannon_id > 0)then
	RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].cannon_id, 27, Watcher)
	RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].cannon_id+1, 27, Watcher)
end

local function Cannondied(eventid, creature, player)

	local LocId = GetLocationId(creature)
	
	GGWC[creature:GetGUIDLow()] = 1;
	creature:DespawnOrUnsummon();
	PreparedStatements(2, "creature", creature:GetGUIDLow())
	PreparedStatements(1, "cannon_count", GWARZ[LocId].cannon_count-1, LocId)
end
	
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].cannon_id, 4, Cannondied)
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].cannon_id+1, 4, Cannondied)

function Guardffa(eventid, creature, player)

	if(player:GetObjectType()=="Player")then
	
	local Pteam = GGW[player:GetAccountId()].team
	local LocId = GetLocationId(player)
	
		if(LocId == nil)then
			LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
		end
	
		if(player:IsInGuild()==true)then
		
			if((Pteam~=GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))or((GWCOMM[SERVER_GUILD_ID].anarchy==1)and(Pteam==GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))then
		
				if(GWARZ[LocId].team < 2)then
		
					if(creature:IsWithinDistInMap(player, 40))then
						
						if(GWARZ[LocId].team==0)then -- ally faction 84 team 0 ::  horde faction 83 team 1
							player:SetFaction(2) -- 83
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
							creature:AttackStart(player)
						else
							player:SetFaction(1) -- 84
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
							creature:AttackStart(player)
						end
					end
				else
				end
			else
			end
		else
		end
	else
	end
end

RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id, 27, Guardffa)
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id+1, 27, Guardffa)

function Guardcombat(eventid, creature, player)

	if(player:GetObjectType()=="Player")then

		local LocId = GetLocationId(creature)
		
		if(LocId == nil)then
			LocId = CreateLocation(creature:GetMapId(), creature:GetAreaId(), creature:GetZoneId())
		end
		
		for _, v in ipairs(GetPlayersInWorld()) do
	
			if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
				v:SendBroadcastMessage("|cffff0000!!LOCATION "..GWARZ[LocId].entry.." IS UNDER ATTACK!!|r");
			end
		end
	end
end

RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id, 1, Guardcombat)
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id+1, 1, Guardcombat)

function Guarddied(eventid, creature, player)
	
	local LocId = GetLocationId(creature)
	
	PreparedStatements(2, "creature", creature:GetGUIDLow())
	PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count-1, LocId)
	
	local Drop = (math.random(1, 4))
	
	for _, v in ipairs(GetPlayersInWorld()) do
		
		if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
			v:SendBroadcastMessage("|cffcc0000!! I HAVE FAILED AT DEFENDING LOCATION "..LocId.." !!|r");
		end
	end
	
	if(Drop==4)then
		player:AddItem(Guard_Died_Drop, math.random(1, 4))
	end
	
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id, 4, Guarddied)
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id+1, 4, Guarddied)

function Guardhit(eventid, creature, attacker, damage)

	if(attacker:GetObjectType()=="Player")then

		local LocId = GetLocationId(creature)
	
		if(LocId == nil)then
			LocId = CreateLocation(creature:GetMapId(), creature:GetAreaId(), creature:GetZoneId())
		end
	
		if(attacker:GetObjectType()=="Player")then
			local a = (math.random(1, 4))
			
			if(a==4)then
				
				for _, v in ipairs(GetPlayersInWorld()) do
					
					if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
						v:SendBroadcastMessage("|cffff0000!!HURRY!! I NEED ASSISTANCE AT LOCATION "..LocId.."...!!HURRY!!|r");
					end
				end
			end
		end
	end
end

RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id, 9, Guardhit)
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id+1, 9, Guardhit)

function Guardkill(eventid, creature, victim)
	
	local LocId = GetLocationId(creature)
	
	for _, v in ipairs(GetPlayersInWorld()) do
		
		if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
			
			v:SendBroadcastMessage("|cff00cc00!! I HAVE KILLED A "..victim:GetObjectType().." INTRUDEING AT LOCATION "..GWARZ[LocId].entry.." !!|r");
			v:SendBroadcastMessage("|cff00cc00I found some gold on him.|r");
			v:ModifyMoney(math.random(100000, 1000000))
		end
	end
end

RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id, 3, Guardkill)
RegisterCreatureEvent(GWCOMM[SERVER_GUILD_ID].guard_id+1, 3, Guardkill)

print ("PVP core: "..pvp_version)

-- ****************************************************
-- NPC Vendor functions
-- ****************************************************

if(vendor1 == 1)then
	
	local function vendor1_menu(event, player, creature)
	
	local LocId = GetLocationId(creature)
		
		if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
			creature:SendUnitYell("!!Evil do`r!!", 0)
		else
		
			player:GossipClearMenu()
			
				for menu=1,#Vendor1 do
				
					player:GossipMenuAddItem(0, Vendor1[menu][2], 0, menu);
				end
			player:GossipSendMenu(1, creature)
		end
	end

	local function vendor1_Select(event, player, creature, sender, intid, code)

	local LocId = GetLocationId(creature)

		if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
			creature:SendUnitYell("!!Evil do`r!!", 0)
		else
	
			if(intid <= (#Vendor1-1))then
				
				player:AddAura(Vendor1[intid][1], player);
				vendor1_menu(1, player, creature);
			else
				player:GossipComplete(); -- last intid should be for `goodbye`
			end
		end
	end

	RegisterCreatureGossipEvent(GWCOMM[SERVER_GUILD_ID].vendor1_id, 1, vendor1_menu);
	RegisterCreatureGossipEvent(GWCOMM[SERVER_GUILD_ID].vendor1_id+1, 1, vendor1_menu);
	RegisterCreatureGossipEvent(GWCOMM[SERVER_GUILD_ID].vendor1_id, 2, vendor1_Select);
	RegisterCreatureGossipEvent(GWCOMM[SERVER_GUILD_ID].vendor1_id+1, 2, vendor1_Select);
	print("buff vendor1 loaded.");
else
	print("vendor 1 disabled.")
end

if(vendor2 == 1)and(GWCOMM[SERVER_GUILD_ID].vendor2_id > 0)then
		
	local function vendor2_menu(event, player, creature)

	local LocId = GetLocationId(creature)
	local npc2id = creature:GetEntry();
	
		VendorRemoveAllItems(npc2id);
									
			if(GWARZ[LocId].guild_id ~= player:GetGuildId())then
				creature:SendUnitYell("!!Evil do`r!!", 0);
			else
	
				for item2=1,#Vendor2 do
					AddVendorItem(npc2id, Vendor2[item2][1], 1, 1, Vendor2[item2][2]);
				end
				player:SendListInventory(creature);
			end
	end
	
	RegisterCreatureGossipEvent(GWCOMM[SERVER_GUILD_ID].vendor2_id, 1,vendor2_menu)
	RegisterCreatureGossipEvent(GWCOMM[SERVER_GUILD_ID].vendor2_id+1, 1,vendor2_menu)
	print("fun vendor2 loaded.")
else
	print("vendor2 disabled.")
end

if(vendor3 == 1)and(GWCOMM[SERVER_GUILD_ID].vendor3_id > 0)then
		
	local function vendor3_menu(event, player, creature)
		
	local LocId = GetLocationId(creature)
	local npc3id = creature:GetEntry();
	
		VendorRemoveAllItems(npc3id)
			
			if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
				creature:SendUnitYell("!!Evil do`r!!", 0)
			else
			
				for item3=1,#Vendor3 do
					AddVendorItem(npc3id, Vendor3[item3][1], 1, 1, Vendor3[item3][2]);
				end
				player:SendListInventory(creature)
			end
	end
	
	RegisterCreatureGossipEvent(GWCOMM[SERVER_GUILD_ID].vendor3_id, 1, vendor3_menu)
	RegisterCreatureGossipEvent(GWCOMM[SERVER_GUILD_ID].vendor3_id+1, 1, vendor3_menu)
	print("misc vendor3 loaded.");
else
	print("vendor3 disabled.");
end

print ("Vendor core: "..vendor_version);

-- ****************************************************
-- ******************** End OF Line ******************* 
-- ****************************************************

print ("GUILD WARZ ver: "..GW_version.." Loaded.");
local duration = (string.format("Load Time: %0.03f seconds.", os.clock() - start));
print(duration);
print("-----------------------------------\n");