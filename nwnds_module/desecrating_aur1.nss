#include "NW_I0_SPELLS"
void main()
{
   //Declare major variables
   object oCaster = GetAreaOfEffectCreator();
   object oTarget = GetEnteringObject();

   int nDC = 10 + GetHitDice(oCaster) /2 + GetAbilityModifier(ABILITY_CHARISMA,oCaster);

   int nHP = GetHitDice(oTarget) * 2;
   effect eVis2 = EffectVisualEffect(VFX_IMP_HOLY_AID);
   effect eVis = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MINOR);
   effect eAttack = EffectAttackIncrease(2);
   effect eDamage = EffectDamageIncrease(2);
   effect eSaves = EffectSavingThrowIncrease(SAVING_THROW_ALL,2);
   effect eHP = EffectTemporaryHitpoints(nHP);
   effect eLink = EffectLinkEffects(eAttack,eDamage);
   eLink = EffectLinkEffects(eLink,eSaves);
   eLink = EffectLinkEffects(eLink,eVis);

   effect eFear = EffectParalyze();
   effect eFearVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
   effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
   effect eLink2 = EffectLinkEffects(eFear,eFearVis);
   eLink2 = EffectLinkEffects(eLink2,eDur);


   // Fear Aura
   if ( GetIsEnemy(oTarget,oCaster) && GetLocalInt(oCaster,"FEAR_AURA") )
   {
       if ( !GetIsImmune(oTarget,IMMUNITY_TYPE_FEAR) )
       {
           if ( !MySavingThrow(SAVING_THROW_WILL,oTarget,nDC,SAVING_THROW_TYPE_FEAR,oCaster) )
           {
               ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink2,oTarget,RoundsToSeconds(d8()));
           }
       }
   }


   // Descecrating Aura
   if (GetLocalInt(oTarget,"DEAura")>=0 )
       return;
   int nRace = GetRacialType(oTarget);
   if ( nRace == RACIAL_TYPE_UNDEAD )
   {
       ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oTarget);
       ApplyEffectToObject(DURATION_TYPE_PERMANENT,eLink,oTarget);
       ApplyEffectToObject(DURATION_TYPE_PERMANENT,eHP,oTarget);
       SetLocalInt(oTarget,"DEAura",1);
   }
}
