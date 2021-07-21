void main()
{
    // BedrollOnUsed.NSS
    // 7/01/02 Jesse Fox
    // TBP: in OnUsed event of bedroll placeable
    object oPC = GetLastUsedBy();

object oItemToTake;
oItemToTake = GetItemPossessedBy(oPC, "RedFactionHelm");
if(GetIsObjectValid(oItemToTake) != 0)  {
ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),oPC);
FloatingTextStringOnCreature("You have been killed in your sleep.",oPC,FALSE);
}
    if (GetDistanceBetween(oPC, OBJECT_SELF) < 2.8)
    {
        SetLocalObject(oPC, "inbed", OBJECT_SELF);
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, SetFacing(GetFacing(OBJECT_SELF)));
        AssignCommand(oPC, ActionRest());
        DelayCommand(20.0,DeleteLocalObject(oPC, "inbed"));
    }
    else
        FloatingTextStringOnCreature("You are too far away.",oPC,FALSE);
}

