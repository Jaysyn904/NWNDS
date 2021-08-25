/* Combat Medic spontaneous heal ability
 *
 * Created July 17 2005
 * Author: GaiaWerewolf
 */
#include "prc_inc_spells"
#include "prc_getbest_inc"

int GetSpontaneousHealBurnableSpell(object oCaster)
{
    int nBurnableSpell = -1;

    nBurnableSpell = GetBestL6Spell(oCaster, nBurnableSpell);
    if(nBurnableSpell == -1)
        nBurnableSpell = GetBestL7Spell(oCaster, nBurnableSpell);
    if(nBurnableSpell == -1)
        nBurnableSpell = GetBestL8Spell(oCaster, nBurnableSpell);
    if(nBurnableSpell == -1)
        nBurnableSpell = GetBestL9Spell(oCaster, nBurnableSpell);

    return nBurnableSpell;
}

void main()
{
    //Declare our standard variables
    object oCaster = OBJECT_SELF;
    int nCasterLvl = GetLevelByTypeDivineFeats(oCaster, SPELL_HEAL);//character is most likely divine caster
    int nArcane = GetPrimaryArcaneClass(oCaster);
    if(nArcane == CLASS_TYPE_BARD || nArcane == CLASS_TYPE_WITCH)//but we check arcane classes just in case
    {
        int nTest = GetLevelByTypeArcaneFeats(oCaster, SPELL_HEAL);
        if(nTest > nCasterLvl)
            nCasterLvl = nTest;
    }

    int nClass, nLevel, i;
    int nBurnableSpell = -1;
    int bBioCastersLoopDone = 0;//will prevent running 'GetBestSpell' loops twice

    for(i = 1; i <= 3; i++)
    {
        nClass = GetClassByPosition(i, oCaster);

        if(GetSpellbookTypeForClass(nClass) == SPELLBOOK_TYPE_SPONTANEOUS)
        {
            for(nLevel = 6; nLevel < 10; nLevel++)
            {
                nBurnableSpell = persistant_array_get_int(oCaster, "NewSpellbookMem_" + IntToString(nClass), nLevel);
                if(nBurnableSpell > 0)
                    break;
            }

            if(nBurnableSpell > 0)
            {
                SetLocalInt(oCaster, "DomainCast", -1);
                SetLocalInt(oCaster, "NSB_Class", nClass);
                SetLocalInt(oCaster, "NSB_SpellLevel", nLevel);
                ActionCastSpell(SPELL_HEAL, nCasterLvl, 16 + GetAbilityModifier(ABILITY_WISDOM, oCaster), 0, METAMAGIC_NONE, CLASS_TYPE_INVALID, 0, 0, OBJECT_INVALID, FALSE);
                return;
            }
        }
        else if(GetSpellbookTypeForClass(nClass) == SPELLBOOK_TYPE_PREPARED)
        {
            string sFile = GetFileForClass(nClass);
            string sArrayIDX, sArray = "NewSpellbookMem_" + IntToString(nClass);
            int nSpellbookID, nSpellLevel, MaxValue;

            for(nLevel = 6; nLevel < 10; nLevel++)
            {
                sArrayIDX = "SpellbookIDX" + IntToString(nLevel) + "_" + IntToString(nClass);
                MaxValue = persistant_array_get_size(oCaster, sArrayIDX);
                int j = 0;
                while(j < MaxValue)
                {
                    nSpellbookID = persistant_array_get_int(oCaster, sArrayIDX, j);
                    nSpellLevel = StringToInt(Get2DACache(sFile, "Level", nSpellbookID));
                    if(nSpellLevel > 5)
                    {
                        nBurnableSpell = persistant_array_get_int(oCaster, sArray, nSpellbookID);
                        if(nBurnableSpell > 0)//escape while loop
                            break;
                    }
                    j++;
                }
                if(nBurnableSpell > 0)//escape for loop
                    break;
            }

            if(nBurnableSpell > 0)
            {
                SetLocalInt(oCaster, "DomainCast", -1);
                SetLocalInt(oCaster, "NSB_Class", nClass);
                SetLocalInt(oCaster, "NSB_SpellbookID", nSpellbookID);
                ActionCastSpell(SPELL_HEAL, nCasterLvl, 16 + GetAbilityModifier(ABILITY_WISDOM, oCaster), 0, METAMAGIC_NONE, CLASS_TYPE_INVALID, 0, 0, OBJECT_INVALID, FALSE);
                return;
            }
        }
        if(((nClass == CLASS_TYPE_BARD || nClass == CLASS_TYPE_SORCERER) && persistant_array_get_size(oCaster, "Spellbook" + IntToString(nClass)) != -1) ||//bard/sorcerer *not* using new spellbooks
             nClass == CLASS_TYPE_CLERIC || nClass == CLASS_TYPE_DRUID || nClass == CLASS_TYPE_WIZARD || nClass == CLASS_TYPE_DEFILER)//other bioware casters with 6+ spell levels
        {
            nBurnableSpell = bBioCastersLoopDone ? -1: GetSpontaneousHealBurnableSpell(oCaster);
            bBioCastersLoopDone = 1;
            if(nBurnableSpell != -1)
            {
                SetLocalInt(oCaster, "DomainCast", -1);
                SetLocalInt(oCaster, "Domain_BurnableSpell", nBurnableSpell + 1);
                ActionCastSpell(SPELL_HEAL, nCasterLvl, 16 + GetAbilityModifier(ABILITY_WISDOM, oCaster), 0, METAMAGIC_NONE, CLASS_TYPE_INVALID, 0, 0, OBJECT_INVALID, FALSE);
                return;
            }
        }
    }

    //if we got here - there's no burnable spells left
    FloatingTextStringOnCreature("You have no spells left to trade for a spontaneous heal.", oCaster, FALSE);
}