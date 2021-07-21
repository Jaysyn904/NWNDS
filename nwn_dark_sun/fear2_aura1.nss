#include "NW_I0_SPELLS"

void main()
{
    object oTarget = GetEnteringObject();
    object oCaster = GetAreaOfEffectCreator();

    int nLevel = GetHitDice(oCaster);
    int nDC = 10 + nLevel / 2 + GetAbilityModifier(ABILITY_CHARISMA,oCaster);


    if ( nLevel > 20 )
        nLevel = 20;

    float fDuration = RoundsToSeconds(d4());

    if ( !GetIsEnemy(oTarget,oCaster) || oTarget == oCaster )
        return;

    effect eFear = EffectParalyze();
    effect eImp = EffectVisualEffect(VFX_IMP_FEAR_S);
    effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eFear,eVis);
    eLink = EffectLinkEffects(eLink,eDur);


    if ( !MySavingThrow(SAVING_THROW_WILL,oTarget,nDC,SAVING_THROW_TYPE_FEAR,oCaster) )
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eImp,oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink,oTarget,fDuration);
    }
}
