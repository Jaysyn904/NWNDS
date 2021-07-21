object oAlc = OBJECT_SELF;
string sTag1,sTag2,sTag3,sTag4,sType,sTag = "";
string sReg1,sReg2,sReg3,sReg4 = "";
object oPC = GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
object oItem;
string sItem = "";
int nStack = 1;
void main()
{
// Set up first reagent

sTag = GetTag(GetInventoryDisturbItem());
if (sTag == "kartangegg") {
SetLocalString(oAlc, "Reg1", "i");
//FloatingTextStringOnCreature("Debug "+ sTag,oPC,FALSE);
DestroyObject(GetInventoryDisturbItem());
}

if (sTag == "drakeblood") {
SetLocalString(oAlc, "Reg1", "df");
//FloatingTextStringOnCreature("Debug "+ sTag,oPC,FALSE);
DestroyObject(GetInventoryDisturbItem());
}



if (sTag == "Brimstone" || sTag == "IceNine" || sTag == "AcidCrystal" || sTag == "ChargedCrystal") {
if (sTag == "Brimstone")
sType = "f";
if (sTag == "IceNine")
sType = "i";
if (sTag == "AcidCrystal")
sType = "a";
if (sTag == "ChargedCrystal")
sType = "c";
SetLocalString(oAlc, "Reg3", sType);
//FloatingTextStringOnCreature("Debug "+ sTag+" "+sType,oPC,FALSE);
DestroyObject(GetInventoryDisturbItem());
}

sTag = GetStringLowerCase(sTag); // temp while we fix tags
if (GetSubString(sTag,0,5) == "steel") {
SetLocalString(oAlc, "Reg2", GetSubString(sTag,5,20));
DestroyObject(GetInventoryDisturbItem());
//FloatingTextStringOnCreature("Debug "+sTag+" "+GetSubString(sTag,5,20),oPC,FALSE);
}


if ((GetLocalString(oAlc, "Reg1") != "") && (GetLocalString(oAlc, "Reg2") != "") && (GetLocalString(oAlc, "Reg3") != "")){
sItem = GetLocalString(oAlc, "Reg1")+GetLocalString(oAlc, "Reg3")+ GetLocalString(oAlc, "Reg2");
DeleteLocalString(oAlc, "Reg1");
DeleteLocalString(oAlc, "Reg2");
DeleteLocalString(oAlc, "Reg3");
}



if (sItem != "") {
//sItem = "Nothing was created with that formula";
//FloatingTextStringOnCreature("You made "+ sItem,oPC,FALSE);
CreateItemOnObject(sItem, oAlc, nStack);
}

}
