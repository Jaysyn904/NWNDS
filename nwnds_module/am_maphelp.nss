//::///////////////////////////////////////////////
//:: FileName: am_maphelp
//:: Copyright (c) 2006 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Alan Miranda
//:: Created On: June 14, 2007
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetPlaceableLastClickedBy();
    object oHelp = GetNearestObjectByTag("wm_help", OBJECT_SELF);

    PlaySound("gui_button");
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionExamine(oHelp));
}
