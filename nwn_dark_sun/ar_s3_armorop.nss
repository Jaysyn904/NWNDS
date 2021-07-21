
const int CLASS_TYPE_GLADIATOR = 45;


#include "nw_i0_spells"

void main()
{

    //Declare major variables
    object oTarget = OBJECT_SELF;
    int nDuration = GetHitDice(OBJECT_SELF);
    int nLevel = GetLevelByClass(CLASS_TYPE_GLADIATOR, oTarget);
    int nBonus;

    if (nLevel >= 40)
       {
       nBonus = 8;
       }
    else if (nLevel >= 35)
        {
        nBonus = 7;
        }
    else if (nLevel >= 30)
        {
        nBonus = 6;
        }
    else if (nLevel >= 25)
        {
        nBonus = 5;
        }
    else if (nLevel >= 20)
        {
        nBonus = 4;
        }
    else if (nLevel >= 15)
        {
        nBonus = 3;
        }
    else if (nLevel >= 10)
        {
        nBonus = 2;
        }
    else if (nLevel >= 5)
        {
        nBonus =1;
        }
    //Set unique armor bonus
   effect eAC;
   eAC = EffectACIncrease(nBonus, AC_NATURAL_BONUS);
   effect eVis = EffectVisualEffect(VFX_IMP_AC_BONUS);


    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

    effect eLink = EffectLinkEffects(eAC, eVis);
           eLink = ExtraordinaryEffect(eLink);


    RemoveEffectsFromSpell(oTarget, GetSpellId());

    //Apply the armor bonus and the VFX impact
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(nDuration));
}


