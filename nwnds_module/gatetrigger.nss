//******************************************************************************
//* stargatish portal script put on_disturbed for dhd
//* written by BWW aka Lord Nikon
//* 12/05/04
//* Triggers the gate transition when player steps across it
//******************************************************************************

void main()
{
object oPC = GetEnteringObject();
location oTarget = GetLocalLocation(oPC,"GATEADDY");
object oGATE = GetLocalObject(oPC,"GATETARGET");
object oOFF = GetNearestObjectByTag("stargate_on");
location lOFF = GetLocation(oOFF);
object oON = GetNearestObjectByTag("stargate_on",oGATE);
location lON = GetLocation(oON);
object oONE;
 //turns off gates 20 sec after they step through
 //local gate
 DestroyObject(oOFF,20.0);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_off",lOFF);
 //destination gate
 DestroyObject(oON,20.0);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_off",lON);
//transports pc
AssignCommand(oPC,ActionJumpToLocation(oTarget));
//resets code
SetCampaignString("SPENCER","sCode","",oPC);
}
