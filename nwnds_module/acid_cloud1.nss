void main()
{
    object oTarget = GetEnteringObject();
    object oCaster = GetAreaOfEffectCreator();

    if ( !GetIsEnemy(oTarget,oCaster) || oTarget == oCaster )
        return;

    effect eAcid = EffectDamage(d6(6),DAMAGE_TYPE_ACID);
    effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);

    ApplyEffectToObject(DURATION_TYPE_INSTANT,eAcid,oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
}
