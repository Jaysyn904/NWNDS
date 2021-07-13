/************************************
*   Detonate                        *
*                                   *
*   Cost: 18                        *
*   Power Score: Con -3             *
*                                   *
************************************/

#include "lib_psionic"
#include "nw_i0_spells"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=18;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-3;
    effect eVis=EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_IMP_DUST_EXPLOSION));
    effect eLink=EffectDeath(TRUE);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_DETONATE);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_CONSTITUTION);
    object oTarget=GetSpellTargetObject();
    location lTargLoc=GetLocation(oTarget);
    int nHP=GetCurrentHitPoints(oTarget);
    eLink=EffectLinkEffects(eLink, EffectDamage(nHP));
    eLink=ExtraordinaryEffect(eLink);


    if ((GetObjectType(oTarget)==OBJECT_TYPE_CREATURE) && !(GetRacialType(oTarget)==RACIAL_TYPE_UNDEAD || GetRacialType(oTarget)==RACIAL_TYPE_CONSTRUCT))
    {
        FloatingTextStringOnCreature("Only inanimate objects and non-living creatures are affected by this ability", oPC, FALSE);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_DETONATE)) return;

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_DETONATE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

    if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC) && !GetPlotFlag(oTarget))
    {

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget);

        oTarget=GetFirstObjectInShape(SHAPE_SPHERE, 3.0, lTargLoc, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
        eVis=EffectVisualEffect(VFX_COM_BLOOD_SPARK_MEDIUM);
        float fDelay;

        while (GetIsObjectValid(oTarget))
        {
            if (!ReflexSave(oTarget, nDC))
            {
                fDelay=GetRandomDelay(0.2, 0.8);
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d10(), DAMAGE_TYPE_BLUDGEONING), oTarget));
                DelayCommand(fDelay, SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_DETONATE)));
            }

            else
            {
                fDelay=GetRandomDelay(0.2, 0.8);
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d10()/2, DAMAGE_TYPE_BLUDGEONING), oTarget));
                DelayCommand(fDelay, SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_DETONATE)));
            }

            oTarget=GetNextObjectInShape(SHAPE_SPHERE, 3.0, lTargLoc, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
        }
    }
}
