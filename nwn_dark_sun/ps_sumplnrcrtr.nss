/************************************
*   Summon Planar Creature          *
*                                   *
*   Cost: 15                        *
*   Power Score: Int -4             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=15;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-4;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_SUMMON_PLANAR_CREATURE);
    int nRoll=d6()+nLevel;
    effect eSummon;

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_SUMMON_PLANAR_CREATURE)) return;

    if (nRoll<=4)
        eSummon = EffectSummonCreature("NW_S_CLANTERN", VFX_FNF_SUMMON_CELESTIAL, 2.5);
    else if (nRoll<=7)
        eSummon = EffectSummonCreature("NW_S_IMP",VFX_FNF_SUMMON_GATE , 2.5);
    else if (nRoll<=10)
        eSummon = EffectSummonCreature("NW_S_SLAADRED", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==11)
        eSummon = EffectSummonCreature("NW_S_SUCCUBUS",VFX_FNF_SUMMON_GATE, 2.5);
    else if (nRoll==12)
        eSummon = EffectSummonCreature("NW_S_CHOUND", VFX_FNF_SUMMON_CELESTIAL, 2.5);
    else if (nRoll==13)
        eSummon = EffectSummonCreature("NW_S_SLAADGRN",VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==14)
        eSummon = EffectSummonCreature("NW_S_EARTHHUGE", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==15)
        eSummon = EffectSummonCreature("NW_S_AIRHUGE", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==16)
        eSummon = EffectSummonCreature("NW_S_FIREHUGE", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==17)
        eSummon = EffectSummonCreature("NW_S_WATERHUGE", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==18)
        eSummon = EffectSummonCreature("NW_S_VROCK", VFX_FNF_SUMMON_GATE, 2.5);
    else if (nRoll==19)
        eSummon = EffectSummonCreature("NW_S_CTRUMPET", VFX_FNF_SUMMON_CELESTIAL, 2.5);
    else if (nRoll==20)
        eSummon = EffectSummonCreature("NW_S_EARTHGREAT", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==21)
        eSummon = EffectSummonCreature("NW_S_AIRGREAT", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==22)
        eSummon = EffectSummonCreature("NW_S_FIREGREAT", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==23)
        eSummon = EffectSummonCreature("NW_S_WATERGREAT", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==24)
        eSummon = EffectSummonCreature("NW_S_SLAADDETH", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==25)
        eSummon = EffectSummonCreature("NW_S_EARTHELDER", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==26)
        eSummon = EffectSummonCreature("NW_S_AIRELDER", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==27)
        eSummon = EffectSummonCreature("NW_S_FIREELDER", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll==28)
        eSummon = EffectSummonCreature("NW_S_WATERELDER", VFX_FNF_SUMMON_MONSTER_3, 1.0);
    else if (nRoll<28 && nRoll%2==1)
        eSummon = EffectSummonCreature("NW_S_BALOR", VFX_FNF_SUMMON_GATE, 3.0);
    else
        eSummon = EffectSummonCreature("X2_S_MUMMYWARR", VFX_FNF_SUMMON_EPIC_UNDEAD, 1.0);

    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), HoursToSeconds(24));

}
