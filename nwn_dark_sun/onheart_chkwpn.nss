//::///////////////////////////////////////////////
//:: Weapon Check Guard v 1.0
//:: On Heartbeat
//:: onheart_chkwpn
//:://////////////////////////////////////////////
/*
Guard will warn player with weapon in hand to put it away.
After a few warnings the guard will attack the offending player.
*/
//:://////////////////////////////////////////////
//:: Created By: David "The Shadowlord" Corrales
//:: Created On: August 20 2002
//:://////////////////////////////////////////////
//Edited by Dante -- clean up and ClearAllActions

#include "NW_I0_GENERIC"

//VARIABLES START - EDIT AT OWN PLEASURE

float WARN_DISTANCE = 20.0;//Distance in which to spot player
float ANGER_DUR = 120.0; //Length of time (sec) that will remain angry at the pc
//END OF VARIABLES

void main()
{
    ExecuteScript("prc_npc_hb", OBJECT_SELF);
    int nMsg;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF);

    if(oPC != OBJECT_INVALID && (GetDistanceBetween(OBJECT_SELF, oPC) < WARN_DISTANCE) && GetObjectSeen(oPC) && !GetIsEnemy(oPC))
    {
        if(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC) != OBJECT_INVALID)
        {
            if(GetLocalObject(OBJECT_SELF, "LastOffender") == oPC)
            {
                if(GetLocalInt(OBJECT_SELF,"OffenseCount") == 2)
                {
                    nMsg = d4();
                    string ATTACK_MSG;
                    switch (nMsg)
                    {
                        case 1: ATTACK_MSG = "You where warned!!! Attack!!!";  break;
                        case 2: ATTACK_MSG = "That's it kank dung!!!";  break;
                        case 3: ATTACK_MSG = "I'll pry your weapon from your dead hand!!!";  break;
                        case 4: ATTACK_MSG = "Templars attack!!!";  break;
                    }
                    SpeakString(ATTACK_MSG);
                    SetIsTemporaryEnemy(oPC,OBJECT_SELF,TRUE,ANGER_DUR);
                    AssignCommand(OBJECT_SELF, ClearAllActions());
                    AssignCommand(OBJECT_SELF, ActionAttack(oPC));
                }
                else if(GetLocalInt(OBJECT_SELF, "OffenseCount") == 1)
                {
                    nMsg = d4();
                    string WARNING3;
                    switch (nMsg)
                    {
                        case 1: WARNING3 = "I will not tell you again! Put it away!";  break;
                        case 2: WARNING3 = "Disarm or die insolent kank!";  break;
                        case 3: WARNING3 = "Are you deaf slave?  Disarm or die!";  break;
                        case 4: WARNING3 = "Comply or die!";  break;
                    }
                    ClearAllActions();
                    AssignCommand(OBJECT_SELF, ActionMoveToObject(oPC, TRUE));
                    SetLocalInt(OBJECT_SELF, "OffenseCount", 2);
                    SpeakString(WARNING3);
                }
                else
                {
                    nMsg = d4();
                    string WARNING2;
                    switch (nMsg)
                    {
                        case 1: WARNING2 = "I said put away your weapon!";  break;
                        case 2: WARNING2 = "Put away your weapon!  You risk death!";  break;
                        case 3: WARNING2 = "Put away your weapon or I'll cut you!";  break;
                        case 4: WARNING2 = "Obey my command and sheath your arms!";  break;
                    }
                    SetLocalInt(OBJECT_SELF, "OffenseCount", 1);
                    SpeakString(WARNING2);
                }
            }
            else
            {
                nMsg = d4();
                string WARNING1;
                switch (nMsg)
                {
                    case 1: WARNING1 = "This is not a combat zone, put away your weapon.";  break;
                    case 2: WARNING1 = "Secure your arms.";  break;
                    case 3: WARNING1 = "Exposed weapons are not allowed here";  break;
                    case 4: WARNING1 = "Carrying a weapon in Tyr will get you hurt";  break;
                }
                SetLocalInt(OBJECT_SELF, "OffenseCount", 0);
                SpeakString(WARNING1);
                SetLocalObject(OBJECT_SELF, "LastOffender", oPC);
            }
        }
        else
        {
            if(GetLocalObject(OBJECT_SELF, "LastOffender") != OBJECT_INVALID)
            {
                nMsg = d4();
                string COMPLY_REPLY;
                switch (nMsg)
                {
                    case 1: COMPLY_REPLY = "Smart move slave.";  break;
                    case 2: COMPLY_REPLY = "Thats more like it, I guess I wont bust your head.";  break;
                    case 3: COMPLY_REPLY = "Thats better.";  break;
                    case 4: COMPLY_REPLY = "Lets not see anymore of that.";  break;
                }
                SpeakString(COMPLY_REPLY);
            }
            DeleteLocalObject(OBJECT_SELF, "LastOffender");
            SetLocalInt(OBJECT_SELF, "OffenseCount", 0);
        }
    }

    if(GetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY))
    {
        if(TalentAdvancedBuff(40.0))
        {
            SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY, FALSE);
            return;
        }
    }

    if(GetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING))
    {
        int nDay = FALSE;
        if(GetIsDay() || GetIsDawn())
        {
            nDay = TRUE;
        }
        if(GetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT") != nDay)
        {
            if(nDay == TRUE)
            {
                SetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT", TRUE);
            }
            else
            {
                SetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT", FALSE);
            }
            WalkWayPoints();
        }
    }

    if(!GetHasEffect(EFFECT_TYPE_SLEEP))
    {
        if(!GetIsPostOrWalking())
        {
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                {
                    if(!GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL) && !IsInConversation(OBJECT_SELF))
                    {
                        if(GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS) || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN))
                        {
                            PlayMobileAmbientAnimations();
                        }
                        else if(GetIsEncounterCreature() &&
                        !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                        {
                            PlayMobileAmbientAnimations();
                        }
                        else if(GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS) &&
                           !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                        {
                            PlayImmobileAmbientAnimations();
                        }
                    }
                    else
                    {
                        DetermineSpecialBehavior();
                    }
                }
                else
                {
                    //DetermineCombatRound();
                }
            }
        }
    }
    else
    {
        if(GetSpawnInCondition(NW_FLAG_SLEEPING_AT_NIGHT))
        {
            effect eVis = EffectVisualEffect(VFX_IMP_SLEEP);
            if(d10() > 6)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
            }
        }
    }

    if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1001));
    }
}
