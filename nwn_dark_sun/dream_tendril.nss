void DoIntDamage(object oTarget, object oOrigin )
{
    int nKillEm = 0;
    if ( (!GetIsPC( oTarget ) ) || ( GetGameDifficulty() >= GAME_DIFFICULTY_CORE_RULES ) )
    {
        nKillEm = 1;
    }

    effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    int nDam = d4();
    effect eInt = EffectAbilityDecrease(ABILITY_INTELLIGENCE, nDam);
    eInt = SupernaturalEffect(eInt);

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eInt,oTarget);
        return;
    }

    effect eHeal = EffectTemporaryHitpoints(5);
    effect eHealVis = EffectVisualEffect(VFX_IMP_HEALING_S);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHeal, oOrigin, HoursToSeconds(1));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealVis, oOrigin);

    if ( GetAbilityScore(oTarget,ABILITY_INTELLIGENCE) - nDam < 3 && nKillEm )
    {
         int nHitPoints = GetCurrentHitPoints(oTarget);
         effect eVis = EffectVisualEffect(VFX_IMP_DEATH);
         effect eHitDamage = EffectDamage(nHitPoints, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
         ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHitDamage, oTarget);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eInt,oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
}

void main()
{
    object oOrigin = OBJECT_SELF ;               // Where the spell came from
    object oTarget = GetSpellTargetObject();  // What the spell is aimed at

    int nInt = GetAbilityScore(oTarget,ABILITY_INTELLIGENCE);

    if ( !GetLocalInt(oTarget,"NotMindless") && nInt == 3 )
        return;

    if ( nInt != 3 )
        SetLocalInt(oTarget,"NotMindless",1);

    DelayCommand(0.1,DoIntDamage(oTarget,oOrigin));
}
