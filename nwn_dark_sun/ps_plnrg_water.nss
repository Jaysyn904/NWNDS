/************************************
*   Summon Planar Energy (Water)    *
*                                   *
*   Cost: 16                        *
*   Power Score: Int                *
*                                   *
************************************/

#include "lib_psionic"


void Drown(object oTarget, object oPC)
{
    effect eVis=EffectVisualEffect(VFX_IMP_FROST_S);
    int nDamage=GetMaxHitPoints(oTarget)/4;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY);
    int nDC=14+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_INTELLIGENCE);

    if(nDamage<1) nDamage=1;

    if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC))
    {
        AssignCommand(oTarget, PlayAnimation(ANIMATION_FIREFORGET_SPASM));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage), oTarget);
        DelayCommand(6.0, Drown(oTarget, oPC));
    }
}

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE);
    object oTarget=GetSpellTargetObject();
    int nTargRace=GetRacialType(oTarget);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY)) return;

    if ( GetObjectType(oTarget)!=OBJECT_TYPE_CREATURE
        || nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD
        || nTargRace==RACIAL_TYPE_ELEMENTAL || nTargRace==RACIAL_TYPE_OOZE )
    {
        FloatingTextStringOnCreature("This power only affects creatures that breathe.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_SUMMON_PLANAR_ENERGY));
    Drown(oTarget, oPC);

}
