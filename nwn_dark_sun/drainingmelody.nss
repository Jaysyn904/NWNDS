void main()
{
    //Set and apply AOE object
    effect eVis = EffectVisualEffect(VFX_DUR_INVISIBILITY);
    eVis = SupernaturalEffect(eVis);
    eVis = ExtraordinaryEffect(eVis);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);

    effect eAOE = EffectAreaOfEffect(AOE_MOB_DRAGON_FEAR,"melody1","melody2","melody3");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAOE, OBJECT_SELF, HoursToSeconds(100));
}
