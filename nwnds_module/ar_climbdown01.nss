//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::
//:: AR_ClimbDown01
//::
//:: Western Dunes to Abandoned Mines
//::
//:: Conversation based
//::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

//////////////////////////////////////////
//ari_climb_ou written by JJRittenhouse//
//
//This script is placed on the OnUsed event of any useable
//placeable.  It will calculate a climb check, adding a +1
//modifier for each level the creature has in a class that
//normally gets Climb as a class skill in the PnP version.
//This check will take armor class check into account.  On
//a failure by ten or more the script will move the player
//to the ClimbDestinationFall waypoint.
//It is also set to add +20 to any creature with the Spider
//climb effect item in their inventory, and a +10 to anyone
//marked as using a Climbing Rope.
//This script requires #include "ari_climbing_inc" and the
//ClimbCheck(), GetClimbClassMod(), and the
//JumpAllAssociatesToLocation() functions

#include "ari_climbing_inc"

void main()
{
string sDirection = "DOWN";
string oDestination = "wp_oldwell";

//For Builders using the climbing system to transition between areas
//if the fall location is in a different area than the climbing placeable
//change the "GetNearestObjectByTag" function below to "GetObjectByTag"
//The tag of the ClimbDestinationFall waypoint used will need to be
//changed to a unique tag and substitued for "ClimbDestinationFall".
//See notes at the bottom of this script for more information regarding
//applying falling damage to characters during a transition between areas

object oFall=GetObjectByTag ("wp_oldwell");
//the object that stores the fall location, set manually by the builder

location lFall = GetLocation(oFall);
//location of the above waypoint

location lDestination = GetLocation(oFall);
//same as fall location since we are climbing straight down

object oCreature = GetPCSpeaker();
//creature calling the conversation

effect eFall= EffectKnockdown();
//knockdown effect in simple failure
//this effect keeps a player from simply spam clicking the placeable until they succeed or
//fall, and makes them vulnerable to attack by hostiles while they
//recover from failing the climb.  This effect will work on creatures
//using the placeable as well

//If the builder is using the climb system as a means to transition
//between areas, change the "oDestination=GetNearestObjectByTag" to
//"=GetObjectByTag" below.  The tag given to the waypoint will need to be
//unique, and should be substituted for the "ClimbDestination" type tags
//See the notes at the bottom of this script about falling and
//special conditions arising from falling damage applied to players
//during a transition between areas.

//assign the location to jump the creature to if they succeed.
//lDestination=GetLocation(oDestination);//stores the location to move the player if they succeed
int nClimb=ClimbCheck(oCreature, 5); //perform the check
object oHostileFollow;//hostile creature that might follow the player
int nNth=1;//counter to get the next nearest creature until no more are found
object OClimbable=OBJECT_SELF;//assign to variable to use within an
//AssignAction command which would return the creature instead of the
//placeable as OBJECT_SELF.  This is the climbing placeable now being
//used.

switch(nClimb)
    {
    case 0:   //fail, apply knockdown for 6 seconds
        //FloatingTextStringOnCreature("*You could not make the climb."*, oCreature, FALSE);
        AssignCommand(oCreature, ApplyEffectToObject (DURATION_TYPE_TEMPORARY, eFall, oCreature, 6.0));

        break;
    case 1:  //succeed, move to appropriate waypoint, move associates
    //         to the waypoint, find the nearest hostile creatures and
    //         have them use the placeable to try to follow.
    //         The script will make a random check, giving more chance
    //         for the creature to try the climb the more they are capable
        FloatingTextStringOnCreature("*You manage to climb down the rope*", oCreature);
        AssignCommand(oCreature, JumpToLocation(lDestination));//move the creature using the placeable to the climb location
        JumpAllAssociatesToLocation (oCreature, lDestination);//move all associates to the same location
//This next block handles the ability of hostile creatures to follow the player using the Climbable.
        oHostileFollow=GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF,nNth);//get the first Non-pc creature to the placeable
        //does not return PC's so it will not force them to use the placeable.
        while (GetIsObjectValid(oHostileFollow))//break condition, when all the creatures in the area have been checked this will break
            {
            if (!GetIsFriend(oHostileFollow, oCreature))//checks if hostile to the creature using the placeable.
            {
                if (GetObjectSeen(oCreature, oHostileFollow))//checks if the hostile can see the creature that just used the placeable
                    {
//compare the creature's climb skill modifier to the DC
//the greater the chance for the creature to succeed, the more
//likely it is to follow
                    int nChance=d20();
//finds the difference between the climb DC and the class modifier of the hostile creature
                    int nFollow=5-GetClimbClassMod(oHostileFollow);
//5% chance to try to follow even if the creauture can't make the
//climb.  To remove this behaviour comment out this if statement and the following three lines.
                    if (nFollow>19)
                        {
                        nFollow=19;
                        }
//add the d20 roll to the difference between the DC and the creatures climb modifier.
//If the creature's climb modifier is greater than the DC it will always follow.
//If it is less than 20 (no chance) it will only follow on a roll of 20.  The better the
//chance the creature has to make the climb, the more likely it will try.
                    if (!(nFollow+nChance>20))
                        {
                        AssignCommand (oHostileFollow, ClearAllActions(TRUE));//clear all actions in cue, including combat
                        AssignCommand(oHostileFollow, ActionInteractObject (OClimbable));//use the climbable to try to follow (running this script for the hostile as well)
                        }


                }
            }
            nNth++;//advance the counter to the next nearest creature to the placeable.
            oHostileFollow=GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF,nNth);//get the next nearest non-pc creature and test While condition(above)
            }
        break;
     case 2:   //Critical Failure
        AssignCommand(oCreature, JumpToLocation(lFall));//fall location from the waypoint ClimbDestinationFall placed manually by the builder
        AssignCommand(oCreature, ActionPlayAnimation (ANIMATION_LOOPING_DEAD_BACK, 6.0));//fall animation, no actual knockdown effect.
        SetLocalInt (oCreature, "bFall", TRUE);//The FallTrigger painted at the location of the fall will read this local variable on the creature.
        //only if it is true (through this part of the script) will it fire the OnEnter commands.
        SetLocalInt (oCreature, "nFallDistance", 20);//sets the fall distance statically
//controls hostile creatures climbing down to follow a creature who falls, same conditions as above
        oHostileFollow=GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF,nNth);
        while (GetIsObjectValid(oHostileFollow))
            {
            if (!GetIsFriend(oHostileFollow, oCreature))
            {
                if (GetObjectSeen(oCreature, oHostileFollow))
                    {
                    int nChance=d20();
                    int nFollow=5-GetClimbClassMod(oHostileFollow);
                    if (nFollow>19)
                        {
                        nFollow=19;
                        }
                    if (!(nFollow+nChance>20))
                        {
                        AssignCommand (oHostileFollow, ClearAllActions(TRUE));
                        AssignCommand(oHostileFollow, ActionInteractObject (OClimbable));
                        }


                }
            }
            nNth++;
            oHostileFollow=GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF,nNth);
            }
        break;
    }



}
//The use of the fall Trigger is so that this script can be altered to act as
//a transition between areas.  Originally this system was set up to apply the damage
//by this script, however in cases where the player was moved to a new area because of a fall
//and that fall killed the player, the player would die at the placeable instead of at the fall location.
//In order to move a player into another area they cannot die when they enter the area.  Even using
//delay commands could get around this.  In order to cause creatures to fall into other map areas
//you will need to paint the fall trigger surrounding the fall location in a ring so that the player
//does not enter the trigger until after they have loaded the area and move themselves.  Once the players move
//they will enter the trigger, make a tumble check and have damage assigned to them.  This is not normally
//a problem unless the player dies as a result of the fall.
//The Fall Trigger is used to standardize everything, and make it easier to modify this script
//for using climbs as transitions to other areas.


