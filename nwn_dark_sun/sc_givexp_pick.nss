//sc_givexp_pick: Give XP on Pick Lock by KidCharlemagne 9/15/02

//Script gives experience points to a PC who picks a lock.
//Place this script in the OnUnLock Event of the door, chest, etc.
//They must not have key in inventory for it to work.

//Note: Although I arrived at this idea independently, I later
//found a similar script on NWN Vault to give xp when a trap
//is disarmed.  This script was written by Velmar.  I give credit
//to a like minded individual. :)

//VARIABLES:
//
//nExp = XP to be given
//oPC = PC who unlocked object
//oItem = variable to check through oPC's inventory
//sKey = string of key required to unlock object
//oKey = key object required to unlock object
//nDC = DC to unlock object
//nAlreadyPicked = local integer on calling object to prevent PC
//                 from locking object and picking to gain xp
//                 repeatedly

void main()
{

//VARIABLE DECLARATIONS----------------------------

    int nExp = 0;
    object oPC = GetLastUnlocked();
    object oItem = GetFirstItemInInventory(oPC);
    string sKey = GetTrapKeyTag(OBJECT_SELF);
    object oKey = GetObjectByTag(sKey);
    int nDC = GetLockUnlockDC(OBJECT_SELF);
    int nKeyAssociated = TRUE;
    int nAlreadyUnlocked = FALSE;

//if object's lock has already been unlocked before, don't give xp

    nAlreadyUnlocked = GetLocalInt(OBJECT_SELF,"AlreadyUnlocked");

    if (nAlreadyUnlocked == TRUE)
    {
        return;
    }

//Regardless of whether lock was just picked or key was used,
//localint "AlreadyUnlocked" will be set to indicate unlocking.

    SetLocalInt(OBJECT_SELF,"AlreadyUnlocked",TRUE);

//if oKey is OBJECT_INVALID then no key is associated with object

    if (oKey == OBJECT_INVALID)
    {
        nKeyAssociated = FALSE;
    }

//If a key is associated with the door, check oPC's inventory for the key
//If oPC has key, return from script

    while (oItem != OBJECT_INVALID && nKeyAssociated == TRUE)
    {
        if (oItem == oKey)
        {
            return;
        }
        oItem = GetNextItemInInventory(oPC);
    }
//The amount of experience given will depend on DC of the lock.
//This section is adjustable to suit level of XP required.

    if (nDC <= 18)
    {
        nExp = 50;
    }
    if (18 < nDC <= 30)
    {
        nExp = 100;
    }
    if (nDC > 30)
    {
        nExp = 200;
    }

    GiveXPToCreature(oPC,nExp);
}
