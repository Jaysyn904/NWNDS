void main()
{
    object oOrigin = OBJECT_SELF ;               // Where the spell came from
    object oTarget = GetSpellTargetObject();  // What the spell is aimed at

    int nRace = GetRacialType(oTarget);
    if ((  nRace == RACIAL_TYPE_CONSTRUCT ) || ( nRace == RACIAL_TYPE_ELEMENTAL )
        || ( nRace == RACIAL_TYPE_UNDEAD ))
        return;
    effect eVis = EffectVisualEffect(VFX_IMP_DISEASE_S);
    effect eVis2 = EffectVisualEffect(VFX_IMP_HEALING_S);
    int nDam = d6()+6;
    effect eRot = EffectDamage(nDam);
    effect eHeal = EffectHeal(5);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eRot,oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oOrigin);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oOrigin);
}
