/************************************
*   Summon Planar Energy (Fire)     *
*                                   *
*   Cost: 16                        *
*   Power Score: Int                *
*                                   *
************************************/

#include "lib_psionic"
#include "nw_i0_spells"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY);
    effect eVis1=EffectVisualEffect(494); //VFX_FNF_DRAGBREATHGROUND
    effect eVis2=EffectVisualEffect(VFX_COM_HIT_FIRE);
    object oTarget=GetSpellTargetObject();
    location lTargLoc=GetLocation(oTarget);
    if (!GetIsObjectValid(oTarget))
        lTargLoc=GetSpellTargetLocation();
    oTarget=GetFirstObjectInShape(SHAPE_SPHERE, 4.0, lTargLoc, TRUE);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_INTELLIGENCE);
    float fDelay;

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY)) return;


    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis1, lTargLoc);

    while (GetIsObjectValid(oTarget))
    {
        if (!ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_FIRE))
        {
            fDelay=GetRandomDelay(0.2, 0.8);
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetEnhancedEffect(d8(3), FEAT_PSIONIC_SUMMON_PLANAR_ENERGY), DAMAGE_TYPE_FIRE), oTarget));
            DelayCommand(fDelay, SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_SUMMON_PLANAR_ENERGY)));
        }

        else
        {
            fDelay=GetRandomDelay(0.2, 0.8);
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetEnhancedEffect(d8(3), FEAT_PSIONIC_SUMMON_PLANAR_ENERGY)/2, DAMAGE_TYPE_FIRE), oTarget));
            DelayCommand(fDelay, SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_SUMMON_PLANAR_ENERGY)));
        }

        oTarget=GetNextObjectInShape(SHAPE_SPHERE, 4.0, lTargLoc, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }


}
