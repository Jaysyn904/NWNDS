#include "x2_inc_itemprop"

//*Checks to see if the EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE is still
//*there.  if not, the spell has expired or was dispelled
void CheckHasTensersEffects(object oTarget = OBJECT_SELF);

//*Checks to see if the EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE is still
//*there.  if not, the spell has expired or was dispelled
void CheckDivinePowerEffects(object oTarget);

//custom function so as not to conflict with nw_i0_spells (duplicate
//function implementation).  Also ensures a normal magical effect,
//in case a custom race or PrC has this effect generated as Supernatural
int VulcGetHasNormalEffect(int nEffectType, object oTarget = OBJECT_SELF)
{
    effect eCheck = GetFirstEffect(oTarget);
    while(GetIsEffectValid(eCheck))
    {
        if(GetEffectType(eCheck) == nEffectType &&
           GetEffectSubType(eCheck) == SUBTYPE_MAGICAL)
        {
             return TRUE;
        }
        eCheck = GetNextEffect(oTarget);
    }
    return FALSE;
}

//returns true if the weapon is an exotic weapon
int GetIsExoticWeapon(object oItem)
{
    //Declare major variables
    int nItem = GetBaseItemType(oItem);

    if((nItem == BASE_ITEM_DIREMACE) ||
      (nItem == BASE_ITEM_DOUBLEAXE) ||
      (nItem == BASE_ITEM_DWARVENWARAXE) ||
      (nItem == BASE_ITEM_KATANA) ||
      (nItem == BASE_ITEM_KUKRI) ||
      (nItem == BASE_ITEM_SCYTHE) ||
      (nItem == BASE_ITEM_KAMA) ||
      (nItem == BASE_ITEM_SHURIKEN) ||
      (nItem == BASE_ITEM_SICKLE) ||
      (nItem == BASE_ITEM_TWOBLADEDSWORD) ||
      (nItem == BASE_ITEM_WHIP))
   {
        return TRUE;
   }
   return FALSE;
}
//returns true if the weapon is a martial weapon
int GetIsMartialWeapon(object oItem)
{
    //Declare major variables
    int nItem = GetBaseItemType(oItem);

    if((nItem == BASE_ITEM_BATTLEAXE) ||
      (nItem == BASE_ITEM_GREATAXE) ||
      (nItem == BASE_ITEM_GREATSWORD) ||
      (nItem == BASE_ITEM_HALBERD) ||
      (nItem == BASE_ITEM_HANDAXE) ||
      (nItem == BASE_ITEM_LONGSWORD) ||
      (nItem == BASE_ITEM_SCIMITAR) ||
      (nItem == BASE_ITEM_HEAVYFLAIL) ||
      (nItem == BASE_ITEM_LIGHTFLAIL) ||
      (nItem == BASE_ITEM_LIGHTHAMMER) ||
      (nItem == BASE_ITEM_RAPIER) ||
      (nItem == BASE_ITEM_WARHAMMER) ||
      (nItem == BASE_ITEM_THROWINGAXE) ||
      (nItem == BASE_ITEM_LONGBOW) ||
      (nItem == BASE_ITEM_TRIDENT) ||
      (nItem == BASE_ITEM_SHORTBOW))
   {
        return TRUE;
   }
   return FALSE;
}
//returns true if the weapon is a simple weapon that wizards normally
//can't use
int GetIsSimpleWeapon(object oItem)
{
    //Declare major variables
    int nItem = GetBaseItemType(oItem);

    if((nItem == BASE_ITEM_CLUB) ||
      (nItem == BASE_ITEM_DAGGER) ||
      (nItem == BASE_ITEM_HEAVYCROSSBOW) ||
      (nItem == BASE_ITEM_LIGHTCROSSBOW) ||
      (nItem == BASE_ITEM_QUARTERSTAFF) ||
      (nItem == BASE_ITEM_LIGHTMACE) ||
      (nItem == BASE_ITEM_SICKLE) ||
      (nItem == BASE_ITEM_SHORTSPEAR) ||
      (nItem == BASE_ITEM_MORNINGSTAR) ||
      (nItem == BASE_ITEM_DART) ||
      (nItem == BASE_ITEM_SLING))
   {
        return TRUE;
   }
   return FALSE;
}
int GetIsElfWeapon(object oItem)
{
    //Declare major variables
    int nItem = GetBaseItemType(oItem);

    if((nItem == BASE_ITEM_LONGBOW) ||
      (nItem == BASE_ITEM_LONGSWORD) ||
      (nItem == BASE_ITEM_RAPIER) ||
      (nItem == BASE_ITEM_SHORTBOW))
   {
        return TRUE;
   }
   return FALSE;
}
int GetIsRogueWeapon(object oItem)
{
    //Declare major variables
    int nItem = GetBaseItemType(oItem);

    if((nItem == BASE_ITEM_CLUB) ||
      (nItem == BASE_ITEM_DAGGER) ||
      (nItem == BASE_ITEM_DART) ||
      (nItem == BASE_ITEM_HANDAXE) ||
      (nItem == BASE_ITEM_HEAVYCROSSBOW) ||
      (nItem == BASE_ITEM_LIGHTCROSSBOW) ||
      (nItem == BASE_ITEM_QUARTERSTAFF) ||
      (nItem == BASE_ITEM_LIGHTMACE) ||
      (nItem == BASE_ITEM_SHORTSWORD) ||
      (nItem == BASE_ITEM_RAPIER) ||
      (nItem == BASE_ITEM_MORNINGSTAR) ||
      (nItem == BASE_ITEM_SLING) ||
      (nItem == BASE_ITEM_SHORTBOW))
   {
        return TRUE;
   }
   return FALSE;
}
int GetIsMonkWeapon(object oItem)
{
    //Declare major variables
    int nItem = GetBaseItemType(oItem);

    if((nItem == BASE_ITEM_CLUB) ||
      (nItem == BASE_ITEM_DAGGER) ||
      (nItem == BASE_ITEM_HANDAXE) ||
      (nItem == BASE_ITEM_LIGHTCROSSBOW) ||
      (nItem == BASE_ITEM_HEAVYCROSSBOW) ||
      (nItem == BASE_ITEM_QUARTERSTAFF) ||
      (nItem == BASE_ITEM_SHURIKEN) ||
      (nItem == BASE_ITEM_KAMA) ||
      (nItem == BASE_ITEM_SLING))
   {
        return TRUE;
   }
   return FALSE;
}
int GetIsDruidWeapon(object oItem)
{
    //Declare major variables
    int nItem = GetBaseItemType(oItem);

    if((nItem == BASE_ITEM_LONGBOW) ||
      (nItem == BASE_ITEM_LONGSWORD) ||
      (nItem == BASE_ITEM_RAPIER) ||
      (nItem == BASE_ITEM_SHORTBOW))
   {
        return TRUE;
   }
   return FALSE;
}
int GetIsWizardWeapon(object oItem)
{
    //Declare major variables
    int nItem = GetBaseItemType(oItem);

    if((nItem == BASE_ITEM_CLUB) ||
      (nItem == BASE_ITEM_DAGGER) ||
      (nItem == BASE_ITEM_HEAVYCROSSBOW) ||
      (nItem == BASE_ITEM_LIGHTCROSSBOW) ||
      (nItem == BASE_ITEM_MAGICROD) ||
      (nItem == BASE_ITEM_MAGICSTAFF) ||
      (nItem == BASE_ITEM_MAGICWAND) ||
      (nItem == BASE_ITEM_QUARTERSTAFF))
   {
        return TRUE;
   }
   return FALSE;
}
int GetIsProficientWithWeapon(object oItem)
{
    int iReturn;
    if((GetIsMartialWeapon(oItem) && GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL)) ||
      (GetIsSimpleWeapon(oItem) && GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE)) ||
      (GetIsElfWeapon(oItem) && GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF)) ||
      (GetIsRogueWeapon(oItem) && GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE)) ||
      (GetIsMonkWeapon(oItem) && GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK)) ||
      (GetIsDruidWeapon(oItem) && GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID)) ||
      (GetIsWizardWeapon(oItem) && GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD)) ||
      (GetIsExoticWeapon(oItem) && GetHasFeat(IP_CONST_FEAT_WEAPON_PROF_EXOTIC)) ||
      (GetBaseItemType(oItem) == BASE_ITEM_MAGICSTAFF) ||
      (GetBaseItemType(oItem) == BASE_ITEM_SMALLSHIELD) ||
      (GetBaseItemType(oItem) == BASE_ITEM_LARGESHIELD) ||
      (GetBaseItemType(oItem) == BASE_ITEM_TOWERSHIELD) ||
      (GetBaseItemType(oItem) == BASE_ITEM_TORCH) ||
      (GetBaseItemType(oItem) == BASE_ITEM_MAGICROD) ||
      (GetBaseItemType(oItem) == BASE_ITEM_MAGICWAND))
    {
        return TRUE;
    }
    return FALSE;
}
void CheckHasTensersEffects(object oTarget = OBJECT_SELF)
{
    int nTenser =  GetLocalInt(oTarget,"tensers_transformation");
    object oRight, oLeft, oArmor;
    if(nTenser)
    {
        //check for turn resistance.  if gone, the spell was
        //dispelled/expired.
        if(VulcGetHasNormalEffect(EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE,oTarget))
        {
            return;
        }
        else
        {
            DeleteLocalInt(oTarget,"tensers_transformation");
            RestoreBaseAttackBonus(oTarget);
            oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oTarget);
            oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oTarget);
            oArmor = GetLocalObject(oTarget,"tensers_armor");
            SetItemCursedFlag(oArmor,FALSE);
            if(!GetIsProficientWithWeapon(oLeft))
            {
                AssignCommand(oTarget,ClearAllActions());
                AssignCommand(oTarget,ActionUnequipItem(oLeft));
            }
            if(!GetIsProficientWithWeapon(oRight))
            {
               AssignCommand(oTarget,ClearAllActions());
               AssignCommand(oTarget,ActionUnequipItem(oRight));
            }
        }
    }
}
void CheckDivinePowerEffects(object oTarget)
{
    if(VulcGetHasNormalEffect(EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE,oTarget))
    {
        return;
    }
    else
    {
        RestoreBaseAttackBonus(oTarget);
    }
}
//void main () {}
