//::
//:: A pnp version of the Raaig's diseased touch.
//::
//:: 50/50 chance to do either Red Ache or Filth Fever OnHit
//::
//:: Modified by: DM Heatstroke 01-07-11
//::

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

const int DISEASE_CONTAGION_FILTH_FEVER = 22;
const int DISEASE_CONTAGION_RED_ACHE = 24;

void DoDisease(object oTarget, object oCaster)
{   // Get Ability Damage
    effect eVis = EffectVisualEffect(VFX_IMP_DISEASE_S);
    int nRandom = d2();
    effect eDisease = EffectDisease(DISEASE_CONTAGION_FILTH_FEVER);

    if (nRandom == 1)
        {
            effect eDisease = EffectDisease(DISEASE_CONTAGION_RED_ACHE);
            //SpeakString("Switched to Red Ache - Silent Shout", TALKVOLUME_SILENT_SHOUT);
            //SpeakString("Switched to Red Ache", TALKVOLUME_TALK);
        }


    // Get oCaster's Touch DC
    int nCreCHAMod = GetAbilityModifier(ABILITY_CHARISMA, oCaster);
    int nCreHD = GetHitDice (oCaster);
    int nDiseaseDC = (10 + (nCreHD/2) + nCreCHAMod);

    // Roll a saving throw
    if ( !MySavingThrow(SAVING_THROW_FORT, oTarget, nDiseaseDC, SAVING_THROW_TYPE_DISEASE, oCaster) )
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);           // Apply Viz
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDisease, oTarget);
    }
}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_DISEASE) )
    {
        SendMessageToPC(oTarget,"Immune to disease.");
        return;
    }

    DelayCommand(0.1,DoDisease(oTarget,oCaster));

}
