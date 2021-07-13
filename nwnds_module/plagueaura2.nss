#include "NW_I0_SPELLS"
void DoStrDamage(object oTarget)
{
    effect eStr = EffectAbilityDecrease(ABILITY_STRENGTH,d6());
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eStr,oTarget);
}

void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();

    effect eNaus = EffectDazed();
    effect eVis2 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    eNaus = EffectLinkEffects(eNaus,eVis2);
    eNaus = EffectLinkEffects(eNaus,eDur);

    effect eVis = EffectVisualEffect(VFX_IMP_DAZED_S);

    object oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        if(GetIsEnemy(oTarget, oCaster))
        {
            int nRace = GetRacialType(oTarget);
            if ((  nRace == RACIAL_TYPE_CONSTRUCT ) || ( nRace == RACIAL_TYPE_ELEMENTAL )
                || ( nRace == RACIAL_TYPE_UNDEAD ))
                break;
            if (!MySavingThrow(SAVING_THROW_FORT, oTarget, 15, SAVING_THROW_TYPE_NONE,oCaster))
            {

                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eNaus,oTarget,RoundsToSeconds(1));
                DelayCommand(0.1,DoStrDamage(oTarget));
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
            }
        }
    oTarget = GetNextInPersistentObject();
    }
}
