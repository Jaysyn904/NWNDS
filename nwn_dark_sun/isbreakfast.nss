//::///////////////////////////////////////////////
//:: Is Breakfast
//:: IsBreakfast
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Returns TRUE if the module time is between
    4am & 10am
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: May 28, 2012
//:://////////////////////////////////////////////

int StartingConditional()
{
int nHour = GetTimeHour();

if (nHour > 10) return FALSE;
if (nHour < 4) return FALSE;

else return TRUE;
}
