#include "ar_inc_wow"


void ARCleanPCLocalVar(object oPC);
void main()
{
    //Get the player that is resting/rested
    object oPlayer = GetLastPCRested();
    //Get that players name
    string sPlayerName = GetName(oPlayer);
    //determine whether they are done resting or just starting resting
    int nLastRestType = GetLastRestEventType();
    //Determine if they are resting at a bed or campsite
    int bBedOrCamp = GetIsObjectValid(GetLocalObject(oPlayer, "inbed"));

    //They are just now trying to rest
    if(nLastRestType == REST_EVENTTYPE_REST_STARTED)
    {
        //If they are trying to sleep at a bed or campsite
        if(bBedOrCamp)
        {
            // Restore 2e Psionic PSPs
             ExecuteScript("lib_psionrest", GetLastPCRested());
            // Run Database script
            ExecuteScript("ar_db_onrest",oPlayer);
            //Create a snoring effect
            effect eSnore = EffectVisualEffect(VFX_IMP_SLEEP);
            //Apply this to the player
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSnore, oPlayer, 7.0);
            ScanItems(oPlayer,FALSE);
            //Apply a delayed snore????
            DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSnore, oPlayer, 7.0));
            //Set a variable to FALSE so they aren't beaten and robbed when they come back
            SetLocalInt(oPlayer, "bExitPenalty", FALSE);
            //Tell the player it's safe to log out
            FloatingTextStringOnCreature("It is now safe for " + sPlayerName + " to log out.", oPlayer, FALSE);
            ExportSingleCharacter(oPlayer);



        }
        else //They are trying to sleep without a bed or campsite
        {
            //Clear all the players actions
            AssignCommand(oPlayer, ClearAllActions());
            //Tell them they connot sleep without a bed or campsite
            FloatingTextStringOnCreature(sPlayerName + " cannot rest here.  You must find a bed or a campsite.", oPlayer, FALSE);
        }
    }
   //They just got done resting or they canceled it
    else if(nLastRestType == REST_EVENTTYPE_REST_FINISHED || nLastRestType == REST_EVENTTYPE_REST_CANCELLED)
    {
        if(bBedOrCamp)
        {
            //Delete the varible that they are in bed
            DeleteLocalObject(oPlayer, "inbed");
            //Tell them they can no longer log out and be safe
            DelayCommand(25.0, FloatingTextStringOnCreature("It is no longer safe for "+ sPlayerName + " to log out.", oPlayer, FALSE));
            //Set the varible so they will be beaten and robbed if they leave
            DelayCommand(30.0, SetLocalInt(oPlayer, "bExitPenalty", TRUE));
        }
    }
if(GetLastRestEventType()==REST_EVENTTYPE_REST_FINISHED)
    {
        ARCleanPCLocalVar(GetLastPCRested());
        ScanItems(GetLastPCRested(),FALSE);
    }
}

void ARCleanPCLocalVar(object oPC)
{
    DeleteLocalObject(oPC, "BackLashAOE");
    DeleteLocalObject(oPC,"AR_CONSERVE_CASTER");
    DeleteLocalInt(oPC, "BackLash");
    DeleteLocalInt(oPC, "BackLashDice");
    DeleteLocalInt(oPC,"AR_CONSERVE");
    DeleteLocalInt(oPC,"AR_CONSERVE_DC");
    SetLocalInt(oPC,"TaintedAuraActive",0);
    DelayCommand(90.0f, SetLocalInt(oPC, "TSTimer", 0));

}
