//::///////////////////////////////////////////////
//:: Name x2_def_rested
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Rested script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    int nNumber = GetLocalInt(OBJECT_SELF,"CREATURE_VAR_NUMBER_OF_ATTACKS");
    if (nNumber >0 )
    {
        SetBaseAttackBonus(nNumber);
    }

    int nShadowy = GetLocalInt(OBJECT_SELF,"SHADOWY");
    if (nShadowy)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nStony = GetLocalInt(OBJECT_SELF,"STONY");
    if (nStony)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_STONESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nWoody = GetLocalInt(OBJECT_SELF,"WOODY");
    if (nWoody)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_BARKSKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nSR = GetLocalInt(OBJECT_SELF,"SPELL_RESISTANCE");
    if ( nSR )
    {
        effect eSR = EffectSpellResistanceIncrease(nSR);
        eSR = SupernaturalEffect(eSR);
        eSR = ExtraordinaryEffect(eSR);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eSR,OBJECT_SELF);
    }

    int nAttackBonus = GetLocalInt(OBJECT_SELF,"ATTACK_BONUS");
    if ( nAttackBonus )
    {
        effect eAttack = EffectAttackIncrease(nAttackBonus);
        eAttack = SupernaturalEffect(eAttack);
        eAttack = ExtraordinaryEffect(eAttack);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAttack,OBJECT_SELF);
    }

    int nGlow = GetLocalInt (OBJECT_SELF,"GLOW_COLOR");
    if (nGlow == 1)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 2)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 3)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 4)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREY);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 5)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 6)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 7)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 8)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 9)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 10)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 11)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 12)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 13)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 14)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 15)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 16)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    ExecuteScript("prc_npc_rested", OBJECT_SELF);
    ExecuteScript("nw_c2_defaulta", OBJECT_SELF);
}
