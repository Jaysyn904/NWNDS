//PRC racial pack compatible PWFXP script
//
//PRC Version: 3.1e
//Written by: Silvercloud (scl.vcs-online.com) & Ornedan
// Modified by fluffyamoeba for 3.x versions of the PRC
/*

changes: 2007-11-14

- pwfxp_prc_race now reads the 2da cache directly.

- the race LA is done entirely through this script. DO NOT set PRC_XP_USE_SIMPLE_LA 
  or the XP penalty will be applied twice
  
- if using this with the supplied prc_pwondeath script, you don't need to make any
  changes to nw_c2_default7 (the OnDeath script)
  
- prc_racial_const no longer used
  
=================

Include added for prc races: pwfxp_prc_race, modify this file if you want to
adjust ECLs (the subrace constants in pwfxp_def is removed).

Main function for determining ECL rewritten to hook into getECLMod.

package includes prc_racial_const for completeness, but you do not have to over-
write the one in your world per se (for example if you have more races).

have fun,

Silvercloud


//::///////////////////////////////////////////////
//:: XP Distribution Script by Knat
//:: pwfxp v1.70
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////


  IMPORTANT: see pwfxp_def modifier definition script...

  check this link in case you want to discuss this script:
    http://www.thefold.org/nuke/modules.php?name=Forums&file=viewforum&f=69

  This is a more sophisticated XP distribution script geared towards PWs.
  It comes with two dozen XP modifiers to fine tune XP output and
  is losely based on the old but solid TTV XP script.

  here is a small example of features, all modifiers are scalable:

  - independent XP modifier for every single level. this breaks nwns linear
    XP progression and enables you to define your own progression function.
    you can give out fast xp early and let players slow down at any rate you want.
    or model your own progression function with the manipulation of two constants

  - PCs suffer XP reduction if their level is not close enough to the average
    party level. level 1 grouping with level 10 is probably not a good idea...

  - PCs suffer XP reduction if their level is not close enough to the CR of the killed MOB
    (both directions independent now)

  - Adjustable & cached ECL modifiers, easy to sync with any subrace scripts

  - Group bonus. groups receive a small XP bonus (or big, if you wish) to encourage teamplay

  - Groupmembers need to be within minimum distance to the killed MOB if they want to receive XP

  - associates get a share of the xp, but you can set a different divisor for each associate type
    e.g.: henchman soak up more XP then animal companions

  - several counter exploit mechanisms included

  - many more, see the constants...

  - easy to add new modifiers..

  all in all, this is pushing the nwn XP system more close to what you get in a MMORPG. You can
  make it very hard to level or easy as hell, with good control of group impact and flexible
  boundaries.

  system went through extensive beta tests at www.thefold.org - thanks to all the great
  players and staff there...

  ------------------------------------------------------------------------------------------
  --- USAGE --- --- USAGE --- --- USAGE --- --- USAGE --- --- USAGE ------------------------
  ------------------------------------------------------------------------------------------

  just add the following line to the onDeath script of your creatures (default: nw_c2_default7):

    ExecuteScript("pwfxp",OBJECT_SELF);

  Don't forget to set the XP-Scale slider to 0 (module properties)
  
  *note* if using your own prc_pwondeath script add this to that script instead.

  ATTENTION: HOW TO REMOVE THE DOUBLE XP MESSAGE !

  put this code above the pwfxp execution in your onDeath script

   // safety mechanism in case creature kills itself
   if(GetLastKiller() == OBJECT_SELF) return;

  put this code near the bottom of your onDeath script to remove the double-xp message
  thanks to spider661/Sotae for this catch...

    // resurrect & self kill to bypass bioware xp message
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(10000, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY), OBJECT_SELF);

  ------------------------------------------------------------------------------------------

  changelog:

  v1.7 update (3/2004)

  - added PWFXP_MAXIMUM_XP constant due to user request...

  v1.62 update (2/2004)

  - fixed documentation error. using the wrong info could lead to divide by zero error

    if you want to eliminate mob CR < PC-Level reduction:
     set PWFXP_CR_LESSTHAN_PCLEVEL_REDUCTION to PWFXP_CR_MAX and
         PWFXP_CR_LESSTHAN_PCLEVEL_NOXP      to PWFXP_CR_MAX + 1

    if you want to eliminate mob CR > PC-Level reduction:
     set PWFXP_CR_GREATERTHAN_PCLEVEL_REDUCTION to PWFXP_CR_MAX and
         PWFXP_CR_GREATERTHAN_PCLEVEL_NOXP      to PWFXP_CR_MAX + 1

    if you want to eliminate Average Party Level reduction:
     set PWFXP_APL_REDUCTION to 40 and
         PWFXP_APL_NOXP to 41

    thanx to tribble for the catch

  v1.61 update(1/2004)

  - fixed minor naming convention error

  v1.6 update(1/2004)

  - improved XP divisor. you can now distinct between animal companion,
    familiar, dominated, summoned and henchman. you can set a different
    xp divisor for each of them. (default: henchman has max reduction impact followed
    by dominated, summoned, familiars, animal companion)

    see PWFXP_XP_DIVISOR_* constants

  - added PWFXP_USE_TOTAL_XP_TO_COMPUTE_PCLEVEL constant
    pc level gets computed based on the total XP instead of
    using GetLevelBy functions if set to TRUE. this way players ready to levelup
    can't bunker XP to gain better XP bonuses/modifiers.

  - removed dumb debug fragments, no more svirfneblin invasions...
    thanks to Beowulf for the catch...

  v1.5 update(12/2003)

  - improved ECL modifier: added caching to decrease cpu use
                           improved parser

  v1.4 update(12/2003)

  - removed constant PWFXP_CR_REDUCTION and PWFXP_CR_NOXP

  - added 4 new constants instead to distinct between..
      PC-Level > CR
      PC-Level < CR
    ..cases:

    PWFXP_CR_LESSTHAN_PCLEVEL_REDUCTION
    PWFXP_CR_LESSTHAN_PCLEVEL_NOXP
    PWFXP_CR_GREATERTHAN_PCLEVEL_REDUCTION
    PWFXP_CR_GREATERTHAN_PCLEVEL_NOXP

  - added PWFXP_USE_SETXP constant

  - split the script up. now all constants are isolated in their own
    definiton file (pwfxp_def). easier to update that way...

  v1.3 update (12/2003)

  - added PWFXP_LEVEL_MODIFIERS. this removes the linear xp output... read more below

  v1.2 update (10/2003)

  - killer gets excluded from distance check now if he *is* a PC.
    he gets XP even if his spell kills something far away (e.g. long range spells,
    damage over time spells. maybe traps, not tested so far. this does not include NPCs)
    every other groupmember gets still checked for distance...
    [thanks to telstar for the report/request...]

  v1.1 initial full release (10/2003)

  - fine tuned and slightly optimized code
  - added debug toggle

  v1.0 beta (8/2003):

  - distance check should now work correctly

  - minimum XP award (see new PWFXP_MINIMUM_XP constant)

  - henchman, familiars, animal companions, summoned creatures and other NPCs in a player
    group now take away XP. see PWFXP_XP_DIVISOR_PC and PWFXP_XP_DIVISOR_NPC constants

  - made it easier to manage ECL modifiers. see PWFXP_ECL_MODIFIERS string constant

*/
//:://////////////////////////////////////////////
//:: Created By: LasCivious & Knat
//:: Created On: 7/2003
//:://////////////////////////////////////////////

#include "pwfxp_def"
#include "pwfxp_prc_race"


int PWFXP_GetLevel(object oPC)
{
  // we need to use a derivation of the base xp formular to compute the
  // pc level based on total XP.
  //
  // base XP formula (x = pc level, t = total xp):
  //
  //   t = x * (x-1) * 500
  //
  // need to use some base math..
  // transform for pq formula use (remove brackets with x inside and zero right side)
  //
  //   x^2 - x - (t / 500) = 0
  //
  // use pq formula to solve it [ x^2 + px + q = 0, p = -1, q = -(t/500) ]...
  //
  // that's our new formular to get the level based on total xp:
  //   level = 0.5 + sqrt(0.25 + (t/500))
  //
  if(PWFXP_USE_TOTAL_XP_TO_COMPUTE_PCLEVEL) // use total XP to compute PC level
    return FloatToInt(0.5 + sqrt(0.25 + ( IntToFloat(GetXP(oPC)) / 500 )));
  else  // use total class level to compute PC level
    return GetLevelByPosition(1,oPC) + GetLevelByPosition(2,oPC) + GetLevelByPosition(3,oPC);
}



// see PWFXP_ECL_MODIFIERS constant description
float PWFXP_GetECLModifier(object oPC)
{
  // get current
  int nHD  = GetHitDice(oPC);

  // get last PC HD from cache
  int nECLHitDice = GetLocalInt(oPC,"PWFXP_ECL_HITDICE");

  // last PC HD = current PC HD ? get ECL modifier from cache and return...
  if(nECLHitDice == nHD) return GetLocalFloat(oPC,"PWFXP_ECL_MODIFIER");

  // recompute ECL modifier and cache it
  // this code section will run only in the case of two circumstances:
  //
  // 1. first time kill
  // 2. pc hitdice change (e.g. levelup)
  float fECLMod;
    fECLMod = IntToFloat(nHD) / (IntToFloat(nHD) + IntToFloat(GetECLMod(oPC)));
  SetLocalFloat(oPC,"PWFXP_ECL_MODIFIER", fECLMod);
  SetLocalInt(oPC,"PWFXP_ECL_HITDICE",nHD);
  return fECLMod;
}
// see PWFXP_LEVEL_MODIFIER constant description
float PWFXP_GetLevelModifier(int nLevel)
{
  return StringToFloat(GetSubString( PWFXP_LEVEL_MODIFIERS, (nLevel - 1) * 7, 6));
}

// see PWFXP_APL_REDUCTION & PWFXP_APL_NOXP constant description
float PWFXP_GetLevelDistanceModifier(float fLevelDistance)
{
  if( fLevelDistance >= PWFXP_APL_NOXP )
  {
    // level distance greater than maximum allowed > no XP award at all
    return 0.0; // -100%
  }
  else if(fLevelDistance >= PWFXP_APL_REDUCTION)
  {
    // level distance greater than reduction limit ? reduce xp
    return 1 - ((fLevelDistance - PWFXP_APL_REDUCTION) * PWFXP_APL_MODIFIER);
  }
  return 1.0;
}

// see PWFXP_CR_LESSTHAN_PCLEVEL_REDUCTION, PWFXP_CR_LESSTHAN_PCLEVEL_NOXP
//     PWFXP_CR_GREATERTHAN_PCLEVEL_REDUCTION, PWFXP_CR_GREATERTHAN_PCLEVEL_NOXP
//     constant description
float PWFXP_GetCRDistanceModifier(float fCRDistance)
{
  // PC level > creature CR ?
  if(fCRDistance < 0.0)
  {
    fCRDistance = fabs(fCRDistance);
    if( fCRDistance >= PWFXP_CR_LESSTHAN_PCLEVEL_NOXP )
    {
      // level distance greater than maximum allowed > no XP award at all
      return 0.0; // -100%
    }
    else if(fCRDistance >= PWFXP_CR_LESSTHAN_PCLEVEL_REDUCTION)
    {
      // level distance greater than reduction limit ? reduce xp
      return 1 - ((fCRDistance - PWFXP_CR_LESSTHAN_PCLEVEL_REDUCTION) * PWFXP_CR_LESSTHAN_PCLEVEL_MODIFIER);
    }
  }
  else
  {
    fCRDistance = fabs(fCRDistance);
    if( fCRDistance >= PWFXP_CR_GREATERTHAN_PCLEVEL_NOXP )
    {
      // level distance greater than maximum allowed > no XP award at all
      return 0.0; // -100%
    }
    else if(fCRDistance >= PWFXP_CR_GREATERTHAN_PCLEVEL_REDUCTION)
    {
      // level distance greater than reduction limit ? reduce xp
      return 1 - ((fCRDistance - PWFXP_CR_GREATERTHAN_PCLEVEL_REDUCTION) * PWFXP_CR_GREATERTHAN_PCLEVEL_MODIFIER);
    }
  }
  return 1.0;
}

// see PWFXP_KILLINGBLOW_MODIFIER constant description
float PWFXP_GetMiscModifier(object oPC, object oKiller)
{
  if(oPC == oKiller && PWFXP_KILLINGBLOW_MODIFIER != 0.0)
  {
    return 1 + PWFXP_KILLINGBLOW_MODIFIER;
  }
  return 1.0;
}

// see PWFXP_GROUPBONUS_MODIFIER constant description
float PWFXP_GetGroupBonusModifier(int nGroupSize)
{
  return 1 + ((nGroupSize-1) * PWFXP_GROUPBONUS_MODIFIER);
}

// see PWFXP_XP_DIVISOR_* constants
float PWFXP_GetAssociateDivisor(object oCreature)
{
  switch(GetAssociateType(oCreature))
  {
    case ASSOCIATE_TYPE_ANIMALCOMPANION: return PWFXP_XP_DIVISOR_ANIMALCOMPANION;
    case ASSOCIATE_TYPE_DOMINATED: return PWFXP_XP_DIVISOR_DOMINATED;
    case ASSOCIATE_TYPE_FAMILIAR: return PWFXP_XP_DIVISOR_FAMILIAR;
    case ASSOCIATE_TYPE_HENCHMAN: return PWFXP_XP_DIVISOR_HENCHMAN;
    case ASSOCIATE_TYPE_SUMMONED: return PWFXP_XP_DIVISOR_SUMMONED;
    default: return PWFXP_XP_DIVISOR_UNKNOWN;
  }
  return 1.0;
}

// see PWFXP_MAXIMUM_DISTANCE_TO_GROUP constant description
int PWFXP_CheckDistance(object oDead, object oGroupMbr)
{
  return ( GetDistanceBetween(oDead, oGroupMbr) <= PWFXP_MAXIMUM_DISTANCE_TO_GROUP ) && ( GetArea(oDead) == GetArea(oGroupMbr) );
}

// see PWFXP_USE_SETXP constant description
void PWFXP_GiveXP(object oPC, int nXP)
{
  if(PWFXP_USE_SETXP)
    SetXP(oPC, GetXP(oPC) + nXP);
  else
    GiveXPToCreature(oPC, nXP);
}

void main()
{
  object oDead = OBJECT_SELF;
  object oKiller = GetLastKiller();

  // only continue if killer is valid and not from same faction...
  if ((oKiller==OBJECT_INVALID) || (GetFactionEqual(oKiller, oDead))) return;

  // average party level, xp divisor
  float fAvgLevel, fDivisor;
  // groupsize, only PCs count
  int nGroupSize;

  // get some basic group data like average PC level , PC group size, and XP divisor
  object oGroupMbr = GetFirstFactionMember(oKiller, FALSE);
  while(oGroupMbr != OBJECT_INVALID)
  {
    if( PWFXP_CheckDistance(oDead, oGroupMbr) || oGroupMbr == oKiller)
    {
      if(GetIsPC(oGroupMbr))
      {
        nGroupSize++;
        // add pc divisor
        fDivisor += PWFXP_XP_DIVISOR_PC;
        fAvgLevel += IntToFloat(PWFXP_GetLevel(oGroupMbr));
      }
      else
        fDivisor += PWFXP_GetAssociateDivisor(oGroupMbr); // add npc divisor
    }
    oGroupMbr = GetNextFactionMember(oKiller, FALSE);
  }

  if(nGroupSize == 0)
  {
    // NPC (Minion) killed something without a PC (Master) near enough to get XP
    return;
  }

  // calculate average partylevel
  fAvgLevel /= IntToFloat(nGroupSize);

  // modifiers
  float fLevelModifier, fDistanceModifier, fCRModifier, fMiscModifier, fFinalModifier, fECLModifier, fGroupBonusModifier;
  // groupmember level
  float fMbrLevel;
  // get creature CR
  float fCR = GetChallengeRating(oDead);
  // reduce CR if greater then maximum CR cap
  if(fCR > PWFXP_CR_MAX) fCR = PWFXP_CR_MAX; // cap CR
  // multiply CR with global XP modifier
  float fModCR = fCR * PWFXP_GLOBAL_MODIFIER;

  // calculate modifiers for each PC individually
  oGroupMbr = GetFirstFactionMember(oKiller, TRUE);
  while(oGroupMbr != OBJECT_INVALID)
  {
    fMbrLevel =  IntToFloat(PWFXP_GetLevel(oGroupMbr));
    if( PWFXP_CheckDistance(oDead, oGroupMbr) || oGroupMbr == oKiller)
    {
      // get global level modifier
      fLevelModifier = PWFXP_GetLevelModifier(FloatToInt(fMbrLevel));
      // get PC-level distance to average group-level and compute modifier
      fDistanceModifier = PWFXP_GetLevelDistanceModifier(fabs(fAvgLevel - fMbrLevel));
      // get PC-level distance to CR of dead creature and compute modifier
      fCRModifier = PWFXP_GetCRDistanceModifier(fCR - fMbrLevel);
      // get misc modifiers (right now only 10% for killing blow dealer)
      fMiscModifier = PWFXP_GetMiscModifier(oGroupMbr, oKiller);
      // get group bonus modifier
      fGroupBonusModifier = PWFXP_GetGroupBonusModifier(nGroupSize);
      // get subrace ECL modifier
      fECLModifier = PWFXP_GetECLModifier(oGroupMbr);
      // calculate final modifier
      fFinalModifier = fLevelModifier * fDistanceModifier * fCRModifier * fMiscModifier * fGroupBonusModifier * fECLModifier;

      // debug
      if(PWFXP_DEBUG)
        SendMessageToPC(oGroupMbr,GetName(oGroupMbr)+"'s XP Base: "+IntToString(FloatToInt(fModCR / fDivisor))+
                                  " / Modifiers: LVL [" + IntToString(FloatToInt((fLevelModifier-1)*100)) +
                                  "%] APD ["+IntToString(FloatToInt((fDistanceModifier-1)*100)) +
                                  "%] CRD ["+IntToString((fCR-fMbrLevel) < 0.0) + "/" + IntToString(FloatToInt((fCRModifier-1)*100))+
                                  "%] MSC ["+IntToString(FloatToInt((fMiscModifier-1)*100))+
                                  "%] GRP ["+IntToString(FloatToInt((fGroupBonusModifier-1)*100))+
                                  "%] ECL ["+IntToString(FloatToInt((fECLModifier-1)*100))+
                                  "%] GRS ["+IntToString(nGroupSize)+
                                  "] DIV ["+GetSubString(FloatToString(fDivisor),6,5) +
                                  "] FIN ["+IntToString(FloatToInt((fFinalModifier-1)*100))+
                                  "%]");


      int nXP = FloatToInt((fModCR / fDivisor) * fFinalModifier);

      // award minimum/maximum xp if needed
      if(nXP < PWFXP_MINIMUM_XP)
        nXP = PWFXP_MINIMUM_XP;
      else if(nXP > PWFXP_MAXIMUM_XP)
        nXP = PWFXP_MAXIMUM_XP;

    // misc checks for reasons the party member might not get XP would go here (eg. if they are dead)

      if(nXP > 0) PWFXP_GiveXP(oGroupMbr, nXP);
    }
    oGroupMbr = GetNextFactionMember(oKiller, TRUE);
  }
}
