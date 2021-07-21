#include "NW_I0_SPELLS"

void main()
{
    object oTarget = GetEnteringObject();
    object oCaster = GetAreaOfEffectCreator();

    int nLevel = GetHitDice(oCaster);
    int nDC = 10 + nLevel / 2 + GetAbilityModifier(ABILITY_CHARISMA,oCaster);


    if ( nLevel > 20 )
        nLevel = 20;

    float fDuration = HoursToSeconds(nLevel);

    if ( !GetIsEnemy(oTarget,oCaster) || oTarget == oCaster )
        return;

    effect eCharm = EffectCharmed();
    effect eImp = EffectVisualEffect(VFX_IMP_CHARM);
    effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DOMINATED);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eCharm,eVis);
    eLink = EffectLinkEffects(eLink,eDur);


    if ( !MySavingThrow(SAVING_THROW_WILL,oTarget,nDC,SAVING_THROW_TYPE_MIND_SPELLS,oCaster) )
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eImp,oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink,oTarget,fDuration);
    }
}
