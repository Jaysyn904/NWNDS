//::///////////////////////////////////////////////
//:: Name x2_def_ondamage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDamaged script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
  #include "nw_i0_generic"

void main()
{
    //--------------------------------------------------------------------------
    // GZ: 2003-10-16
    // Make Plot Creatures Ignore Attacks
    //--------------------------------------------------------------------------
    if (GetPlotFlag(OBJECT_SELF))
    {
        return;
    }

    //--------------------------------------------------------------------------
    // Execute old NWN default AI code
    //--------------------------------------------------------------------------
    ExecuteScript("nw_c2_default6", OBJECT_SELF);

{

{
    object oSpawn;
    object oSelf = OBJECT_SELF;

    // Get the creature who triggered this event.
    object oPC = GetLastHostileActor();

    // Only fire once.
    if ( GetLocalInt(OBJECT_SELF, "DO_ONCE") )
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", TRUE);

    // Have us say something.
    SpeakString("GUARDS, COME QUICK!");

    // Spawn some critters.

    oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "NPC_SS_GUARD001", GetLocation(oSelf));
    AssignCommand(oSpawn, DetermineCombatRound(oPC));

    oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "NPC_SS_GUARD001", GetLocation(oSelf));
    AssignCommand(oSpawn, DetermineCombatRound(oPC));
}
}
}
