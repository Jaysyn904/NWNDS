//::///////////////////////////////////////////////
//:: Tailoring - Dye Color 4
//:: tlr_color4.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*
    Sets the color to 4.
*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 4);

    ExecuteScript("tlr_dyeitem", OBJECT_SELF);
}
