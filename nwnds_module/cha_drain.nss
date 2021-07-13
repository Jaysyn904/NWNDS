#include "NW_I0_SPELLS"


void DoAbilityDamage(object oTarget, object oCaster)
{
    effect eImp = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eImp,oTarget);

    // Cha Damage
    int nDC = 10 + GetHitDice(oCaster) /2 + GetAbilityModifier(ABILITY_CHARISMA,oCaster);
    int nDam = 2;
    int nHeal = 10;

    int nType = ABILITY_CHARISMA;

    if ( MySavingThrow(SAVING_THROW_FORT,oTarget,nDC,SAVING_THROW_TYPE_NONE,oCaster) )
    {
        nDam = 1;
        nHeal = 5;
    }
    effect eDam = EffectAbilityDecrease(nType,nDam);
    eDam = SupernaturalEffect(eDam);
    eDam = ExtraordinaryEffect(eDam);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDam,oTarget);

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
        return;

    effect eHeal = EffectHeal(nHeal);
    effect eHealVis = EffectVisualEffect(VFX_IMP_HEALING_S);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oCaster);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eHealVis,oCaster);




}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

/*    int bIsPoisoned = GetLocalInt(oTarget,"IsPoisoned");
    if ( bIsPoisoned )
        return; */

    DelayCommand(0.1,DoAbilityDamage(oTarget,oCaster));

}
