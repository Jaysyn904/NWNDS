//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: NW_C2_DEFAULT3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calls the end of combat script every round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
void main()
{
    if((GetIsDead(GetLastAttacker()) == TRUE) && (GetIsPC(GetLastAttacker()) == TRUE) && (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 9) && (d6() > 5))

{


int nMsg = d8();

string sMsg;

switch (nMsg)

{

case 1: sMsg = "Wimp."; break;

case 2: sMsg = "Pathetic."; break;

case 3: sMsg = "You are worthless and weak."; break;

case 4: sMsg = "Wimp."; break;

case 5: sMsg = "Waste of water."; break;

case 6: sMsg = "I didnt even break a sweat."; break;

case 7: sMsg = "Ha Ha!"; break;

case 8: sMsg = "Insect."; break;

}

SpeakString(sMsg, TALKVOLUME_TALK);


}

    if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
    {
        DetermineSpecialBehavior();
    }
    else if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
    {
       DetermineCombatRound();
    }
    if(GetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1003));
    }
}


