//::///////////////////////////////////////////////
//:: Default: Commoner Attacked
//:: ds_comonattack
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
void main()
{
    ExecuteScript("prc_npc_physatt", OBJECT_SELF);
    int nMsg = d6();
    string sMsg;
    switch (nMsg)
    {
        case 1: sMsg = "Guards!  Help!";  break;
        case 2: sMsg = "Help I'm being repressed!";  break;
        case 3: sMsg = "Where is a guard when you need one?!";  break;
        case 4: sMsg = "Bleeeeeee!";  break;
        case 5: sMsg = "No, you can have all my money!  Please!";  break;
        case 6: sMsg = "Someone save me!";  break;
    }

SpeakString(sMsg, TALKVOLUME_TALK);


if (d4() > 2) {
object oPC = GetLastHostileActor();
    if(GetIsDM(oPC) || GetIsDMPossessed(oPC) || !GetIsPC(oPC))
        {
        sMsg ="Thank you master, may I have another?";
        SpeakString(sMsg, TALKVOLUME_WHISPER);
        return;
        }

DelayCommand(2.0,AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Jail")))));
DelayCommand(6.0,FloatingTextStringOnCreature(GetName(oPC)+" has been arrested.",oPC,FALSE));
DelayCommand(7.0,SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 50, oPC));
}

    if(!GetFleeToExit())
    {
        if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
        {
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(GetIsObjectValid(GetLastAttacker()))
                {
                    if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
                    {
                        //AdjustReputation(GetLastAttacker(), OBJECT_SELF, -100);
                        SetSummonHelpIfAttacked();
                        DetermineSpecialBehavior(GetLastAttacker());
                    }
                    else
                    {
                        if(GetArea(GetLastAttacker()) == GetArea(OBJECT_SELF))
                        {
                            SetSummonHelpIfAttacked();
                            DetermineCombatRound();
                        }
                    }
                    //Shout Attack my target, only works with the On Spawn In setup
                    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
                    //Shout that I was attacked
                    SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                }
            }
        }
        else
        {
            //Put a check in to see if this attacker was the last attacker
            //Possibly change the GetNPCWarning function to make the check
            SetSpawnInCondition(NW_FLAG_SET_WARNINGS, FALSE);
        }
    }
    else
    {
        ActivateFleeToExit();
    }
    if(GetSpawnInCondition(NW_FLAG_ATTACK_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1005));
    }


}


