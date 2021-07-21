///////////////////////////////////////////////////////
// Mass Buff and debuff Effects
// Created: 03-12-06
// LastEdited: NiteCap-04-14-06
// Ability adjustments for mass buff spells
//      added debuff effects
//      added select PRC functions
//      added color textblitz
//
///////////////////////////////////////////////////////


#include "X2_I0_SPELLS"
#include "x0_i0_spells"
#include "x2_i0_spells"
//#include "x2_inc_spellhook"
#include "x2_inc_toollib"

//increase pc Dexterity
effect CreateBadSunEffectsLink();
void AddMassEffectDex(float fDuration,object oTarget,int nModify);
//increase pc Constitution
void AddMassEffectCon(float fDuration,object oTarget,int nModify);
//increase pc Charisma
void AddMassEffectCha(float fDuration,object oTarget,int nModify);
 //increase pc Intelegence
void AddMassEffectInt(float fDuration,object oTarget,int nModify);
//increase pc  Strength
void AddMassEffectStr(float fDuration,object oTarget,int nModify);
//adds the ultravision effect to pc
void AddMassEffectUVis(float fDuration, object oTarget);
//increase pc wizdom
void AddMassEffectWiz(float fDuration,object oTarget,int nModify);
//adds the shield of faith effect to pc
void AddMassEffectSoF(float fDuration,object oTarget,int nModify);

// Curse_of_Impending_Blades effect ac
void AddMassEffectCpb(float fDuration,object oTarget,int nModify);

// Curse_of_Petty_Failing effect ac
void AddMassEffectCpf(float fDuration,object oTarget,int nModify);

float TenMinutesToSeconds(int tenMinutes);

effect SPEffectTemporaryHitpoints(int nHitPoints);

float MinutesToSeconds(int minutes);

int SPResistSpell(object oCaster, object oTarget,int nCasterLevel = 0, float fDelay = 0.0 );

 // This function gets the meta magic int value
int SPGetMetaMagic();

// This function applies metamagic to a spell's duration, returning the new duration.
//      fDuration - the spell's normal duration.
//      nMetaMagic - metamagic constant, if -1 GetMetaMagic() is called.
float SPGetMetaMagicDuration(float fDuration, int nMetaMagic = -1);

void SPRaiseSpellCastAt(object oTarget, int bHostile = TRUE, int nSpellID = -1, object oCaster = OBJECT_SELF);

// Function to return a damage effect.
//      nDamageAmount - Amount of damage to apply.
//      nDamageType - DAMAGE_TYPE_xxx for the type of damage.
//      nDamagePower - DAMAGE_POWER_xxx power rating for the damage.
effect SPEffectDamage(int nDamageAmount, int nDamageType = DAMAGE_TYPE_MAGICAL,
    int nDamagePower = DAMAGE_POWER_NORMAL);

// Function to return damage shield effect
//      nDamageAmount - Amount of damage to apply.
//      nRandomAmount - DAMAGE_BONUS_xxx for amount of random bonus damage to apply.
//      nDamageType - DAMAGE_TYPE_xxx for the type of damage.
effect SPEffectDamageShield(int nDamageAmount, int nRandomAmount, int nDamageType);

//Function to return healing effect
//      nAmountToHeal - Amount of damage to heal.
effect SPEffectHeal(int nAmountToHeal);
// This function rolls damage and applies metamagic feats to the damage.
//      nDamageType - The DAMAGE_TYPE_xxx constant for the damage, or -1 for no
//          a non-damaging effect.
//      nDice - number of dice to roll.
//      nDieSize - size of dice, i.e. d4, d6, d8, etc.
//      nBonusPerDie - Amount of bonus damage per die.
//      nBonus - Amount of overall bonus damage.
//      nMetaMagic - metamagic constant, if -1 GetMetaMagic() is called.
//      returns - the damage rolled with metamagic applied.
int SPGetMetaMagicDamage(int nDamageType, int nDice, int nDieSize,
    int nBonusPerDie = 0, int nBonus = 0, int nMetaMagic = -1);

//Wrapper for The MaximizeOrEmpower function that checks for metamagic feats
//in channeled spells as well
int PRCMaximizeOrEmpower(int nDice, int nNumberOfDice, int nMeta, int nBonus = 0);


//Calculates the efective caster level for dispell checks.
//using the foci for abjuration
// also subtracts levels if the target has arcane defense
int ARDispellsAtLevel(object oPC,object oTarget);


//increase pc Dexterity
effect CreateBadSunEffectsLink()
{
    //Declare major variables
    effect eAttack = EffectAttackDecrease(1);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    //Link the effects
    effect eLink = EffectLinkEffects(eAttack, eDur);
    return eLink;
}

void AddMassEffectDex(float fDuration,object oTarget,int nModify)
{
    effect eDex;
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    eDex = EffectAbilityIncrease(ABILITY_DEXTERITY,nModify);
    effect eLink = EffectLinkEffects(eDex, eDur);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);

}

//increase pc Constitution
void AddMassEffectCon(float fDuration,object oTarget,int nModify)
{
    effect eCon;
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    //

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    eCon = EffectAbilityIncrease(ABILITY_CONSTITUTION, nModify);
    effect eLink = EffectLinkEffects(eCon, eDur);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
    //

}
//increase pc Charisma
void AddMassEffectCha(float fDuration,object oTarget,int nModify)
{
    effect eCha;
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    //

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    eCha = EffectAbilityIncrease(ABILITY_CHARISMA, nModify);
    effect eLink = EffectLinkEffects(eCha, eDur);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
    //

}

 //increase pc Intelegence
void AddMassEffectInt(float fDuration,object oTarget,int nModify)
{
    effect eInt;
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    //

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    eInt = EffectAbilityIncrease(ABILITY_INTELLIGENCE,nModify);
    effect eLink = EffectLinkEffects(eInt, eDur);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
    //

}

//increase pc  Strength
void AddMassEffectStr(float fDuration,object oTarget,int nModify)
{
    effect eStr;
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);


    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    eStr = EffectAbilityIncrease(ABILITY_STRENGTH, nModify);
    effect eLink = EffectLinkEffects(eStr, eDur);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);


}

//increase pc wizdom
void AddMassEffectWiz(float fDuration,object oTarget,int nModify)
{
    effect eWiz;
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);


    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    eWiz = EffectAbilityIncrease(ABILITY_WISDOM, nModify);
    effect eLink = EffectLinkEffects(eWiz, eDur);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);


}

//adds the ultravision effect to pc
void AddMassEffectUVis(float fDuration, object oTarget)
{
    effect eVis = EffectVisualEffect(VFX_DUR_ULTRAVISION);
    effect eVis2 = EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eUltra = EffectUltravision();
    effect eLink = EffectLinkEffects(eVis, eDur);
    eLink = EffectLinkEffects(eLink, eVis2);
    eLink = EffectLinkEffects(eLink, eUltra);

  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);

}

//adds the shield of faith effect to pc
void AddMassEffectSoF(float fDuration,object oTarget,int nModify)
{

 effect eVis = EffectVisualEffect(VFX_IMP_AC_BONUS);
 effect eAC = EffectACIncrease(nModify, AC_DEFLECTION_BONUS);
 effect eDur = EffectVisualEffect(VFX_DUR_PROTECTION_GOOD_MINOR);
 effect eLink = EffectLinkEffects(eAC, eDur);

 ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);


}

// Curse_of_Impending_Blades effect ac
void AddMassEffectCpb(float fDuration,object oTarget,int nModify)
{

 effect eVis = EffectVisualEffect(VFX_IMP_AC_BONUS);
 effect eAC = EffectACDecrease(nModify);
 effect eDur = EffectVisualEffect(VFX_IMP_PULSE_NEGATIVE);
 effect eLink = EffectLinkEffects(eAC, eDur);

 ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);


}


// Curse_of_Petty_Failing effect ac
void AddMassEffectCpf(float fDuration,object oTarget,int nModify)
{

 effect eVis = EffectVisualEffect(VFX_IMP_AC_BONUS);
 effect eAtt = EffectAttackDecrease(nModify,ATTACK_BONUS_MISC);
 effect eDur = EffectVisualEffect(VFX_IMP_PULSE_NEGATIVE);
 effect eLink = EffectLinkEffects(eAtt, eDur);

 ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);


}

/*
ADDED THIS SECTION TO GET THE SOME PRC SPELLS TO FUNCTION CORRECTLY
//NC:EDIT
*/
float MinutesToSeconds(int minutes)
{
    return TurnsToSeconds(minutes);
/*
    // Use HoursToSeconds to figure out how long a scaled minute
    // is and then calculate the number of real seconds based
    // on that.
    float scaledMinute = HoursToSeconds(1) / 60.0;
    float totalMinutes = minutes * scaledMinute;

    // Return our scaled duration, but before doing so check to make sure
    // that it is at least as long as a round / level (time scale is in
    // the module properties, it's possible a minute / level could last less
    // time than a round / level !, so make sure they get at least as much
    // time as a round / level.
    float totalRounds = RoundsToSeconds(minutes);
    float result = totalMinutes > totalRounds ? totalMinutes : totalRounds;
    return result;
*/
}

float TenMinutesToSeconds(int tenMinutes)
{
    return TurnsToSeconds(tenMinutes) * 10;
/*
    // Use HoursToSeconds to figure out how long a scaled 10 minute
    // duration is and then calculate the number of real seconds based
    // on that.
    float scaledMinute = HoursToSeconds(1) / 6.0;
    float totalMinutes = tenMinutes * scaledMinute;

    // Return our scaled duration, but before doing so check to make sure
    // that it is at least as long as a round / level (time scale is in
    // the module properties, it's possible a 10 minute / level could last less
    // time than a round / level !, so make sure they get at least as much
    // time as a round / level.
    float totalRounds = RoundsToSeconds(tenMinutes);
    float result = totalMinutes > totalRounds ? totalMinutes : totalRounds;
    return result;
*/
}


// Function to return temporary hit points effect
//      nHitPoints - Number of temp. hit points.
effect SPEffectTemporaryHitpoints(int nHitPoints)
{
    return EffectTemporaryHitpoints(nHitPoints);
    // PRC pack does not use version 2.0 of Bumpkin's PRC script package, so there is no
    // EffectPRCTemporaryHitpoints() method.  So just call the bioware default.
    //return EffectPRCTemporaryHitpoints(nHitPoints);
}


int SPResistSpell(object oCaster, object oTarget,int nCasterLevel = 0, float fDelay = 0.0 )
{
//  return MyResistSpell(oCaster, oTarget, fDelay);
    int result = MyResistSpell(oCaster, oTarget, fDelay);
    return result;
}

 // This function gets the meta magic int value
int SPGetMetaMagic()
{
    // Get the meta magic value from the engine then let the PRC code override.
    int nMetaMagic = GetMetaMagicFeat();
    // PRC pack does not use version 2.0 of Bumpkin's PRC script package, so there is no
    // PRCGetMetamagic() method.  So just call the bioware default.
    //nMetaMagic = PRCGetMetamagic(nMetaMagic);
    return nMetaMagic;
}


// This function applies metamagic to a spell's duration, returning the new duration.
//      fDuration - the spell's normal duration.
//      nMetaMagic - metamagic constant, if -1 GetMetaMagic() is called.
float SPGetMetaMagicDuration(float fDuration, int nMetaMagic = -1)
{
    // If the metamagic argument wasn't given get it.
    if (-1 == nMetaMagic) nMetaMagic = SPGetMetaMagic();

    // Apply extend metamagic.
    if (nMetaMagic & METAMAGIC_EXTEND) fDuration *= 2.0;
    return fDuration;
}

void SPRaiseSpellCastAt(object oTarget, int bHostile = TRUE, int nSpellID = -1, object oCaster = OBJECT_SELF)
{
    if (-1 == nSpellID) nSpellID = GetSpellId();

    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(oCaster, nSpellID, bHostile));
}
// Function to return a damage effect.
//      nDamageAmount - Amount of damage to apply.
//      nDamageType - DAMAGE_TYPE_xxx for the type of damage.
//      nDamagePower - DAMAGE_POWER_xxx power rating for the damage.
effect SPEffectDamage(int nDamageAmount, int nDamageType = DAMAGE_TYPE_MAGICAL,
    int nDamagePower = DAMAGE_POWER_NORMAL)
{
    return EffectDamage(nDamageAmount, nDamageType, nDamagePower);
    // PRC pack does not use version 2.0 of Bumpkin's PRC script package, so there is no
    // EffectPRCDamage() method.  So just call the bioware default.
    //return EffectPRCDamage(nDamageAmount, nDamageType, nDamagePower);
}
// Function to return damage shield effect
//      nDamageAmount - Amount of damage to apply.
//      nRandomAmount - DAMAGE_BONUS_xxx for amount of random bonus damage to apply.
//      nDamageType - DAMAGE_TYPE_xxx for the type of damage.
effect SPEffectDamageShield(int nDamageAmount, int nRandomAmount, int nDamageType)
{
    return EffectDamageShield(nDamageAmount, nRandomAmount, nDamageType);
    // PRC pack does not use version 2.0 of Bumpkin's PRC script package, so there is no
    // EffectPRCDamageShield() method.  So just call the bioware default.
    //return EffectPRCDamageShield(nDamageAmount, nRandomAmount, nDamageType);
}
//Function to return healing effect
//      nAmountToHeal - Amount of damage to heal.
effect SPEffectHeal(int nAmountToHeal)
{
    return EffectHeal(nAmountToHeal);
    // PRC pack does not use version 2.0 of Bumpkin's PRC script package, so there is no
    // EffectPRCHeal() method.  So just call the bioware default.
    //return EffectPRCHeal(nAmountToHeal);
}

// This function rolls damage and applies metamagic feats to the damage.
//      nDamageType - The DAMAGE_TYPE_xxx constant for the damage, or -1 for no
//          a non-damaging effect.
//      nDice - number of dice to roll.
//      nDieSize - size of dice, i.e. d4, d6, d8, etc.
//      nBonusPerDie - Amount of bonus damage per die.
//      nBonus - Amount of overall bonus damage.
//      nMetaMagic - metamagic constant, if -1 GetMetaMagic() is called.
//      returns - the damage rolled with metamagic applied.
int SPGetMetaMagicDamage(int nDamageType, int nDice, int nDieSize,
    int nBonusPerDie = 0, int nBonus = 0, int nMetaMagic = -1)
{
    // If the metamagic argument wasn't given get it.
    if (-1 == nMetaMagic) nMetaMagic = SPGetMetaMagic();

    // Roll the damage, applying metamagic.
    int nDamage = PRCMaximizeOrEmpower(nDieSize, nDice, nMetaMagic, (nBonusPerDie * nDice) + nBonus);
    return nDamage;
}


//Wrapper for The MaximizeOrEmpower function that checks for metamagic feats
//in channeled spells as well
int PRCMaximizeOrEmpower(int nDice, int nNumberOfDice, int nMeta, int nBonus = 0)
{
    int i = 0;
    int nDamage = 0;
    int nChannel = GetLocalInt(OBJECT_SELF,"spellswd_aoe");
    int nFeat = GetLocalInt(OBJECT_SELF,"spell_metamagic");
    int nDiceDamage;
    for (i=1; i<=nNumberOfDice; i++)
    {
        nDiceDamage = nDiceDamage + Random(nDice) + 1;
    }
    nDamage = nDiceDamage;
    //Resolve metamagic
    if (nMeta & METAMAGIC_MAXIMIZE || nFeat & METAMAGIC_MAXIMIZE)
//    if ((nMeta & METAMAGIC_MAXIMIZE))
    {
        nDamage = nDice * nNumberOfDice;
    }
    if (nMeta & METAMAGIC_EMPOWER || nFeat & METAMAGIC_EMPOWER)
//    else if ((nMeta & METAMAGIC_EMPOWER))
    {
       nDamage = nDamage + nDamage / 2;
    }
    return nDamage + nBonus;
}


// Sends a message to all PCs and DMs
// * colors are: "darkred",  "darkblue",  "darkgreen",
//               "lightred", "lightblue", "lightgreen",
//               "white",    "random"
// * If you don't choose a color, it will be randomly picked
// * You can also send a 3 digit RGB color code instead
// example: "ş  " would create light red
// 0-255:  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış
// (please note that 0 is actualy a space)
void ColorToAll(string message, string color="random");

// Sends a message to all players and dms
void ToAll(string message);

// Sends a message to all players in area
// * oArea is the area you want the message to go to
// * colors are: "darkred",  "darkblue",  "darkgreen",
//               "lightred", "lightblue", "lightgreen",
//               "white",    "random"
// * You can also send a 3 digit RGB color code instead
// example: "ş  " would create light red
// 0-255:  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış
// (please note that 0 is actualy a space)
void ColorToAllInArea(string message, object oArea, string color="random");

// Sends a message to all players in area
// * oArea is the area you want the message to go to
void ToAllInArea(string message, object oArea);

// Sends a message to a PC in color
// * colors are: "darkred",  "darkblue",  "darkgreen",
//               "lightred", "lightblue", "lightgreen",
//               "white",    "random"
// * You can also send a 3 digit RGB color code instead
// example: "ş  " would create light red
// 0-255:  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış
// (please note that 0 is actualy a space)
void ColorToOne(object oPC, string message, string color="random");

// Wraps a rainbow string, no visable output
// alone, needs to be used with other functions
// ToAll, SendMessageToPC, etc. Do not use with a color
// function, it will conflict
string Rainbow(string s);

// returns a three digit string usable by other textblitz functions
string RandomColor();

// Sends a message to a PC in color with floaty text
// * colors are: "darkblue",  "darkgreen",
//               "lightblue", "lightgreen",
//               "white",     "random"
// * bBroadcast is TRUE if you want other party members to see it.
// * You can also send a 3 digit RGB color code instead
// example: "ş  " would create light red
// 0-255:  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış
// (please note that 0 is actualy a space)
// Red doesnt work, i dont know why
void FloatyColorToOne(string message, object oPC, int bBroadcast=TRUE, string color="random");

void ColorToAll(string message, string color="random")
{
  if (color == "darkred")    color = "~  ";
  if (color == "lightred")   color = "ş  ";
  if (color == "darkblue")   color = "  ~";
  if (color == "lightblue")  color = "  ş";
  if (color == "darkgreen")  color = " ~ ";
  if (color == "lightgreen") color = " ş ";
  if (color == "white")      color = "şşş";
  if (color == "random")     color = RandomColor();
  ToAll("<c" + color + ">" + message + "</c>");
}

void ToAll(string message)
{
  SendMessageToAllDMs(message);
  object oPC = GetFirstPC();
  while(oPC != OBJECT_INVALID)
  {
    SendMessageToPC(oPC, message);
    oPC = GetNextPC();
  }
}

void ToAllInArea(string message, object oArea)
{
  object oPC = GetFirstObjectInArea(oArea);
  while(oPC != OBJECT_INVALID)
  {
    if (GetIsPC(oPC)) SendMessageToPC(oPC, message);
    oPC = GetNextObjectInArea(oArea);
  }
}

void ColorToAllInArea(string message, object oArea, string color="random")
{
  if (color == "darkred")    color = "~  ";
  if (color == "lightred")   color = "ş  ";
  if (color == "darkblue")   color = "  ~";
  if (color == "lightblue")  color = "  ş";
  if (color == "darkgreen")  color = " ~ ";
  if (color == "lightgreen") color = " ş ";
  if (color == "white")      color = "şşş";
  if (color == "random")     color = RandomColor();
  ToAllInArea("<c" + color + ">" + message + "</c>", oArea);
}


void ColorToOne(object oPC, string message, string color="random")
{
  if (color == "darkred")    color = "~  ";
  if (color == "lightred")   color = "ş  ";
  if (color == "darkblue")   color = "  ~";
  if (color == "lightblue")  color = "  ş";
  if (color == "darkgreen")  color = " ~ ";
  if (color == "lightgreen") color = " ş ";
  if (color == "white")      color = "şşş";
  if (color == "random")     color = RandomColor();
  SendMessageToPC(oPC, "<c" + color + ">" + message + "</c>");
}

// returns a three digit string usable by other textblitz functions
string RandomColor()
{
  string x = "!#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış";
  string c1 = "";
  string c2 = "";
  string c3 = "";
  while (c1 == "") c1 = GetSubString(x, Random(251), 1);
  while (c2 == "") c2 = GetSubString(x, Random(251), 1);
  while (c3 == "") c3 = GetSubString(x, Random(251), 1);
  return c1 + c2 + c3;
}

string Rainbow(string s)
{
  int max = GetStringLength(s);
  int i = 0;
  string final = "";
  while(i < max)
  {
    final += "<c" + RandomColor() + ">" + GetSubString(s, i, 1) + "</c>";
    i += 1;
  }
  return final;
}

void FloatyColorToOne(string message, object oPC, int bBroadcast=TRUE, string color="random")
{
  if (color == "darkblue")   color = "!!z";
  if (color == "lightblue")  color = "!!ş";
  if (color == "darkgreen")  color = "!z!";
  if (color == "lightgreen") color = "!ş!";
  if (color == "white")      color = "şşş";
  if (color == "random")     color = RandomColor();
  FloatingTextStringOnCreature("<c" + color + ">" + message + "</c>", oPC, bBroadcast);
}

//Calculates the efective caster level for dispell checks.
//using the foci for abjuration
int ARDispellsAtLevel(object oPC,object oTarget)
{
    int nLevel = GetCasterLevel(oPC);
    int nLevelAddition=0;

    if(GetHasFeat(FEAT_SPELL_FOCUS_ABJURATION,oPC))nLevelAddition+=2;
    if(GetHasFeat(FEAT_GREATER_SPELL_FOCUS_ABJURATION,oPC))nLevelAddition+=2;
    if(GetHasFeat(FEAT_EPIC_SPELL_FOCUS_ABJURATION,oPC))nLevelAddition+=2;
    if(GetHasFeat(FEAT_ARCANE_DEFENSE_ABJURATION,oTarget))nLevelAddition-=2;

    return nLevelAddition;

}

//void main(){}
