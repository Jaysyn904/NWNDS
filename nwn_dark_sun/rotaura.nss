void main()
{
//    object oPC = GetFirstPC();
//    SendMessageToPC(oPC,"Running rotaura OBJECT_SELF = " + GetName(OBJECT_SELF));

    //Set and apply AOE object
    effect eAOE = EffectAreaOfEffect(AOE_PER_GREASE,"rotaura1","rotaura3","rotaura2");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAOE, OBJECT_SELF, HoursToSeconds(100));
}
