//::
//:: A pnp version of the Ghost's ability draining touch.
//::
//:: Modified by: DM Heatstroke 01-10-11
//::

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

void DoAbilityDamage(object oTarget, object oCaster)
{   // Get ability & amount to drain
    int nAbility;
    int nDam = Random(5)+1;
    int nRandom = Random(5)+1;
    if (nRandom == 1)
        {
            nAbility = ABILITY_STRENGTH;
            //SpeakString("Choice "+IntToString(nRandom)+".  Draining "+IntToString(nDam)+" Strength", TALKVOLUME_SILENT_SHOUT);
        }

    else if (nRandom == 2)
        {
            nAbility = ABILITY_CONSTITUTION;
            //SpeakString("Choice "+IntToString(nRandom)+".  Draining "+IntToString(nDam)+" Constitution", TALKVOLUME_SILENT_SHOUT);
        }

    else if (nRandom == 3)
        {
            nAbility = ABILITY_DEXTERITY;
            //SpeakString("Choice "+IntToString(nRandom)+".  Draining "+IntToString(nDam)+" Dexterity", TALKVOLUME_SILENT_SHOUT);
        }
    else if (nRandom == 4)
        {
            nAbility = ABILITY_INTELLIGENCE;
            //SpeakString("Choice "+IntToString(nRandom)+".  Draining "+IntToString(nDam)+" Intelligence", TALKVOLUME_SILENT_SHOUT);
        }
    else if (nRandom == 5)
        {
            nAbility = ABILITY_WISDOM;
            //SpeakString("Choice "+IntToString(nRandom)+".  Draining "+IntToString(nDam)+" Wisdom", TALKVOLUME_SILENT_SHOUT);
        }
    else
        {
            nAbility = ABILITY_CHARISMA;
            //SpeakString("Choice "+IntToString(nRandom)+".  Draining "+IntToString(nDam)+" Charisma", TALKVOLUME_SILENT_SHOUT);
        }

    // Setup ability drain
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eDrain = EffectAbilityDecrease(nAbility, nDam);
    eDrain = ExtraordinaryEffect(eDrain);

    // Setup oCaster's healing
    effect eHeal = EffectHeal(5);
    effect eDrainVis = EffectVisualEffect(VFX_IMP_HEALING_L);

    // Determine if they can die from ability loss
    int bKillEm = FALSE;
    if ( !GetIsPC(oTarget) || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES
        || GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT )
        bKillEm = TRUE;

    // Get oCaster's Touch DC
    int nCreCHAMod = GetAbilityModifier(ABILITY_CHARISMA, oCaster);
    int nCreHD = GetHitDice (oCaster);
    int nTouchDC = (10 + (nCreHD/2) + nCreCHAMod);

    // Roll a saving throw
    if ( !MySavingThrow(SAVING_THROW_FORT, oTarget, nTouchDC, SAVING_THROW_TYPE_NONE, oCaster) )
    {   // If they fail a save & have less than a 3 in any ability score, kill them
        int nStr = GetAbilityScore(oTarget,ABILITY_STRENGTH);
        int nCon = GetAbilityScore(oTarget,ABILITY_CONSTITUTION);
        int nDex = GetAbilityScore(oTarget,ABILITY_DEXTERITY);
        int nInt = GetAbilityScore(oTarget,ABILITY_INTELLIGENCE);
        int nWis = GetAbilityScore(oTarget,ABILITY_WISDOM);
        int nCha = GetAbilityScore(oTarget,ABILITY_CHARISMA);
        if ( ( nStr - nDam ) < 3 && bKillEm )
        {
            effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP2 = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath2 = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP2,oTarget);
            SendMessageToPC(oTarget,"You died from Strength Drain.");
            //SpeakString(GetName(oTarget)+" Died from Strength Drain", TALKVOLUME_SILENT_SHOUT);

        }
        else if ( ( nDex - nDam ) < 3 && bKillEm )
        {
            effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP2 = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath2 = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP2,oTarget);
            SendMessageToPC(oTarget,"You died from Dexterity Drain.");
            //SpeakString(GetName(oTarget)+" Died from Dexterity Drain", TALKVOLUME_SILENT_SHOUT);

        }
        else if ( ( nCon - nDam ) < 3 && bKillEm )
        {
            effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP2 = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath2 = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP2,oTarget);
            SendMessageToPC(oTarget,"You died from Constitution Drain.");
            //SpeakString(GetName(oTarget)+" Died from Constitution Drain", TALKVOLUME_SILENT_SHOUT);

        }
        else if ( ( nInt - nDam ) < 3 && bKillEm )
        {
            effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP2 = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath2 = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP2,oTarget);
            SendMessageToPC(oTarget,"You died from Intelligence Drain.");
            //SpeakString(GetName(oTarget)+" Died from Intelligence Drain", TALKVOLUME_SILENT_SHOUT);

        }
        else if ( ( nWis - nDam ) < 3 && bKillEm )
        {
            effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP2 = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath2 = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP2,oTarget);
            SendMessageToPC(oTarget,"You died from Wisdom Drain.");
            //SpeakString(GetName(oTarget)+" Died from Wisdom Drain", TALKVOLUME_SILENT_SHOUT);

        }
        else if ( ( nCha - nDam ) < 3 && bKillEm )
        {
            effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP2 = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath2 = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP2,oTarget);
            SendMessageToPC(oTarget,"You died from Charisma Drain.");
            //SpeakString(GetName(oTarget)+" Died from Charisma Drain", TALKVOLUME_SILENT_SHOUT);

        }
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);              // Apply Viz
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDrain, oTarget, 8640.0);  // 24 "Athas Reborn" hours -DMH
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oCaster);             // Heal up
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDrainVis, oCaster);         // Apply Viz
    }
}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

/*    int bIsPoisoned = GetLocalInt(oTarget,"IsPoisoned");
    if ( bIsPoisoned )
        return; */

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
    {
        SendMessageToPC(oTarget,"Immune to ability drain.");
        return;
    }

    DelayCommand(0.1,DoAbilityDamage(oTarget,oCaster));

}
