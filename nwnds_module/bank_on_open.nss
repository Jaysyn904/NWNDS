//::///////////////////////////////////////////////
//:: bank_on_open.nss
//:: Bank Vault on Open file
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
//:: Created By: Clayten Gillis (a.k.a. DragonsWake)
//:: Created On: December 17, 2002
//:://////////////////////////////////////////////
#include "bank_inc"

void main()
{
    int iInvCount = 0;

    string sBPRef;
    int iID;

    int I = 0;
    object oPC = GetLastOpenedBy();   // Get Last Opened by PC
    string sPCName = GetKey(oPC, 1);
    iCurUse = GetTimeMillisecond();
    iLastUse = GetLocalInt(OBJECT_SELF, sEventTime);
    SetLocalInt(OBJECT_SELF, sEventTime, iCurUse);

        if ( ! iSingleCamp )
        {
            sDataName = sPCName;
        }
        else
        {
            sDataName = sCampName;
        }
        if ( ! BankModule )
        {
            sBankKey = GetKey(OBJECT_SELF, 0);
        }
        else
        {
            sBankKey = "";
        }
        if ( iPCGlobal == 1 )
        {
            sBankKey = sBankKey + GetKey(oPC, 0);
        }

    if ( iPCGlobal )
    {
        oItemID = OBJECT_SELF;
    }
    else
    {
        oItemID = oPC;

    }

    if ( (iCurUse == iLastUse) )
    {
        ResetBank(OBJECT_SELF);
        return;
    }

    iBankFirstTime = GetLocalInt(OBJECT_SELF, sBankFirst);
    SendMessageToPC(oPC, "FirstTime1: "+IntToString(iBankFirstTime));
    if ( iBankFirstTime == FALSE )
    {
        //SetCampaignInt(sCampName, IntToString(HashID("ChestNotOpen"+sBankKey)), 1, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "ChestNotOpen", 1);
        //SetLocked(OBJECT_SELF, FALSE);
        SetLocalInt(OBJECT_SELF, sBankFirst, 1);
    }
    SendMessageToPC(oPC, "FirstTime2: "+IntToString(iBankFirstTime));


    //int iChestNotOpen = GetCampaignInt(sCampName, IntToString(HashID("ChestNotOpen"+sBankKey)), OBJECT_SELF);
    int iChestNotOpen = GetLocalInt(OBJECT_SELF, "ChestNotOpen");
    SendMessageToPC(oPC, "ChestNotOpen: "+IntToString(iChestNotOpen));
    if ( iChestNotOpen == FALSE )
    {
        object oPC = GetLastOpenedBy();   // Get Last Opened by PC
        AssignCommand(oPC, ActionMoveAwayFromObject(OBJECT_SELF, FALSE, 5.0));
        //object oTransport = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, 1);
        //location lLoc = GetLocation(oTransport);
        //AssignCommand(oPC,JumpToLocation(lLoc));
        SendMessageToPC(oPC, "This Bank Vault is in use.  Please wait your turn.");
        return;
    }


        //SetCampaignInt(sCampName, IntToString(HashID("ChestNotOpen"+sBankKey)), 0, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "ChestNotOpen", 0);
        //SetLocked(OBJECT_SELF, TRUE);
        //SetCampaignString(sCampName, IntToString(HashID("PCUsingChest"+sBankKey)), sPCName, OBJECT_SELF);
        SetLocalString(OBJECT_SELF, "PCUsingChest", sPCName);

        //iBankChestNotOpen = 0;
        //sPCUsingChest = GetKey(oPC);



        int iBankCount = GetCampaignInt(sDataName, IntToString(HashID("BankCount" + sBankKey)), oItemID);

        //Debug
        if (Debug)
        {
            SendMessageToPC(oPC, "On OPEN ROUTINE");
            SendMessageToPC(oPC, "BankCount: "+ IntToString(iBankCount) );
            SendMessageToPC(oPC, "BankKey: "+sBankKey);
        }

        //Warning Message
        //SendMessageToPC(oPC,"WARNING!: Do NOT press the 'I' Key while this Chest is open.");

        if ( iBankCount != 0)
        {
            while ( I != iBankCount)
            {
                I++;



                sBPRef = GetCampaignString(sDataName, IntToString(HashID(sBankBP + IntToString(I)+ sBankKey)), oItemID );
                //Debug
                if (Debug)
                {
                    SendMessageToPC(oPC, "Item#: "+IntToString(I) );
                    SendMessageToPC(oPC, "ResRef: "+sBPRef);
                }


                if ( sBPRef != "nw_it_gold001" )
                {
                    if (sBPRef == "CONTAIN")
                    {
                        I = DecodeContainer(oPC, OBJECT_SELF, sBPRef, I, sDataName, sBankKey, 0);

                    }
                    else
                    {
                        if (sBPRef == "CONTAINUNQ")
                        {
                            I = DecodeContainer(oPC, OBJECT_SELF, sBPRef, I, sDataName, sBankKey, 1);

                        }
                        else
                        {
                            if ( sBPRef == "STACK")
                            {
                                I = DecodeStackItem(oPC, OBJECT_SELF, I, sBPRef, sDataName, sBankKey, 0);
                            }
                            else
                            {
                                if ( sBPRef == "STACKUNQ")
                                {
                                    I = DecodeStackItem(oPC, OBJECT_SELF, I, sBPRef, sDataName, sBankKey, 1);
                                }
                                else
                                {
                                    if ( sBPRef == "UNIQUE")
                                    {
                                        oCurInvObj = DecodeItem(oPC, OBJECT_SELF, I, sBPRef, sDataName, sBankKey, 1);
                                    }
                                    else
                                    {
                                        oCurInvObj = DecodeItem(oPC, OBJECT_SELF, I, sBPRef, sDataName, sBankKey, 0);
                                    }
                                }
                            }
                        }
                    }


                }
                else
                {

                    DecodeGold(oPC, OBJECT_SELF, I, sBPRef, sDataName, sBankKey);
                  //  DeletePersistentInt(oPC, sBankGold );


                }

             //   DeletePersistentString(oPC, sBankBP + IntToString(I) );

            }

        }

}
