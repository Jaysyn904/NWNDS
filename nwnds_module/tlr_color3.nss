//::///////////////////////////////////////////////
//:: Tailoring - Dye Color 3
//:: tlr_color3.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*
    Sets the color to 3.
*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 3);

    ExecuteScript("tlr_dyeitem", OBJECT_SELF);
}
