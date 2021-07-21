//::///////////////////////////////////////////////
//:: Poison 1d8 Damage
//:: Poison_1d8_Dam
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Poison causes 1d8 damage.
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: January 14, 2012
//:://////////////////////////////////////////////

void main()
{
    object oTarget = OBJECT_SELF;
    int oDamage = (d8(1));
    effect eVenom = EffectDamage(oDamage, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVenom, oTarget);
}
