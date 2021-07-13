//::
//:: Ghoul_touch
//::
//:: A pnp version of the Ghoul's diseased & paralytic bite.
//::
//:: Modified by: DM Heatstroke 01-19-11
//::

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

void DoGhoulBite(object oTarget, object oCaster)
{   // Setup disease
    effect eVis1 = EffectVisualEffect(VFX_IMP_DISEASE_S);
    effect eDisease = EffectDisease(DISEASE_GHOUL_ROT);
    eDisease = ExtraordinaryEffect(eDisease);
    effect eSick = EffectLinkEffects(eDisease, eVis1);

    // Setup paralytic touch
    effect eVis2 = EffectVisualEffect(VFX_DUR_PARALYZED);
    float fDuration = RoundsToSeconds(d4()+1);
    effect eParalyze = EffectParalyze();
    eParalyze = ExtraordinaryEffect(eParalyze);
    effect eStun = EffectLinkEffects(eParalyze, eVis2);

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

    // Roll a saving throw to resist the diseased bite
    if ( !MySavingThrow(SAVING_THROW_FORT, oTarget, nBiteDC, SAVING_THROW_TYPE_DISEASE, oCaster) )
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSick, oTarget);
        }
}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

    DelayCommand(0.1,DoGhoulBite(oTarget,oCaster));

}
