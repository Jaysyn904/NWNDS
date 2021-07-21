// Script by: Nyadarus
// Created:   September 2003
// Used in:   The Hermit Quest
// Purpose:   To send the PC from the portal in The Pit of Fire to the
//            waypoint outside The Citadel in The Barrens.

void main()
{
    object oPC = GetLastUsedBy();
    object oDest = GetObjectByTag("DS_citadelportalexit");
    if(GetIsPC(oPC))
    {
    AssignCommand(oPC,JumpToObject(oDest));
    }
}
