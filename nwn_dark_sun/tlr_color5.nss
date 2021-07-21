//::///////////////////////////////////////////////
//:: Tailoring - Dye Color 5
//:: tlr_color5.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*
    Sets the color to 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 5);

    ExecuteScript("tlr_dyeitem", OBJECT_SELF);
}
