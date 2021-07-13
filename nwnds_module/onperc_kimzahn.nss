//::///////////////////////////////////////////////
//:: Name: OnPerc_Kimzahn
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Kimzahn's On Perception script
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: February 18 2012
//:://////////////////////////////////////////////


void main()
{
    ExecuteScript("prc_npc_percep", OBJECT_SELF);
    ExecuteScript("nw_c2_default2", OBJECT_SELF);

    object oSeen = GetLastPerceived();
    int nCount2 = GetLocalInt(OBJECT_SELF,"SaidMyLine2");

    nCount2 ++;
    if (nCount2==1)
    {
        if (GetIsPC(oSeen))
        {
            ActionSpeakString("I don't know who you are but I will not allow you to prevent me from destroying this vile Orb!");
            SetLocalInt(OBJECT_SELF,"SaidMyLine2",nCount2);
            ActionWait(3.5);
            ActionSpeakString("");
        }
    }
}
