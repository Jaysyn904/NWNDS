//::///////////////////////////////////////////////
//:: Name: OnPerc_Grignar
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Grignar's On Perception script
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: March 12 2012
//:://////////////////////////////////////////////


void main()
{
    ExecuteScript("prc_npc_percep", OBJECT_SELF);
    ExecuteScript("nw_c2_default2", OBJECT_SELF);
    
    {
      
    object oPC = GetLastPerceived();
    if (!GetIsPC(oPC)) return;

    if (!GetLastPerceptionSeen()) return;
    
    int nInt;
    nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYjt_takeout");

    if (!(nInt < 2))
    return;

    ActionSpeakString("You! I can smell Belet and his miner filth on you! I shall feast on your bones and they shall starve!");

    }
}
