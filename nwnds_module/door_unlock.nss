/////////////////////////////////////////////////
/*
       Summon guard if unlocked.

       Variables set on the Defender(at spawn in);
       int  "DEFENDER" 1

*/
/////////////////////////////////////////////////
#include "nw_i0_generic"
void GoHostile(object oPC, object oDefender);
void main()
{
     object oDest = GetTransitionTarget(OBJECT_SELF);
     object oPC = GetLastUnlocked();
     SetLocked(oDest,FALSE);
/*
    if(GetAssociateType(oNPC) != ASSOCIATE_TYPE_NONE)
       {oPC = GetMaster(oPC);}
*/
    int bDefender;
    int nth = 1;
    object oDefender = GetNearestObject(OBJECT_TYPE_CREATURE,OBJECT_SELF,nth);

    while(oDefender != OBJECT_INVALID)
    {
        bDefender = GetLocalInt(oDefender,"DEFENDER");

        // Am I a defender
        if(bDefender == TRUE)
        {
            if(GetIsInCombat(oDefender) == FALSE)
            {

                if(LineOfSightObject(oDefender,oPC) == TRUE)
                {
                     vector vFacing = GetPosition(oPC);
                     //SetIsTemporaryEnemy(oPC,oDefender,TRUE);
                     GoHostile(oPC,oDefender);
                     AssignCommand(oDefender,ClearAllActions());
                     AssignCommand(oDefender,SetFacingPoint(vFacing));
                     AssignCommand(oDefender,SpeakString("Stop theif!"));
                     AssignCommand(oDefender,PlayVoiceChat(VOICE_CHAT_BATTLECRY1));
                     AssignCommand(oDefender,ActionForceMoveToObject(oPC,TRUE,4.0));
                     AssignCommand(oDefender,ActionDoCommand(DetermineCombatRound(oPC)));}
                }
          oDefender = OBJECT_INVALID;
        }
        else
        {
             nth=nth+1;
             oDefender = GetNearestObject(OBJECT_TYPE_CREATURE,OBJECT_SELF,nth);
        }
    }


}
void GoHostile(object oPC, object oDefender)
{
   object oFactionMember = GetFactionLeader(oPC);
   while(oFactionMember != OBJECT_INVALID)
   {
     SetIsTemporaryEnemy(oFactionMember,oDefender,TRUE);
     oFactionMember = GetNextFactionMember(oPC);
   }
}
