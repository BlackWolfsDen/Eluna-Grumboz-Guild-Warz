Grumboz-Guild-Warz
==================

.... blood and death ..nuff said?

now that we are done with the fun stuff :

what is this ... well this is an alternate perspective for PvP. you can PvP bg'z, you can PvP by raiding towns and malls, you can even PvP by teams, but now you have a fun way to PvP by GvG !! yes !! GvG "Guild Versus Guild". ..
.. Anarchy you say.. well !! YES IT IS !! so grab your guild mates and run around searching out the apposing teams guild locations. kill and destroy there defenses take there flag ... strip it down and sell it all off for profit ... or claim it as your own and expand your power and wealth deep into the enemies territory. build farms to supply your troops. build barracks to supply guards to help protect your lands . raise a hall for you troops to chill.

ok now how to basics:
     first of course you must be in a guild.
     you must be in guild chat "/guild"

basic commands are:

     type "/guild commands" for a complete list of commands available to you.
     the buy commands are accessible by guild members of a certain level chosen by the guild master. -Default GUildMaster only.
     the sell commands are accessible by guild members of a certain level chosen by the guild master. -Default GuildMaster only.
     the guild master can change what ranks can access buy/sell commands by using the set command.

to buy an area not owned by another guild:

     type "/guild buy area". A flag will appear at your location based on your team.
     
to purchase a farm:

     just type "/guild buy farm". A farm thingy will appear at your x,y,z.

to purchas a barrack:

     just type "/guild buy barrack".A barrack will appear at your x,y,z.

to purchase a hall:

     just type "/guild buy hall". And now you have a big 'o' hall buried in the mountain side lol.

to sell a building:
     
     just type "/guild sell hall". or farm or barrack. but you must get close to it to sell it.
     halls you have to be at the center bottom level.

to sell an npc:
     
     just select a pig and type "/guild sell pig". you can do this for all GGW npc's.
     
to purchase a location not owned by another guild other than "SERVER":

     just type "/guild buy area"

to adjust the buy/sell access level:

     as the guild master (rank 0) you will type /guild set buy 1
          - this will allow guild members who are rank 1 to access buy commands
          - the Guild Master is Rank 0 . each rank +1 is 1 rank below Guild Master. i.e.(Rank 1 = officer, Rank 2 = veteran,
       Rank 3 = member, rank 4 = initiate).
       
to set the sell command:

     type "/guild set sell 1". now 1 level below guild master can now use the sell command.(officer)

Adminz can change system settings, amounts, and values using the set command.

to change settings as the Admin:

     it is basicly the same as a Guildmaster
     to change amount of farms per location just type "/guild set farm_L 2". now you may have 2 farms per location.
     use "/guild help set" to list available settings you may change with a basic description and example
     use "/guild help farm_L" to get specific help with changing something rather than a full screen from "help set".
     the GM_minimum setting is the minimum level a gm must be to acces gm commands.
     the GM_admin is the GM rank of the admin. this sets what rank is required to access admin settings. can only be
     changed manually in the sql.
     The "reload table" command will reload all the tables for the system in case something goes out of sync.

the teleporter:

     to teleport just type "/guild gtele x" where x == location id
     
     ??id??
     ok each location has a unique location id. so when you use the "info" command it will say loc ID: xxxxx
     the xxxx is the location id. yes it can get up into the 4 digits. I don't know how many unique combinations
     there are for (map, area, zone) but so far I have seen up to 889 individual locations.
     to teleport from location to location. you can type "/guild list" .this will list all lands owned by your 
     guild by location id with basic info and totals at the bottom.

I have added an "OPTIONAL" feature ::: flag_require

     this will set the system to require that the invading force MUST clear ALL guards before they can take a flag.

     to turn this feature on :

          as ADMIN type "/guild set flag_require 1"  turns it on
          as ADMIN type "/guild set flag_require 0"  turns it off

I have added a new "OPTIONAL" feature ::: Anarchy

     this will allow guilds of EITHER team to invade ANY other guild location and claim it for their own.
     True GvG ally can invade ally/horde and horde can invade horde/ally.

          as ADMIN type "/guild set anarchy 1" turns it on
          as ADMIN type "/guild set anarchy 0" turns it off

I have added a new "OPTIONAL" Feature ::: No-Tag-Flag

     This will place an adjustable timer on a newly spawned flag.
     this timer wont allow the flag to be tagged and taken by another Guild.
     when the timer expires the flag becomes active.
          
          as ADMIN type "/guild set f_timer 1" turns it on
          as ADMIN type "/guild set f_timer 0" turns it off
     
          the time length is in seconds. i.e. 5 minutes is 300 seconds.
          as ADMIN type "/guild set s_timer 300" sets the timer to 5 minutes
          
All commands and settings happen LIVE in game so becareful of who's location your in when you turn it on.

Tutorial Video's: https://www.youtube.com/user/TheBlackwolfsden/videos

So have fun and remember to !! RAPE PLUNDER and PILLAGE !!.

#Grumbo
#Grumbo'z
#GrumbozGuildWarz