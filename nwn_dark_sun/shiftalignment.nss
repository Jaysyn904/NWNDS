void ShiftAlignment (int Alignment, int Amount);

void ShiftAlignment (int Alignment, int Amount)
    {
    object oSpeaker;
    effect eAlignment;

    oSpeaker = GetPCSpeaker();

    switch (Alignment)
        {
        case ALIGNMENT_GOOD:
            eAlignment=EffectVisualEffect(VFX_IMP_HEAD_HOLY,FALSE);
            break;
        case ALIGNMENT_LAWFUL:
            eAlignment=EffectVisualEffect(VFX_IMP_HEAD_MIND,FALSE);
            break;
        case ALIGNMENT_EVIL:
            eAlignment=EffectVisualEffect(VFX_IMP_HEAD_EVIL,FALSE);
            break;
        case ALIGNMENT_CHAOTIC:
            eAlignment=EffectVisualEffect(VFX_IMP_HEAD_ODD,FALSE);
            break;
        case ALIGNMENT_NEUTRAL:
            eAlignment=EffectVisualEffect(VFX_IMP_HEAD_NATURE,FALSE);
            break;
        }
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eAlignment, oSpeaker, 0.5);
    AdjustAlignment(oSpeaker, Alignment, Amount);
    }
