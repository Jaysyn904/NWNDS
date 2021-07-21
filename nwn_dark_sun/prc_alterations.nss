//::///////////////////////////////////////////////
//:: Include nexus
//:: prc_alterations
//::///////////////////////////////////////////////
/*
    This is the original include file for the PRC Spell Engine.

    Various spells, components and designs within this system have
    been contributed by many individuals within and without the PRC.


    These days, it serves to gather links to almost all the PRC
    includes to one file. Should probably get sorted out someday,
    since this slows compilation. On the other hand, it may be
    necessary, since the custom compiler can't seem to handle
    the most twisted include loops.
    Related TODO to any C++ experts: Add #DEFINE support to nwnnsscomp

    Also, this file contains misceallenous functions that haven't
    got a better home.
*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////


//return a location that PCs will never be able to access
location PRC_GetLimbo();

//int GetSkill(object oObject, int nSkill, int bSynergy = FALSE, int bSize = FALSE, int bAbilityMod = TRUE, int bEffect = TRUE, int bArmor = TRUE, int bShield = TRUE, int bFeat = TRUE);

//////////////////////////////////////////////////
/*                 Constants                    */
//////////////////////////////////////////////////

// const int ERROR_CODE_5_FIX_YET_ANOTHER_TIME = 1;

//////////////////////////////////////////////////
/* Include section                              */
//////////////////////////////////////////////////

// Generic includes

#include "inc_abil_damage"

//////////////////////////////////////////////////
/* Function Definitions                         */
//////////////////////////////////////////////////

//return a location that PCs will never be able to access
location PRC_GetLimbo()
{
    int i = 0;
    location lLimbo;

    while (1)
    {
        object oLimbo = GetObjectByTag("Limbo", i++);

        if (oLimbo == OBJECT_INVALID) {
            PrintString("PRC ERROR: no Limbo area! (did you import the latest PRC .ERF file?)");
            return lLimbo;
        }

        if (GetName(oLimbo) == "Limbo" && GetArea(oLimbo) == OBJECT_INVALID)
        {
            vector vLimbo = Vector(0.0f, 0.0f, 0.0f);
            lLimbo = Location(oLimbo, vLimbo, 0.0f);
        }
    }
    return lLimbo;      //never reached
}

//Also serves as a store of all item creation feats
int GetItemCreationFeatCount()
{
    return(GetHasFeat(FEAT_CRAFT_WONDROUS)
          + GetHasFeat(FEAT_CRAFT_STAFF)
          + GetHasFeat(FEAT_CRAFT_ARMS_ARMOR)
          + GetHasFeat(FEAT_FORGE_RING)
          + GetHasFeat(FEAT_CRAFT_ROD)
          + GetHasFeat(FEAT_CRAFT_CONSTRUCT)
          + GetHasFeat(FEAT_SCRIBE_SCROLL)
          + GetHasFeat(FEAT_BREW_POTION)
          + GetHasFeat(FEAT_CRAFT_WAND)
          + GetHasFeat(FEAT_ATTUNE_GEM)
          + GetHasFeat(FEAT_CRAFT_SKULL_TALISMAN)
          + GetHasFeat(FEAT_INSCRIBE_RUNE)
        //+ GetHasFeat(?)
            );
}

