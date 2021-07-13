/************************************
*   Meditative Focus                *
*   (Enhancement)                   *
*   Multiplier: x2                  *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    effect eVis=EffectVisualEffect(VFX_IMP_HEAD_NATURE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    SetEnhancement(oPC, PSIONIC_ENH_MEDITATIVE_FOCUS);
}

