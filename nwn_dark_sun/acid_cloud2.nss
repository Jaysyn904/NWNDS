void main()
{
    effect eAcid;
    effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);

    object oCaster = GetAreaOfEffectCreator();

    object oTarget = GetFirstInPersistentObject();

    while ( GetIsObjectValid(oTarget ) )
    {
        if ( GetIsEnemy(oTarget,oCaster) )
        {
            eAcid = EffectDamage(d6(6),DAMAGE_TYPE_ACID);

            ApplyEffectToObject(DURATION_TYPE_INSTANT,eAcid,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
        }
        oTarget = GetNextInPersistentObject();
    }
}
