//::///////////////////////////////////////////////
//:: Name floater_onDamage
//:: Copyright (c) 2021 NWN Dark Sun
//:://////////////////////////////////////////////
/*
    Floater's OnDamaged script
*/
//:://////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: May 28th 2021
//:://////////////////////////////////////////////

#include "nw_i0_spells"
//#include "x2_inc_spellhook"
#include "x2_inc_switches"

void main()
{
    object oCaster = OBJECT_SELF;
    int nMetaMagic = GetMetaMagicFeat();
    int nDamage;
    int nRnd = d8(1);
    float fDelay;
    effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    effect eDam;
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(OBJECT_SELF);
    object oDamager = GetLastDamager();
    int nDC = 10 + GetDamageDealtByType(DAMAGE_TYPE_FIRE);

    //--------------------------------------------------------------------------
    // Detect fire damage -> Roll Fort save -> Explode on fail.
    //--------------------------------------------------------------------------

    if(GetDamageDealtByType(DAMAGE_TYPE_FIRE) >= 1)
        {
        if(!MySavingThrow(SAVING_THROW_FORT, oCaster, nDC, SAVING_THROW_TYPE_FIRE, oDamager, 0.0f ))
            {
            //Declare the spell shape, size and the location.  Capture the first target object in the shape.
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_SMALL, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR);
            //Cycle through the targets within the spell shape until an invalid object is captured.
            while (GetIsObjectValid(oTarget))
                {
                //Fire cast spell at event for the specified target
                //SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FIREBALL));
                //Get the distance between the explosion and the target to calculate delay
                fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20;
                if (!MyResistSpell(OBJECT_SELF, oTarget, fDelay))
                    {
                    //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
                    nDamage = GetReflexAdjustedDamage(nRnd, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_FIRE);
                    //Set the damage effect
                    eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                    if(nDamage > 0)
                        {
                        // Apply effects to the currently selected target.
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                        //This visual effect is applied to the target object not the location as above.  This visual effect
                        //represents the flame that erupts on the target not on the ground.
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                        }
                    }

                //Select the next target within the spell shape.
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_SMALL, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR);
                effect eDeath;
                eDeath = EffectDeath();
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, oCaster);
            }
        }
    }
    //--------------------------------------------------------------------------
    // Execute default AI code
    //--------------------------------------------------------------------------
    ExecuteScript("prc_npc_damaged", OBJECT_SELF);
    ExecuteScript("loc_ondamaged", OBJECT_SELF);
}
