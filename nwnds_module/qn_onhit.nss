//::///////////////////////////////////////////////
//:: qn_onhit
//:://////////////////////////////////////////////
/*
Touch Attacks (Creature Slam) Workaround:
    -5 Damage
      +20 Attack
      OnHit Cast Spell: Unique Power (Level 1)

TAG must be named the same as the script "qn_onhit" !!!

To use create a claw/slam/bite give it whatever damage
    you would like then change the TAG to the name of the
script.

Give it the OnHit Cast Spell: Unique Power (OnHit Level 1).

Assign the appropriate variable below. Example: Wraith
would be SPECIAL_ATTACK int 16.

I didn't use NWNs touch attack script... its too flawed. Higher
    level undead can Touch you more than once a round, so I made
    a workaround claw/slam noted at the very begning to make it
more D&D based. +20 to attack may seem like alot but you have
to figure that Incorporeal Undead are touching you which might
I add in 90% of the cases is very easy.

Of course you don't have to use this method - its optional.
*/
//:://////////////////////////////////////////////
//:: Created By: Q-Necron
//:://////////////////////////////////////////////
#include "x2_inc_switches"
#include "x2_inc_spellhook"

//Belker
void SmokeClaw(object oTarget, int nDC, int nRounds);

//Burn
void Burn(object oTarget, int nDamage);

//Spawn Undead
void SpawnUndead(object oTarget, string sRESREF, location lDeadPC);

//Drain Ability:
void NegativeAbility(object oTarget, int nAbility, int nDrain);

//Drain Ability or Death:
void NegativeOrDeath(object oTarget, int nAbility, int nDrain, string sRESREF, int bSpawn);

//Living Check
int GetIsLiving(object oTarget);

void main()
{
    //Make sure it fires correctly.
    if(GetUserDefinedItemEventNumber() == X2_ITEM_EVENT_ONHITCAST &&
    GetLocalInt(OBJECT_SELF, "SPECIAL_ATTACK") != 0)
    {
        object oTarget = GetAttemptedAttackTarget();
        int nAbility;
        int nAppearance = GetAppearanceType(OBJECT_SELF);
        int nCharisma = GetAbilityModifier(ABILITY_CHARISMA, OBJECT_SELF);
        int nConstitution = GetAbilityModifier(ABILITY_CONSTITUTION, OBJECT_SELF);
        int nDamage;
        int nDC;
        int nDrain;
        int nHD = GetHitDice(OBJECT_SELF);
        int nPower;
        int nTempHP;
        int nType;
        int nSpecial = GetLocalInt(OBJECT_SELF, "SPECIAL_ATTACK");
        int bSave = TRUE;
        int bSpawn = FALSE;
        int bSpectre = FALSE;
        int bStirge = FALSE;
        int nStrength = GetAbilityModifier(ABILITY_STRENGTH, OBJECT_SELF);
        int bTempHP = FALSE;
        int bWight = FALSE;
        effect eDamage;
        effect eTempHP;
        effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
        string sRESREF;

        //Determine special attack.
        switch(nSpecial)
        {
            //Allip
            case 1:
            nAbility = ABILITY_WISDOM;
            nDrain = d4(1);
            bSave = FALSE;
            bTempHP = TRUE;
            nTempHP = 5;
            break;

            //Cockatrice
            case 2:
            nDC = 10 + (nHD / 2) + nConstitution;
            if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_ALL, OBJECT_SELF) == 0)
            {
                //Apply effects.
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPetrify(), oTarget, RoundsToSeconds(nHD * 2));
            }
            return;
            break;

            //Succubus
            case 3:
            if(GetIsLiving(oTarget) == FALSE){return;}
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectNegativeLevel(1), oTarget));
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectConfused(), oTarget, RoundsToSeconds(12)));
            return;
            break;

            //Rake
            case 4:
            if(GetHasFeatEffect(FEAT_KNOCKDOWN, oTarget) == TRUE ||
            GetHasFeatEffect(FEAT_IMPROVED_KNOCKDOWN, oTarget) == TRUE)
            {
                //Determine creature appearance.
                switch(nAppearance)
                {
                    //Dire Tiger
                    case APPEARANCE_TYPE_CAT_CAT_DIRE:
                    nDamage = d4(2) + 4;
                    nType = DAMAGE_TYPE_SLASHING;
                    nPower = DAMAGE_POWER_NORMAL;
                    break;

                    //Androsphinx
                    case APPEARANCE_TYPE_SPHINX:
                    nDamage = d4(2) + 3;
                    nType = DAMAGE_TYPE_SLASHING;
                    nPower = DAMAGE_POWER_NORMAL;
                    break;

                    //Mountain Lion
                    case APPEARANCE_TYPE_CAT_COUGAR:
                    nDamage = d3(1) + 1;
                    nType = DAMAGE_TYPE_SLASHING;
                    nPower = DAMAGE_POWER_NORMAL;
                    break;

                    //Lion
                    case APPEARANCE_TYPE_CAT_LION:
                    nDamage = d4(1) + 2;
                    nType = DAMAGE_TYPE_SLASHING;
                    nPower = DAMAGE_POWER_NORMAL;
                    break;
                }

                //Set damage.
                eDamage = EffectDamage(nDamage, nType, nPower);

                //Apply effects.
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
            }
            return;
            break;

            //Fire Elemental
            case 5:
            nDC = 10 + (nHD / 2) + nConstitution;
            if(nHD <= 7){nDamage = d6(1);}//------------------ Medium
            else if(nHD >= 8 && nHD <= 15){nDamage = d6(2);}// Large
            else{nDamage = d8(2);}//-------------------------- Huge
            //Reflex Save
            if(ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_FIRE, OBJECT_SELF) == 0)
            {
                //Apply burn.
                DelayCommand(3.0f, Burn(oTarget, nDamage));
            }
            return;
            break;

            //Water Elemental
            case 6:
            if(GetHasSpellEffect(SPELL_DARKFIRE, oTarget) == TRUE ||
            GetHasSpellEffect(SPELL_ELEMENTAL_SHIELD, oTarget) == TRUE ||
            GetHasSpellEffect(SPELL_FLAME_WEAPON, oTarget) == TRUE &&
            d20(1) + nHD > 11 + GetHitDice(oTarget))//Dispel Check
            {
                object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTarget);
                object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);
                effect eVis = EffectVisualEffect(VFX_IMP_DISPEL);
                itemproperty ipDamage = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d6);
                itemproperty ipVis = ItemPropertyVisualEffect(ITEM_VISUAL_FIRE);

                //Elemental Shield
                effect eEffect = GetFirstEffect(oTarget);
                while(GetIsEffectValid(eEffect))
                {
                    if(GetHasSpellEffect(SPELL_ELEMENTAL_SHIELD, oTarget) == TRUE)
                    {
                        RemoveEffect(oTarget, eEffect);
                    }
                    eEffect = GetNextEffect(oTarget);
                }

                //Prevents stacking
                IPRemoveMatchingItemProperties(oLeft, GetItemPropertyType(ipDamage), DURATION_TYPE_TEMPORARY);
                IPRemoveMatchingItemProperties(oLeft, GetItemPropertyType(ipVis), DURATION_TYPE_TEMPORARY);
                IPRemoveMatchingItemProperties(oRight, GetItemPropertyType(ipDamage), DURATION_TYPE_TEMPORARY);
                IPRemoveMatchingItemProperties(oRight, GetItemPropertyType(ipVis), DURATION_TYPE_TEMPORARY);

                //Apply effects.
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            }
            return;
            break;

            //Ghoul, Ghast & Mohrg Paralysis
            case 7:
            nDC = 10 + (nHD / 2) + nCharisma;
            if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_ALL, OBJECT_SELF) == 0)
            {
                //Apply effects.
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectParalyze(), oTarget, RoundsToSeconds(nHD * 2));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), oTarget, RoundsToSeconds(nHD * 2));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PARALYZED), oTarget, RoundsToSeconds(nHD * 2));
            }
            return;
            break;

            //Trample
            case 8:
            nDC = 10 + (nHD / 2) + nStrength;
//          if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, nDC))
            if(ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_ALL, OBJECT_SELF) == 0)
            {
                //Determine creature appearance.
                switch(nAppearance)
                {
                    case APPEARANCE_TYPE_GORGON:
                    nDamage = d8(1) + 7;
                    break;

                    case APPEARANCE_TYPE_BEETLE_STAG:
                    nDamage = d8(2) + 3;
                    break;
                }

                //Set damage.
                eDamage = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL);

                //Apply effects.
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);

                //Set Local Int
                SetLocalInt(OBJECT_SELF, "SPECIAL_ATTACK", 0);
            }
            return;
            break;

            //Rend
            case 9:
            if(d2(1) == 1)
            {
                //Determine creature appearance.
                switch(nAppearance)
                {
                    case APPEARANCE_TYPE_GREY_RENDER:
                    case APPEARANCE_TYPE_TROLL:
                    case APPEARANCE_TYPE_TROLL_CHIEFTAIN:
                    case APPEARANCE_TYPE_TROLL_SHAMAN:
                    nDamage = d6(2) + 9;
                    nType = DAMAGE_TYPE_SLASHING;
                    nPower = DAMAGE_POWER_NORMAL;
                    break;
                }

                //Set damage.
                eDamage = EffectDamage(nDamage, nType, nPower);

                //Apply effects.
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
            }
            return;
            break;

            //Gelatinous Cube
            case 10:
            nDC = 10 + (nHD / 2) + nConstitution;
            if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_ALL, OBJECT_SELF) == 0)
            {
                //Apply effects.
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectParalyze(), oTarget, RoundsToSeconds(nHD * 2));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), oTarget, RoundsToSeconds(nHD * 2));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOW_GREEN), oTarget, RoundsToSeconds(nHD * 2));
            }
            return;
            break;

            //Belker Claw
            case 11:
            nDC = 10 + (nHD / 2) + nConstitution;
            //Smoke Claw
            SmokeClaw(oTarget, nDC, d3(2));
            return;
            break;

            //Shadow & Greater Shadow
            case 12:
            nAbility = ABILITY_STRENGTH;
            nDC = 10 + (nHD / 2) + nCharisma;
            bSave = FALSE;
            bSpawn = TRUE;
            sRESREF = "shadow01";
            //Determine creature appearance.
            switch(nAppearance)
            {
                //1d6 Strength Drain
                case APPEARANCE_TYPE_SHADOW:
                nDrain = d6(1);
                break;

                //1d8 Strength Drain
                case APPEARANCE_TYPE_SHADOW_FIEND:
                nDrain = d8(1);
                break;
            }
            break;

            //Spectre
            case 13:
            nDC = 10 + (nHD / 2) + nCharisma;
            bSpectre = TRUE;
            bTempHP = TRUE;
            nTempHP = 5;
            break;

            //Stirge
            case 14:
            nAbility = ABILITY_CONSTITUTION;
            nDrain = 1;
            bStirge = TRUE;
            bTempHP = TRUE;
            nTempHP = 1;
            eVis = EffectVisualEffect(VFX_IMP_HEAD_EVIL);
            break;

            //Wight
            case 15:
            nDC = 10 + (nHD / 2) + nCharisma;
            bWight = TRUE;
            bTempHP = TRUE;
            nTempHP = 5;
            break;

            //Wraith
            case 16:
            nAbility = ABILITY_CONSTITUTION;
            nDC = 10 + (nHD / 2) + nCharisma;
            nDrain = d6(1);
            bSpawn = TRUE;
            sRESREF = "wraith01";
            bTempHP = TRUE;
            nTempHP = 5;
            break;

            //Dread Wraith
            case 17:
            nAbility = ABILITY_CONSTITUTION;
            nDC = 10 + (nHD / 2) + nCharisma;
            nDrain = d8(1);
            bSpawn = TRUE;
            sRESREF = "wraith01";
            bTempHP = TRUE;
            nTempHP = 5;
            break;

            //Icegaunt
            case 18:
            nAbility = ABILITY_CONSTITUTION;
            nDC = 10 + (nHD / 2) + nCharisma;
            nDrain = d4(1);
            bTempHP = TRUE;
            nTempHP = 5;
            break;

            //Cinderspawn
            case 19:
            nAbility = ABILITY_CHARISMA;
            nDC = 10 + (nHD / 2) + nCharisma;
            nDrain = d6(1);
            bTempHP = TRUE;
            nTempHP = 5;
            break;

            //Sword Wraith
            case 20:
            nAbility = ABILITY_STRENGTH;
            nDrain = 1;
            bSave = FALSE;
            break;

            //Voidwraith
            case 21:
            nAbility = ABILITY_CONSTITUTION;
            nDC = 10 + (nHD / 2) + nCharisma;
            nDrain = d2(1);
            bTempHP = TRUE;
            nTempHP = 5;
            break;
        }

        //Constructs & Undead
        if(GetIsLiving(oTarget) == FALSE){return;}

        //Bone Ring
        if(GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oTarget)) == "r_bone" ||
        GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oTarget)) == "r_bone")
        {
            //Priceless...
            bSave = TRUE;
        }

        //Spectre
        if(bSpectre == TRUE)
        {
            nDrain = 2;
            //Fotitude Save!
            if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NEGATIVE) == 1){nDrain = 1;}

            //Apply effects.
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectNegativeLevel(nDrain), oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

            //Does the touch grant temporary HP?
            if(bTempHP == TRUE)
            {
                eTempHP = SupernaturalEffect(EffectTemporaryHitpoints(nTempHP));
                //Temporary HitPoints
                if(GetCurrentHitPoints(OBJECT_SELF) < (GetMaxHitPoints(OBJECT_SELF) * 2))
                {
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTempHP, OBJECT_SELF);
                }
            }
            return;
        }

        //Stirge
        if(bStirge == TRUE)
        {
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, RoundsToSeconds(nHD)));

            //Does the touch grant temporary HP?
            if(bTempHP == TRUE)
            {
                eTempHP = SupernaturalEffect(EffectTemporaryHitpoints(nTempHP));
                //Temporary HitPoints.
                if(GetCurrentHitPoints(OBJECT_SELF) < (GetMaxHitPoints(OBJECT_SELF) * 2))
                {
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTempHP, OBJECT_SELF);
                }
            }
            return;
        }

        //Wight
        if(bWight == TRUE)
        {
            //Fotitude Save!
            if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NEGATIVE) == 0)
            {
                //Apply effects.
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectNegativeLevel(1), oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

                //Does the touch grant temporary HP?
                if(bTempHP == TRUE)
                {
                    eTempHP = SupernaturalEffect(EffectTemporaryHitpoints(nTempHP));
                    //Temporary HitPoints
                    if(GetCurrentHitPoints(OBJECT_SELF) < (GetMaxHitPoints(OBJECT_SELF) * 2))
                    {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTempHP, OBJECT_SELF);
                    }
                }
            }
            return;
        }

        //Aw no save...
        if(bSave == FALSE)
        {
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            DelayCommand(0.1, NegativeOrDeath(oTarget, nAbility, nDrain, sRESREF, bSpawn));

            //Does the touch grant temporary HP?
            if(bTempHP == TRUE)
            {
                eTempHP = SupernaturalEffect(EffectTemporaryHitpoints(nTempHP));
                //Temporary HitPoints.
                if(GetCurrentHitPoints(OBJECT_SELF) < (GetMaxHitPoints(OBJECT_SELF) * 2))
                {
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTempHP, OBJECT_SELF);
                }
            }
        }
        //Save.
        else
        {
            //Fotitude Save!
            if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NEGATIVE) == 0)
            {
                DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                DelayCommand(0.1, NegativeOrDeath(oTarget, nAbility, nDrain, sRESREF, bSpawn));

                //Does the touch grant temporary HP?
                if(bTempHP == TRUE)
                {
                    eTempHP = SupernaturalEffect(EffectTemporaryHitpoints(nTempHP));
                    //Temporary HitPoints
                    if(GetCurrentHitPoints(OBJECT_SELF) < (GetMaxHitPoints(OBJECT_SELF) * 2))
                    {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTempHP, OBJECT_SELF);
                    }
                }
            }
        }
    }
}

//------------------------------------------------------------------------------
// Burn
//------------------------------------------------------------------------------
void Burn(object oTarget, int nDamage)
{
    effect eBurn = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);

    //Apply effects.
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eBurn, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}

//------------------------------------------------------------------------------
// Spawn Undead
//------------------------------------------------------------------------------
void SpawnUndead(object oTarget, string sRESREF, location lDeadPC)
{
    //Is the PC still dead?
    if(GetIsDead(oTarget) == TRUE)
    {
        //Create undead.
        CreateObject(OBJECT_TYPE_CREATURE, sRESREF, lDeadPC);
    }
    else
    {
        //Set Local Int
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 0);
    }
}

//------------------------------------------------------------------------------
// Drain Ability:
//------------------------------------------------------------------------------
void NegativeAbility(object oTarget, int nAbility, int nDrain)
{
    //Ablity Drain.
    effect eDrain = EffectAbilityDecrease(nAbility, nDrain);
    //Apply effects.
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDrain, oTarget);
}

//------------------------------------------------------------------------------
// Drain Ability or Death:
//------------------------------------------------------------------------------
void NegativeOrDeath(object oTarget, int nAbility, int nDrain, string sRESREF, int bSpawn)
{
    //Get PC's ability.
    int nAbilityScore = GetAbilityScore(oTarget, nAbility);

    //Current ability vs drain.
    if(nAbilityScore - nDrain <= 0 && GetIsPC(oTarget) == TRUE)
    {
        effect eDeath = EffectDeath();
        location lDeadPC = GetLocation(oTarget);

        //Apply effects
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, oTarget);

        //Get the killers RESREF and spawn another of its type.
        if(bSpawn == TRUE && GetLocalInt(OBJECT_SELF, "DO_ONCE") != 1)
        {
            DelayCommand(RoundsToSeconds(d3(2)), SpawnUndead(oTarget, sRESREF, lDeadPC));

            //Set Local Int
            SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
        }
    }
    else
    {
        //Ability Drain.
        DelayCommand(0.1, NegativeAbility(oTarget, nAbility, nDrain));
    }
}

//------------------------------------------------------------------------------
// Living Check
//------------------------------------------------------------------------------
int GetIsLiving(object oTarget)
{
    int bAlive;

    //Constructs & Undead
    if(GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT ||
    GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
    {
        return bAlive = FALSE;
    }
    else
    {
        return bAlive = TRUE;
    }
}

//------------------------------------------------------------------------------
// Smoke Claw
//------------------------------------------------------------------------------
void SmokeClaw(object oTarget, int nDC, int nRounds)
{
    //Fortitude Save
    if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_ALL, OBJECT_SELF) == 0)
    {
        nRounds--;
        effect eDamage = EffectDamage(d4(3));
        effect eVis = EffectVisualEffect(VFX_IMP_SILENCE);

        //Apply effects.
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

        //Smoke Claw
        if(nRounds != 0)
        {
            SmokeClaw(oTarget, nDC, nRounds);
        }
    }
}
