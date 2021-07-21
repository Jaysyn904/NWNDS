//::///////////////////////////////////////////////
//:: Default On Blocked
//:: re_common_blkd
//:: Copyright (c) 2001 Bioware Corp.
//   modifications by Carlo
//:://////////////////////////////////////////////
/*
    This will cause blocked creatures to open
    doors, or failing that clear their action queue.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////
void main()
{
    object oDoor = GetBlockingDoor();
    // * Increment number of times blocked
    SetLocalInt(OBJECT_SELF, "X2_NUMTIMES_BLOCKED", GetLocalInt(OBJECT_SELF, "X2_NUMTIMES_BLOCKED") + 1);
    if (GetLocalInt(OBJECT_SELF, "X2_NUMTIMES_BLOCKED") > 1)
      {
         SetLocalInt(OBJECT_SELF, "X2_NUMTIMES_BLOCKED",0);
         ClearAllActions();
      }
    if(GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) >= 5)
    {
        if(GetIsDoorActionPossible(oDoor, DOOR_ACTION_OPEN) && GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) >= 7 )
        {
            DoDoorAction(oDoor, DOOR_ACTION_OPEN);
        }
    }
}
