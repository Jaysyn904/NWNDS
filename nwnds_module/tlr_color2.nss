//::///////////////////////////////////////////////
//:: Tailoring - Dye Color 2
//:: tlr_color2.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*
    Sets the color to 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 2);

    ExecuteScript("tlr_dyeitem", OBJECT_SELF);
}
