void DoConDamage(object oTarget, object oOrigin )
{
    int nKillEm = 0;
    if ( (!GetIsPC( oTarget ) ) || ( GetGameDifficulty() >= GAME_DIFFICULTY_CORE_RULES ) )
    {
        nKillEm = 1;
    }

    effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    effect eBeam = EffectBeam(VFX_BEAM_SILENT_EVIL,oOrigin,BODY_NODE_CHEST);
    int nDam = d4();
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION, nDam);
    eCon = SupernaturalEffect(eCon);
    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCon,oTarget);
        return;
    }

    if ( GetAbilityScore(oTarget,ABILITY_CONSTITUTION) - nDam < 3 && nKillEm )
    {
         int nHitPoints = GetCurrentHitPoints(oTarget);
         effect eVis = EffectVisualEffect(VFX_IMP_DEATH);
         effect eHitDamage = EffectDamage(nHitPoints, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
         ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHitDamage, oTarget);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCon,oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oTarget,1.5);
}

void main()
{
    object oOrigin = OBJECT_SELF ;               // Where the spell came from
    object oTarget = GetSpellTargetObject();  // What the spell is aimed at

    int nRace = GetRacialType(oTarget);
    if ( nRace == RACIAL_TYPE_UNDEAD || nRace == RACIAL_TYPE_CONSTRUCT ||
        nRace == RACIAL_TYPE_OOZE || nRace == RACIAL_TYPE_ELEMENTAL )
        return;

    DelayCommand(0.1,DoConDamage(oTarget,oOrigin));
}
