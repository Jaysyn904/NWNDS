/////////////////////////////////////////////////
/*
       Summon guard if attacked.

       If the Player attacking the door is in
       the line of sight of the Defender he will respond.
       This is not the same as a perception event and the
       guard may not normally have percieved the action.

       Variables set on the Defender(at spawn in);
       int  "DEFENDER" 1

*/
/////////////////////////////////////////////////
#include "nw_i0_generic"
void GoHostile(object oPC, object oDefender);
void main()
{
if(GetLocalInt(OBJECT_SELF,"FoundDefender") == TRUE)
  {return;}
else
  {
    SetLocalInt(OBJECT_SELF,"FoundDefender",TRUE);

    //don't call for help for 5 more rounds
    DelayCommand(30.0,DeleteLocalInt(OBJECT_SELF,"FoundDefender"));

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
                object oPC = GetLastHostileActor();
                if(LineOfSightObject(oDefender,oPC) == TRUE)
                {
                     vector vFacing = GetPosition(oPC);
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
}
void GoHostile(object oPC, object oDefender)
{
   SetIsTemporaryEnemy(oPC,oDefender,TRUE);
   if(GetAssociateType(oPC) != ASSOCIATE_TYPE_NONE)
   {
     object oMaster = GetMaster(oPC);
     SetIsTemporaryEnemy(oMaster,oDefender,TRUE);
   }
}
