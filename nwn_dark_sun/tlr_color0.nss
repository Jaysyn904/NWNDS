//::///////////////////////////////////////////////
//:: Tailoring - Dye Color 0
//:: tlr_color0.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*
    Sets the color to 0.
*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 0);

    ExecuteScript("tlr_dyeitem", OBJECT_SELF);
}
