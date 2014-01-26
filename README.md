Grumboz-Guild-Warz
==================

.... blood and death ..nuff said?

now that we are done with the fun stuff :

what is this ... well this is an alternate perspective for PvP. you can PvP bg'z, you can PvP by raiding towns and malls, you can even PvP by teams, but now you have a fun way to PvP by GvG !! yes !! GvG "Guild Versus Guild". ..
.. Anarchy you say.. grab you guild members and run around searching out the apposing teams guild locations. kill and destroy there defenses take there flag ... strip it down and sell it all off for profit ... or claim it as your own and expand your power and wealth deep into the enemies territory. build farms to supply your troops. build barracks to supply guards to help protect your lands . raise a hall for you troops to chill.

ok now how to basics:
first of course you must be in a guild.
you must be in guild chat "/guild"
basic commands are:
type /guild commands for a complete list of commands available to you.
the buy commands are accessible by guild members of a certain level chosen by the guild master
the sell commands are accessible by guild members of a certain level chosen by the guild master
the guild master can change what ranks can access buy/sell commands by using the set command.
Adminz can change system settings, amounts, and values using the set command.

to purchase a farm just type /guild buy farm
to purchase a location not owned by another guild other than "SERVER" just type /guild buy area

to adjust the buy/sell access level:
as the guild master (rank 0) you will type /guild set buy 1
     - this will allow guild members who are rank 1 to access buy commands
     - the Guild Master is Rank 0 . each rank +1 is 1 rank below Guild Master. i.e.(Rank 1 = officer, Rank 2 = veteran,
       Rank 3 = member, rank 4 = initiate).
to set the sell command type /guild set sell 1 

to change settings as the Admin:
it is basicly the same as a Guildmaster
to change amount of farms per location just type /guild set farm_L 2
     now you may have 2 farms per location.
use "/guild help set" to list available settings you may change with a basic description and example
use "/guild help farm_L" to get specific help with changing something rather than a full screen from "help set".
the GM_minimum setting is the minimum level a gm must be to acces gm commands.
the GM_admin is the GM rank of the admin. this sets what rank is required to access admin settings. can only be changed manually in the sql.

The "reload table" command will reload all the tables for the system in case something goes out of sync

the teleporter:
to teleport just type "/guild gtele x" where x == location id
??id??
ok each location has a unique location id. so when you use the "info" command it will say loc ID: xxxxx
     the xxxx is the location id. yes it can get up into the 4 digits. I don't know how many unique combinations
     there are for (map, area, zone) but so far I have seen up to 889 individual locations.
     to teleport from location to location you can type "/guild list" this will list all lands owned by your guild by 
     location id with basic info and totals at the bottom.

I have added an "OPTIONAL" feature ::: flag_require
this will set the system to require that the invading force MUST clear ALL guards before they can take a flag.
to turn this feature on :
     as ADMIN type "/guild set flag_require 1"  turns it on
     as ADMIN type "/guild set flag_require 0"  turns it off
