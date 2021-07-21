//::///////////////////////////////////////////////
//:: Name: AT_SStoDG_001
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Set's PC ceramic amount as a local INT VAR &
    them moves the PC to the location defined in
    the Door's destination.
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: June 18 2012
//:://////////////////////////////////////////////

void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);  
  int iCeramic = GetGold(oClicker);
  
  SetLocalInt(oClicker, "goldamount", iCeramic);  

  AssignCommand(oClicker,JumpToLocation(lLoc));
  
}
