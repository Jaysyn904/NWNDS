//PRC Compatible ILR script
//Version : 0.7
//Written by: Silvercloud (scl.vcs-online.com) and Ornedan
//Heavily modified from: script by Zanth (of the Legends of Cormyr server: http://www.legendsofcormyr.com/)
//Usage: Needs to be in onequip script event of your module
//
// This script uses valuebased ILR checking (which takes into account PRC items), that can be
// overridden by usage of the "ilr_custom_override" variable (integer) on an item.
//
// Additionally it allows for you to set a deity variable called "ilr_deity" (string) so that
// only if the player has that Deity name in his deity field will he be able to equip the item.
//
// And lastly you can forbid by type of item versus deity as well (which you will need to script
// by hand) and i have included an example of forbidding short swords to akadi worshippers
//
// Note: you do NOT need to set the module to item level restrictions on, you just have to put this
// script in the onequip script under module properties.
//
// 0.4 note: should now properly unequip.
// 0.5 note: cheat prevention added with thanks to Evergrey.
// 0.6 note: changed the values in the file to reflect bioware 2da and ignore projectiles.
// 0.7 note: added plot item checking (switch)
//
// It should be quite easy to add your own checks to this script.
// Just add your own restriction block to the main() and make your own
// testing function that returns an itemRestriction structure. - Ornedan
//
// Handling Projectiles - Due to bioware engine auto-equipping feature on projectiles
// you could end up with an endless loop,by default the script now ignores
// projectiles for ILR (since any single projectile would never amount to more than 300 coins
// anyway, it makes sense to ignore it)
// Use the switch to determine behaviour if you want it changed - Silvercloud

//---------------------SWITCHES-------------------------\\

// Set this to true if you want to completely ignore IRL checking for projectiles.
const int IGNORE_PROJECTILES = TRUE;
const int CHECK_PLOT_ITEMS = TRUE;


//-------------------END SWITCHES------------------------\\

//These two constants are the variables you would set on an item to set it to either override
//the value based ilr with this level or deity worshipped item only .
const string ILR_VARIABLE_NAME = "ilr_custom_override";
const string ITEM_DEITY_NAME = "ilr_deity";


// A structure for passing data around the functions here.
struct itemRestriction{
// This determines whether the wielder is allowed to wield the item
// Values to use:
// -1   Item use forbidden by this test, stop further testing.
//  0   Item use allowed by this test, pass to next test.
//  1   Item use allowed by this test, stop further testing.
int nAllow;
// Message to send to the equipping PC. This is ignored if nAllow is 0.
string sMessage;
};


void actionForceUnequipItem(object oItem, object oPlayer, string sMessage);
int GetIsInstanceOfPRCItem(string sResRef);
struct itemRestriction GetDeityRestriction(string sDeity, object oItem, object oPC);
struct itemRestriction GetItemLevelRestriction(object oItem, object oPC);


void main()
{
    object oPC = GetPCItemLastEquippedBy();
    object oItem = GetPCItemLastEquipped();
    int iTyp = GetBaseItemType(oItem);
    // Handle special PRC class items
    string sResRef = GetResRef(oItem);
    if(GetIsInstanceOfPRCItem(sResRef)) return;
    if (IGNORE_PROJECTILES)
    {
        if(iTyp == BASE_ITEM_ARROW)return;
        if(iTyp == BASE_ITEM_BOLT)return;
        if(iTyp == BASE_ITEM_BULLET)return;
        if(iTyp == BASE_ITEM_DART)return;
        if(iTyp == BASE_ITEM_SHURIKEN)return;
        if(iTyp == BASE_ITEM_THROWINGAXE)return;
    }


    // DMs get to equip whatever they like
    if(!GetIsDM(oPC) && GetIsPC(oPC))
    {
        struct itemRestriction Result;

        // Example restriction block
        /*
        dataType Foo = GetData(oPC);
        Result = GetSomeRestriction(foo, oItem, oPC);

        switch(Result.nAllow){
        case -1: actionForceUnequipItem(oItem, oPC, Result.sMessage);
        case 0:  break;

        case 1:  if(Result.sMessage != "") SendMessageToPC(oPC, Result.sMessage);
        return;
        }
        */


        // Handle deity restriction
        string sDeity = GetDeity(oPC);
        Result = GetDeityRestriction(sDeity, oItem, oPC);

        switch(Result.nAllow){
            case -1: actionForceUnequipItem(oItem, oPC, (Result.sMessage != "" ? Result.sMessage : sDeity + " does not allow you to wield " + GetName(oItem)));
            case 0:  break;

            case 1:  if(Result.sMessage != "") SendMessageToPC(oPC, Result.sMessage);
            return;
        }


        // Handle restriction by item level
        Result = GetItemLevelRestriction(oItem, oPC);
        switch(Result.nAllow){
            case -1: actionForceUnequipItem(oItem, oPC, Result.sMessage);
            case 0:  break;

            case 1:  if(Result.sMessage != "") SendMessageToPC(oPC, Result.sMessage);
            return;
        }
    }
}




/* Makes the player unequip the given item and sends any non-empty sMessage to
* them.
*/
void actionForceUnequipItem(object oItem, object oPlayer, string sMessage = "")
{
    if(sMessage != "") SendMessageToPC(oPlayer, sMessage);
    //Brute force unequip makes it virtually impossible to bypass and cheat.
    DelayCommand(0.5, AssignCommand(oPlayer, ActionUnequipItem(oItem)));
    DelayCommand(0.8, AssignCommand(oPlayer, ActionUnequipItem(oItem)));
    DelayCommand(1.1, AssignCommand(oPlayer, ActionUnequipItem(oItem)));
    DelayCommand(1.4, AssignCommand(oPlayer, ActionUnequipItem(oItem)));
}


/* This checks to see if the resref of the given item matches with
* the resref of one of the special PRC class items.
*/
int GetIsInstanceOfPRCItem(string sResRef)
{
    if(sResRef == "base_prc_skin")    return TRUE;
    if(sResRef == "pnp_shft_tstpkup") return TRUE;
    if(sResRef == "listenerhide")     return TRUE;
    if(sResRef == "shifterhide")      return TRUE;
    if(sResRef == "lichamulet")       return TRUE;
    if(sResRef == "soul_gem")         return TRUE;
    if(sResRef == "platinumarmor4")   return TRUE;
    if(sResRef == "platinumarmor6")   return TRUE;
    if(sResRef == "platinumarmor8")   return TRUE;
    if(sResRef == "wp_arr_imbue_1")   return TRUE;
    if(sResRef == "runescarreddagge") return TRUE;
    if(sResRef == "codi_mw_katana")   return TRUE;
    if(sResRef == "codi_mw_short")    return TRUE;

    return FALSE;
}


/* Checks to see whether the deity lets the player use the item.
* Returned results:
* -1   The deity forbids the use of the item. The player cannot wield
*      it, no matter what.
*  0   The deity does not care one way or another. Other limitations
*      apply as normal.
*  1   The deity helps the player wield the item. They can wield it
*      even if they normally could not.
*/
struct itemRestriction GetDeityRestriction(string sDeity, object oItem, object oPC)
{
    struct itemRestriction Result;
    Result.nAllow = 0;
    Result.sMessage = ""; //In case there is a special message.

    sDeity = GetStringLowerCase(sDeity);


    /* Do your checks here */

    //example of forbidding short swords to akadi worshippers
    /*
    if(sDeity == "akadi" && GetBaseItemType(oItem) == BASE_ITEM_SHORTSWORD)
    {
    Result.nAllow = -1;
    Result.sMessage = "Akadi forbids the use of this type of item."
    }
    */



    // See if the item is limited to followers of a single deity only
    // and if so, whether the player follows said deity
    string sItemDeity = GetStringLowerCase(GetLocalString(oItem, ITEM_DEITY_NAME));
    if(sItemDeity != "")
    {
        if(sItemDeity != sDeity)
        {
            Result.nAllow = -1;
            Result.sMessage = "This item is restricted to followers of " + sItemDeity + ".";
        }
    }

    return Result;
}


struct itemRestriction GetItemLevelRestriction(object oItem, object oPC)
{
    struct itemRestriction Result;
    Result.nAllow = 0;
    Result.sMessage = "";

    int iItemLevel = 1;
    int iClassLevel = GetLevelByPosition(1,oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC);

    if(GetLocalInt(oItem, ILR_VARIABLE_NAME))
    {
        iItemLevel = GetLocalInt(oItem, ILR_VARIABLE_NAME);
    }
    else
    {

       int iGPValue = GetGoldPieceValue(oItem);

        // Code to check for plotitem and restrict it by its internal value:
        // only runs if set (=default)
        if (CHECK_PLOT_ITEMS)
        {
            if (GetPlotFlag(oItem) == TRUE)
            {
                SetPlotFlag(oItem, FALSE);
                int iGPValue = GetGoldPieceValue(oItem);
                SetPlotFlag(oItem, TRUE);
            }
        }

        if (iGPValue > 4000000) iItemLevel = 40;
        else if (iGPValue > 3800000) iItemLevel = 39;
        else if (iGPValue > 3600000) iItemLevel = 38;
        else if (iGPValue > 3400000) iItemLevel = 37;
        else if (iGPValue > 3200000) iItemLevel = 36;
        else if (iGPValue > 3000000) iItemLevel = 35;
        else if (iGPValue > 2800000) iItemLevel = 34;
        else if (iGPValue > 2600000) iItemLevel = 33;
        else if (iGPValue > 2400000) iItemLevel = 32;
        else if (iGPValue > 2200000) iItemLevel = 31;
        else if (iGPValue > 2000000) iItemLevel = 30;
        else if (iGPValue > 1800000) iItemLevel = 29;
        else if (iGPValue > 1600000) iItemLevel = 28;
        else if (iGPValue > 1400000) iItemLevel = 27;
        else if (iGPValue > 1200000) iItemLevel = 26;
        else if (iGPValue > 1000000) iItemLevel = 25;
        else if (iGPValue > 750000)  iItemLevel = 24;
        else if (iGPValue > 500000)  iItemLevel = 23;
        else if (iGPValue > 250000)  iItemLevel = 22;
        else if (iGPValue > 130000)  iItemLevel = 21;
        else if (iGPValue > 110000)  iItemLevel = 20;
        else if (iGPValue > 90000)   iItemLevel = 19;
        else if (iGPValue > 75000)   iItemLevel = 18;
        else if (iGPValue > 65000)   iItemLevel = 17;
        else if (iGPValue > 50000)   iItemLevel = 16;
        else if (iGPValue > 40000)   iItemLevel = 15;
        else if (iGPValue > 35000)   iItemLevel = 14;
        else if (iGPValue > 30000)   iItemLevel = 13;
        else if (iGPValue > 25000)   iItemLevel = 12;
        else if (iGPValue > 19500)   iItemLevel = 11;
        else if (iGPValue > 15000)   iItemLevel = 10;
        else if (iGPValue > 12000)   iItemLevel = 9;
        else if (iGPValue > 9000)    iItemLevel = 8;
        else if (iGPValue > 6500)    iItemLevel = 7;
        else if (iGPValue > 5000)    iItemLevel = 6;
        else if (iGPValue > 3500)    iItemLevel = 5;
        else if (iGPValue > 2500)    iItemLevel = 4;
        else if (iGPValue > 1500)    iItemLevel = 3;
        else if (iGPValue > 1000)     iItemLevel = 2;
    }

    if (iItemLevel > iClassLevel)
    {
        Result.nAllow = -1;
        Result.sMessage = "You are not high enough level to equip " + GetName(oItem) + ", you must be at least level: " + IntToString(iItemLevel) + ".";
    }

    return Result;
}
