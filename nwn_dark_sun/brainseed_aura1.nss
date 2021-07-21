#include "NW_I0_SPELLS"
#include "NW_I0_GENERIC"

void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();
    object oTarget = GetEnteringObject();
    int nDC = 11 + GetAbilityModifier(ABILITY_CONSTITUTION, oCaster);
    effect eImp = EffectVisualEffect(VFX_IMP_DAZED_S);

/*    effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    effect eDaze = EffectDazed();
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eDaze,eVis);
    eLink = EffectLinkEffects(eLink,eDur); */

    effect eVis2 = EffectVisualEffect(VFX_IMP_POISON_S);
    int nDrain = d8();
    effect eDrain = EffectDamage(nDrain);
    effect eDur2 = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink2 = EffectLinkEffects(eDrain,eDur2);
    eLink2 = SupernaturalEffect(eLink2);

    effect eHealing = EffectHeal(nDrain);
    effect eVis3 = EffectVisualEffect(VFX_IMP_HEALING_S);

    if(GetIsEnemy(oTarget, oCaster))
    {
        if ( !MySavingThrow(SAVING_THROW_FORT, oTarget, nDC, SAVING_THROW_TYPE_NONE, oCaster) )
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT,eLink2,oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eHealing,oCaster);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oCaster);
            }
        }
        else
        {
            if ( !MySavingThrow(SAVING_THROW_FORT, oTarget, nDC, SAVING_THROW_TYPE_NONE, oCaster) )
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink2,oTarget,RoundsToSeconds(10));
            }
        }
    }
