//******************************************************************************
//* stargatish portal script put on_open for dhd
//* written by BWW aka Lord Nikon
//* 12/05/04
//* Places the Dialup Runes into the inventory and resets the code
//******************************************************************************

void main()
{
  object oPC = GetLastOpenedBy();
  object oSelf = OBJECT_SELF;
  string sTagSelf = GetTag(oSelf);
  string sCode = "";

 SetCampaignString("SPENCER","sCode",sCode,oPC); // initialize portal code to null

 CreateItemOnObject("a_rune",OBJECT_SELF,1); //A rune
 CreateItemOnObject("a_rune001",OBJECT_SELF,1); //B rune
 CreateItemOnObject("a_rune002",OBJECT_SELF,1); //C rune
 CreateItemOnObject("a_rune003",OBJECT_SELF,1); //D rune
 CreateItemOnObject("a_rune004",OBJECT_SELF,1); //E rune
 CreateItemOnObject("a_rune005",OBJECT_SELF,1); //F rune
 CreateItemOnObject("a_rune006",OBJECT_SELF,1); //G rune
 CreateItemOnObject("a_rune007",OBJECT_SELF,1); //Motis trigger

}


