#include "nw_i0_plot"
//******************************************************************************
//* stargatish portal script put on_disturbed for dhd
//* written by BWW aka Lord Nikon
//* 12/05/04
//* builds code for portal address then ports when player chooses the motis rune
//******************************************************************************
void main()
{
  object oPC = GetLastDisturbed();
  object oSelf = OBJECT_SELF;
  object oItem = GetInventoryDisturbItem();
  string sItemTag = GetTag(oItem);
  string sTagSelf = GetTag(oSelf);
  string sItemResRef;
  object oA = GetObjectByTag("A_Rune");
  object oB = GetObjectByTag("B_Rune");
  object oC = GetObjectByTag("C_Rune");
  object oD = GetObjectByTag("D_Rune");
  object oE = GetObjectByTag("E_Rune");
  object oF = GetObjectByTag("F_Rune");
  object oG = GetObjectByTag("G_Rune");
  object oM = GetObjectByTag("M_Rune");
  string sCode = "";
  //oOFF gets the local gate, oON gets the target gate
  object oOFF = GetNearestObjectByTag("stargate_off");
  location lOFF = GetLocation(oOFF);
  object oON;
  location lON;
// locations of gates to add just add a location line and the appropriate waypoint tag
  location oGATE1 = GetLocation(GetWaypointByTag("GATE1"));
  location oGATE2 = GetLocation(GetWaypointByTag("GATE2"));
  location oGATE3 = GetLocation(GetWaypointByTag("GATE3"));
  location oGATE4 = GetLocation(GetWaypointByTag("GATE4"));
  location oGATE5 = GetLocation(GetWaypointByTag("GATE5"));
  location oGATE6 = GetLocation(GetWaypointByTag("GATE6"));
  location oGATE7 = GetLocation(GetWaypointByTag("GATE7"));
  location oGATE8 = GetLocation(GetWaypointByTag("GATE8"));

 //code for interpreting the address uses base code from UO_Abagails crafting system modified for use here
  if (GetInventoryDisturbType()== INVENTORY_DISTURB_TYPE_ADDED)
   {
    // The following 3 lines are to ensure compatability with UOAbigal's Persistent Token System.
    // You can replace them with whatever 'no-drop' code you have or comment them out.
    string sNoDropFlag = (GetStringLeft(GetTag(oItem),6));
    if (sNoDropFlag == "NoDrop" || sNoDropFlag == "TOKEN_"||sNoDropFlag=="_TBOX_")
     return;
    if (GetBaseItemType(oItem)==BASE_ITEM_LARGEBOX)
     {
      DestroyObject(oItem);
      SendMessageToPC(oPC,"To avoid possible dupe exploits, the container placed in this bag may be destroyed.");
      return;
     }
    // End of compatability portion.
    CopyItem(oItem,oPC,TRUE);
    DestroyObject(oItem);
    FloatingTextStringOnCreature("You can only Activate by selecting runes.",oPC,FALSE);   return;
   }

//uses campaign string to save the code change the campaign name to whatever campaign database you want to use
sCode = GetCampaignString("SPENCER","sCode",oPC);    //gets global portal code


  if (oItem == oA)
    {sCode = sCode + "A";
     SetCampaignString("SPENCER","sCode",sCode,oPC);
    }
  if (oItem == oB)
    {sCode = sCode + "B";
    SetCampaignString("SPENCER","sCode",sCode,oPC);
    }

  if (oItem == oC)
    {sCode = sCode + "C";
    SetCampaignString("SPENCER","sCode",sCode,oPC);
    }

   if (oItem == oD)
    {sCode = sCode + "D";
    SetCampaignString("SPENCER","sCode",sCode,oPC);
    }
    if (oItem == oE)
    {sCode = sCode + "E";
    SetCampaignString("SPENCER","sCode",sCode,oPC);
    }

    if (oItem == oF)
    {sCode = sCode + "F";
    SetCampaignString("SPENCER","sCode",sCode,oPC);
    }

    if (oItem == oG)
     {sCode = sCode + "G";
     SetCampaignString("SPENCER","sCode",sCode,oPC);
    }

 CopyObject(oItem,GetLocation(oSelf),oSelf,GetTag(oItem));
 DestroyObject(oItem);

FloatingTextStringOnCreature(sCode,oPC,FALSE); //debug scode viewer

// if the trigger rune is pulled check code, if code valid open gate

if (oItem == oM)
{
//checks scode for valid entry, change this to whatever code/length you desire
//examples are 7 letter codes, make the code length whatever you want

if (sCode == "BADBABE")
{
 //set variables for destination
 SetLocalLocation(oPC,"GATEADDY",oGATE1);
 SetLocalObject(oPC,"GATETARGET",GetWaypointByTag("GATE1"));
 //turns on gate
 DestroyObject(oOFF);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lOFF);
 //turns on gate on other side at target
 oON = GetNearestObjectByTag("stargate_off",GetWaypointByTag("GATE1"),1);
 lON = GetLocation(oON);
 DestroyObject(oON);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lON);

}
if (sCode == "GABEDFC")
{
 SetLocalLocation(oPC,"GATEADDY",oGATE2);
 SetLocalObject(oPC,"GATETARGET",GetWaypointByTag("GATE2"));
 DestroyObject(oOFF);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lOFF);

 oON = GetNearestObjectByTag("stargate_off",GetWaypointByTag("GATE2"));
 lON = GetLocation(oON);
 DestroyObject(oON);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lON);
}
//example of a 3 letter code, codes can be any length as long as it will fit in
//a string variable
if (sCode == "ACABADE")
{
 SetLocalLocation(oPC,"GATEADDY",oGATE3);
 SetLocalObject(oPC,"GATETARGET",GetWaypointByTag("GATE3"));
 DestroyObject(oOFF);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lOFF);


 oON = GetNearestObjectByTag("stargate_off",GetWaypointByTag("GATE3"));
 lON = GetLocation(oON);
 DestroyObject(oON);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lON);
}
//Example of a gate address greater than 7 characters
if (sCode == "FEDABGC")
{
 SetLocalLocation(oPC,"GATEADDY",oGATE4);
 SetLocalObject(oPC,"GATETARGET",GetWaypointByTag("GATE4"));
 DestroyObject(oOFF);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lOFF);


 oON = GetNearestObjectByTag("stargate_off",GetWaypointByTag("GATE4"));
 lON = GetLocation(oON);
 DestroyObject(oON);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lON);
}
if (sCode == "BADBEEFEGAD")
{
 SetLocalLocation(oPC,"GATEADDY",oGATE5);
 SetLocalObject(oPC,"GATETARGET",GetWaypointByTag("GATE5"));
 DestroyObject(oOFF);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lOFF);


 oON = GetNearestObjectByTag("stargate_off",GetWaypointByTag("GATE5"));
 lON = GetLocation(oON);
 DestroyObject(oON);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lON);
}
if (sCode == "DEADCABGEF")
{
 SetLocalLocation(oPC,"GATEADDY",oGATE6);
 SetLocalObject(oPC,"GATETARGET",GetWaypointByTag("GATE6"));
 DestroyObject(oOFF);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lOFF);


 oON = GetNearestObjectByTag("stargate_off",GetWaypointByTag("GATE6"));
 lON = GetLocation(oON);
 DestroyObject(oON);
 CreateObject(OBJECT_TYPE_PLACEABLE,"stargate_on",lON);
}

SetCampaignString("SPENCER","sCode",sCode);
}


} //main

