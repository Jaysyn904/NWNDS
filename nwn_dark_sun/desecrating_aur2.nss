#include "NW_I0_SPELLS"
void main()
{
   //Declare major variables
   object oCaster = GetAreaOfEffectCreator();

   int nHP;
   effect eHP;
   effect eVis2 = EffectVisualEffect(VFX_IMP_HOLY_AID);
   effect eVis = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MINOR);
   effect eAttack = EffectAttackIncrease(2);
   effect eDamage = EffectDamageIncrease(2);
   effect eSaves = EffectSavingThrowIncrease(SAVING_THROW_ALL,2);

   effect eLink = EffectLinkEffects(eAttack,eDamage);
   eLink = EffectLinkEffects(eLink,eSaves);
   eLink = EffectLinkEffects(eLink,eVis);

   object oTarget = GetFirstInPersistentObject();
   while(GetIsObjectValid(oTarget))
   {
       if (GetLocalInt(oTarget,"DEAura")<=0 )
       {
           int nRace = GetRacialType(oTarget);
           if ( nRace == RACIAL_TYPE_UNDEAD )
           {
               nHP = GetHitDice(oTarget) * 2;
               eHP = EffectTemporaryHitpoints(nHP);
               ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oTarget);
               ApplyEffectToObject(DURATION_TYPE_PERMANENT,eLink,oTarget);
               ApplyEffectToObject(DURATION_TYPE_PERMANENT,eHP,oTarget);
               SetLocalInt(oTarget,"DEAura",1);
           }
       }
       oTarget = GetNextInPersistentObject();
   }
}
