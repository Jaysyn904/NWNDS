//::///////////////////////////////////////////////
//:: Summon Shadow
//:: X0_S2_ShadSum.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PRESTIGE CLASS VERSION
    Spell powerful ally from the shadow plane to
    battle for the wizard
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 26, 2001
//:://////////////////////////////////////////////

void main()
{
    //Declare major variables
    int nMetaMagic = GetMetaMagicFeat();
    int nCasterLevel = GetLevelByClass(27);
    int nDuration = nCasterLevel;
    effect eSummon;
    object oSummon;


    //Set the summoned undead to the appropriate template based on the caster level
    if (nCasterLevel <= 5)
    {
        eSummon = EffectSummonCreature("DS_S_SHADOW_01",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nCasterLevel <= 8)
    {
        eSummon = EffectSummonCreature("DS_S_SHADOW_02",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nCasterLevel <=11)
    {
        eSummon = EffectSummonCreature("DS_S_SHADOW_03",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nCasterLevel <=14)
    {
        eSummon = EffectSummonCreature("DS_S_SHADOW_04",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nCasterLevel <=17)
    {
        eSummon = EffectSummonCreature("DS_S_SHADOW_05",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nCasterLevel <=20)
    {
        eSummon = EffectSummonCreature("DS_S_SHADOW_06",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nCasterLevel <=23)
    {
        eSummon = EffectSummonCreature("DS_S_SHADOW_07",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nCasterLevel <=26)
    {
        eSummon = EffectSummonCreature("DS_S_SHADOW_08",VFX_FNF_SUMMON_UNDEAD);
    }
    else
    {
      if (GetHasFeat(1002,OBJECT_SELF))// has epic shadowlord feat
      {
       //GZ 2003-07-24: Epic shadow lord
          eSummon = EffectSummonCreature("DS_S_SHADOW_09",VFX_FNF_SUMMON_UNDEAD);
      }
      else
      {
         eSummon = EffectSummonCreature("DS_S_SHADOW_09",VFX_FNF_SUMMON_UNDEAD);
      }

    }

    //Apply VFX impact and summon effect
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), HoursToSeconds(nDuration));
}
