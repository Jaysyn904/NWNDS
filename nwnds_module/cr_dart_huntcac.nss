// Hunting Cactus Ranged Spine & Poison - Item Unique OnHit Script
//
// Since you can't put a creature poison directly on a creature's ranged
// projectile.
//
//

#include "nw_i0_spells"
//#include "x2_inc_spellhook"
#include "x2_inc_switches"


void main()
{

   object oPC = OBJECT_SELF;
   object oItem = GetSpellCastItem();
   object oTarget = GetSpellTargetObject();

   int oFort = GetFortitudeSavingThrow(oTarget);
   int nDC = 14;
   effect ePoison = EffectPoison(60);
   effect ePoisonVis = EffectVisualEffect(VFX_IMP_POISON_S);


// See if the hunting cactus' poison is resisted.
      if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_POISON, oTarget))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, ePoisonVis, oTarget);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoison, oTarget);
        }

   }
