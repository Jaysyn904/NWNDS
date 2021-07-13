//::///////////////////////////////////////////////
//:: Tailoring - Dye Color 1
//:: tlr_color1.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*
    Sets the color to 1.
*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 1);

    ExecuteScript("tlr_dyeitem", OBJECT_SELF);
}
