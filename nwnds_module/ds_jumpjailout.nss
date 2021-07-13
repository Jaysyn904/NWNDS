//::///////////////////////////////////////////////
//:: FileName ds_jumpjailout
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/8/02 7:26:12 PM
//:: Edited By: DM Heatstroke
//:: Edited On: 10/30/08 6:51 PM
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    //Set up faction variables
    object oPC = GetPCSpeaker();
    object oTyrian = GetObjectByTag("ATHAS_FACTION_TYR");
    object oUrikite = GetObjectByTag("ATHAS_FACTION_URIK");
    object oNoncombat = GetObjectByTag("ATHAS_FACTION_NONCOMBATANT");
    object oNeut1 = GetObjectByTag("ATHAS_FACTION_NEUTRAL1");
    object oNeut2 = GetObjectByTag("ATHAS_FACTION_NEUTRAL2");
    object oVA = GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE");
    object oDraqo = GetObjectByTag("ATHAS_FACTION_DRAQO");

    // Set the faction to like the player so they may leave jail safely.
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, 80);
    AdjustReputation(GetPCSpeaker(), oTyrian, 80);
    AdjustReputation(GetPCSpeaker(), oUrikite, 80);
    AdjustReputation(GetPCSpeaker(), oNoncombat, 80);
    AdjustReputation(GetPCSpeaker(), oNeut1, 80);
    AdjustReputation(GetPCSpeaker(), oNeut2, 80);
    AdjustReputation(GetPCSpeaker(), oVA, 80);
    AdjustReputation(GetPCSpeaker(), oDraqo, 80);

    // Set standard factions to like the player so they may leave jail safely.
    SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80);
    SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80);
    DetermineCombatRound(GetPCSpeaker());
    AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetObjectByTag("WP_JailOut"))));
}
