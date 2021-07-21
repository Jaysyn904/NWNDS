/************************************
*   Ultrablast                      *
*                                   *
*   Cost: 75                        *
*   Power Score: Wis -10            *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=75;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-10;
    effect eVis=EffectVisualEffect(VFX_FNF_SOUND_BURST);
    effect eLink=EffectDeath();
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ULTRABLAST);
    location lHere=GetLocation(oPC);
    int nDC=10+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    object oTarget=GetFirstObjectInShape(SHAPE_SPHERE, 10.0, lHere);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ULTRABLAST)) return;

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

    while(GetIsObjectValid(oTarget))
    {
        if(!GetFactionEqual(oTarget, oPC) && !(GetRacialType(oTarget)==RACIAL_TYPE_CONSTRUCT || GetRacialType(oTarget)==RACIAL_TYPE_UNDEAD))
        {
            SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_ULTRABLAST));

            if (!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
                DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget));

            else
            {
                DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(3)), oTarget));
            }
        }

        oTarget=GetNextObjectInShape(SHAPE_SPHERE, 10.0, lHere);
    }

}
