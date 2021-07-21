//::///////////////////////////////////////////////
//:: On Conversation
//:: speaksitting
//:: Created By: Hillary Skeryanc-Mann
//:: Created On: March 22, 2003
//:://////////////////////////////////////////////
void main()
{
    if(GetCommandable(OBJECT_SELF)){
      {
          BeginConversation();
      }
    ClearAllActions();
    string sMyTagName = GetTag(OBJECT_SELF);
    string sChairTag = "Seat";
    string sFloorTag = "FLOOR_" + sMyTagName;
    object oSitplace = GetNearestObject();
    if (GetTag (oSitplace) == sChairTag)
        {
            int nChair = 1;
            object oChair;
            oChair = GetNearestObjectByTag(sChairTag, OBJECT_SELF, nChair);
            ActionSit(oChair);
        }
    else if (GetTag (oSitplace) == sFloorTag)
        {
            int nChair = 1;
            object oChair;
            oChair = GetNearestObjectByTag(sFloorTag, OBJECT_SELF, nChair);
            ActionDoCommand( ActionPlayAnimation( ANIMATION_LOOPING_SIT_CROSS,0.0,4000.0) ) ;
        }
     }
}
