//Treasure Chest Loot
/*
 By: The Great Slayer of Gelatinous Cubes
 On: 1/31/03
 This generates loot in a treasure chest based on initial items placed in it
 Included is a CreateLootXTimes, for easy customization
 This goes in a containers on open event

 Enjoy!
*/
#include "TGSOFGC_INC"
void CreateLoot(object oSelf, int iNum)
//Originally I used the local object to set the stack size
//However, while this method should work, it seems to only work the first time
//The function is called, why is still a mystery
{
    int iPick = Random(iNum)+1; //The random number of the pick
    string sNum = IntToString(iPick);  //Convert the number into a string to use as a name
    string sResref = GetLocalString(oSelf, sNum);  //Get the resref stored under that number
   //////These two lines are relics to a mystery I would love an answer to
   // object oRef = GetLocalObject(oSelf, sNum);
   // int iStack = GetNumStackedItems(oRef);
   ///////////////////////////////////////////////
    CreateItemOnObject(sResref, oSelf, 1); //Spawn a stack size one of that loot
}
void CreateLootXTimes(int iTimes, object oChest, int iNum)
//This function is included for customization by novice scriptors whom are scared
//It Also reduces future needs to type, I am only including suport for:
//ints ranging between 0-30, if You run a function like create loot 30+ times you are asking to crash
//I recommend keeping this low, especially lower than about 15-20
//This script is dedicated to the god send of Copy+Paste
{
    if(iTimes == 1){
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 2){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 3){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 4){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 5){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 6){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 7){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 8){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 9){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 10){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 11){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 12){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 13){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 14){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 15){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 16){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 17){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 18){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 19){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 20){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 21){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 22){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 23){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 24){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 25){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 26){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 27){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 28){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 29){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    if(iTimes == 30){
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
        CreateLoot(oChest, iNum);
    }
    else{}
}
void main()
//This script goes in a container's on open event
{
    object oChest = OBJECT_SELF; //The container
    float fDelay = RandomFloat(1200.0)+600.0; //Respawn delay = 10-20 minutes
    //float fDelay = 1.0;  //This is  a relic of testing
    int iLocal = GetLocalInt(oChest, "switch"); //The switch local keeps track of three states, first time open/unopened = 0, will spawn treasure when opened = 1, nothing special = 2
    if(iLocal == 0){ //This should only fire the first time it is opened
        int iNumber = CountItemsInInventory(oChest); //This should only run once, and sets the approprait local variables for the createloot function
        SetLocalInt(oChest, "items", iNumber);//Store the info above, so you don't need to run more counts
        EmptyInventory(oChest);//Get rid of the initial stuff, that made up the options or loot table
        CreateLoot(oChest, iNumber); //Create one peice of loot
        SetLocalInt(oChest, "switch", 2); //Set to deactivate
        DelayCommand(fDelay, SetLocalInt(oChest, "switch", 1));  //After the delay passes set to 1, or active
    }
    if(iLocal == 1){
        int iNum = GetLocalInt(oChest, "items"); //Get the local int, set above so you don't need to count again. Multiple counts after the emptying and or additions wrecks the loot table
        CreateLoot(oChest, iNum); //Create one peice of loot
        SetLocalInt(oChest, "switch", 2);//Set it to disabled
        DelayCommand(fDelay, SetLocalInt(oChest, "switch", 1));//After the delay re-enable the chest
    }
    else{}//if iLocal doesn't equal 1 or 0, ie 2, then it is disabled (take no special actions)
}
