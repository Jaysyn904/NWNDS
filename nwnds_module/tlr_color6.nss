//::///////////////////////////////////////////////
//:: Tailoring - Dye Color 6
//:: tlr_color6.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*
    Sets the color to 6.
*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 6);

    ExecuteScript("tlr_dyeitem", OBJECT_SELF);
}
