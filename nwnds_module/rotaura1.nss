#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();
    effect eNaus = EffectDazed();
    effect eVis = EffectVisualEffect(VFX_IMP_DISEASE_S);
    effect eVis2 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
    effect eVis3 = EffectVisualEffect(VFX_IMP_HEALING_S);
    effect eHeal = EffectHeal(5);
    object oTarget = GetEnteringObject();
    int nRace = GetRacialType(oTarget);
    if ((  nRace == RACIAL_TYPE_CONSTRUCT ) || ( nRace == RACIAL_TYPE_ELEMENTAL )
        || ( nRace == RACIAL_TYPE_UNDEAD ))
        return;
/*    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_DISEASE ) )
    {
        eVis = EffectVisualEffect(VFX_IMP_FORTITUDE_SAVING_THROW_USE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
        return;
    }*/
    if(GetIsEnemy(oTarget, oCaster))
    {
        int nDam = d6(5);
        nDam = GetReflexAdjustedDamage(nDam, oTarget, 24, SAVING_THROW_TYPE_NONE, oCaster);
        if ( nDam > 0 )
        {
            effect eDam = EffectDamage(nDam);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
            if (!MySavingThrow(SAVING_THROW_WILL, oTarget, 24, SAVING_THROW_TYPE_NONE,oCaster))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eNaus,oTarget,RoundsToSeconds(1));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis2,oTarget,RoundsToSeconds(1));
            }
            int nFlag = GetLocalInt(oCaster,"AURA_STATE");
            if ( nFlag == 0 )
            {
                SetLocalInt(oCaster,"AURA_STATE",1);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oCaster);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oCaster);
            }
        }
    }
}
