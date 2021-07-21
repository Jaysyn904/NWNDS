
#include "NW_I0_SPELLS"
//#include "x2_inc_spellhook"

void main()
{
   //Declare major variables
   //Get the object that is exiting the AOE
   object oTarget = GetExitingObject();
   int bValid = FALSE;
   int bAttack = FALSE;
   int bDamage = FALSE;
   int bHP = FALSE;
   int bSaves = FALSE;
   int bVis = FALSE;

   effect eAOE;
   int nEffectType;

   if(GetLocalInt(oTarget,"DEAura")>=1)
   {
       //Search through the valid effects on the target.
       eAOE = GetFirstEffect(oTarget);
       while (GetIsEffectValid(eAOE) && bValid == FALSE)
       {
//            SendMessageToPC(oPC,"EffectCreator is "+ GetName(GetEffectCreator(eAOE)));

           if (GetEffectCreator(eAOE) == GetAreaOfEffectCreator(OBJECT_SELF))
           {
               nEffectType = GetEffectType(eAOE);
               if ( (nEffectType == EFFECT_TYPE_ATTACK_INCREASE) ||
                   (nEffectType == EFFECT_TYPE_DAMAGE_INCREASE) ||
                   (nEffectType == EFFECT_TYPE_SAVING_THROW_INCREASE) ||
                   (nEffectType == EFFECT_TYPE_VISUALEFFECT) ||
                   (nEffectType == EFFECT_TYPE_TEMPORARY_HITPOINTS) )
               {
                   //If the effect was created by the Acid_Fog then remove it
                   if(GetEffectSpellId(eAOE) == -1)
                   {
                       RemoveEffect(oTarget, eAOE);
                       if ( nEffectType == EFFECT_TYPE_ATTACK_INCREASE )
                           bAttack = TRUE;
                       if ( nEffectType == EFFECT_TYPE_DAMAGE_INCREASE )
                           bDamage = TRUE;
                       if ( nEffectType == EFFECT_TYPE_SAVING_THROW_INCREASE )
                           bSaves = TRUE;
                       if ( nEffectType == EFFECT_TYPE_TEMPORARY_HITPOINTS )
                           bHP = TRUE;
                       if ( nEffectType == EFFECT_TYPE_VISUALEFFECT )
                           bVis = TRUE;

                       if ( bAttack && bDamage && bSaves && bHP && bVis )
                           bValid = TRUE;
                   }
               }
           }
           //Get next effect on the target
           eAOE = GetNextEffect(oTarget);
       }
       SetLocalInt(oTarget,"DEAura",0);
   }
}
