#include "x0_i0_spells"

void doSubmDamage(object oTarget)
{
/*    object oDebug = GetObjectByTag("LookHere");
    if ( oDebug != OBJECT_INVALID )
    {
        effect eDeb = EffectVisualEffect(VFX_IMP_DOOM);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeb,oDebug);
    }  */
    int nKillEm = 0;
    if ( (!GetIsPC( oTarget ) ) || ( GetGameDifficulty() >= GAME_DIFFICULTY_CORE_RULES ) )
    {
        nKillEm = 1;
    }
    int nRoll = d4(2);
    effect eStr = EffectAbilityDecrease(ABILITY_STRENGTH,nRoll);
    int nTargetAbility = GetAbilityScore(oTarget, ABILITY_STRENGTH);
    if ( ( (nTargetAbility - nRoll) < 3) && nKillEm )
    {
         int nHitPoints = GetCurrentHitPoints(oTarget);
         effect eVis = EffectVisualEffect(VFX_IMP_DESTRUCTION);
         effect eHitDamage = EffectDamage(nHitPoints, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
         ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHitDamage, oTarget);
    }

    nRoll = d4(2);
    effect eDex = EffectAbilityDecrease(ABILITY_DEXTERITY,nRoll);

    nRoll = d4(2);
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,nRoll);
    eStr = ExtraordinaryEffect(eStr);
    eDex = ExtraordinaryEffect(eDex);
    eCon = ExtraordinaryEffect(eCon);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eStr,oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDex,oTarget);
    int nType = GetRacialType(oTarget);
    if ( nType != RACIAL_TYPE_UNDEAD )
    {
        nTargetAbility = GetAbilityScore(oTarget, ABILITY_CONSTITUTION);
        if ( ( (nTargetAbility - nRoll) < 3) && nKillEm )
        {
             int nHitPoints = GetCurrentHitPoints(oTarget);
             effect eHitDamage = EffectDamage(nHitPoints, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
             ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHitDamage, oTarget);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCon,oTarget);
    }
}

void main()
{


//    object oSpellOrigin = OBJECT_SELF ;               // Where the spell came from
    object oTarget = GetSpellTargetObject();  // What the spell is aimed at

    // Must check to see if target has bones
    int nRaceType = GetRacialType(oTarget);
    if (( nRaceType == RACIAL_TYPE_ELEMENTAL ) || ( nRaceType == RACIAL_TYPE_CONSTRUCT )
        || ( nRaceType == RACIAL_TYPE_OOZE ) )
        return;
    // Ghosts don't have bones :P
    int nAppearType = GetAppearanceType(oTarget);
    if (( nAppearType == APPEARANCE_TYPE_ALLIP ) || ( nAppearType == APPEARANCE_TYPE_LANTERN_ARCHON )
        || ( nAppearType == APPEARANCE_TYPE_SHADOW ) || ( nAppearType == APPEARANCE_TYPE_SHADOW_FIEND )
        || ( nAppearType == APPEARANCE_TYPE_SPECTRE ) || ( nAppearType == APPEARANCE_TYPE_WRAITH ))
        return;
    int nSave;
    // Will save for undead, fort for everyone else
    if ( nRaceType == RACIAL_TYPE_UNDEAD )
        nSave = WillSave( oTarget, 22 );
    else
        nSave = FortitudeSave( oTarget, 22 );
    if ( nSave )
        return;
    effect eVis = EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
    eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
    DelayCommand(0.1,doSubmDamage(oTarget));

}
