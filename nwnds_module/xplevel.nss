void XPLevel(int SetLevel)
{
    object oSpeaker;
    effect eLevel;
    int Level, XP, xxx;

    XP=0;

    for (xxx=1; xxx<SetLevel; xxx++)
    {
        XP+=xxx*1000;
    }

    oSpeaker=GetPCSpeaker();
    Level=GetXP(oSpeaker);

    if (Level>=XP)
        {
        eLevel=EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY,FALSE);
        }
    else if (Level<XP)
        {
        eLevel=EffectVisualEffect(VFX_IMP_RESTORATION_GREATER,FALSE);
        }
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLevel, oSpeaker, 0.5);
    SetXP(oSpeaker, XP);
}
