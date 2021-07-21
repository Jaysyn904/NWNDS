//::///////////////////////////////////////////////
//:: HS Room Valet
//:: HS_RoomValet
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Picks inn room waypoint based on a variable 
    set on a nearby object, then moves the PC to
    that waypoint
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: May 29, 2012
//:://////////////////////////////////////////////


void main()
{
    object oValet = OBJECT_SELF;
    object oPC = GetPCSpeaker();    
    object oArea = GetArea(oValet);
    object oDesk = GetNearestObjectByTag("ZEP_DESK01");
    string sInnRoom = GetLocalString(oDesk, "INN_ROOM");
    object oWayPoint = GetWaypointByTag(sInnRoom);
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
