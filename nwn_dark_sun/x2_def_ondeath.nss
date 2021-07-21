//::///////////////////////////////////////////////
//:: Name x2_def_ondeath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

// Necromancy  101 /////////
#include "_inc_livingdead_"
#include "_inc_battlecry_"
////////////////////////////
#include "NW_I0_SPELLS"
#include "nw_i0_plot"

void main()
{
    object oNPC = OBJECT_SELF;

    if ((GetResRef(oNPC) == "NPC_KLEDGUARD") ||
        (GetResRef(oNPC) == "NPC_IANTO_GUARD1") ||
        (GetResRef(oNPC) == "NPC_IANTO_GUARD2") ||
        (GetResRef(oNPC) == "ds_vorlon_guard1") ||
        (GetResRef(oNPC) == "ds_vorlon_guard2"))
            {
                object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oNPC);
                object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oNPC);

                // Give a 3% chance to drop armor &/or equipped weapon
                int bDroppableA = d100() > 97;
                int bDroppableW = d100() > 97;

                SetDroppableFlag(oArmor, bDroppableA);
                SetDroppableFlag(oWeapon, bDroppableW);

            }


    int nInsanity  = GetLocalInt(OBJECT_SELF,"INSANITY");
    if(nInsanity)
        {
            object oCaster = OBJECT_SELF;
            object oTarget = GetLastKiller();
            effect eConfuse = EffectConfused();
            effect eImpact = EffectVisualEffect(VFX_FNF_LOS_NORMAL_20);
            effect eVis = EffectVisualEffect(VFX_IMP_CONFUSION_S);
            effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
            effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
            effect eLink = EffectLinkEffects(eMind, eConfuse);
            eLink = EffectLinkEffects(eLink, eDur);
            eLink = SupernaturalEffect(eLink);

            // Get oCaster's DC
            int nCreCHAMod = GetAbilityModifier(ABILITY_CHARISMA, oCaster);
            int nCreHD = GetHitDice (oCaster);
            int nDC = (10 + (nCreHD/2) + nCreCHAMod);

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetSpellTargetLocation());

            if ( !MySavingThrow(SAVING_THROW_WILL, oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oCaster))
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);           // Apply Viz
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);
                    AssignCommand(oTarget,SpeakString("*The "+GetName(oCaster)+" has driven you insane!*"));
                }
        }

    int nVFX = GetLocalInt(OBJECT_SELF,"SpawnVFX");
    if(nVFX)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,SupernaturalEffect(EffectVisualEffect(nVFX)),OBJECT_SELF);
        }
    int nFirey = GetLocalInt(OBJECT_SELF,"FIREY");
    if (nFirey)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_INFERNO_NO_SOUND);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    int nShadowy = GetLocalInt(OBJECT_SELF,"SHADOWY");
    if (nShadowy)
        {

            effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    int nStony = GetLocalInt(OBJECT_SELF,"STONY");
    if (nStony)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_STONESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    int nWoody = GetLocalInt(OBJECT_SELF,"WOODY");
    if (nWoody)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_BARKSKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

            int nIcy = GetLocalInt(OBJECT_SELF,"ICY");
    if (nIcy)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_ICESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    int nConcealed20 = GetLocalInt(OBJECT_SELF,"CONCEALED20");
    if (nConcealed20)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_BLUR );
            effect eConceal = EffectConcealment(20, 0);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    int nConcealed50 = GetLocalInt(OBJECT_SELF,"CONCEALED50");
    if (nConcealed50)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_BLUR );
            effect eConceal = EffectConcealment(50, 0);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    int nGlow = GetLocalInt (OBJECT_SELF,"GLOW_COLOR");
    if (nGlow == 1)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 2)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 3)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 4)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREY);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 5)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 6)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 7)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 8)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 9)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 10)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 11)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 12)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 13)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 14)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    else if (nGlow == 15)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 16)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    ExecuteScript("nw_c2_default7", OBJECT_SELF);
    // Necromancy 101 ///////////////////////
    DoDeathCry();
    if (UndeadCheck(GetLastKiller())) return;
    /////////////////////////////////////////
}
