void main()
{
    //Set and apply AOE object
    effect eAOE = EffectAreaOfEffect(AOE_MOB_CIRCGOOD,"desecrating_aur1","desecrating_aur2","desecrating_aur3");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAOE, OBJECT_SELF, HoursToSeconds(100));
}
