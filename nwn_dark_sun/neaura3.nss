
//::///////////////////////////////////////////////
//:: Grease: On Exit
//:: NW_S0_GreaseB.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creatures entering the zone of grease must make
    a reflex save or fall down.  Those that make
    their save have their movement reduced by 1/2.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 1, 2001
//:://////////////////////////////////////////////

#include "NW_I0_SPELLS"
//#include "x2_inc_spellhook"

void main()
{
    //Declare major variables
    //Get the object that is exiting the AOE
    object oTarget = GetExitingObject();
    int bValid = FALSE;
    int bRegen = FALSE;
    int bTurn = FALSE;
    effect eAOE;
    int nEffectType;
    object oPC = GetFirstPC();
//    SendMessageToPC(oPC,"neaura3: OBJECT_SELF = " + GetName(OBJECT_SELF) +
//                        " Creator = " + GetName(GetAreaOfEffectCreator(OBJECT_SELF)) );

    if(GetLocalInt(oTarget,"NEAura"))
    {
        //Search through the valid effects on the target.
        eAOE = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eAOE) && bValid == FALSE)
        {
//            SendMessageToPC(oPC,"EffectCreator is "+ GetName(GetEffectCreator(eAOE)));

            if (GetEffectCreator(eAOE) == GetAreaOfEffectCreator(OBJECT_SELF))
            {
                nEffectType = GetEffectType(eAOE);
                if ( (nEffectType == EFFECT_TYPE_REGENERATE) ||
                    (nEffectType == EFFECT_TYPE_TURN_RESISTANCE_INCREASE) ||
                    (nEffectType == EFFECT_TYPE_NEGATIVELEVEL) )
                {
                    //If the effect was created by the Acid_Fog then remove it
                    if(GetEffectSpellId(eAOE) == -1)
                    {
                        RemoveEffect(oTarget, eAOE);
                        if ( nEffectType == EFFECT_TYPE_NEGATIVELEVEL )
                            bValid = TRUE;
                        if ( nEffectType == EFFECT_TYPE_TURN_RESISTANCE_INCREASE )
                            bTurn = TRUE;
                        if ( nEffectType == EFFECT_TYPE_REGENERATE )
                            bRegen = TRUE;
                        if ( bTurn && bRegen )
                            bValid = TRUE;

                    }
                }
            }
            //Get next effect on the target
            eAOE = GetNextEffect(oTarget);
        }
        SetLocalInt(oTarget,"NEAura",0);
    }
}
