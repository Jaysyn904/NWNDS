const float WOW_POLYMORPH_HEARTBEAT = 1.0; // The delay between heartbeats
int wow_GetPrimaryAbility();
void wow_PolyFix();
effect wow_GetPolyFixEffect();
void wow_PolyHeartbeat();
void wow_RemovePolyFix();
int wow_CheckPoly();
int wow_GetPolySpellId();
void wow_PolyOnClientEnter();
int wow_CheckForCasterLevels();

int wow_CheckForCasterLevels()
{
    if(GetLevelByClass(CLASS_TYPE_BARD) > 0 ||
        GetLevelByClass(CLASS_TYPE_CLERIC) > 0 ||
        GetLevelByClass(CLASS_TYPE_DRUID) > 0 ||
        GetLevelByClass(CLASS_TYPE_PALADIN) > 0 ||
        GetLevelByClass(CLASS_TYPE_RANGER) > 0 ||
        GetLevelByClass(CLASS_TYPE_SHIFTER) > 0 ||
        GetLevelByClass(CLASS_TYPE_SORCERER) > 0 ||
        GetLevelByClass(CLASS_TYPE_WIZARD) > 0) return TRUE;
    else return FALSE;
}

void wow_PolyOnClientEnter()
{
    if(!GetIsPC(OBJECT_SELF))
    {
        AssignCommand(GetEnteringObject(), wow_PolyOnClientEnter());
    }
    else
    {
        if(wow_CheckPoly()) DelayCommand(WOW_POLYMORPH_HEARTBEAT, wow_PolyHeartbeat());
        else wow_RemovePolyFix();
    }
}

void wow_RemovePolyFix()
{
    effect eEffect = GetFirstEffect(OBJECT_SELF);
    int nType, nSpell;

    while(GetIsEffectValid(eEffect))
    {
        nType = GetEffectType(eEffect);
        nSpell = GetEffectSpellId(eEffect);
        if(nType == EFFECT_TYPE_ABILITY_INCREASE)
        {
            switch(nSpell)
            {
                case 184:
                case 387:
                case 388:
                case 389:
                case 390:
                case 391:
                case 392:
                case 393:
                case 394:
                case 395:
                case 396:
                case 397:
                case 398:
                case 399:
                case 400:
                case 401:
                case 402:
                case 403:
                case 404:
                case 405:
                case 658:
                case 659:
                case 660:
                case 661:
                case 662:
                case 672:
                case 678:
                case 680:
                case 670:
                case 673:
                case 674:
                case 679:
                case 691:
                case 694:
                case 682:
                case 683:
                case 684:
                case 704:
                case 705:
                case 706:
                case 707:
                case 708:
                case 709:
                case 733:
                case 734:
                case 735:
                case 738:
                case 739:
                case 740:
                {
                    RemoveEffect(OBJECT_SELF, eEffect);
                    break;
                }
            }
        }
        eEffect = GetNextEffect(OBJECT_SELF);
    }
}

int wow_GetPolySpellId()
{
    int nReturn = -1;
    effect eEffect = GetFirstEffect(OBJECT_SELF);
    int nType;

    while(GetIsEffectValid(eEffect))
    {
        nType = GetEffectType(eEffect);
        if(nType == EFFECT_TYPE_POLYMORPH) nReturn = GetEffectSpellId(eEffect);
        eEffect = GetNextEffect(OBJECT_SELF);
    }
    return nReturn;
}

int wow_CheckPoly()
{
    int nAppearance = GetAppearanceType(OBJECT_SELF);
    int nReturn = FALSE;
    int nSpell = wow_GetPolySpellId();
    switch(nSpell)
    {
        case 387:
        {
            if(nAppearance == 159) nReturn = TRUE;
            break;
        }
        case 388:
        {
            if(nAppearance == 167) nReturn = TRUE;
            break;
        }
        case 389:
        {
            if(nAppearance == 168) nReturn = TRUE;
            break;
        }
        case 390:
        {
            if(nAppearance == 55) nReturn = TRUE;
            break;
        }
        case 391:
        {
            if(nAppearance == 198) nReturn = TRUE;
            break;
        }
        case 392:
        {
            if(nAppearance == 49) nReturn = TRUE;
            break;
        }
        case 393:
        {
            if(nAppearance == 80) nReturn = TRUE;
            break;
        }
        case 394:
        {
            if(nAppearance == 38) nReturn = TRUE;
            break;
        }
        case 395:
        {
            if(nAppearance == 152) nReturn = TRUE;
            break;
        }
        case 396:
        {
            if(nAppearance == 89) nReturn = TRUE;
            break;
        }
        case 184:
        {
            if(nAppearance == 40) nReturn = TRUE;
            break;
        }
    }
    return nReturn;
}
void wow_PolyHeartbeat()
{
    if(wow_CheckPoly()) DelayCommand(WOW_POLYMORPH_HEARTBEAT, wow_PolyHeartbeat());
    else DelayCommand(1.0, wow_RemovePolyFix());
}

int wow_GetPrimaryAbility()
{
    int nAbility;
    int nClass = GetLastSpellCastClass();
    if(nClass == CLASS_TYPE_INVALID) nClass = CLASS_TYPE_SHIFTER;
    switch(nClass)
    {
        case CLASS_TYPE_BARD:
        case CLASS_TYPE_SORCERER:
        {
            nAbility = ABILITY_CHARISMA;
            break;
        }
        case CLASS_TYPE_CLERIC:
        case CLASS_TYPE_DRUID:
        case CLASS_TYPE_PALADIN:
        case CLASS_TYPE_RANGER:
        case CLASS_TYPE_SHIFTER:
        {
            nAbility = ABILITY_WISDOM;
            break;
        }
        case CLASS_TYPE_WIZARD:
        {
            nAbility = ABILITY_INTELLIGENCE;
            break;
        }
        default:
        {
            nAbility = -1;
            break;
        }
    }
    return nAbility;
}

void wow_PolyFix()
{
    if(GetIsPC(OBJECT_SELF) && wow_CheckForCasterLevels()  && (GetIsPC(GetSpellTargetObject()) || !GetIsObjectValid(GetSpellTargetObject())))
    {
        effect eEffect = wow_GetPolyFixEffect();
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, GetSpellTargetObject());
        AssignCommand(GetSpellTargetObject(), DelayCommand(WOW_POLYMORPH_HEARTBEAT, wow_PolyHeartbeat()));
    }
}

effect wow_GetPolyFixEffect()
{
    int nAbility = wow_GetPrimaryAbility();
    effect eEffect;
    if(nAbility != -1)
    {
        object oItem;
        int nSlot, nValue; // 13, 1
        itemproperty ipIP;
        for(nSlot = 0; nSlot <= 13; nSlot++)
        {
            oItem = GetItemInSlot(nSlot, OBJECT_SELF);
            if(GetIsObjectValid(oItem))
            {
                if(GetItemHasItemProperty(oItem, ITEM_PROPERTY_ABILITY_BONUS) || GetItemHasItemProperty(oItem, ITEM_PROPERTY_DECREASED_ABILITY_SCORE))
                {
                    ipIP = GetFirstItemProperty(oItem);
                    while(GetIsItemPropertyValid(ipIP))
                    {
                        if(GetItemPropertyType(ipIP) == ITEM_PROPERTY_ABILITY_BONUS)
                        {
                            if(GetItemPropertySubType(ipIP) == nAbility)
                            {
                                nValue += GetItemPropertyCostTableValue(ipIP);
                            }
                        }
                        else if(GetItemPropertyType(ipIP) == ITEM_PROPERTY_DECREASED_ABILITY_SCORE)
                        {
                            if(GetItemPropertySubType(ipIP) == nAbility)
                            {
                                nValue -= GetItemPropertyCostTableValue(ipIP);
                            }
                        }
                        ipIP = GetNextItemProperty(oItem);
                    }
                }
            }
        }
        if(nValue > 0)
        {
            eEffect = EffectAbilityIncrease(nAbility, nValue);
        }
    }
    return eEffect;
}
//void main () {}
