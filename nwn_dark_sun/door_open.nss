// closes door when when associate gets knocked behind door and
// opens it to follow Master
void main()
{

object oDest = GetTransitionTarget(OBJECT_SELF);
if(oDest == OBJECT_INVALID)
   {return;}
else
   {

      object oNPC = GetLastUsedBy();
      if(GetAssociateType(oNPC) != ASSOCIATE_TYPE_NONE)
        {DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF));}
   }
}
