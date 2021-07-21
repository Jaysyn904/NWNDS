//::///////////////////////////////////////////////
//:: Name       Area Entery Message
//:: FileName   asg_i_skcusttext
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Some DM's whish to add flavor to there modules areas by
    adding in text discriptions. Here's a place you could
    add some in

    Usage:

        Just mach the Text Discription with a area tag
        it will display to the entering player.
        place your "If then ID's for the Area Tags"
        use sText as the return string.


*/
//:://////////////////////////////////////////////
//:: Created By:    Donny Wilbanks
//:: Created On:    9/7/03
//:://////////////////////////////////////////////

string ASG_CallAreaText(string sAreaTag)
{
    string sText = "No Area Details";
    object oPC = GetEnteringObject();
    object oMOD = GetModule();
    string sPDB = GetPCPlayerName(oPC); // Individule Player Database Name;
    string sName = GetName(oPC);
    string CDKey = GetPCPublicCDKey(oPC);
    string sID = GetStringLeft(sName,20); // Indivudual Character Used inside the
    string sHID = sName+CDKey; // Hcr Style;

    string sDawn = "/\-O-/\: It is Dawn, the sun is rising.  ";
    string sDay = "->O<-: It is Day.  ";
    string sDusk = ".-0-.: It is Dusk, the sun is setting.  ";
    string sNight = ".....: It is Night.  ";

    string sReturnText;
    string sTime;

    if (GetIsDawn()) sTime = sDawn;
    if (GetIsDay()) sTime = sDay;
    if (GetIsDusk()) sTime = sDusk;
    if (GetIsNight()) sTime = sNight;

    // **** Example of Area Discription
    if (sAreaTag=="AREATAGHERE")
    {
        sText = "You are in a cavern, water falls into a yellow flame lit chasim in the center. There is a piller of fire stretching from the dark abyss bellow that climbs into a shaft in the ceiling.";
        sText += " In the center of the piller of flame is a yellow glowing crystal.";
    }
    // *************************************************************************
    // ** Demo Addon
    if (sAreaTag=="TheOldRoad")
    {
        sText = "You have been following the old road for some time. During the day the woods are inhabitied by lions, Tigers and Bears. Who often hunt forest animals. At night the forest is comes alive with wolves and other dangerous caines.";
    }
    sReturnText = sTime+sText;
    return sReturnText;
    // Send Messages
}



