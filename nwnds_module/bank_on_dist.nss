//::///////////////////////////////////////////////
//:: bank_on_dist.nss
//:: Bank Vault on Disturb Inventory file
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
      Fixed problem where items were being listed as unidentified even though
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
//:: Created On: December 21, 2002
//:://////////////////////////////////////////////
#include "bank_inc"

void main()
{

    object oPC = GetLastDisturbed();
    object oItem = GetInventoryDisturbItem();
    string sPCKey = GetKey(oPC, 1);
    string sBankKey = GetKey(OBJECT_SELF, 0);
    string sUsingPC = GetLocalString(OBJECT_SELF, "PCUsingChest");
    int iDisturbType = 0;
    string sBPName = GetResRef(oItem);
    int iCount = 0;
    object oSpawn;

    iDisturbType = GetInventoryDisturbType();

    // This is now possible, so for the case.
    if ( TestStringAgainstPattern(sUsingPC, sPCKey) == FALSE )
    {
        //iDisturbType = GetInventoryDisturbType();
        if (iDisturbType == INVENTORY_DISTURB_TYPE_ADDED)
        {
            SendMessageToPC(oPC, "Someone is using this Chest.  Please Wait.");
            AssignCommand(OBJECT_SELF, ActionGiveItem(oItem, oPC));
        }
        if (iDisturbType == INVENTORY_DISTURB_TYPE_REMOVED)
        {
            SendMessageToPC(oPC, "Someone is using this Chest.  You cannot take there items");
            AssignCommand(OBJECT_SELF, ActionTakeItem(oItem, oPC));
        }
        return;
    }




    if (iDisturbType == INVENTORY_DISTURB_TYPE_REMOVED)
    {

        sBPName = GetTag(oItem);
        if ( sBPName == "StorageChestKey" )
        {
            SendMessageToPC(oPC, "Spawning Chest Daemon");
            oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "ChestDaemon", GetLocation(OBJECT_SELF), TRUE);
        }


    }
    if (iDisturbType == INVENTORY_DISTURB_TYPE_ADDED)
    {
        sBPName = GetTag(oItem);
        if ( sBPName == "StorageChestKey" )
        {
                SendMessageToPC(oPC, "Removing Chest Daemon");
                oSpawn = GetNearestObjectByTag("ChestDaemon", OBJECT_SELF, 1);
                DestroyObject(oSpawn);
        }
    }

    if (iDisturbType == INVENTORY_DISTURB_TYPE_ADDED)
    {
        oCurInvObj = GetFirstItemInInventory(OBJECT_SELF);
        while ( GetIsObjectValid(oCurInvObj) == TRUE || GetResRef(oCurInvObj) == "nw_it_gold001")   //Begin Processing Item in Inventory
        {
            iCount = iCount + 1;
            oCurInvObj = GetNextItemInInventory(OBJECT_SELF);
        }
        if ( iCount > iStorageLimit)
        {
            SendMessageToPC(oPC, "You have reached your Storage Limit.");
            AssignCommand(OBJECT_SELF, ActionGiveItem(oItem, oPC));
        }
    }




    // This shouldn't be possible but just in case.
    if (iDisturbType == INVENTORY_DISTURB_TYPE_ADDED)
    {
        if (GetHasInventory(oItem) == TRUE)
        {
            oCurInvObj = GetFirstItemInInventory(oItem);

            while ( GetIsObjectValid(oCurInvObj) == TRUE || GetResRef(oCurInvObj) == "nw_it_gold001")   //Begin Processing Item in Inventory
            {
                if ( GetHasInventory(oCurInvObj) == TRUE)
                {
                    SendMessageToPC(oPC, "This Container has another Container within, please remove it.");
                    AssignCommand(OBJECT_SELF, ActionGiveItem(oCurInvObj, oPC));
                    break;
                }


                oCurInvObj = GetNextItemInInventory(oItem);
            }

        }

    }

}
