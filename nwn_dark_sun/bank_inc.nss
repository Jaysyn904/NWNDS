//::///////////////////////////////////////////////
//:: bank_inc.nss
//:: Bank Vault include file
//:: Version 1.9
//:://////////////////////////////////////////////
/*
  1.0 Orginal Version
  1.1 Fixed problem with multiple opens where items from
      First opener where assign to Second, third, etc PC.
      OnDisturb checks to see if PC Adding/Removing items
      is the orginal Opener.  Returns items if not.
  1.2 Made workaround for Blank Template Problem.  OnDistrub returns
      any items or Containers that have or contain a blank Template
      returned by GetResRef() function back to original PC.
      Made workaround for Multiple PC problem.  Any PC opening Chest
      other then original PC will be teleported to the closest waypoint
      (WP_BankLobby) and told to wait their turn. :)
  1.3 Fixed Blank Template Bug.  Items that are split or bought from
      Merchants can now be placed into the Bank Vault.
      Fixed problem where item were being listed as unidentified even though
      they were list as ID when placed into Bank Vault.
  1.4 Added a Storage Limit variable to limit items per PC that can be stored
      into Bank Chest.  Currently set to 20.  Change the iStorageLimit variable
      in the bank_inc.nss file to increase/decrease.
  1.5 Fixed problem where gold was duplicating or dissapearing when adding more
      then 50000 gold pieces to the Bank Chest.  Changed Bank Chest so that you
      don't need a WayPoint to transport any additonal PC's trying to access chest
      after the first.
  1.6 Added the ability to switch the Bank Chest(s) to be either Module wide Chests
      (the same items appear no matter what Area you are in the Module), or Local
      Chests (Items are stored in a Area can only be retrieved in that Area).  These
      options are controled by the "BankModule" variable in the Bank_inc.nss file.
      Added a switch that will store all PC Bank Vault data into a single database,
      (default "BankVault"), or create a seperate database for each Players's PC.
      This should help in Persistent Worlds with cleaningup character data.
      This is controlled with the "iSingleCamp" variable in the Bank_inc.nss file.
  1.7 Added ablility to store unique objects that are not in the Module Pallette (aka no ResRef).
      PC's can now store items from other modules into the BankVault.  Added a
      Anti-spam fixed to prevent users from duplicating items in BankVault.
  1.8 Added Hash code for Database tag names to break 32 character barrier in both Bank Vault
      and Personal Vault.  NOTE: This makes version 1.8 uncompatible with any previous versions
      of Bank Vault.  NEW: Personal Storage Vaults with Access Control.  You can now
      assign a Vault to a indiviual owner.  This owner can specify his own set of friends
      that can access his/her Vault all in game and real time.  See instructions.
  1.9 Added the ability to switch the Bank Chest(s) to either have a seperate Vault
      for each Player's PC or to have a single Vault Space shared by every PC a Player
      creates. This is controlled with the "iPCGlobal" variable in the Bank_inc.nss file.
      Added the ability for the user to identify the Player by either his/her Player Name
      or by his/her Public CD Key.  This is controlled with the "iCDKey" variable in the
      Bank_inc.nss file.  This ability is only valid if you are using a single Vault Space.
      Fixed a duping exploit.

*/
//:://////////////////////////////////////////////
//:: Created By: Clayten Gillis (a.k.a DragonsWake)
//:: Created On: December 17, 2002
//:://////////////////////////////////////////////



// Variable Declarations

// Print Debug Statements.  Set to '1' to Print Debug statements to PC
int Debug = 0;

// Set BanksModule = 1 for Module wide Bank. Set BankModule = 0 for Local Banks.
int BankModule = 1;

// Set the Chest to being opened for the first time (Do Not Modify)
int iBankFirstTime = 0;
int iCurUse;
int iLastUse;

// Storage Limit for Bank Chest.  This limits how many items per PC that can be stored.
int iStorageLimit = 20;

// Campaign Name for Bank Vault.  Default is BankVault

string sCampName = "BankVault";
string sDataName = "";

// Single Campaign Database.  If set to 1 it will open a single Database called
// "BankVault".  If set to 0 it will open a database for each individual PC.

int iSingleCamp = 1;

// Set Value for Global Indentifier on Bank Chest.
// 0 = Uses PC Player Name and PC Name for ID. Most unique solution. Each PC created
// by player has his/her own Vault space
// 1 = Uses PC Player Name or PC Public CD Key only for ID.  Each PC created by Player shares a single
// Vault space

int iPCGlobal = 1;

// Specify if you want to use 1 = Public CD Key or 0 = PC Player Name.

int iCDKey = 1;

// Internal Identifiers of storage variables. (Do Not Modify)
string sBankBP = "BankItemBP";
string sBankUQ = "BankItemUQ";
string sBankItemID = "BankItemID";
string sBankGold = "BankGold";
string sBankStack = "BankStkAmt";
string sBankFirst = "BankFrist";
int iHeaderCount = 0;
int iStackAmt = 0;
object oCurInvObj;
object oItemID;
string sBankKey = "";
string sEventTime = "BankEvent";
int iUnique = 0;
int iTotalLen;
int iAscii;
int iHashCount;
string sHashTable = " ! #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}";
int iMasque = 1;

int HashID(string sIDString)
{
    int iHash = 1299827;
    iHashCount = 0;
    iTotalLen = GetStringLength(sIDString);
    while ( iHashCount != iTotalLen )
    {
        iHashCount++;
        iAscii = 31 + FindSubString(sHashTable, GetSubString(sIDString, iHashCount, 1));
        iHash += iAscii << (8 * ((iHashCount - 1) & iMasque));

    }
    return iHash;
}

// GetKey() Taken from PWDB Include written by Valerio Santinelli - tanis@mediacom.it
// Determine an Object's key.
string GetKey(object oTarget, int iOpenTest)
{
    string sKey;

    if (GetIsPC(oTarget))
    {
        if ( iPCGlobal == 0 )
        {
            sKey = GetPCPlayerName(oTarget) + "_" + GetName(oTarget);
        }
        else
        {
            if ( iCDKey == 0 )
            {
                sKey = GetPCPlayerName(oTarget);
                SendMessageToPC(oTarget, "Key1: "+sKey);
            }
            else
            {
                if ( iCDKey == 1 )
                {
                    sKey = GetPCPublicCDKey(oTarget);
                    SendMessageToPC(oTarget, "Key2: "+sKey);
                }
            }
        }
        if (iOpenTest)
        {
            sKey = GetPCPlayerName(oTarget) + "_" + GetName(oTarget);
        }

    }
    else
    {
        //location lLoc = GetLocation(oTarget);
        //vector vLoc = GetPositionFromLocation(lLoc);
        //int iVec1 = FloatToInt(vLoc.x);
        //int iVec2 = FloatToInt(vLoc.y);
        //int iVec3 = FloatToInt(vLoc.z);
        object oArea = GetArea(oTarget);
        string sAreaName = GetName(oArea);
        //string sLoc = IntToString(iVec1) + IntToString(iVec2) + IntToString(iVec3);
        sKey = GetTag(oTarget) + sAreaName;
//       + GetName(oTarget)
    }
    return sKey;
}

int EncodeGold (object oPC, object oCurItem, int iItemCount, string sItemName, string sCampName, string sAreaKey)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    iStackAmt = GetNumStackedItems(oCurItem);
    if (iStackAmt > 50000)
    {
        int i;
        int iDivision = iStackAmt / 50000;
        int iModulo = iStackAmt % 50000;
        for (i = 0; i < iDivision; i++)
        {
            SetCampaignInt(sCampName, IntToString(HashID(sBankGold + IntToString(iItemCount) + sAreaKey)), 50000, oItemID);
            SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), sItemName, oItemID);
            iItemCount = iItemCount + 1;

            if (Debug)
            {
                SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
                SendMessageToPC(oPC, "This is Gold. StackSize "+IntToString(50000));
                SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
                SendMessageToPC(oPC, "ResRef: "+sItemName);
                SendMessageToPC(oPC, "----------");
            }
        }

        SetCampaignInt(sCampName, IntToString(HashID(sBankGold + IntToString(iItemCount) + sAreaKey)), iModulo, oItemID);
        SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), sItemName, oItemID);

        if (Debug)
        {
            SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
            SendMessageToPC(oPC, "This is Gold. StackSize "+IntToString(iModulo));
            SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
            SendMessageToPC(oPC, "ResRef: "+sItemName);
            SendMessageToPC(oPC, "----------");
        }

    }
    else
    {
        SetCampaignInt(sCampName, IntToString(HashID(sBankGold + IntToString(iItemCount) + sAreaKey)), iStackAmt, oItemID);
        SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), sItemName, oItemID);

    // Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "This is Gold. StackSize "+IntToString(iStackAmt));
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+sItemName);
        SendMessageToPC(oPC, "----------");
    }
    }
    return iItemCount;
}

void EncodeItem (object oPC, object oCurItem, int iItemCount, string sItemName, string sCampName, string sAreaKey, int iItemUnq)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), sItemName, oItemID);

    if ( GetIdentified(oCurItem) )
    {
        SetCampaignInt(sCampName, IntToString(HashID(sBankItemID + IntToString(iItemCount) + sAreaKey)), 1, oItemID);
    }
    else
    {
        SetCampaignInt(sCampName, IntToString(HashID(sBankItemID + IntToString(iItemCount) + sAreaKey)), 0, oItemID);
    }

    if (iItemUnq)
    {
        StoreCampaignObject(sCampName, IntToString(HashID(sBankUQ + IntToString(iItemCount) + sAreaKey)), oCurItem, oItemID);
    }
    //Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "This is an Item.");
        SendMessageToPC(oPC, "Valid Object: " + IntToString(GetIsObjectValid(oCurItem)) );
        if ( !iItemUnq )
        {
            SendMessageToPC(oPC, "ResRef: "+sItemName);
        }
        else
        {
            SendMessageToPC(oPC, "ResRef: Unique");
        }
        SendMessageToPC(oPC, "Identified?: " + IntToString(GetIdentified(oCurItem)));
        SendMessageToPC(oPC, "----------");
    }

    return;
}

int EncodeStackItem (object oPC, object oCurItem, int iItemCount, string sCampName, string sAreaKey, int iItemUnq)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }

    string sItemName;
    if (!iItemUnq)
    {
        iStackAmt = GetNumStackedItems(oCurItem);

        SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), "STACK", oItemID);
        iItemCount = iItemCount + 1;
        SetCampaignInt(sCampName, IntToString(HashID(sBankStack + IntToString(iItemCount) + sAreaKey)), iStackAmt, oItemID);

        string sItemName = GetResRef(oCurItem);

        if ( sItemName == "" )
        {
            sItemName = GetTag(oCurItem);
        }


        SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), sItemName, oItemID);


    }
    else
    {
        SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), "STACKUNQ", oItemID);
        iItemCount = iItemCount + 1;
        sItemName = "UNIQUE";
        SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), sItemName, oItemID);
        StoreCampaignObject(sCampName, IntToString(HashID(sBankUQ + IntToString(iItemCount) + sAreaKey)), oCurItem, oItemID);
    }

    if ( GetIdentified(oCurItem) )
    {
        SetCampaignInt(sCampName, IntToString(HashID(sBankItemID + IntToString(iItemCount) + sAreaKey)), 1, oItemID);
    }
    else
    {
        SetCampaignInt(sCampName, IntToString(HashID(sBankItemID + IntToString(iItemCount) + sAreaKey)), 0, oItemID);
    }

    //Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "Stack Item. StackSize: "+IntToString(iStackAmt));
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+ sItemName );
        SendMessageToPC(oPC, "Identified?: " + IntToString(GetIdentified(oCurItem)));
        SendMessageToPC(oPC, "----------");
    }

    return iItemCount;
}

int EncodeContainer (object oPC, object oCurItem, int iItemCount, string sItemName, string sCampName, string sAreaKey, int iItemUnq)
{
    iHeaderCount = 0;
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "Encode Container ROUTINE");
    }

    if (!iItemUnq)
    {
        SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), "CONTAIN", oItemID);
    }
    else
    {
        SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), "CONTAINUNQ", oItemID);
    }
    iHeaderCount = iHeaderCount + 1;

    iItemCount = iItemCount + 1;

    EncodeItem(oPC, oCurItem, iItemCount, sItemName, sCampName, sAreaKey, iItemUnq);

    oCurInvObj = GetFirstItemInInventory(oCurItem);

    while ( GetIsObjectValid(oCurInvObj) == TRUE || GetResRef(oCurInvObj) == "nw_it_gold001")   //Begin Processing Item in Inventory
    {

        iItemCount = iItemCount + 1;

        sItemName = GetResRef(oCurInvObj);
        if ( sItemName == "" )
        {
            //sItemName = GetTag(oCurInvObj);
            //if (sItemName == "")
            //{
                iUnique = 1;
                sItemName = "UNIQUE";
            //}
            //else
            //{
            //    iUnique = 0;
            //}
        }
        else
        {
            iUnique = 0;
        }
        if ( sItemName == "nw_it_gold001")
        {
            EncodeGold(oPC, oCurInvObj, iItemCount, sItemName, sCampName, sAreaKey);

        }
        else
        {
            //Debug
            if (Debug)
            {
                SendMessageToPC(oPC, "----------");
                SendMessageToPC(oPC, "StackNum: "+IntToString(GetNumStackedItems(oCurInvObj)));
                SendMessageToPC(oPC, "----------");
            }

            if (GetHasInventory(oCurInvObj) == TRUE )
            {
                iItemCount = EncodeContainer(oPC, oCurInvObj, iItemCount, sItemName, sCampName, sAreaKey, iUnique);
            }
            else if (GetNumStackedItems(oCurInvObj) > 1)
                {
                    iHeaderCount = iHeaderCount + 1;
                    iItemCount = EncodeStackItem( oPC, oCurInvObj, iItemCount, sCampName, sAreaKey, iUnique);
                }
                else
                {
                    EncodeItem(oPC, oCurInvObj, iItemCount, sItemName, sCampName, sAreaKey, iUnique);
                }
        }


        oCurInvObj = GetNextItemInInventory(oCurItem);


    }
    iItemCount = iItemCount + 1;
    SetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), "END", oItemID);
    iHeaderCount = iHeaderCount + 1;

    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "END Encode Container ROUTINE");
    }


    return iItemCount;
}


void DecodeGold (object oPC, object oCurContainer, int iItemCount, string sItemName, string sCampName, string sAreaKey)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    iStackAmt = GetCampaignInt(sCampName, IntToString(HashID(sBankGold + IntToString(iItemCount) + sAreaKey)), oItemID);
    object oCurItem = CreateItemOnObject(sItemName, oCurContainer, iStackAmt);

    // Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "This Gold. StackSize "+IntToString(iStackAmt));
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+sItemName);
        SendMessageToPC(oPC, "----------");
    }

    return;
}

object DecodeItem (object oPC, object oCurContainer, int iItemCount, string sItemName, string sCampName, string sAreaKey, int iItemUnq)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    object oCurItem;
    if (!iItemUnq)
    {
        oCurItem = CreateItemOnObject(sItemName, oCurContainer, 1);

    }
    else
    {
        oCurItem = RetrieveCampaignObject(sCampName, IntToString(HashID(sBankUQ + IntToString(iItemCount) + sAreaKey)),  GetLocation(OBJECT_SELF), OBJECT_SELF, oItemID);  //,
    }
    if ( GetCampaignInt(sCampName, IntToString(HashID(sBankItemID + IntToString(iItemCount) + sAreaKey)), oItemID) )
    {
        SetIdentified(oCurItem, TRUE);
    }
    else
    {
        SetIdentified(oCurItem, FALSE);
    }

    //Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "This is an Item.");
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+sItemName);
        SendMessageToPC(oPC, "Identified?: " + IntToString(GetCampaignInt(sCampName, IntToString(HashID(sBankItemID + IntToString(iItemCount) + sAreaKey)), oItemID)) );
        SendMessageToPC(oPC, "----------");
    }

    //DeletePersistentInt(oPC, sBankItemID + IntToString(iItemCount) );

    return oCurItem;
}

int DecodeStackItem (object oPC, object oCurContainer, int iItemCount, string sItemName, string sCampName, string sAreaKey, int iItemUnq)
{
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
    object oCurItem;
    //DeletePersistentString(oPC, sBankBP + IntToString(iItemCount) );
    iItemCount = iItemCount + 1;
    if (!iItemUnq)
    {
        iStackAmt = GetCampaignInt(sCampName, IntToString(HashID(sBankStack + IntToString(iItemCount) + sAreaKey)), oItemID);
        sItemName = GetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), oItemID);
        oCurItem = CreateItemOnObject(sItemName, oCurContainer, iStackAmt);


    }
    else
    {
        oCurItem = RetrieveCampaignObject(sCampName, IntToString(HashID(sBankUQ + IntToString(iItemCount) + sAreaKey)), GetLocation(OBJECT_SELF), OBJECT_SELF, oItemID);      //,
    }

    if ( GetCampaignInt(sCampName, IntToString(HashID(sBankItemID + IntToString(iItemCount) + sAreaKey)), oItemID) )
    {
        SetIdentified(oCurItem, TRUE);
    }
    else
    {
        SetIdentified(oCurItem, FALSE);
    }

    //DeletePersistentInt(oPC, sBankStack + IntToString(iItemCount) );
    //DeletePersistentInt(oPC, sBankItemID + IntToString(iItemCount) );

    //Debug Statements
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount));
        SendMessageToPC(oPC, "Stack Item. StackSize: "+IntToString(iStackAmt));
        SendMessageToPC(oPC, "Valid Object:" + IntToString(GetIsObjectValid(oCurItem)) );
        SendMessageToPC(oPC, "ResRef: "+sItemName);
        SendMessageToPC(oPC, "Identified?: " + IntToString(GetCampaignInt(sCampName, IntToString(HashID(sBankItemID + IntToString(iItemCount)+ sAreaKey)), oItemID)) );
        SendMessageToPC(oPC, "----------");
    }

    return iItemCount;
}

int DecodeContainer (object oPC, object oCurContainer, string sItemName, int iItemCount, string sCampName, string sAreaKey, int iItemUnq)
{
    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "Decode Container ROUTINE");
    }
    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }
   // DeletePersistentString(oPC, sBankBP + IntToString(iItemCount) );
    iItemCount = iItemCount +1;

    //Debug
    if (Debug)
    {
        SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount) );
    }

    sItemName = GetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), oItemID );

    oCurContainer = DecodeItem(oPC, OBJECT_SELF, iItemCount, sItemName, sCampName, sAreaKey, iItemUnq);

    sItemName = GetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount + 1) + sAreaKey)), oItemID );

    while ( sItemName != "END")
        {
            iItemCount = iItemCount + 1;
            //Debug
            if (Debug)
            {
                SendMessageToPC(oPC, "Item#: "+IntToString(iItemCount) );
            }

            sItemName = GetCampaignString(sCampName, IntToString(HashID(sBankBP + IntToString(iItemCount) + sAreaKey)), oItemID );


            if ( sItemName != "nw_it_gold001" )
            {

                    if ( sItemName == "STACK")
                    {
                        iItemCount = DecodeStackItem(oPC, oCurContainer, iItemCount, sItemName, sCampName, sAreaKey, 0);
                    }
                    else
                    {
                        if ( sItemName == "STACKUNQ")
                        {
                            iItemCount = DecodeStackItem(oPC, oCurContainer, iItemCount, sItemName, sCampName, sAreaKey, 1);
                        }
                        else
                        {
                            if ( sItemName == "UNIQUE" )
                            {
                                DecodeItem(oPC, oCurContainer, iItemCount, sItemName, sCampName, sAreaKey, 1);
                            }
                            else
                            {
                                DecodeItem(oPC, oCurContainer, iItemCount, sItemName, sCampName, sAreaKey, 0);
                            }
                        }

                    }


            }
            else
            {

                DecodeGold(oPC, oCurContainer, iItemCount, sItemName, sCampName, sAreaKey);
              //  DeletePersistentInt(oPC, sBankGold );


            }
          //  DeletePersistentString(oPC, sBankBP + IntToString(iItemCount) );


        }

    return iItemCount;
}

void ResetBank (object oBank)
{
    DestroyObject(oBank);
    CreateObject(GetObjectType(oBank),GetResRef(oBank),GetLocation(oBank));
    return;
}

void ClearVault (object oChest)
{
    int iClearMaxCount = 10;
    int iClearCount = 0;
    float fMaxDistance = 5.0;
    object oPCClear;
    float fDistance;
    string sUsingPC = GetLocalString(OBJECT_SELF, "PCUsingChest");
    string sCurPC;

    while ( iClearCount < iClearMaxCount )
    {
        iClearCount++;
        oPCClear = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC, oChest, iClearCount);
        if ( GetIsPC(oPCClear) )
        {
            sCurPC = GetKey(oPCClear, 1);
            if (TestStringAgainstPattern(sUsingPC, sCurPC) == FALSE )
            {
                fDistance = GetDistanceBetween(oChest, oPCClear);
                if ( fDistance <= fMaxDistance )
                {
                    AssignCommand(oPCClear, ActionMoveAwayFromObject(oChest, TRUE, 5.0));
                }
            }
        }
        else
        {
            iClearCount = iClearMaxCount;
        }


    }
    return;

}
//void main () {}
