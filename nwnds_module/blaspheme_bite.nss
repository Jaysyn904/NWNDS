void DoStrDamage( object oTarget )
{
    int nDam = d6();
    effect eStr = EffectAbilityDecrease(ABILITY_STRENGTH, nDam);
    eStr = SupernaturalEffect(eStr);
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eStr,oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
}

void main()
{
    object oOrigin = OBJECT_SELF ;               // Where the spell came from
    object oTarget = GetSpellTargetObject();  // What the spell is aimed at
    int nAlign = GetAlignmentGoodEvil(oTarget);
    if ( nAlign == ALIGNMENT_EVIL )
        return;
    effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    effect eDaze = EffectDazed();
    effect eVis2 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eDaze,eVis2);
    eLink = EffectLinkEffects(eLink,eDur);

    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
//    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eStr,oTarget);
    DelayCommand(0.1, DoStrDamage(oTarget));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink,oTarget,RoundsToSeconds(1));
}
