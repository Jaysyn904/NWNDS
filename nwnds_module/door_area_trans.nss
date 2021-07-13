////////////////////////////////////////
/*
  Closes door when player transitions

  If the player opens door and does not transition the door
  will not close.

 This script doesn't interfere with the Area Transiton Wizard.

*/
////////////////////////////////////////
#include "x0_inc_henai"
void b_FollowMaster(object oMaster);
void main()
{
  object oClicker = GetClickingObject();
  object oSelf = OBJECT_SELF;
  object oDest = GetTransitionTarget(OBJECT_SELF);

if(oDest == OBJECT_INVALID)
   {
     SendMessageToAllDMs("Door "+GetTag(OBJECT_SELF)+
     " is missing a transition target");
     return;
   }

// Seems the script is firing twice, once for the door actually used
// and once for the transition target
if(GetLocalInt(oClicker,"DoorOnce") == FALSE)
{
  SetLocalInt(oClicker,"DoorOnce",TRUE);
  DelayCommand(1.1,DeleteLocalInt(oClicker,"DoorOnce"));

  if(GetIsPC(oClicker)==TRUE)
     {
       SetLocalInt(oClicker,"PC_USED_DOOR",TRUE);
       AssignCommand(oClicker,JumpToObject(oDest));

       b_FollowMaster(oClicker);

       AssignCommand(oClicker,ActionDoCommand(SignalEvent(oSelf,
       EventUserDefined(9006))));
     }

  else // A different script was required for npc's. Go figure.
     {
        // Allows for npc to perform the door open animation before
        // jumping to the destination. Otherwise the npc will still be
        // performing the door open animation when he transitions and sometimes
        // transitions back to his original location.
        DelayCommand(1.0,AssignCommand(oClicker,JumpToObject(oDest)));


          // When an NPC is chasing a player, he sometimes transitions to an
          // area before player does then leaves when he sees
          // nothing and\or WalkWaypoints fires. This gives him something else
          // to do for a half second (like walk behind the door.. geesh).
          DelayCommand(1.2,AssignCommand(oClicker,
          ActionMoveAwayFromObject(oDest,FALSE,0.1)));

          // I'm sick of re-writing the bw ai. It's assumed that
          // if no enemy is present or the npc is not in combat,
          // DetermineCombatRound will do nothing.
          DelayCommand(1.2,AssignCommand(oClicker,
          ActionDoCommand(DetermineCombatRound())));


        DelayCommand(3.0,SignalEvent(oSelf,EventUserDefined(9006)));

     }

}

}

void a_FollowMaster(object oMaster)
{
  float fDist = GetFollowDistance();
  ActionForceFollowObject(oMaster,fDist);

}

void b_FollowMaster(object oMaster)
{
    object oAssociate = GetFirstFactionMember(oMaster,FALSE);
    while(oAssociate != OBJECT_INVALID)
    {

        if(GetAssociateType(oAssociate)!= ASSOCIATE_TYPE_NONE)
          {
            if(GetAssociateState(NW_ASC_MODE_STAND_GROUND,oAssociate) == TRUE)
            {SetAssociateState(NW_ASC_MODE_STAND_GROUND,FALSE,oAssociate);}

            if(oMaster != OBJECT_INVALID)
            {AssignCommand(oAssociate,a_FollowMaster(oMaster));}

          }
        oAssociate = GetNextFactionMember(oMaster,FALSE);
    }
}


