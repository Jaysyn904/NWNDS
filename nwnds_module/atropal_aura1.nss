#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eVis2 = EffectVisualEffect(VFX_IMP_HOLY_AID);
    effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
    effect eDrain = EffectNegativeLevel(10);
    effect eDeath = EffectDeath();
    effect eBoost = EffectTurnResistanceIncrease(20);
    eBoost = EffectLinkEffects(eBoost,EffectRegenerate(20,6.0));
    object oTarget = GetEnteringObject();
    int nRace = GetRacialType(oTarget);
    if ( GetLocalInt(oTarget,"NEAura") )
        return;
    if(GetIsEnemy(oTarget, oCaster))
    {
        if ( nRace != RACIAL_TYPE_UNDEAD )
        {
//            if ( GetHitDice(oTarget) <= 10 )
//            {
//                location lWight = GetLocation(oTarget);
//                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
//                ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,oTarget);
//                CreateObject(OBJECT_TYPE_CREATURE,"nw_wight",lWight);
//                return;
//            }
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDrain,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
        }
    }
    if ( nRace == RACIAL_TYPE_UNDEAD )
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oTarget);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eBoost,oTarget);
    }
    SetLocalInt(oTarget,"NEAura",1);
}
