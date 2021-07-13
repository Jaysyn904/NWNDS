/************************************
*   Magnify                         *
*   (Enhancement)                   *
*   Multiplier: x3                  *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    effect eVis=EffectVisualEffect(VFX_IMP_HEAD_COLD);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    SetEnhancement(oPC, PSIONIC_ENH_MAGNIFY);
}

