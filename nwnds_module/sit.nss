 void main()
{

object oPC = GetLastUsedBy();

//if (!GetIsPC(oPC)) return;

object oTarget;
oTarget = OBJECT_SELF;

AssignCommand(oPC, ActionSit(oTarget));

}

