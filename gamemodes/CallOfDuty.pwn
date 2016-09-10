/************************************************************
SA:MP Script by Gotham.GitHub:@GothamSAMP

By Gotham©.All Copyrights Reserved.
/***********************************************************/
#include <a_samp>
#include <zcmd>
#include <jadmin3>
#include <sscanf2>

#define COLOR_RED 0xAA3333AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_SPAWN 0xFF8C55FF
#define COLOR_LIGHTBLUE 0x6DC5F3FF
#define COLOR_ADMIN 0xFF0000FF
#define COLOR_SAY 0x2986CEFF
#define COLOR_SYSGREY 0xC6BEBDFF
#define COLOR_BLACK 0x000000FF
#define COLOR_JOIN 0x74E80099
#define COLOR_WARN 0xBE615099
#define COLOR_RACE 0x00BBBB99
#define COLOR_KRED 0xFF0000FF
#define TEAM_EURASIA 0
#define TEAM_ARABIA 1
#define TEAM_SOVIET 2
#define TEAM_AUSTRAILIA 3
#define TEAM_EURASIA_COLOUR 0x00FF1E
#define TEAM_ARABIA_COLOUR 0xD6D311
#define TEAM_SOVIET_COLOUR 0xD96B11
#define TEAM_AUSTRAILIA_COLOUR 0x9B0BBF

new gTeam[MAX_PLAYERS];


main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}


public OnGameModeInit()
{
	ConnectNPC("MyNPC","NPC");
	ConnectNPC("TheCrazyWoozie","FootNPC");
	ConnectNPC("TheBusDriver","VNPC");// Car postion of Npc
    CreateObject(971, -911.85840, 1575.73767, 30.88662,   0.00000, 0.00000, 57.08653);
    CreateObject(971, -906.61871, 1582.11511, 31.04550,   0.00000, 0.00000, 46.71734);
    CreateObject(3279, -904.13177, 1556.76294, 25.69925,   0.00000, 0.00000, -1.14000);
    CreateObject(3279, -904.50873, 1531.69141, 24.73063,   0.00000, 0.00000, 0.00000);
    CreateObject(971, -915.35785, 1542.28748, 29.61569,   0.00000, 0.00000, 271.64615);
    CreateObject(971, -811.48279, 1652.63025, 8.40902,   0.00000, 0.00000, 0.00000);
    CreateObject(971, -915.79327, 1550.89368, 29.72172,   0.00000, 0.00000, 274.54395);
    CreateObject(971, -916.23132, 1559.27197, 29.81672,   0.00000, 0.00000, 269.23798);
    CreateObject(971, -914.96704, 1567.89844, 30.72816,   0.00000, 0.00000, 77.08375);
    CreateObject(971, -914.65100, 1573.68164, 28.20495,   0.00000, 0.00000, 39.13827);
    CreateObject(971, -882.21246, 1630.35669, 29.49270,   0.00000, 0.00000, 48.85470);
    CreateObject(971, -887.90399, 1623.90320, 29.02389,   0.00000, 0.00000, 54.88393);
    CreateObject(971, -900.90991, 1588.58484, 31.00771,   0.00000, 0.00000, 50.31620);
    CreateObject(971, -896.13062, 1593.69507, 30.95830,   0.00000, 0.00000, 43.04705);
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	 SetPlayerTeamFromClass(playerid, classid);
	 return 1;
}

public OnPlayerConnect(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
    RemoveBuildingForPlayer(playerid, 3343, -905.0000, 1541.0547, 24.8672, 0.25);
    RemoveBuildingForPlayer(playerid, 3168, -905.0000, 1541.0547, 24.8672, 0.25);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{

if(IsPlayerNPC(playerid))
{
	new NPCNAME[24];
	GetPlayerName(playerid,NPCNAME,sizeof(NPCNAME));
	if(!strcmp(NPCNAME, "TheBusDriver", true))
	{
		   PutPlayerInVehicle(playerid,CreateVehicle(431,2039.5297,1292.9309,10.7733,181.4727,217,66,5000,0, 0));
		   SetPlayerSkin(playerid, 84);
	}
	return 1;
	
	GetPlayerName(playerid,NPCNAME,sizeof(NPCNAME));
	if(!strcmp(NPCNAME, "TheCrazyWoozie", true))
	{
			 SetPlayerSkin(playerid, 34);
	}
	return 1;
	
	GetPlayerName(playerid,NPCNAME,sizeof(NPCNAME));
	if(!strcmp(NPCNAME, "MyNPC", true))
	{
			SetPlayerSkin(playerid, 28);
	}
	return 1;
}
	 SetPlayerToTeamColour(playerid);
	 return 1;
}

 SetPlayerTeamFromClass(playerid, classid)
{
	 if(classid == 0)
	 {
	 gTeam[playerid] = TEAM_EURASIA;
	 }
	 if(classid == 1)
	 {
	 gTeam[playerid] = TEAM_ARABIA;
	 }
	 if(classid == 2)
	 {
	 gTeam[playerid] = TEAM_SOVIET;
	 }
	 if(classid == 3)
     {
 	 gTeam[playerid] = TEAM_AUSTRAILIA;
	 }
	 
}
SetPlayerToTeamColour(playerid)
{
   if(gTeam[playerid] == TEAM_EURASIA)
   {
		 SetPlayerColor(playerid,TEAM_EURASIA_COLOUR); // Green
   }
   if(gTeam[playerid] == TEAM_ARABIA)
   {
		 SetPlayerColor(playerid,TEAM_ARABIA_COLOUR);
   }
   if(gTeam[playerid] == TEAM_SOVIET)
   {
		 SetPlayerColor(playerid,TEAM_SOVIET_COLOUR);
   }
   if(gTeam[playerid] == TEAM_AUSTRAILIA)
   {
		  SetPlayerColor(playerid,TEAM_AUSTRAILIA_COLOUR);
	}
   
}
public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	new msg[128];
	format(msg, sizeof(msg), "[%d] %s", playerid, text);
	SendPlayerMessageToAll(playerid, msg);
	return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

CMD:vskin(playerid, params[])
{
        new string[128], skinid;
	if(CheckVip(playerid) >=2)
	{
	    if(sscanf(params, "d", skinid))
	    {
			SendClientMessage(playerid, COLOR_RED, "SYNTAX: /skin [skinID]");
		}
		else
		{
		    SetPlayerSkin(playerid, skinid);
			format(string, sizeof(string), "You have set your skin ID to %d", skinid);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}
	}
	return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
