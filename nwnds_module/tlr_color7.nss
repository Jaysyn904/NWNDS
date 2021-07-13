//::///////////////////////////////////////////////
//:: Tailoring - Dye Color 7
//:: tlr_color7.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*
    Sets the color to 7.
*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 7);

    ExecuteScript("tlr_dyeitem", OBJECT_SELF);
}
