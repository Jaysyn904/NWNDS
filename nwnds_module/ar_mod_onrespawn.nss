//::///////////////////////////////////////////////
//:: Generic On Pressed Respawn Button
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
// * June 1: moved RestoreEffects into plot include
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November
//:://////////////////////////////////////////////
//NC:EDIT
//ADD The Grey Respawn In This Script
//NC:EDIT
#include "nw_i0_plot"
#include "ar_inc_pcspawn"


const string TYR_JAIL = "WP_Jail";
const string URIK_JAIL = "WP_UrikJail";

string ChooseJail(string sDefenderTag);
void ApplyPenalty(object oDead);
void InformPlayer(string sMessage, object oCreature);

void main()
{
    object oRespawner = GetLastRespawnButtonPresser();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oRespawner);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oRespawner)), oRespawner);
    RemoveEffects(oRespawner);

    DeleteLocalInt(oRespawner, "bDeath");

    if ((GetLocalInt(oRespawner, "DefenderKill")) && (GetLocalInt(oRespawner, "IsUrikite")))
    {
        DeleteLocalInt(oRespawner, "DefenderKill");
        string sDefenderTag = GetLocalString(oRespawner,"DefenderTag");
        DeleteLocalInt(oRespawner, "DefenderTag");
        ApplyPenalty(oRespawner);
        InformPlayer("Your corpse has been carted back to Urik.", oRespawner);
        AssignCommand(oRespawner, ActionJumpToObject(GetWaypointByTag("WP_UrikRespawn")));

    }
    else {
    if ((GetLocalInt(oRespawner, "DefenderKill")) && (!GetLocalInt(oRespawner, "IsUrikite")))
    {
        DeleteLocalInt(oRespawner, "DefenderKill");
        string sDefenderTag = GetLocalString(oRespawner,"DefenderTag");
        DeleteLocalInt(oRespawner, "DefenderTag");
        ApplyPenalty(oRespawner);
        InformPlayer("You have woken up in jail!", oRespawner);
        AssignCommand(oRespawner,ActionJumpToLocation(GetLocation(GetWaypointByTag(ChooseJail(sDefenderTag)))));

    }
    else
    {
        //If not in the arena respawn at the Hospital
        if (GetTag(GetArea(oRespawner)) != "TYR_GS_ARENA")
        {
            ApplyPenalty(oRespawner);
            //NC:EDIT
            //go to the black will be added here
            //for furture referance.
            //AssignCommand(oRespawner,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_RESPAWN"))));
            //InformPlayer("You have passed on to the Grey", oRespawner);
            //NC:EDIT
            if (GetLocalInt(oRespawner, "IsUrikite"))
            {
            InformPlayer("Your badly beaten body has been dragged back to Urik.", oRespawner);
            AssignCommand(oRespawner, ActionJumpToObject(GetWaypointByTag("WP_UrikRespawn")));
            }
            else
            {
            InformPlayer("Your badly beaten body has been dragged back to civilization.", oRespawner);
            AssignCommand(oRespawner, ARSpawnPC(oRespawner,TRUE));
            }
            //ARSpawnPC(oRespawner,TRUE);
            //AssignCommand(oRespawner,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_RESPAWN"))));
        }
        //We're in the arena so respawn by the cots
        else
        {
            InformPlayer("The arena medics have healed you.", oRespawner);
            AssignCommand(oRespawner, ActionJumpToObject(GetWaypointByTag("WP_ARENASPAWN")));
        }
    }
}
}

// * Applies an XP penalty to the player respawning
void ApplyPenalty(object oDead)
{
    int nXP = GetXP(oDead);
    int nPenalty = 50 * GetHitDice(oDead);
    int nHD = GetHitDice(oDead);
    // * You can not lose a level with this respawning
    int nMin = ((nHD * (nHD - 1)) / 2) * 1000;

    int nNewXP = nXP - nPenalty;
    if (nNewXP < nMin)
       nNewXP = nMin;
    if (nXP != nNewXP)
        SetXP(oDead, nNewXP);
}

void InformPlayer(string sMessage, object oCreature)
{
    DelayCommand(3.0f, FloatingTextStringOnCreature(sMessage, oCreature, FALSE));
}


string ChooseJail(string sDefenderTag)
{
    if ((sDefenderTag == "npc_tyrguard001") ||	//	Tyr Guard
        (sDefenderTag == "npc_tyrguardcapt") ||	//	Tyr Guard Capt.
        (sDefenderTag == "npc_tyrtowncrier"))	// 	Tyr Town Crier
        return TYR_JAIL;

    if((sDefenderTag == "UrikiteGuard") ||
        (sDefenderTag == "UrikiteTemplar") ||
        (sDefenderTag == "MrHelpful"))
        return URIK_JAIL;

    return "WP_Jail";

}
