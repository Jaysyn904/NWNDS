void main()
{
object oModel = OBJECT_SELF;
object oPC = GetPCSpeaker();
int nPCAppearance = GetAppearanceType(oPC);
int nPCSex= GetGender(oPC);
int nModelSex =GetGender(OBJECT_SELF);

    if(nPCSex != nModelSex)
    {
        string sErrorText = "Please speak with the other visage.";
        FloatingTextStringOnCreature(sErrorText, oModel);
        FloatingTextStringOnCreature(sErrorText, oModel);
        SendMessageToPC(oPC,sErrorText);
        return;

    }

    SetCreatureAppearanceType(oModel,nPCAppearance);

}
