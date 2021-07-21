void main()
{
    // BedrollOnUsed.NSS
    // 7/01/02 Jesse Fox
    // TBP: in OnUsed event of bedroll placeable
    object oPC = GetLastUsedBy();
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

