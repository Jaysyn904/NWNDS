/************************************
*   Harness Subconscious            *
*   (Enhancement)                   *
*   Multiplier: x0                  *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    effect eVis=EffectVisualEffect(VFX_IMP_HEAD_ELECTRICITY);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    SetEnhancement(oPC, PSIONIC_ENH_HARNESS_SUBCONSCIOUS);
}

