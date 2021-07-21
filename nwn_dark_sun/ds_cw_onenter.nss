void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC))
        SetLocalInt(OBJECT_SELF, "PCIsInArea", GetLocalInt(OBJECT_SELF, "PCIsInArea") + 1);
}
