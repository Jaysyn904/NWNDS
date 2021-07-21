//::///////////////////////////////////////////////
//:: Trap door that takes you to a waypoint that
//:: is stored into the Destination local string.
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Robert Babiak
//:: Created On: June 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oidUser;
    object oidDest;
    string sDest;

    if (!GetLocked(OBJECT_SELF) )
    {
        if ( GetIsOpen(OBJECT_SELF))
        {
            sDest = GetLocalString( OBJECT_SELF, "Destination" );

            oidUser = GetLastUsedBy();
            oidDest = GetObjectByTag(sDest);

            AssignCommand(oidUser, ActionJumpToObject(oidDest,FALSE));
            PlayAnimation(ANIMATION_PLACEABLE_CLOSE );
        } else
        {
            PlayAnimation(ANIMATION_PLACEABLE_OPEN );
        }
    } else
    {
    //    ActionUseSkill
    }

}
