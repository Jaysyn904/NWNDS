//::
//:: Ghoul_claw
//::
//:: A pnp version of the Ghoul's paralytic claws.
//::
//:: Modified by: DM Heatstroke 01-19-11
//::

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

void DoGhoulClaw(object oTarget, object oCaster)
{   // Setup paralytic touch
    effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
    float fDuration = RoundsToSeconds(d4()+1);
    effect eParalyze = EffectParalyze();
    eParalyze = ExtraordinaryEffect(eParalyze);
    effect eStun = EffectLinkEffects(eParalyze, eVis);

    // Get oCaster's Bite DC
    int nCreCHAMod = GetAbilityModifier(ABILITY_CHARISMA, oCaster);
    int nCreHD = GetHitDice (oCaster);
    int nBiteDC = (10 + (nCreHD/2) + nCreCHAMod);

    // Roll a saving throw to resist the paralytic touch
    if ( !MySavingThrow(SAVING_THROW_FORT, oTarget, nBiteDC, SAVING_THROW_TYPE_NONE, oCaster) &&
         !GetHasFeat(4711, oTarget) &&        // PRC Elven feat
         !GetHasFeat(256, oTarget) )          // Bioware Weapon Prof: Elf
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, fDuration);
        }

}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

    DelayCommand(0.1,DoGhoulClaw(oTarget,oCaster));

}
