#include "nw_i0_plot"


////////////////////////////////////////////////////////////////
//Climbing Include Function Libarary written by JJRittenhouse///
//GetArmorCheckMod modified from example script found in the ///
//GetItemACValue(object) entry of the Lexicon.               ///
//(author: Jason Harris, editor: Jasperre, additional        ///
//contributor(s): Kristian Markon, Jasperre)                 ///
////////////////////////////////////////////////////////////////

//Functions in this Library

//GetArmorCheckMod(): Returns the Armor Check modifier of oItem
//Will return a 0 value to any non-armor passed to this function

//GetShieldArmorCheckMod():  Returns the Armor Check modifier of oItem
//Will Return a 0 Value to any non-sheild item passed

//ClimbCheck(): Calculates a climb modifer subtracting Armor check
//penalties and adding a +1 modifier for each level in a class
//that normally possesses Climb as a class skill.
//Performs the Climb roll and compares it to the DC passed to the
//function (nDC).
//Returns 0 if failed, 1 if Passed and 2 if failed by more than 10
//Sends combat message to the player telling them that a climb
//check was made, the DC of the climb check, the Armor check modifier
//applied as well as the class modifier applied.  Indicates success
//or Failure to the Player.  Adds 10 for the use of Climbing Rope
//and adds 20 if the player is under the spell effect Spider Climb


//JumpAllAssociatesToLocation()
//Gets familiar, animal companion, summon, up to four henchmen, and dominated
//creature, any 1 summon of a creature the PC summoned, and any 1
//summon of a creature the PC dominates and jumps them to a location

// GetArmorCheckMod ()
// Returns the Armor check modifier of the item passed
// 0 if invalid, or not armor, or just plain not found.
// 0 to -8 as the value of AC got from the armor - 0 for none, -8 for Full plate.
int GetArmorCheckMod(object oItem)
{
    // Make sure the item is valid and is an armor.
    if (!(GetIsObjectValid(oItem)))
        return 0;
    if (GetBaseItemType(oItem) != BASE_ITEM_ARMOR)
        return 0;

    // Get the identified flag for safe keeping.
    int bIdentified = GetIdentified(oItem);
    SetIdentified(oItem,FALSE);

    int nType = 0;
    switch (GetGoldPieceValue(oItem))
    {
        case    1: nType = 0; break; // None
        case    5: nType = 0; break; // Padded
        case   10: nType = 0; break; // Leather
        case   15: nType = -1; break; // Studded Leather / Hide
        case  100: nType = -2; break; // Chain Shirt / Scale Mail
        case  150: nType = -5; break; // Chainmail / Breastplate
        case  200: nType = -7; break; // Splint Mail / Banded Mail
        case  600: nType = -7; break; // Half-Plate
        case 1500: nType = -8; break; // Full Plate
    }
    // Restore the identified flag, and return armor check modifier.
    SetIdentified(oItem,bIdentified);
    return nType;
}

// GetClimbClassMod ()
//calculate the class modifier by adding one for each level in a
//class that normally gets climb as a skill.
//While 4 ranks might be normally taken at first level, it might
//not have been raised one rank every level.  This only represents
//a reasonable climb skill by class of the character.
//adds 10 if climbing rope is used, and adds 20 if the player is under
//the spell effect "Spider Climb Effect".
//This script is not adapted for the PRC hak.
int GetClimbClassMod (object oPC)
{

object oRope;
string sRope;
int bUseRope=GetLocalInt (oPC, "bUseRope");
int nPCClassMod;
int nCreatureClimbMod=GetLocalInt (oPC, "nClimbMod");//local integer set on a creature to give them a climb bonus

nPCClassMod=nPCClassMod+nCreatureClimbMod;//add that bonus

    if (GetLevelByClass (CLASS_TYPE_ASSASSIN, oPC)>0)
        {
        nPCClassMod=nPCClassMod+(GetLevelByClass (CLASS_TYPE_ASSASSIN, oPC));
        }
    if (GetLevelByClass (CLASS_TYPE_BARBARIAN, oPC)>0)
        {
        nPCClassMod=nPCClassMod+(GetLevelByClass (CLASS_TYPE_BARBARIAN, oPC));
        }
    if (GetLevelByClass (CLASS_TYPE_BARD, oPC)>0)
        {
        nPCClassMod=nPCClassMod+(GetLevelByClass (CLASS_TYPE_BARD, oPC));
        }
    if (GetLevelByClass (CLASS_TYPE_FIGHTER, oPC)>0)
        {
        nPCClassMod=nPCClassMod+ (GetLevelByClass (CLASS_TYPE_FIGHTER, oPC));
        }
    if (GetLevelByClass (CLASS_TYPE_HARPER, oPC)>0)
        {
        nPCClassMod=nPCClassMod+ (GetLevelByClass (CLASS_TYPE_HARPER, oPC));
        }
    if (GetLevelByClass (CLASS_TYPE_MONK, oPC)>0)
        {
        nPCClassMod=nPCClassMod+ (GetLevelByClass (CLASS_TYPE_MONK, oPC));
        }
    if (GetLevelByClass (CLASS_TYPE_RANGER, oPC)>0)
        {
        nPCClassMod=nPCClassMod+ (GetLevelByClass (CLASS_TYPE_RANGER, oPC));
        }
    if (GetLevelByClass (CLASS_TYPE_ROGUE, oPC)>0)
        {
        nPCClassMod=nPCClassMod+ (GetLevelByClass (CLASS_TYPE_ROGUE, oPC));
        }
    if (GetLevelByClass (CLASS_TYPE_SHADOWDANCER, oPC)>0)
        {
        nPCClassMod=nPCClassMod+ (GetLevelByClass (CLASS_TYPE_SHADOWDANCER, oPC));
        }

//Checks for the item "Spider Climb Effect" created by the Arcane
//Knowledge "Spider Climb" item to give a +20.  Does not stack with
//Rope bonus.
    if (HasItem (oPC, "SpiderClimbEffect"))
        {
        nPCClassMod=nPCClassMod+20;
        }
//checks for Climbing rope, and if the rope is marked as used.
    else if (HasItem(oPC, "ClimbingRope"))
        {
        if (bUseRope==TRUE)
            {
            nPCClassMod=nPCClassMod+10;//gives +10 bonus
            }
        }


        return nPCClassMod;
}

// GetShieldArmorCheckMod ()
//Find the Armor check modifier of the item in the shield hand
//of the creature.  If the object is not a shield return 0.
int GetShieldArmorCheckMod (object oItem)
{
int nMod=0;
// Make sure the item is valid, if not return 0 value
    if (!GetIsObjectValid(oItem))
        nMod=0;
//if the object is a largeshield return -2
    if (GetBaseItemType(oItem) == BASE_ITEM_LARGESHIELD)
        nMod= -2;
//If the object is a smallshield return -1
    if (GetBaseItemType (oItem) == BASE_ITEM_SMALLSHIELD)
        nMod= -1;
//If the object is a TowerShield return -10
    if (GetBaseItemType (oItem) == BASE_ITEM_TOWERSHIELD)
        nMod= -10;
    return nMod;
}

// ClimbCheck ()
//Returns whether a climb check was passed
//Returns 0 if failed, 1 if Passed and 2 if failed by 10 or more
//If the player has Climbing Rope and they are marked as using it
//Check to see if the rope is still useable

int ClimbCheck (object oCreature, int nDC)
    {
    string sPassFail;//string value for messaging to player result
    int nFray;//fray roll
    int nBreak; //break roll
    int nRoll; //climb check roll
    int nStrMod=GetAbilityModifier (ABILITY_STRENGTH, oCreature);//get str modifier
    object oArmorSlot= GetItemInSlot(INVENTORY_SLOT_CHEST,oCreature);//get object worn on chest
    object oLeftHandSlot= GetItemInSlot (INVENTORY_SLOT_LEFTHAND, oCreature);//get object in left hand
//The total climb modifier is the armor check penalty, plus class modifier, plus str modifier
    int nClimbMod=GetArmorCheckMod(oArmorSlot)+GetShieldArmorCheckMod(oLeftHandSlot)
            +GetClimbClassMod(oCreature)+nStrMod;
    int bUseRope=GetLocalInt (oCreature, "bUseRope");//pass local integer that stores whether rope is being used

        nRoll=d20();//d20 skill roll
        int nClimbTotal=nRoll+nClimbMod;//add total modifier

        if (nClimbTotal>=nDC)//if total exceeds or meets the DC
            {
             sPassFail=" Success! "; //indicate success, this variable
//is used both to determine what value to return as well as to pass in
//a message to the player the result.
             }
        else if (nClimbTotal<(nDC-9))//fails by 10 or more
            {
            sPassFail=" CRITICAL FAILURE! ";//indicate critical failure
            }
         else
            {
            sPassFail=" Failed. ";//any other result is a failure
            }
//Sends Feedback to the Player for the details of the climb check, breaking down each modifier
//(except Spider Climb and Rope modifiers, which are added to the class modifier)
    SendMessageToPC (oCreature, "*Climb Check*  DC: "+IntToString(nDC));//it's a climb check, this is the difficulty
    SendMessageToPC (oCreature, "| Rolled: "+IntToString(nRoll)+"| Armor Check Modifier: "+
                    IntToString(GetArmorCheckMod(oArmorSlot)+GetShieldArmorCheckMod(oLeftHandSlot))+
                    "| Modifiers Due to Class: "+IntToString(GetClimbClassMod(oCreature))+"| Strength Modifier: "+IntToString(nStrMod));//this is what you rolled, these are your modifiers to the roll
    SendMessageToPC (oCreature, "| Total: "+IntToString(nClimbTotal)+sPassFail);//this was your total, and your result.

//If the player has and is marked as using rope test if it has becom unusuable
     if (HasItem(oCreature, "ClimbingRope"))
        {
        object oRope;
        string sRope;
        nFray=d10();//fray chance
        nBreak=d10();//break chance



        if (bUseRope==TRUE)
            {
            oRope=GetLocalObject (oCreature, "oRope");//get the exact rope marked as being used, which is stored on the player when they activate the rope
            sRope=GetName(oRope);//get the name of the rope.  This allows one tag to add the rope modifier to the class modifier, while separating out
//what factors may make it break.  This can be used to add climbing kits, climbing claws and all sorts of items, but additional
//scripting will be needed.  The script is written with easy expansion in mind.
            if (sRope=="Climbing Rope")//regular old rope
                {

                 if (nFray>8)//roll of 9 or 10
                    {
                    FloatingTextStringOnCreature ("Your rope shows signs of wear", oCreature);//indicate wear and test if the rope is still useable
                        if (nBreak>7)//roll of 8-10
                            {
                            DestroyObject(oRope, 0.0f); //destroy the rope marked as used
                            DeleteLocalObject (oCreature, "oRope");//clear the object variable on the player
                            DeleteLocalInt (oCreature, "bUseRope");//clear the int variable on the player
                            FloatingTextStringOnCreature ("Your rope has become unusable", oCreature);//indicate the rope is no longer functional.
                            }
                    }
                }
            else if (sRope == "Silk Rope")//nice silk rope
                {
                if (nFray>9)//roll of 10
                    {
                    FloatingTextStringOnCreature ("Your silk rope shows signs of wear", oCreature);//indicate wear
                        if (nBreak>8) //roll of 9 or 10
                            {
                            DestroyObject(oRope, 0.0f);//same as above
                            DeleteLocalObject (oCreature, "oRope");
                            DeleteLocalInt (oCreature, "bUseRope");
                            FloatingTextStringOnCreature ("Your silk rope has become unusable", oCreature);//indicates the type of rope that has become unuseable too!
                            }
                    }
                }
            }
         }
         //return result 1 success, 0 failure, 2 critical failure, returns 3 for error checking
         //if you are unsure if this function is working correctly (after modifying it) simply provide
         //some feedback to tell you if the function returned an 3 value.  You can use this as well
         //as error control in case something other than a creature is passed to this function
         //as a side note, I'm not even sure if this is needed.
        if (sPassFail== " Success! ")
            return 1;
        if (sPassFail== " CRITICAL FAILURE! ")
            return 2;
        if (sPassFail== " Failed. ")
            return 0;

            else
                return 3;
}
// JumpAllAssociatesToLocation
//Gets familiar, animal companion, summon, up to four henchmen, and dominated
//creature, any 1 summon of a creature the PC summoned, and any 1
//summon of a creature the PC dominates and jumps them to a location
void JumpAllAssociatesToLocation (object oPC, location lLocation)
{

object oPCCompanion= GetAssociate (ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
object oPCDominated= GetAssociate (ASSOCIATE_TYPE_DOMINATED, oPC);
object oPCFamiliar= GetAssociate (ASSOCIATE_TYPE_FAMILIAR, oPC);
object oPCHenchman= GetAssociate (ASSOCIATE_TYPE_HENCHMAN, oPC, 1);
object oPCHenchman2= GetAssociate (ASSOCIATE_TYPE_HENCHMAN, oPC, 2);//more than one henchman, up to four
object oPCHenchman3= GetAssociate (ASSOCIATE_TYPE_HENCHMAN, oPC, 3);
object oPCHenchman4= GetAssociate (ASSOCIATE_TYPE_HENCHMAN, oPC, 4);
object oPCSummon= GetAssociate (ASSOCIATE_TYPE_SUMMONED, oPC);
object oPCSummon2= GetAssociate (ASSOCIATE_TYPE_SUMMONED, oPCSummon); //summon of a summoned creature
object oPCSummon3= GetAssociate (ASSOCIATE_TYPE_SUMMONED, oPCDominated);//summon of a dominated creature
        if (GetIsObjectValid(oPCCompanion))
            AssignCommand (oPCCompanion, JumpToLocation(lLocation));
        if (GetIsObjectValid (oPCDominated))
            AssignCommand (oPCDominated, JumpToLocation(lLocation));
        if (GetIsObjectValid (oPCFamiliar))
            AssignCommand (oPCFamiliar, JumpToLocation (lLocation));
        if (GetIsObjectValid (oPCHenchman))
            AssignCommand (oPCHenchman, JumpToLocation (lLocation));
        if (GetIsObjectValid (oPCHenchman2))
            AssignCommand (oPCHenchman2, JumpToLocation (lLocation));
        if (GetIsObjectValid (oPCHenchman3))
            AssignCommand (oPCHenchman3, JumpToLocation (lLocation));
        if (GetIsObjectValid (oPCSummon))
            AssignCommand (oPCSummon, JumpToLocation (lLocation));
        if (GetIsObjectValid (oPCSummon2))
            AssignCommand (oPCSummon2, JumpToLocation (lLocation));
        if (GetIsObjectValid (oPCSummon3))
            AssignCommand (oPCSummon3, JumpToLocation (lLocation));
}
//void main () {}
