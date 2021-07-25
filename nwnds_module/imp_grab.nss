// PnP Improved Grab Attack - Item Unique OnHit Script
//

#include "prc_inc_combmove"
#include "prc_misc_const"

void main()
{

   object oPC = OBJECT_SELF;
   object oItem = GetSpellCastItem();
   object oTarget = GetSpellTargetObject();

   string sGrapplerName = GetName(oPC);

   int GrappleBonus = GetLocalInt(oPC, "GRAPPLE_BONUS");
   int PCSize = PRCGetSizeModifier(oPC);
   int TargetSize = PRCGetSizeModifier(oTarget);
   int GrappleChance = d100();
   

// You automatically lose an attempt to hold if the target is two or more size categories larger than you are. 
      if (TargetSize - 2 >= PCSize)
      {
         FloatingTextStringOnCreature("This creature is too large to grapple.", oPC);
         return;
      }
      
// Don't try to grapple on every attack. 
      if (GrappleChance >= 66)
      {
         return;
      }

   FloatingTextStringOnCreature("The" + sGrapplerName + "is grappling you!", oTarget);
   DoGrapple(oPC, oTarget, 0, FALSE, TRUE);
}