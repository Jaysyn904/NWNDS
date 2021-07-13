/************************************
*   Animate Shadow                  *
*                                   *
*   Cost: 16                        *
*   Power Score: Wis -3             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ANIMATE_SHADOW);
    effect eSummon;

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ANIMATE_SHADOW)) return;

    if (nLevel <= 9)
    {
        eSummon = EffectSummonCreature("NW_S_SHADOW",VFX_FNF_SUMMON_UNDEAD);
    }
    else if ((nLevel >= 10) && (nLevel <= 14))
    {
        eSummon = EffectSummonCreature("NW_S_SHFIEND",VFX_FNF_SUMMON_UNDEAD);
    }
    else if ((nLevel >= 15))
    {
        eSummon = EffectSummonCreature("NW_S_SHADLORD",VFX_FNF_SUMMON_UNDEAD);
    }


    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), HoursToSeconds(24));

}
