//::///////////////////////////////////////////////
//:: Athas reborn Database Data Structures
//:: ar_db_struct
//:: Copyright (c) 2007 Athas Reborn PW.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:  NiteCap
//:: Created On:  7-9-07
//:://////////////////////////////////////////////

#include "ar_db_const"

// Connection log data
// nPlayerID: Player id pointer
// nPC: PC id pointer
// sInboundConnection: inbound time stamp
// sOutboundConnection: outbound time stamp
// sLastLocation: last Location
// isDM: is player a DM
//  sIP: IP at login
struct ar_connection_log
{
 int nID;
 int nPlayer;
 int nPC;
 string sInboundConnection;
 string sOutboundConnection;
 string sLastLocation;
 int bDM;
 string sIP;
 string sTable;
};

// Area data
// sResref: Area reseref
// sCommonName: Area Common Name
//
struct ar_area_index
{
string sResRef;
string sDescription;
string sCommonName;
string sTable;
};





// Arena Kills Data
// nloser: pc referance of the losing pc
// nwinner: pc referance of the winning pc
// nPCWin: did a pc win this match
// nCreatureWin: did a creature win this match
// nLoserHD
// nWinnerHD
struct ar_arena_kills_index
{
int nloser;
int nwinner;
int bPCWin;
int bCreatureWin;
int nLoserHD;
int nWinnerHD;
string sTable;
};


struct ar_creature_index
{
string sResRef;
string sDescription;
string sCommonName;
int  nCRValue;
int nRace;
int bPlotFlag;
string sTable;
};

struct ar_pc_bounty
{
int nWantedPC;//pc id pointer
int nCollectionAmmount;//amount to collect on colection
int nBountyOrigin;//id pointer of the pc killed for the bounty
string sInception;//date bounty was placed
int nCollector;//id pointer to the collector
string sCollectionDate;//Date bounty was collected
string sTable;
};

struct ar_pc_creature_kills
{
int nPC;
int nCreature;
int nArea;
int nXpValue;
int nGoldValue;
string sTimeStamp;
string sTable;
};

struct ar_pc_death_index
{
int nPC;
int nKiller;
int bPCKill;
int bCreatureKill;
string sTimeStamp;
string sTable;
};

struct ar_pc_index
{
string sName;
int nPlayer;
int bDM;
int nRace;
string sTable;
};

struct ar_pc_quests
{
int nQuest;
int bCStatus;
int nPC;
string sCompleted; //completetion time stamp
string sTable;
};


struct ar_player_index
{
string sName;
string sIP;
string sCDKEY;
string sLastIP;
int bDM;
string sTable;
};

struct ar_player_storage
{
string sResRef;
int nStackSize;
int nInventorySize;
int nPlayer;
string sTable;
};

struct ar_quest_index
{
string sName;
int nXPValue;
int nGoldValue;
int nNPC;
string sTable;
};

struct ar_race_index
{
string sName;
string sStartLocation;
string sRespawnLocation;
string sTable;
};

struct ar_item_index
{
string sResRef;
string sDescription;
int nGoldValue;
int nType;
string sName;
};


//void main(){}
