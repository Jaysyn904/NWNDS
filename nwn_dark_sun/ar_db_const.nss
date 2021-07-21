//::///////////////////////////////////////////////
//:: Athas reborn Database access constants
//:: ar_db_const
//:: Copyright (c) 2007 Athas Reborn PW.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:  NiteCap
//:: Created On:  7-9-07
//:://////////////////////////////////////////////

//Table names of the storage table in mysql

const string ARSX_CONLOG="ar_connection_log";
const string ARSX_AREA_INDEX="ar_area_index";
const string ARSX_ARENA_KILLS_INDEX="ar_arena_kills_index";
const string ARSX_CREATURE_INDEX="ar_creature_index";
const string ARSX_PC_BOUNTY="ar_pc_bounty";
const string ARSX_CREATURE_DEATHS="ar_creature_deaths";
const string ARSX_PC_DEATH_INDEX="ar_pc_death_index";
const string ARSX_PC_INDEX="ar_pc_index";
const string ARSX_PC_QUESTS="ar_pc_quests";
const string ARSX_PLAYER_INDEX="ar_player_index";
const string ARSX_PLAYER_STORAGE="ar_player_storage";
const string ARSX_QUEST_INDEX="ar_quest_index";
const string ARSX_RACE_INDEX="ar_race_index";
const string ARSX_ITEM_INDEX="ar_item_index";
const string ARSX_ITEMPROP_INDEX="ar_itemprops_index";

//Process index
//used for ARSX_ProcessClient();
const int ARSX_PROCID_CONLOG=1;
const int ARSX_PROCID_AREA_INDEX=2;
const int ARSX_PROCID_ARENA_KILLS_INDEX=3;
const int ARSX_PROCID_CREATURE_INDEX=4;
const int ARSX_PROCID_PC_BOUNTY=5;
const int ARSX_PROCID_PC_CREATURE_KILLS=6;
const int ARSX_PROCID_PC_DEATH_INDEX=7;
const int ARSX_PROCID_PC_INDEX=8;
const int ARSX_PROCID_PC_QUESTS=9;
const int ARSX_PROCID_PLAYER_INDEX=10;
const int ARSX_PROCID_PLAYER_STORAGE=11;
const int ARSX_PROCID_QUEST_INDEX=12;
const int ARSX_PROCID_RACE_INDEX=13;



//sql Function constants
//MySQL 5+
const string SQL_NULL="NULL";
const string SQL_NOW="NOW()";
const string SQL_ISNULL=" IS NULL";


//constants pertaining to debugging
//set to false to turn off all debugging
const int ARSX_DEBUG_OUTPUT=TRUE;
//set to -1 to suppres debugging for select data set
const int ARSX_DEBUG_MAIN=1;
const int ARSX_DEBUG_CONNECTION_LOG=2;     // ar_connection_log Debuging
const int ARSX_DEBUG_AREA_INDEX=3;     // ar_area_index Debuging
const int ARSX_DEBUG_ARENA_INDEX=4;     // ar_arena_kills_index Debuging
const int ARSX_DEBUG_CREATURE_INDEX=5;     // ar_creature_index Debuging
const int ARSX_DEBUG_BOUNTY=6;     // ar_pc_bounty Debuging
const int ARSX_DEBUG_CREATURE_KILLS=7;     // ar_pc_creature_kills Debuging
const int ARSX_DEBUG_PC_DEATH_INDEX=8;     // ar_pc_death_index Debuging
const int ARSX_DEBUG_PC_INDEX=9;     // ar_pc_index Debuging
const int ARSX_DEBUG_PC_QUESTS=10;     // ar_pc_quests Debuging
const int ARSX_DEBUG_PLAYER_INDEX=11;     // ar_player_index Debuging
const int ARSX_DEBUG_PLAYER_STORAGE=12;     // ar_player_storage Debuging
const int ARSX_DEBUG_QUEST_INDEX=13;     // ar_quest_index Debuging
const int ARSX_DEBUG_RACE_INDEX=14;     // ar_race_index Debuging

// error codes
const int ARSX_USER_NOT_CONNECTED = -101;
const int ARSX_USER_NOT_FOUND =-102;
const int ARSX_USER_CREATE_ERROR =-103;
const int ARSX_PC_CREATE_ERROR = -104;
const int ARSX_PC_NOT_FOUND = -105;
const int ARSX_RACE_OBJECT_NOT_VALID = -106;
const int ARSX_RACE_CREATE_ERROR = -107;
const int ARSX_RACE_NOT_FOUND = -108;
const int ARSX_AREA_NOT_FOUND= -109;
const int ARSX_CREATURE_CREATE_ERROR=-110;
const int ARSX_LOG_ERROR_PCDEATH=-111;
const int ARSX_LOG_ERROR_PCKILL=-112;
const int ARSX_LOG_ERROR_CRDEATH=-113;
const int ARSX_LOG_PCDEATH=-114;
const int ARSX_LOG_CRDEATH=-115;
const int ARSX_ITEM_CREATE_ERROR=-116;
const int ARSX_LOCATION_STORED = -109;

//const for var pointers for temp PC data storage
const string ARSX_VAR_TOTAL_KILLS = "ARSX_TOTAL_KILLS";
const string ARSX_VAR_KILLS = "ARSX_CONTAINER_KILLS";

//const for local Main data storage
const string ARSX_L_PLAYER = "ARSX_PL_";
const string ARSX_L_PC = "ARSX_PC_";
const string ARSX_L_CONNECTION = "ARSX_CN_";
const string ARSX_L_LASTLOCATION = "ARSX_LOC_";
const string ARSX_CREATUREID = "ARSX_CRID";
const string ARSX_CREATURE_SPAWNED_AREA= "ARSX_CR_SPAWN_AREA";

const string ARSX_MSG_NEWPLAYER = "AthasReborn";// Please Take your time and ask any questions you may have.";
const int    ARSX_LOCAL_USE_MODULE=TRUE;
const int    ARSX_LOCAL_USE_ITEM = FALSE;
const string ARSX_LOCAL_USE_ITEM_TAG = "";
// const int RACIAL_TYPE_PLANT = 62;  // MOVED
const int MAXIMUM_PLAYER_LEVEL = 40;

//void main(){}
