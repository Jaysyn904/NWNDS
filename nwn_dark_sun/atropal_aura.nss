void main()
{
    //Set and apply AOE object
    effect eAOE = EffectAreaOfEffect(AOE_MOB_CIRCGOOD,"atropal_aura1","atropal_aura2","atropal_aura3");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAOE, OBJECT_SELF, HoursToSeconds(100));
}
