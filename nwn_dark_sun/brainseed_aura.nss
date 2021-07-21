void main()
{
    //Set and apply AOE object
    effect eVis = EffectVisualEffect(VFX_DUR_INVISIBILITY);
    eVis = ExtraordinaryEffect(eVis);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);

    effect eAOE = EffectAreaOfEffect(AOE_MOB_DRAGON_FEAR,"brainseed_aura1","brainseed_aura2","brainseed_aura3");
    eAOE = ExtraordinaryEffect(eAOE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAOE, OBJECT_SELF, HoursToSeconds(100));
}
