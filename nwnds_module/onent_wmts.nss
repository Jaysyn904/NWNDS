void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC)) return;

    SetObjectVisualTransform(oPC, OBJECT_VISUAL_TRANSFORM_SCALE, 0.5f);
}
