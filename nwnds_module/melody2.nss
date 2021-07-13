#include "NW_I0_SPELLS"
#include "NW_I0_GENERIC"
void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();

    effect eImp = EffectVisualEffect(VFX_IMP_DAZED_S);

    effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    effect eDaze = EffectDazed();
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eDaze,eVis);
    eLink = EffectLinkEffects(eLink,eDur);

    effect eVis2 = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eDur2 = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);

    int nDrain;
    effect eDrain;
    effect eLink2;
    effect eHealing;

    effect eVis3 = EffectVisualEffect(VFX_IMP_HEALING_S);

    object oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        if(GetIsEnemy(oTarget, oCaster))
        {
            if ( GetHasEffect(EFFECT_TYPE_DAZED,oTarget) )
            {
                if ( !MySavingThrow(SAVING_THROW_WILL,oTarget,18,SAVING_THROW_TYPE_MIND_SPELLS,oCaster) )
                {
                    nDrain = d2();
                    eDrain = EffectNegativeLevel(nDrain);

                    eLink2 = EffectLinkEffects(eDrain,eDur);
                    eLink2 = SupernaturalEffect(eLink2);
                    eHealing = EffectHeal(nDrain * 5);

                    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eLink2,oTarget);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oTarget);
                    if ( !GetIsImmune(oTarget,IMMUNITY_TYPE_NEGATIVE_LEVEL) )
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT,eHealing,oCaster);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oCaster);
                    }
                }
            }
            else
            {
                if ( !MySavingThrow(SAVING_THROW_WILL,oTarget,18,SAVING_THROW_TYPE_MIND_SPELLS,oCaster) )
                {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink,oTarget,RoundsToSeconds(10));
                }
            }
        }
    oTarget = GetNextInPersistentObject();
    }
}
