void main()
{
    //added to enable defiling aura on NPC's
    object oEntering = GetEnteringObject();
    object oArea = GetArea(oEntering);
    SetLocalInt(oArea, "X2_L_WILD_MAGIC", 1);

    object oSpawner = GetObjectByTag("re_x1x2x3x5t0");
    SetLocalInt(oSpawner, "re_bFirstRun", FALSE);

}
