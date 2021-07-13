/////////////////////////////////////////
/*
   Generic door OnFailToOpen event

   - if the tag of the door is "barred" when this
     event fires, the door will speak the string
     "The door is barred from the other side"

   -If a LocalInt "GREETING" is assigned to the door
    and is TRUE,
       a). the event starts a conversation using the
           door's tag as the resref for the dialog.

           ie: If the door's tag is Door01, save the conversation file
               as door01. To avoid any potential glitches, the door's
               tag should probably be all lower case.

       b). SetLocalObject(oPC,"oDoor",OBJECT_SELF); is used
           so GetLocalObject can be used as a reference within
           the conversation. The following shoule be included
           in the door's dialog OnConversation End Event;

              object oPC = GetPCSpeaker();
              DeleteLocalObject(oPC,"oDoor");

*/
////////////////////////////////////////
void main()
{

string sTag = GetTag(OBJECT_SELF);
string sDialogResRef=sTag;

if(sTag == "barred")
   {SpeakString("The door is barred from the other side");}
else
   {
     if(GetLocalInt(OBJECT_SELF,"GREETING") == FALSE)
         {return;}
     else
         {
           object oPC = GetClickingObject();

           if(GetIsPC(oPC) == FALSE)
             {return;}
           else
             {
               SetLocalObject(oPC,"oDoor",OBJECT_SELF);
               ActionStartConversation(oPC,sDialogResRef,TRUE,FALSE);
             }
        }
   }
}
