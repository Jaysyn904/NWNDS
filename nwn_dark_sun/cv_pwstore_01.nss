//::///////////////////////////////////////////////
//:: PW Merchant Spawn System
//:: CV_PWStore_01.nss
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Grabs a storename rezref from the calling NPC
    (STORE_NAME string "STORE_NPCNAME"), checks
    area INT VAR to see if store has been spawned.

    Yes: Opens existing store with rezref of
        "STORE_NAME".

    No: Spawns store with rezref of "STORE_NAME"
        & sets an area INT VAR so we aren't
        constantly overwriting the existing store.

*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: January 23 2012
//:://////////////////////////////////////////////

#include "x0_i0_position"

void main()
{
    object oMerchant = OBJECT_SELF;
    object oBuyer = GetPCSpeaker();
    object oModule = GetModule();
    object oArea = GetArea(oMerchant);

    location lMerchant = GetLocation(oMerchant);
    location lBuyer = GetLocation(oBuyer);
    location lStore = GetAheadLocation(oMerchant);

    string sModule = GetModuleName();
    string sAreaName = GetName(oArea, FALSE);
    string sAreaRezRef =GetStringLowerCase(GetResRef(oArea));
    string sBuyerName = GetName(oBuyer, FALSE);
    string sMerchantName = GetName(oMerchant, FALSE);
    string sMerchantRezRef = GetResRef(oMerchant);
    string sStoreName = GetLocalString(oMerchant, "STORE_NAME");
    string sSpawn = "Spawned";
    string sAreaVar = InsertString(sSpawn, sStoreName, 0);

//::  Debug Stuff
/*  SpeakString("Script Fired");
    SpeakString("PC Name is: "+sBuyerName);
    SpeakString("Module Name is: "+sModule);
    SpeakString("Area Name is: "+sAreaName);
    SpeakString("Area RezRef is: "+sAreaRezRef);
    SpeakString("Area VAR name is: "+sAreaVar);
    SpeakString("Merchant Name is: "+sMerchantName);
    SpeakString("Merchant RezRef is: "+sMerchantRezRef);
    SpeakString("Store RezRef is: "+sStoreName);
*/

    if(!GetLocalInt(oArea, sAreaVar)) // See if the INT VAR is FALSE
        {
            //:: If not, create the store.
            CreateObject(OBJECT_TYPE_STORE, sStoreName, lStore);
            //:: Make INT VAR TRUE so we know the spawn has occured.
            SetLocalInt(oArea, sAreaVar, TRUE);
            //:: SpeakString("Shop has been spawned");
        }

    else
        {
            //:: SpeakString("Shop exists");
        }

    object oStore = GetNearestObjectByTag(sStoreName, OBJECT_SELF);

    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        {
            //:: Open store for PC in conversation.
            DelayCommand(1.0, OpenStore(oStore, oBuyer));
        }

    else
        {
            ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
        }

}
