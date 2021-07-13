//::///////////////////////////////////////////////
//:: Athas reborn Database connection functions
//:: ar_db_main
//:: Copyright (c) 2007 Athas Reborn PW.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:  NiteCap
//:: Created On:  7-9-07
//:://////////////////////////////////////////////
#include "aps_include"
#include "ar_inc_pcspawn"
#include "ar_db_const"
#include "ar_db_struct"
//#include "nwnx_functions"



//:://////////////////////////////////////////////
//:: Prototypes
//:://////////////////////////////////////////////
//Inititalizes the database and grooms the log table
void ARSX_INIT();


//prosscesses the oncliententer db information
void ARSX_OnClientEnter(object oPC);

// client onrest event handler
// stores db info for oPC
// includeing
// last location
void ARSX_OnRest(object oPC);

// returns the main storage object
// can be set to item or module
// if set to item ARSX_LOCAL_USE_ITEM_RESREF will need to be supplied
object ARSX_LOCAL();

//set/returns the race of oObject
int ARSX_GetRace(object oObject);

//returns the player id from the database
int ARSX_GetPlayer(object oPC);

//returns the pc id from the database
int ARSX_GetPC(object oPC, int nPlayer);

// updates the connection log useing sDatastruct
// returns the row index in the table of the connection
int ARSX_LogConnection(struct ar_connection_log sData);

//returns the Database id for oObject
int ARSX_GetDBID(object oObject, int nObjectType);



// returns the last known location of oPC
// if nolocation is found or nIsNewPC is set to true
// will return the PC's race adjusted start point
location ARSX_GetLastLocation(object oPC, int nIsNewPC=FALSE);

//logs the pc death and returns the entry # for use.
int ARSX_LogPCDeath(object oPC, object oKiller);

//logs the pc kil and returns the entry # for use.
int ARSX_LogPCKill(object oPC, object oKiller);


//returns the Database id for oObject
int ARSX_GetDBID(object oObject, int nObjectType);


// updates the ar_area_index
// return on error is ARSX_AREA_NOT_FOUND
int ARSX_IndexArea(object oArea);

// //logs the creature and returns the entry # for use.
int ARSX_IndexCreature(object oCreature);

//gets the xp value of a creature
int ARSX_GetXP(object oPlayer,object oCreature);

//logs the item and returns the entry # for use.
int ARSX_IndexItem(object oItem);

//logs the item Property and returns the entry # for use.
int ARSX_IndexItemProperty(object oItem, int nItem);


//gets the ecl value of a pc
int AR_GetECL(object oPC);

//gets the gold value of a creature
int ARSX_GetGoldValue(object oPlayer,object oCreature);


//:://////////////////////////////////////////////
//:: Implements
//:://////////////////////////////////////////////



// updates the connection log useing sDatastruct
// returns the row index in the table of the connection
// returns -1 on updates
int ARSX_LogConnection(struct ar_connection_log sData)
{
    string sSQL="";
    object oModule=GetModule();


    if(sData.nID == ARSX_USER_NOT_CONNECTED)
        {

        sSQL = "INSERT INTO " + sData.sTable +
        " (nPlayer,nPC,sInboundConnection,bDM,sIP) VALUES" +
            "(" + IntToString(sData.nPlayer) +
            "," + IntToString( sData.nPC) +
            "," + sData.sInboundConnection +
            "," + IntToString(sData.bDM ) +
            ",'" + sData.sIP +
            "');";

        SQLExecDirect(sSQL);

        //Retrive our index for later
        sSQL = "SELECT nIndex FROM " + sData.sTable + " WHERE nPlayer=" +
               IntToString(sData.nPlayer) +
               " AND sOutboundConnection " + SQL_ISNULL +
               " AND sIP='" + sData.sIP + "';";

           SQLExecDirect(sSQL);

            if (SQLFetch() == SQL_SUCCESS)
               {
               return StringToInt(SQLGetData(1));
               }
               else
               {
               return SQLFetch();
               }
        }
     else
        {
         sSQL = "UPDATE " + sData.sTable + " SET sOutBoundConnection=" + sData.sOutboundConnection +
                ",sLocation='" + sData.sLastLocation +
                "' WHERE nIndex=" + IntToString(sData.nID) +
                ";";
        SQLExecDirect(sSQL);
        return ARSX_LOCATION_STORED;
        }
}



//returns the player id from the database
int ARSX_GetPlayer(object oPC)
{

 struct ar_player_index sData;
 sData.sName = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
 sData.sIP = GetPCIPAddress(oPC);
 sData.sCDKEY = GetPCPublicCDKey(oPC);
 sData.sLastIP = SQL_NULL;
 sData.bDM = GetIsDM(oPC);



 string sSQL = "SELECT nIndex FROM " + ARSX_PLAYER_INDEX +
               " WHERE sName='" + sData.sName +"'";
     SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        return StringToInt(SQLGetData(1));
    }
    else
    {
    SendMessageToAllDMs("New Player: " + sData.sName);
    SendMessageToPC(oPC,ARSX_MSG_NEWPLAYER);
    sSQL = "INSERT INTO " + ARSX_PLAYER_INDEX +
           " (sName,sIP,sCDKEY,sLastIP,bDM) VALUES (" +
           "'" +  sData.sName +
           "','" +  sData.sIP +
           "','" +  sData.sCDKEY +
           "','" +  sData.sLastIP +
           "'," + IntToString( sData.bDM) + ");";

    SQLExecDirect(sSQL);

    sSQL = "SELECT nIndex FROM " + ARSX_PLAYER_INDEX +
               " WHERE sName='" + sData.sName +"'";


     SQLExecDirect(sSQL);

     if(SQLFetch() == SQL_SUCCESS)
        {

        return StringToInt(SQLGetData(1));
        }

   return ARSX_USER_CREATE_ERROR;
     }

return ARSX_USER_NOT_FOUND;
}


//returns the pc id from the database
int ARSX_GetPC(object oPC, int nPlayer)
{

 struct ar_pc_index sData;
 sData.sName = SQLEncodeSpecialChars(GetName(oPC));
 sData.nPlayer = nPlayer;
 sData.bDM = GetIsDM(oPC);
 sData.nRace = ARSX_GetRace(oPC);



 string sSQL = "SELECT nIndex FROM " + ARSX_PC_INDEX +
               " WHERE sName='" + sData.sName +"' AND nPlayer=" +
               IntToString(sData.nPlayer) + ";";

    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {

        return StringToInt(SQLGetData(1));
    }
    else
    {

    sSQL = "INSERT INTO " + ARSX_PC_INDEX +
           " (sName,nPlayer,bDM,nRace) VALUES (" +
           "'" +  sData.sName +
           "'," + IntToString( sData.nPlayer ) +
           "," + IntToString(sData.bDM) +
           "," + IntToString(sData.nRace) + ");";

    SQLExecDirect(sSQL);

    sSQL = "SELECT nIndex FROM " + ARSX_PC_INDEX +
               " WHERE sName='" + sData.sName +"' AND nPlayer=" +
               IntToString(sData.nPlayer) + ";";

    SQLExecDirect(sSQL);

     if(SQLFetch() == SQL_SUCCESS)
        {

        return StringToInt(SQLGetData(1));
        }

   return ARSX_PC_CREATE_ERROR;
     }

return ARSX_PC_NOT_FOUND;
}


//set/returns the race index of oObject
int ARSX_GetRace(object oObject)
{

    if(GetObjectType(oObject)!=OBJECT_TYPE_CREATURE)
    {
    return ARSX_RACE_OBJECT_NOT_VALID;
    }

 struct ar_race_index sData;

 if(GetIsPC(oObject))
   {
   sData.sName = GetSubRace(oObject) == "" ?
                 Get2DAString("racialtypes","Lable",GetRacialType(oObject)) :
                 GetSubRace(oObject);

   sData.sStartLocation=GetSubRaceAdjustedStartPoint(oObject);
   sData.sRespawnLocation = GetSubRaceAdjustedRespawnPoint(oObject);
   }
 else
   {
   int nRow = GetRacialType(oObject);
   sData.sName=Get2DAString ("racialtypes","Lable",nRow);
   sData.sStartLocation="~CREATURE_SPAWN_POINT~";
   sData.sRespawnLocation = "~CREATURE_SPAWN_POINT~";
   }

 string sSQL = "SELECT nIndex FROM " + ARSX_RACE_INDEX +
               " WHERE sName='" + sData.sName + "';";

    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
       return StringToInt(SQLGetData(1));
    }
    else
    {

    sSQL = "INSERT INTO " + ARSX_RACE_INDEX +
           " (sName,sStartLocation,sRespawnLocation) VALUES (" +
           "'" +  sData.sName +
           "','" + sData.sStartLocation +
           "','" + sData.sRespawnLocation +
           "');";

    SQLExecDirect(sSQL);

    sSQL = "SELECT nIndex FROM " + ARSX_RACE_INDEX +
               " WHERE sName='" + sData.sName +"';";

    SQLExecDirect(sSQL);

     if(SQLFetch() == SQL_SUCCESS)
        {
        return StringToInt(SQLGetData(1));
        }
   return ARSX_RACE_CREATE_ERROR;
     }
return ARSX_RACE_NOT_FOUND;
}


// returns the main Local storage object
// can be set to item or module  see ar_db_const
// for details
// if set to item ARSX_LOCAL_USE_ITEM_TAG will need to be supplied
object ARSX_LOCAL()
{
   if(ARSX_LOCAL_USE_ITEM)
        {
        return GetObjectByTag(ARSX_LOCAL_USE_ITEM_TAG);
        }
  return GetModule();
}

// returns the last known location of oPC
location ARSX_GetLastLocation(object oPC, int nIsNewPC=FALSE)
{
    int nPlayer = ARSX_GetPlayer(oPC);
    int nPC = ARSX_GetPC(oPC, nPlayer);

 string sSQL;
 location lLoc;

        sSQL= "SELECT sLocation, nIndex FROM "+ ARSX_CONLOG +
                     " WHERE nPlayer=" + IntToString(nPlayer) +
                     " AND nPC=" + IntToString(nPC) +
                     " AND sLocation IS NOT NULL " +
                     " ORDER BY nIndex DESC";

        SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
        {
        string sLoc = SQLGetData(1);
        if(sLoc != "")lLoc = APSStringToLocation(sLoc);
        }
    else
        {
        sSQL = "SELECT sStartLocation FROM " + ARSX_RACE_INDEX +
               " WHERE nIndex=" + IntToString(ARSX_GetRace(oPC));

        SQLExecDirect(sSQL);

        if (SQLFetch() == SQL_SUCCESS)
            {
            lLoc = GetLocation(GetObjectByTag(SQLGetData(1)));
            }
        }


    if(nIsNewPC)
        {
        sSQL = "SELECT sStartLocation FROM " + ARSX_RACE_INDEX +
               " WHERE nIndex=" + IntToString(ARSX_GetRace(oPC));
        SQLExecDirect(sSQL);
        if (SQLFetch() == SQL_SUCCESS)
            {
            lLoc = GetLocation(GetObjectByTag(SQLGetData(1)));
            }
        }
return lLoc;
}


void ARSX_OnClientEnter(object oPC)
{
    struct ar_connection_log sData;
    object oStorer = ARSX_LOCAL();
    string sConn = ARSX_L_CONNECTION + GetPCPlayerName(oPC) + "_" + GetName(oPC);
    int nConn = GetLocalInt(oStorer,sConn);
    int nIsNewPC = GetHitDice(oPC)<=1?TRUE:FALSE;

    if(!nConn)
    {
        sData.nID = ARSX_USER_NOT_CONNECTED;
        sData.nPlayer = ARSX_GetPlayer(oPC);
        sData.nPC = ARSX_GetPC(oPC, sData.nPlayer);
        sData.sInboundConnection = SQL_NOW;
        sData.sOutboundConnection = SQL_NULL;
        //location lLastLoc =ARSX_GetLastLocation(oPC,sData.nPlayer ,sData.nPC,nIsNewPC);
        sData.bDM = GetIsDM(oPC);
        sData.sIP = GetPCIPAddress(oPC);
        sData.sTable = ARSX_CONLOG;
        nConn = ARSX_LogConnection(sData);
        SetLocalInt(oStorer,sConn,nConn);
        SetLocalInt(oPC,sConn,nConn);
        SetLocalInt(oPC,ARSX_L_PLAYER,sData.nPlayer );
        SetLocalInt(oPC,ARSX_L_PC,sData.nPC);
     }
}


void ARSX_OnRest(object oPC)
{


    struct ar_connection_log sData;  // create our connection data structure

    object oStorer = ARSX_LOCAL();

    int nPC = GetLocalInt(oStorer,ARSX_L_PC + GetName(oPC));      // local stored pc index
    int nPlayer = GetLocalInt(oStorer,ARSX_L_PLAYER + GetPCPlayerName(oPC));  // local Player index
    string sUID = GetPCPlayerName(oPC) + "_" + GetName(oPC);

    string sConn = ARSX_L_CONNECTION + sUID;
    int nConn = GetLocalInt(oStorer, sConn);  // get the local stored connection index
    string sLoc = APSLocationToString(GetLocation(oPC));

    if(sLoc=="")sLoc = "#ERROR##ERROR##ERROR##ERROR##ERROR#";

        sData.nID = nConn;
        sData.nPlayer = nPlayer;
        sData.nPC =nPC;
        sData.sInboundConnection = SQL_NULL;
        sData.sOutboundConnection = SQL_NOW;
        sData.sLastLocation = sLoc;
        sData.bDM = GetIsDM(oPC);
        sData.sIP = GetPCIPAddress(oPC);
        sData.sTable = ARSX_CONLOG;
        int nUpdated = ARSX_LogConnection(sData);

        if(nUpdated == ARSX_LOCATION_STORED){
            FloatingTextStringOnCreature("Location Saved",oPC);}

}

//Inititalizes the database and grooms the log table
void ARSX_INIT()
{
    string sCleanConnectionLog = "DELETE FROM ar_connection_log WHERE sLocation IS NULL " +
              " AND sOutboundConnection IS NULL AND " +
              "sInboundConnection < CURRENT_DATE;";

SendMessageToAllDMs("ARSX-Loading...........");
SQLExecDirect(sCleanConnectionLog);
SendMessageToAllDMs("............ARSX-Loaded");

}


// updates the ar_area_index
// return on error is ARSX_AREA_NOT_FOUND
int ARSX_IndexArea(object oArea)
{
        string sSelect;
        string sInsert;
        int nReturn=ARSX_AREA_NOT_FOUND;
        string sResRef=GetResRef(oArea);
        string sDescription=SQLEncodeSpecialChars(GetName(oArea));

      sSelect = "SELECT nIndex FROM " + ARSX_AREA_INDEX +
                " WHERE sResRef='" + sResRef +
                 "';";

     sInsert = "INSERT INTO " + ARSX_AREA_INDEX +
                "(sResRef,sDescription) VALUES (" +
                "'" + sResRef +
                "','" + sDescription +
                "');";

        SQLExecDirect(sSelect);
        // If existing
        if (SQLFetch() == SQL_SUCCESS)
            {
            nReturn = StringToInt(SQLGetData(1));
            }
       // not There so we add it
      else
            {
            SQLExecDirect(sInsert);
            SQLExecDirect(sSelect);

                if (SQLFetch() == SQL_SUCCESS)
                    {
                    nReturn = StringToInt(SQLGetData(1));
                    }
            }

            return nReturn;
 }

// updates the ar_creature_index useing sData
int ARSX_IndexCreature(object oCreature)
{
    struct  ar_creature_index sData;

     sData.sResRef=GetResRef(oCreature);
     sData.sDescription=SQLEncodeSpecialChars(GetName(oCreature));
     sData.sCommonName=SQLEncodeSpecialChars(GetName(oCreature));
     sData.nCRValue=FloatToInt(GetChallengeRating(oCreature));
     sData.nRace= ARSX_GetRace(oCreature);
     sData.bPlotFlag=GetPlotFlag(oCreature);

     int nReturn=ARSX_CREATURE_CREATE_ERROR;

    string sSelect = "SELECT nIndex FROM " + ARSX_CREATURE_INDEX +
                     " WHERE sResRef='" + sData.sResRef + "';";

    string sInsert = "INSERT INTO "  + ARSX_CREATURE_INDEX +
                     "(sResRef,sDescription,sCommonName,nCRValue,nRace,bPlotFlag) VALUES('" +
                      sData.sResRef + "','" +
                      sData.sDescription + "','" +
                      sData.sCommonName + "'," +
                      IntToString(sData.nCRValue) + "," +
                      IntToString(sData.nRace) + "," +
                      IntToString(sData.bPlotFlag) + ");";
            SQLExecDirect(sSelect);
        // If existing
        if (SQLFetch() == SQL_SUCCESS)
            {
            nReturn = StringToInt(SQLGetData(1));
            }
       // not There so we add it
      else
            {
            SQLExecDirect(sInsert);
            SQLExecDirect(sSelect);

                if (SQLFetch() == SQL_SUCCESS)
                    {
                    nReturn = StringToInt(SQLGetData(1));
                    }
            }

            return nReturn;

}

//logs the pc death.
int ARSX_LogPCDeath(object oPC, object oKiller)
{
    int nReturn=ARSX_LOG_ERROR_PCDEATH;
    string sSelect,sInsert;
    int nPC,bKilledByPC,bKilledByCreature,nArea,nKiller,nItem;
    string sTimeOfDeath = SQL_NOW;

        nPC = ARSX_GetPC(oPC,ARSX_GetPlayer(oPC));
        nArea = ARSX_IndexArea(GetArea(oPC));
        object oItem = GetLastWeaponUsed(oKiller);
        nItem =ARSX_IndexItem(oItem);

      if(!GetIsPC(oKiller))
       {
       nKiller = ARSX_IndexCreature(oKiller);
       bKilledByCreature=TRUE;
       }

      if(GetIsPC(oKiller))
      {
      bKilledByPC = TRUE;
      nKiller = ARSX_GetPC(oKiller,ARSX_GetPlayer(oKiller));
      bKilledByCreature=FALSE;
      }

     sInsert = "INSERT INTO " + ARSX_PC_DEATH_INDEX +
            "(nPC,nKiller,bPCKill,bCreatureKill,nArea,nItem,sTimeStamp) VALUES(" +
            IntToString(nPC) + "," +
            IntToString(nKiller) + "," +
            IntToString(bKilledByPC) + "," +
            IntToString(bKilledByCreature) + "," +
            IntToString(nArea) + "," +
            IntToString(nItem) + "," +
            sTimeOfDeath + ");";

    SQLExecDirect(sInsert);

    return ARSX_LOG_PCDEATH;
}

//logs the kill and returns the entry # for use.
//
int ARSX_LogCreatureDeath(object oDead, object oKiller)
{
    int nReturn=ARSX_LOG_ERROR_CRDEATH;
    string sInsert;
    int nPC,nCreature,nArea,nXpValue,nGoldValue,nItem;
    string sTimeOfDeath = SQL_NOW;

         nPC = ARSX_GetPC(oKiller,ARSX_GetPlayer(oKiller));
         nCreature = ARSX_IndexCreature(oDead);
         nArea = ARSX_IndexArea(GetArea(oKiller));
         nXpValue =  ARSX_GetXP(oKiller, oDead);
         nGoldValue =  ARSX_GetGoldValue(oKiller,oDead);
         //limited need upgrades here
        object oItem = GetLastWeaponUsed(oKiller);
        nItem =ARSX_IndexItem(oItem);

     sInsert = "INSERT INTO " + ARSX_CREATURE_DEATHS +
            "(nPC,nCreature,nArea,nXpValue,nGoldValue,nItem,sTimeStamp) VALUES(" +
            IntToString(nPC) + "," +
            IntToString(nCreature) + "," +
            IntToString(nArea) + "," +
            IntToString(nXpValue) + "," +
            IntToString(nGoldValue) + "," +
            IntToString(nItem) + "," +
            sTimeOfDeath + ");";
    SQLExecDirect(sInsert);

    return ARSX_LOG_CRDEATH;
}



//logs the kill and returns the status response
//
int ARSX_LogKill(object oDead, object oKiller)
{
    int nReturn=ARSX_LOG_ERROR_PCKILL;
    string sSelect,sInsert;
    int nDeadPC,nDeadCR,nPCKiller,nCRKiller;

    //Killer is acually the master of oKiller in case of summon or familiars
    if(GetIsObjectValid(GetMaster(oKiller)))oKiller = GetMaster(oKiller);

    //pc was killed
    if(GetIsPC(oDead))nDeadPC = TRUE;
    //creature killed
    if(GetObjectType(oDead)==OBJECT_TYPE_CREATURE)nDeadCR = TRUE;
    if(GetIsPC(oKiller))nPCKiller=TRUE;
    if(GetObjectType(oKiller)==OBJECT_TYPE_CREATURE)nCRKiller=TRUE;

    if(nDeadPC)
        {
          nReturn= ARSX_LogPCDeath(oDead,oKiller);
        }
    else if(nDeadCR)
        {
        nReturn= ARSX_LogCreatureDeath(oDead,oKiller);
        }


    return nReturn;
}


int ARSX_GetXP(object oPlayer,object oCreature)
{
    //Get the area the kill was made in
    object oArea = GetArea(oCreature);
    //Initialize the amount of players in a party
    int nMembers = 0;
    //Determine how many members of the party are in that area
    object oPartyMember = GetFirstFactionMember(oPlayer);
    int AwardXP=0;

    if(GetIsObjectValid(oPartyMember))
    {
        while(GetIsObjectValid(oPartyMember))
        {
            if((GetArea(oPartyMember) == oArea) && (GetIsPC(oPartyMember)))
                nMembers++;
            oPartyMember = GetNextFactionMember(oPlayer);
        }

        //Get the hit dice of the monster
        int nMRating = GetHitDice(oCreature);
        //Get the hit dice of the killer
        int nPRating = AR_GetECL(oPlayer);//GetHitDice(oPlayer);

        if(nPRating == 0)
        {
            nMRating = 0;
            nPRating = 1;
        }


        //Initialize a default amount of experience
        int nXP = (100 + (nMRating * 5));
        if((nMRating - nPRating) < -6)
        {
            nXP = 0;
        }

        //Modify the experience
        nXP = ((nXP * nMRating) / nPRating);
        AwardXP = nXP;

        //Start exp loop
        oPartyMember = GetFirstFactionMember(oPlayer);
        if(GetIsObjectValid(oPartyMember))
        {
            //Initialize a variable for the loop to determine the party members challenge rating
            int nPartyRating;
            int nXPTemp = 0;
            //Loop baby
            while (GetIsObjectValid(oPartyMember))
            {
                if((GetArea(oPartyMember) == oArea) && (GetIsPC(oPartyMember)))
                {
                /// AREA if
                    nPartyRating = AR_GetECL(oPartyMember);
                    if(nPRating >= nPartyRating)
                    {
                        if((nPRating - nPartyRating) > 6)
                            nXPTemp = 0;
                        else
                            nXPTemp = ((nXP * nPartyRating) / nPRating);
                    }
                    else
                    {
                        if((nPartyRating - nPRating) > 6)
                            nXPTemp = 0;
                        else
                        {
                            if(nPartyRating == 0)
                            {
                                nPartyRating = 1;
                                nXP = 0;
                            }
                            nXPTemp = ((nXP * nPRating) / nPartyRating);
                        }
                    }
                    //if(nPRating >= nPartyRating)

                    if((nMRating - nPartyRating) < -6)
                    {
                        nXPTemp = 0;
                    }
                   
                    if(nXPTemp > AwardXP)
                    {
                     AwardXP = nXPTemp;
                    }
                }
                oPartyMember = GetNextFactionMember(oPlayer);
            }

        }
    }
   return AwardXP;
}

int ARSX_GetGoldValue(object oPlayer,object oCreature)
{
//Get the area the kill was made in
    object oArea = GetArea(oCreature);
    //Initialize the amount of players in a party
    int nMembers = 0;
    //Determine how many members of the party are in that area
    object oPartyMember = GetFirstFactionMember(oPlayer);
    int nGold;

    if(GetIsObjectValid(oPartyMember))
    {
        while(GetIsObjectValid(oPartyMember))
        {
            if((GetArea(oPartyMember) == oArea) && (GetIsPC(oPartyMember)))
                nMembers++;
            oPartyMember = GetNextFactionMember(oPlayer);
        }

        //Get the hit dice of the monster
        int nMRating = GetHitDice(OBJECT_SELF);
        //Get the hit dice of the killer
        int nPRating = AR_GetECL(oPlayer);//GetHitDice(oPlayer);
        if(nPRating == 0)
        {
            nMRating = 0;
            nPRating = 1;
        }

        //Get an amount of gold in relation to the challenge rating of the monster
        nGold = d4(nMRating);
        //These monster types don't have gold
        if(GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_ANIMAL ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_BEAST ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_CONSTRUCT ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_ELEMENTAL ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_ABERRATION ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_MAGICAL_BEAST ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_OUTSIDER ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_UNDEAD ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_PLANT ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_OOZE ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_VERMIN)
        {
            nGold = 0;
        }
        else
        {
            //Split the gold among the party members in the area
            if (nMembers == 0)
                nGold /= 1;
            else
                nGold /= nMembers;
        }
    }

return nGold;
}

int AR_GetECL(object oPC)
{
  int iLevel = GetHitDice(oPC);

  if(iLevel > MAXIMUM_PLAYER_LEVEL)
  {
     iLevel = MAXIMUM_PLAYER_LEVEL;
  }
  
  if(iLevel < 0)
  {
     iLevel = 0;
  }
  return iLevel;
}


int ARSX_IndexItem(object oItem)
{
    struct ar_item_index sData;

    sData.sResRef =GetResRef(oItem);
    sData.sDescription="NOT_IMPLEMETED_YET";//GetDescription_(oItem);
    sData.nGoldValue=GetGoldPieceValue(oItem);
    sData.nType=GetBaseItemType(oItem);
    sData.sName = SQLEncodeSpecialChars(GetName(oItem));

    int nReturn=ARSX_ITEM_CREATE_ERROR;

    string sSelect = "SELECT nIndex FROM " + ARSX_ITEM_INDEX +
                     " WHERE sResRef='" + sData.sResRef + "';";

    string sInsert = "INSERT INTO "  + ARSX_ITEM_INDEX +
                     "(sResRef,sDescription,sName,nGoldValue,nType) VALUES('" +
                      sData.sResRef + "','" +
                      sData.sDescription + "','" +
                      sData.sName + "'," +
                      IntToString(sData.nGoldValue) + "," +
                      IntToString(sData.nType) + ");";

            SQLExecDirect(sSelect);
        // If existing
        if (SQLFetch() == SQL_SUCCESS)
            {
            nReturn = StringToInt(SQLGetData(1));
            }
       // not There so we add it
      else
            {
            SQLExecDirect(sInsert);
            SQLExecDirect(sSelect);

                if (SQLFetch() == SQL_SUCCESS)
                    {
                    nReturn = StringToInt(SQLGetData(1));
                    ARSX_IndexItemProperty(oItem, nReturn);
                    }
            }

      return nReturn;
}

//logs the item Property of nItem
int ARSX_IndexItemProperty(object oItem, int nItem)
{
itemproperty ip;
int nSubType,nType,nParam1,nParam1Value,nCostTable,nCostTableValue;
string sSQL;

 // lay our hands on the first prop
 ip = GetFirstItemProperty(oItem);


// start the recurse
 while (GetIsItemPropertyValid(ip))
 {
    // get our values
    nType = GetItemPropertyType(ip);
    nSubType = GetItemPropertySubType(ip);
    nParam1 = GetItemPropertyParam1(ip);
    nParam1Value = GetItemPropertyParam1Value(ip);
    nCostTable = GetItemPropertyCostTable(ip);
    nCostTableValue = GetItemPropertyCostTableValue(ip);

    //SQL ;)
    sSQL= "INSERT INTO "  + ARSX_ITEMPROP_INDEX +
                     "(nItem,nType,nSubType,nParam1,nParam1Value,nCostTable,nCostTableValue) VALUES(" +
                      IntToString(nItem) + "," +
                      IntToString(nType) + "," +
                      IntToString(nSubType) + "," +
                      IntToString(nParam1) + "," +
                      IntToString(nParam1Value) + "," +
                      IntToString(nCostTable) + "," +
                      IntToString(nCostTableValue) + ");";

    // cast the data
    SQLExecDirect(sSQL);

    //try the next Prop if any
    ip = GetNextItemProperty(oItem);
  }
  //done
  return nItem;
}



/*
// updates the ar_arena_kills_index useing sData
void ARSX_IndexArenaKill(struct ar_arena_kills_index sData)
{
    string sSql;
    string sTable = sData.sTable;


}



// updates the ar_pc_bounty useing sData
void ARSX_IndexBounty(struct ar_pc_bounty sData)
{
    string sSql;
    string sTable = sData.sTable;


}


// updates the ar_pc_quests useing sData
void ARSX_IndexPCQuest(struct ar_pc_quests sData)
{
    string sSql;
    string sTable = sData.sTable;


}



// updates the ar_player_storage useing sData
void ARSX_IndexPCStorage(struct ar_player_storage sData)
{
    string sSql;
    string sTable = sData.sTable;


}

// updates the ar_quest_index useing sData
void ARSX_IndexQuest(struct ar_quest_index sData)
{
    string sSql;
    string sTable = sData.sTable;


}
*/
//------------------------------------------------------------------------------
// void main(){}

