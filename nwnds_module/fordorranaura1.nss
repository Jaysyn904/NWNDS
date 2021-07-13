#include "NW_I0_SPELLS"

void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();
    object oTarget = GetEnteringObject();

    effect ePoison = EffectPoison(67);  //  Fordorran Musk Poison
    effect eVis = EffectVisualEffect(VFX_IMP_POISON_S);

    int nRace = GetRacialType(oTarget);
    if ((  nRace == RACIAL_TYPE_CONSTRUCT ) ||
        ( nRace == RACIAL_TYPE_ELEMENTAL )  ||
        ( nRace == 52 )  ||  // Plants are immune to poison.
        ( nRace == RACIAL_TYPE_UNDEAD ))
        return;

    if(GetIsEnemy(oTarget, oCaster))
    {
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoison, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        }
    }
}
