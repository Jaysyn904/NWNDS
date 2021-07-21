/************************************
*   Chemical Simulation, Poison     *
*                                   *
*   Cost: 9                         *
*   Power Score: Con -3             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=9;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-3;
    int nPType;
    effect eLink;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CHEMICAL_SIMULATION);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_CONSTITUTION, oPC);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CHEMICAL_SIMULATION)) return;

    //get poison type, based on DC.
    //At the highest levels there's a 1 in 3 chance
    //to get a different poison.
    if (nDC<18) nPType=POISON_ARSENIC;                  //(Con:1/2d8)   DC:13
    else if (nDC<22) nPType=POISON_DARK_REAVER_POWDER;  //(Con:2d6/2d6) DC:18
    else if (nDC<26) nPType=POISON_BEBILITH_VENOM;      //(Con:1d6/2d6) DC:20
    else if (nDC<30) nPType=POISON_BLACK_LOTUS_EXTRACT; //(Con:3d6/3d6) DC:20
    else if (nDC<35 || d6()<3) nPType=44;               //(Con:2d6/2d6) DC:26
    else nPType=POISON_COLOSSAL_SPIDER_VENOM;           //(Str:2d8/2d8) DC:35

    eLink=EffectPoison(nPType);
    eLink=ExtraordinaryEffect(eLink);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_CHEMICAL_SIMULATION));

    if(TouchAttackMelee(oTarget))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);
    }
}
