//::///////////////////////////////////////////////
//:: Name Random OnFailToOpen Msg Generator - for Doors
//:: FileName ar_barreddoor_f2o
//::
//::
//////////////////////////////////////////////
/*  Use this script to show that the door can never be opened with random
    messages instead of just 1 (This door has been barred from the other
    side.) for example. A big thanks to Kevin Eberwein for giving me a hand
    making this work as well as a couple ideas to add to it.*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Werbenuk (Help from Kevin Eberwein)
//:: Created On: July 14, 2002
//:://////////////////////////////////////////////

void main()
    {
     object oPC = GetLastUsedBy();  // Get the PC that attempted to open the door.
     object oDoor = OBJECT_SELF;    // Gets the door this is being called from
     int nRandomMsg;
     int nVar;
     int nDoorNumber;

     nVar = GetLocalInt(oPC, "TYR_DOOR_01");
     nDoorNumber = GetLocalInt(OBJECT_SELF, "BARRED");

    if (nVar != 0)
        nRandomMsg = nVar;

    else
        nRandomMsg = Random(9);

    switch (nRandomMsg)
            {
                case 0:
                SpeakString("This door is barred from the other side.");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;

                case 1:
                SpeakString("As you reach for the door handle you notice, there isn't  one. Looks like you will have to try to find another way if there is.");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;

                case 2:
                SpeakString("As you turn the handle a voice bellows, 'Go away! Your not getting in here!'");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;

                case 3:
                SpeakString("Neither push nor pull can get this door open.");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;

                case 4:
                SpeakString("As you attempt entry you hear a 'Thud.' Obviously this door is blocked by some means");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;

                case 5:
                SpeakString("Approaching the door you get an overwhelming feeling of magic power. There seems to be some magical ward preventing this door from being opened.");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;

                case 6:
                SpeakString("Unfortunately you are not strong enough to open this door.");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;

                case 7:
                SpeakString("The sound of laughter seems to emminate from the door as it doesn't buldge.");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;

                case 8:
                SpeakString("Opening doors isn't your strong point, eh?");
                SetLocalInt(oPC, "TYR_DOOR_01", nRandomMsg);
                break;
            }
}
