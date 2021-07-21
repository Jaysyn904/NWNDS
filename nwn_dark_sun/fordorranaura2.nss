#include "NW_I0_SPELLS"

void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();

    effect ePoison = EffectPoison(67);  //  Fordorran Musk Poison
    effect eVis = EffectVisualEffect(VFX_IMP_POISON_S);

    object oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        if(GetIsEnemy(oTarget, oCaster))
        {
            int nRace = GetRacialType(oTarget);
            if ((  nRace == RACIAL_TYPE_CONSTRUCT ) ||
                ( nRace == RACIAL_TYPE_ELEMENTAL )  ||
                ( nRace == 52 )  ||  // Plants are immune to poison.
                ( nRace == RACIAL_TYPE_UNDEAD ))
            return;

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoison, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

        }
    oTarget = GetNextInPersistentObject();
    }
}
