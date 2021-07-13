int IsColdSubType( object oTarget )
{
    object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR,oTarget);

    if ( !GetIsObjectValid( oHide ) )
        return FALSE;

    int bCold = FALSE;
    int bFire = FALSE;
    int nIPType;
    int nIPSubType;

    itemproperty ipIP = GetFirstItemProperty(oHide);

    while ( GetIsItemPropertyValid(ipIP) )
    {
        nIPType =  GetItemPropertyType(ipIP);
        nIPSubType = GetItemPropertySubType(ipIP);
        if ( nIPType == ITEM_PROPERTY_DAMAGE_VULNERABILITY &&
             nIPSubType == 10 ) // fire vuln
            bFire = TRUE;
        if ( nIPType == ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE &&
             nIPSubType == 7 ) // cold immunity
            bCold = TRUE;

        if ( bFire && bCold )
            return TRUE;

        ipIP = GetNextItemProperty(oHide);
    }
    return FALSE;
}



void main()
{
    object oCaster = GetAreaOfEffectCreator();

    effect eCold;
    effect eVis = EffectVisualEffect(VFX_IMP_FROST_S);
    effect eRegen = EffectRegenerate(10,6.0);
    effect eTurn = EffectTurnResistanceIncrease(6);
    effect eVis2 = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);

    object oTarget = GetFirstInPersistentObject();
    while ( GetIsObjectValid(oTarget ) )
    {
        if ( oTarget != oCaster && !GetIsDead(oTarget) )
        {
            if ( GetIsEnemy(oTarget,oCaster))
            {
                eCold = EffectDamage(d10(2),DAMAGE_TYPE_COLD);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eCold,oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
            }
            if ( IsColdSubType(oTarget) )
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oTarget);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eRegen,oTarget,6.0);
                if ( GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD )
                {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eTurn,oTarget,6.0);
                }
            }
        }
        oTarget = GetNextInPersistentObject();
    }
}
