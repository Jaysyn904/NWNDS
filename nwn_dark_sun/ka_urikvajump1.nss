string sDeny;
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYurikva");

if (nInt == 3)
   {
   sDeny="The Templar Commander seems to be out on business at the moment.";

   SendMessageToPC(oPC, sDeny);

   return;
   }

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("WP_KRONOSQUEST");

lTarget = GetLocation(oTarget);

//only do the jump if the location is valid.
//though not flawless, we just check if it is in a valid area.
//the script will stop if the location isn't valid - meaning that
//nothing put after the teleport will fire either.
//the current location won't be stored, either

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());

AssignCommand(oPC, ActionJumpToLocation(lTarget));

}
