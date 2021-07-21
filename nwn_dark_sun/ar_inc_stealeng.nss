#include "x2_inc_spellhook"
#include "nw_i0_spells"


//Spell const


//9th level
const int AR_SPELL_DOMINATE_MONSTER=44;
const int AR_SPELL_ELEMENTAL_SWARM=48;
const int AR_SPELL_ENERGY_DRAIN=51;
const int AR_SPELL_GATE=63;
const int AR_SPELL_GREATER_SPELL_MANTLE=73;
const int AR_SPELL_IMPLOSION=87;
const int AR_SPELL_MASS_DOMINATION=112;
const int AR_SPELL_METEOR_SWARM=116;
const int AR_SPELL_MORDENKAINENS_DISJUNCTION=122;
const int AR_SPELL_POWER_WORD_KILL=131;
const int AR_SPELL_SHAPECHANGE=161;
const int AR_SPELL_STORM_OF_VENGEANCE=173;
const int AR_SPELL_SUMMON_CREATURE_IX=178;
const int AR_SPELL_TIME_STOP=185;
const int AR_SPELL_WAIL_OF_THE_BANSHEE=190;
const int AR_SPELL_WEIRD=193;
const int AR_SPELL_UNDEATHS_ETERNAL_FOE=444;
const int AR_SPELL_BIGBYS_CRUSHING_HAND=463;
const int AR_SPELL_BLACK_BLADE_OF_DISASTER=533;
const int AR_SPELL_TIDE_OF_BATTLE=565;
const int AR_SPELL_DEHYDRATE=2004;
const int AR_SPELL_SILTSTORM=2009;
const int AR_SPELL_CALLOFTHEKING=2103;
const int AR_SPELL_MASS_DROWN=2244;
const int AR_SPELL_NATURE_AVATAR=2252;
const int AR_SPELL_UNYIELDING_ROOTS=2253;
//8th level
const int AR_SPELL_CREATE_GREATER_UNDEAD=29;
const int AR_SPELL_GREATER_PLANAR_BINDING=69;
const int AR_SPELL_INCENDIARY_CLOUD=89;
const int AR_SPELL_MASS_BLINDNESS_AND_DEAFNESS=110;
const int AR_SPELL_MASS_CHARM=111;
const int AR_SPELL_MASS_HEAL=114;
const int AR_SPELL_MIND_BLANK=117;
const int AR_SPELL_NATURES_BALANCE=124;
const int AR_SPELL_PREMONITION=134;
const int AR_SPELL_SUMMON_CREATURE_VIII=182;
const int AR_SPELL_AURA_VERSUS_ALIGNMENT = 323;
const int AR_SPELL_HORRID_WILTING= 367;
const int AR_SPELL_BOMBARDMENT= 423;
const int AR_SPELL_EARTHQUAKE= 426;
const int AR_SPELL_SUNBURST= 427;
const int AR_SPELL_BIGBYS_CLENCHED_FIST= 462;
const int AR_SPELL_BLACKSTAFF= 541;
const int AR_SPELL_OBSIDIANDEATH_DEF= 2022;
const int AR_SPELL_MASS_HOLD_MONSTER= 2249;
const int AR_SPELL_GREATER_WALL_OF_DISPEL_MAGIC= 2251;
//7th level
const int AR_SPELL_CONTROL_UNDEAD= 28;
const int AR_SPELL_DELAYED_BLAST_FIREBALL= 39;
const int AR_SPELL_FINGER_OF_DEATH= 56;
const int AR_SPELL_FIRE_STORM= 57;
const int AR_SPELL_GREATER_RESTORATION= 70;
const int AR_SPELL_MORDENKAINENS_SWORD= 123;
const int AR_SPELL_POWER_WORD_STUN= 132;
const int AR_SPELL_PRISMATIC_SPRAY= 135;
const int AR_SPELL_PROTECTION_FROM_SPELLS= 141;
const int AR_SPELL_RESURRECTION= 153;
const int AR_SPELL_SHADOW_SHIELD= 160;
const int AR_SPELL_SPELL_MANTLE= 169;
const int AR_SPELL_SUMMON_CREATURE_VII= 181;
const int AR_SPELL_SUNBEAM=183;
const int AR_SPELL_WORD_OF_FAITH= 194;
const int AR_SPELL_CREEPING_DOOM=364;
const int AR_SPELL_DESTRUCTION= 366;
const int AR_SPELL_AURA_OF_VITALITY= 372;
const int AR_SPELL_REGENERATE=374;
const int AR_SPELL_ETHEREALNESS=443;
const int AR_SPELL_BIGBYS_GRASPING_HAND=461;
const int AR_SPELL_GREAT_THUNDERCLAP=515;
const int AR_SPELL_ETHEREALNESS2=724;
const int AR_SPELL_BANEOFDEFILERS= 2017;
const int AR_SPELL_WORD_OF_BALANCE= 2246;
const int AR_SPELL_MASS_HOLD_PERSON= 2248;
//6th level
const int AR_SPELL_ACID_FOG= 0;
const int AR_SPELL_BLADE_BARRIER= 5;
const int AR_SPELL_CHAIN_LIGHTNING= 14;
const int AR_SPELL_CIRCLE_OF_DEATH= 18;
const int AR_SPELL_CREATE_UNDEAD= 30;
const int AR_SPELL_GLOBE_OF_INVULNERABILITY= 65;
const int AR_SPELL_GREATER_SPELL_BREACH= 72;
const int AR_SPELL_GREATER_STONESKIN= 74;
const int AR_SPELL_HARM= 77;
const int AR_SPELL_HEAL= 79;
const int AR_SPELL_MASS_HASTE= 113;
const int AR_SPELL_PLANAR_BINDING= 128;
const int AR_SPELL_SUMMON_CREATURE_VI= 180;
const int AR_SPELL_TENSERS_TRANSFORMATION= 184;
const int AR_SPELL_BANISHMENT= 430;
const int AR_SPELL_DROWN= 437;
const int AR_SPELL_DIRGE= 445;
const int AR_SPELL_ISAACS_GREATER_MISSILE_STORM= 448;
const int AR_SPELL_PLANAR_ALLY= 451;
const int AR_SPELL_BIGBYS_FORCEFUL_HAND= 460;
const int AR_SPELL_FLESH_TO_STONE= 485;
const int AR_SPELL_STONE_TO_FLESH= 486;
const int AR_SPELL_CRUMBLE= 512;
const int AR_SPELL_UNDEATH_TO_DEATH= 528;
const int AR_SPELL_STONEHOLD= 547;
const int AR_SPELL_SUMMON_SHADOW_X2= 564;
const int AR_SPELL_SUNSTROKE= 2003;
const int AR_SPELL_HEARTSEEKER= 2016;
const int AR_SPELL_MASS_BULLS_STRENGTH= 2225;
const int AR_SPELL_MASS_CATS_GRACE= 2226;
const int AR_SPELL_MASS_EAGLE_SPLENDOR= 2227;
const int AR_SPELL_MASS_ENDURANCE= 2228;
const int AR_SPELL_MASS_FOXS_CUNNING= 2229;
const int AR_SPELL_MASS_OWLS_WISDOM= 2230;
const int AR_SPELL_ACID_STORM= 2256;
const int AR_SPELL_DISINTEGRATE= 2263;
//5th level
const int AR_SPELL_CIRCLE_OF_DOOM= 19;
const int AR_SPELL_CLOUDKILL= 23;
const int AR_SPELL_CONE_OF_COLD= 25;
const int AR_SPELL_FEEBLEMIND= 55;
const int AR_SPELL_GREATER_DISPELLING= 67;
const int AR_SPELL_HEALING_CIRCLE= 80;
const int AR_SPELL_LESSER_MIND_BLANK= 95;
const int AR_SPELL_LESSER_PLANAR_BINDING= 96;
const int AR_SPELL_LESSER_SPELL_MANTLE= 99;
const int AR_SPELL_MIND_FOG= 118;
const int AR_SPELL_ETHEREAL_VISAGE= 121;
const int AR_SPELL_RAISE_DEAD= 142;
const int AR_SPELL_SLAY_LIVING= 164;
const int AR_SPELL_SPELL_RESISTANCE= 168;
const int AR_SPELL_SPHERE_OF_CHAOS= 170;
const int AR_SPELL_SUMMON_CREATURE_V= 179;
const int AR_SPELL_TRUE_SEEING= 186;
const int AR_SPELL_AURA_BLINDING= 195;
const int AR_SPELL_AURA_STUN= 202;
const int AR_SPELL_CONE_ACID= 229;
const int AR_SPELL_CONE_COLD= 230;
const int AR_SPELL_AWAKEN= 363;
const int AR_SPELL_ENERGY_BUFFER= 369;
const int AR_SPELL_LEGEND_LORE= 376;
const int AR_SPELL_SUMMON_MEPHIT= 378;
const int AR_SPELL_SUMMON_CELESTIAL= 379;
const int AR_SPELL_OWLS_INSIGHT= 438;
const int AR_SPELL_FIREBRAND= 440;
const int AR_SPELL_INFERNO= 446;
const int AR_SPELL_BIGBYS_INTERPOSING_HAND= 459;
const int AR_SPELL_TRAP_ARROW= 487;
const int AR_SPELL_TRAP_BOLT= 488;
const int AR_SPELL_TRAP_DART= 493;
const int AR_SPELL_TRAP_SHURIKEN= 494;
const int AR_SPELL_BREATH_PETRIFY= 495;
const int AR_SPELL_TOUCH_PETRIFY= 496;
const int AR_SPELL_BALL_LIGHTNING= 516;
const int AR_SPELL_BATTLETIDE= 517;
const int AR_SPELL_MESTILS_ACID_SHEATH= 524;
const int AR_SPELL_MONSTROUS_REGENERATION= 525;
const int AR_SPELL_VINE_MINE= 529;
const int AR_SPELL_EVIL_BLIGHT= 566;
const int AR_SPELL_STEALENERGY_DEF= 2021;
const int AR_SPELL_WISDOMOFSORCKING= 2102;
const int AR_SPELL_GREATER_HEROISM= 2234;
const int AR_SPELL_LEGIONS_CURSE_OF_PETTY_FAILING= 2241;
//4th level
const int AR_SPELL_CURE_CRITICAL_WOUNDS= 31;
const int AR_SPELL_DEATH_WARD= 38;
const int AR_SPELL_DISMISSAL= 40;
const int AR_SPELL_DIVINE_POWER= 42;
const int AR_SPELL_DOMINATE_PERSON= 45;
const int AR_SPELL_ELEMENTAL_SHIELD= 47;
const int AR_SPELL_ENERVATION= 52;
const int AR_SPELL_FLAME_STRIKE= 61;
const int AR_SPELL_FREEDOM_OF_MOVEMENT= 62;
const int AR_SPELL_HAMMER_OF_THE_GODS= 76;
const int AR_SPELL_HOLD_MONSTER= 82;
const int AR_SPELL_HOLY_SWORD= 85;
const int AR_SPELL_IMPROVED_INVISIBILITY= 88;
const int AR_SPELL_LESSER_SPELL_BREACH= 98;
const int AR_SPELL_MINOR_GLOBE_OF_INVULNERABILITY= 119;
const int AR_SPELL_PHANTASMAL_KILLER= 127;
const int AR_SPELL_RESTORATION= 152;
const int AR_SPELL_SHADOW_CONJURATION= 159;
const int AR_SPELL_STONESKIN= 172;
const int AR_SPELL_SUMMON_CREATURE_IV= 177;
const int AR_SPELL_WALL_OF_FIRE= 191;
const int AR_SPELL_AURA_COLD= 196;
const int AR_SPELL_AURA_ELECTRICITY= 197;
const int AR_SPELL_AURA_FEAR= 198;
const int AR_SPELL_AURA_FIRE= 199;
const int AR_SPELL_ICE_STORM= 368;
const int AR_SPELL_EVARDS_BLACK_TENTACLES= 375;
const int AR_SPELL_INFLICT_CRITICAL_WOUNDS= 435;
const int AR_SPELL_ISAACS_LESSER_MISSILE_STORM= 447;
const int AR_SPELL_MASS_CAMOFLAGE= 455;
const int AR_SPELL_HOLY_SWORD2=538;
const int AR_SPELL_HEATEXHAUSTION= 2002;
const int AR_SPELL_MAGMABLADE= 2007;
const int AR_SPELL_SILTSPRAY= 2008;
const int AR_SPELL_ACIDRAIN= 2011;
const int AR_SPELL_BACKLASH_PRES= 2020;
const int AR_SPELL_MASS_ULTRAVISION= 2231;
const int AR_SPELL_LOWER_SPELL_RESISTANCE= 2232;
const int AR_SPELL_LEGIONS_SHIELD_OF_FAITH= 2242;
const int AR_SPELL_SONIC_ORB= 2254;
//3rd level
const int AR_SPELL_ANIMATE_DEAD= 2;
const int AR_SPELL_BESTOW_CURSE= 4;
const int AR_SPELL_CALL_LIGHTNING= 11;
const int AR_SPELL_CHARM_MONSTER= 15;
const int AR_SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE= 20;
const int AR_SPELL_CONFUSION= 26;
const int AR_SPELL_CONTAGION= 27;
const int AR_SPELL_CURE_SERIOUS_WOUNDS= 35;
const int AR_SPELL_DISPEL_MAGIC= 41;
const int AR_SPELL_DOMINATE_ANIMAL= 43;
const int AR_SPELL_FEAR= 54;
const int AR_SPELL_FIREBALL= 58;
const int AR_SPELL_FLAME_ARROW= 59;
const int AR_SPELL_GREATER_MAGIC_WEAPON= 68;
const int AR_SPELL_GUST_OF_WIND= 75;
const int AR_SPELL_HASTE= 78;
const int AR_SPELL_INVISIBILITY_PURGE= 91;
const int AR_SPELL_INVISIBILITY_SPHERE= 92;
const int AR_SPELL_LIGHTNING_BOLT= 101;
const int AR_SPELL_MAGIC_VESTMENT= 108;
const int AR_SPELL_NEGATIVE_ENERGY_PROTECTION= 125;
const int AR_SPELL_NEUTRALIZE_POISON= 126;
const int AR_SPELL_POISON= 129;
const int AR_SPELL_PRAYER= 133;
const int AR_SPELL_PROTECTION_FROM_ELEMENTS= 137;
const int AR_SPELL_REMOVE_BLINDNESS_AND_DEAFNESS= 145;
const int AR_SPELL_REMOVE_CURSE= 146;
const int AR_SPELL_REMOVE_DISEASE= 147;
const int AR_SPELL_SEARING_LIGHT= 156;
const int AR_SPELL_SLOW= 166;
const int AR_SPELL_STINKING_CLOUD= 171;
const int AR_SPELL_SUMMON_CREATURE_III= 176;
const int AR_SPELL_VAMPIRIC_TOUCH= 188;
const int AR_SPELL_MAGIC_CIRCLE_AGAINST_ALIGNMENT= 322;
const int AR_SPELL_NEGATIVE_ENERGY_BURST= 370;
const int AR_SPELL_WAR_CRY= 373;
const int AR_SPELL_FIND_TRAPS= 377;
const int AR_SPELL_QUILLFIRE= 425;
const int AR_SPELL_INFLICT_SERIOUS_WOUNDS= 434;
const int AR_SPELL_WOUNDING_WHISPERS= 441;
const int AR_SPELL_GREATER_MAGIC_FANG= 453;
const int AR_SPELL_SPIKE_GROWTH= 454;
const int AR_SPELL_DISPLACEMENT= 458;
const int AR_SPELL_CLAIRAUDIENCE=480;
const int AR_SPELL_INFESTATION_OF_MAGGOTS= 513;
const int AR_SPELL_HEALING_STING= 514;
const int AR_SPELL_MESTILS_ACID_BREATH= 523;
const int AR_SPELL_SCINTILLATING_SPHERE= 526;
const int AR_SPELL_BLADE_THIRST= 535;
const int AR_SPELL_KEEN_EDGE = 539;
const int AR_SPELL_GREATERMAGICWEAPON=545;
const int AR_SPELLMAGICVESTMENT= 546;
const int AR_SPELL_DARKFIRE= 548;
const int AR_SPELL_GLYPH_OF_WARDING=549;
const int AR_SPELL_SUNBLADE=2001;
const int AR_SPELL_SOOTHE=2010;
const int AR_SPELL_ELEMENTALIMBUEMENT=2012;
const int AR_SPELL_WATERBREATHING= 2013;
const int AR_SPELL_BRAMBLEWOOD= 2015;
const int AR_SPELL_CONSEVATION_PRES= 2018;
const int AR_SPELL_TOUCHTHEBLACK= 2019;
const int AR_SPELL_ONHITBANEOFDEFILERS= 2023;
const int AR_SPELL_FORCEBLAST= 2235;
const int AR_SPELL_LEGIONS_CURSE_OF_IMPENDING_BLADES= 2239;
const int AR_SPELL_CURSE_OF_PETTY_FAILING= 2240;
const int AR_SPELL_SPIDERSKIN= 2245;
const int AR_SPELL_GREENFIRE= 2247;
const int AR_SPELL_SERPENTS_SIGH= 2257;
//2nd level
const int AR_SPELL_AID= 1;
const int AR_SPELL_BARKSKIN= 3;
const int AR_SPELL_BLINDNESS_AND_DEAFNESS= 8;
const int AR_SPELL_BULLS_STRENGTH= 9;
const int AR_SPELL_CATS_GRACE= 13;
const int AR_SPELL_CHARM_PERSON_OR_ANIMAL= 17;
const int AR_SPELL_CLARITY= 21;
const int AR_SPELL_CURE_MODERATE_WOUNDS= 34;
const int AR_SPELL_DARKNESS= 36;
const int AR_SPELL_ENDURANCE= 49;
const int AR_SPELL_FLAME_LASH= 60;
const int AR_SPELL_GHOUL_TOUCH= 64;
const int AR_SPELL_HOLD_ANIMAL= 81;
const int AR_SPELL_HOLD_PERSON= 83;
const int AR_SPELL_IDENTIFY= 86;
const int AR_SPELL_INVISIBILITY= 90;
const int AR_SPELL_KNOCK= 93;
const int AR_SPELL_LESSER_DISPEL= 94;
const int AR_SPELL_LESSER_RESTORATION= 97;
const int AR_SPELL_MELFS_ACID_ARROW= 115;
const int AR_SPELL_GHOSTLY_VISAGE= 120;
const int AR_SPELL_REMOVE_PARALYSIS= 149;
const int AR_SPELL_RESIST_ELEMENTS= 150;
const int AR_SPELL_SEE_INVISIBILITY= 157;
const int AR_SPELL_SILENCE= 163;
const int AR_SPELL_SOUND_BURST= 167;
const int AR_SPELL_SUMMON_CREATURE_II=  175;
const int AR_SPELL_WEB= 192;
const int AR_SPELL_LESSER_BODY_ADJUSTMENT= 277;
const int AR_SPELL_EAGLE_SPLENDOR= 354;
const int AR_SPELL_OWLS_WISDOM= 355;
const int AR_SPELL_FOXS_CUNNING= 356;
const int AR_SPELL_ULTRAVISION= 365;
const int AR_SPELL_CONTINUAL_FLAME= 419;
const int AR_SPELL_ONE_WITH_THE_LAND= 420;
const int AR_SPELL_BLOOD_FRENZY= 422;
const int AR_SPELL_AURAOFGLORY= 429;
const int AR_SPELL_INFLICT_MODERATE_WOUNDS= 433;
const int AR_SPELL_BALAGARNSIRONHORN= 436;
const int AR_SPELL_TASHAS_HIDEOUS_LAUGHTER= 457;
const int AR_SPELLCATSGRACE=481;
const int AR_SPELLEAGLESPLENDOR= 482;
const int AR_SPELL_INVISIBILITY2= 483;
const int AR_SPELL_COMBUST= 518;
const int AR_SPELL_DEATH_ARMOR= 519;
const int AR_SPELL_GEDLEES_ELECTRIC_LOOP= 520;
const int AR_SPELL_STONE_BONES= 527;
const int AR_SPELL_FLAME_WEAPON= 542;
const int AR_SPELL_AURAOFGLORY_X2= 562;
const int AR_SPELL_CLOUD_OF_BEWILDERMENT= 569;
const int AR_SPELL_GLYPHOFWARDINGDEFAULT= 764;
const int AR_SPELL_MAGMAJET= 2006;
const int AR_SPELL_MIGHTOFSORCKING= 2101;
const int AR_SPELL_HEROISM= 2233;
const int AR_SPELL_BALEFUL_TRANSPOSITION= 2236;
const int AR_SPELL_CURSE_OF_IMPENDING_BLADES= 2238;
const int AR_SPELL_CREATE_MAGIC_TATOO= 2243;
const int AR_SPELL_GLITTERDUST= 2250;
//1st level
const int AR_SPELL_BLESS= 6;
const int AR_SPELL_BLESS_WEAPON= 7;
const int AR_SPELL_BURNING_HANDS= 10;
const int AR_SPELL_CALM_EMOTIONS= 12;
const int AR_SPELL_CHARM_PERSON= 16;
const int AR_SPELL_COLOR_SPRAY= 24;
const int AR_SPELL_CURE_LIGHT_WOUNDS= 32;
const int AR_SPELL_DOOM= 46;
const int AR_SPELL_ENDURE_ELEMENTS= 50;
const int AR_SPELL_ENTANGLE= 53;
const int AR_SPELL_GREASE= 66;
const int AR_SPELL_MAGE_ARMOR= 102;
const int AR_SPELL_MAGIC_MISSILE= 107;
const int AR_SPELL_MAGIC_WEAPON= 109;
const int AR_SPELL_RAY_OF_ENFEEBLEMENT= 143;
const int AR_SPELL_REMOVE_FEAR= 148;
const int AR_SPELL_RESISTANCE= 151;
const int AR_SPELL_SANCTUARY= 154;
const int AR_SPELL_SCARE= 155;
const int AR_SPELL_SLEEP= 165;
const int AR_SPELL_SUMMON_CREATURE_I= 174;
const int AR_SPELL_REMOVEDISEASE= 316;
const int AR_SPELL_PROTECTION_FROM_ALIGNMENT= 321;
const int AR_SPELL_NEGATIVE_ENERGY_RAY= 371;
const int AR_SPELL_DIVINE_FAVOR= 414;
const int AR_SPELL_TRUE_STRIKE= 415;
const int AR_SPELL_SHIELD= 417;
const int AR_SPELL_ENTROPIC_SHIELD= 418;
const int AR_SPELL_CAMOFLAGE= 421;
const int AR_SPELL_INFLICT_LIGHT_WOUNDS= 432;
const int AR_SPELL_AMPLIFY= 442;
const int AR_SPELL_BANE= 449;
const int AR_SPELL_SHIELD_OF_FAITH= 450;
const int AR_SPELL_MAGIC_FANG= 452;
const int AR_SPELL_EXPEDITIOUS_RETREAT= 456;
const int AR_SPELL_HORIZIKAULS_BOOM= 521;
const int AR_SPELL_IRONGUTS= 522;
const int AR_SPELL_SHELGARNS_PERSISTENT_BLADE= 534;
const int AR_SPELL_DEAFENING_CLANG= 536;
const int AR_SPELL_BLESSWEAPON= 537;
const int AR_SPELL_ICE_DAGGER= 543;
const int AR_SPELL_MAGICWEAPON= 544;
const int AR_SPELL_WHIRLWIND= 561;
const int AR_SPELL_CREATEWATER= 2005;
const int AR_SPELL_HANDOFSORCKING= 2100;
const int AR_SPELL_BENIGN_TRANSPOSITION= 2237;
const int AR_SPELL_LESSER_SONIC_ORB= 2255;

//Set to false to suppress debug messages.
const int nStealSpellDebug = FALSE;


const int nSpellLevel1 = 1;
const int nSpellLevel2 = 2;
const int nSpellLevel3 = 3;
const int nSpellLevel4 = 4;
const int nSpellLevel5 = 5;
const int nSpellLevel6 = 6;
const int nSpellLevel7 = 7;
const int nSpellLevel8 = 8;
const int nSpellLevel9 = 9;


//Status response text for the target
const string RESPONSE_TARGET_SPELL_STOLEN = "You have lost a spell of Level: ";
const string RESPONSE_TARGET_SPELL_NOT_STOLEN = "You have sucsesfully stopped the Defiler's atempt to drain you.";
//status response text for the caster.
const string RESPONSE_CASTER_SPELL_STOLEN = "You have sucsesfully stolen energy from the target.";
const string RESPONSE_CASTER_SPELL_NOT_STOLEN = "Target Passed save.";

// Main function to steal a spell
// oTarget = Target to steal from
// nDC = Caster DC
// nTargetSave = Target Save DC
// nSaveVs = SAVE_VS_*
//nSpellLevel = Level Of spell To Steal.
int ARStealSpell(object oCaster,object oTarget,int nSpellLevel,int nMETA);

// Returns true if oTarget Has Spell of level nSpellLevel.
int ARHasSpellLevel(object oTarget,int nSpellLevel);

// Returns true if oTarget Has Spell Casting Abilities.
int ARGetIsCaster(object oTarget);

//Returns true if oPC has taken levels in nClas : CLASS_TYPE_*
int ARGetHasClass(int nCLASS, object oPC);

//debug
void ARdebug( string sMessage );

// Returns true if oTarget Has Spell Casting Abilities.
int ARGetIsCaster(object oTarget)
{
/*
    if(nStealSpellDebug)
        {
        ARdebug("Checking Target for caster levels...");
        }
   */
    int nReturn=0;

    if(ARGetHasClass(CLASS_TYPE_CLERIC,oTarget))nReturn++;
    if(ARGetHasClass(CLASS_TYPE_BARD,oTarget))nReturn++;
    if(ARGetHasClass(CLASS_TYPE_DRUID,oTarget))nReturn++;
    if(ARGetHasClass(CLASS_TYPE_RANGER,oTarget))nReturn++;
    if(ARGetHasClass(CLASS_TYPE_PALADIN,oTarget))nReturn++;
    if(ARGetHasClass(CLASS_TYPE_SORCERER,oTarget))nReturn++;
    if(ARGetHasClass(CLASS_TYPE_WIZARD,oTarget))nReturn++;
   /*

    if(nStealSpellDebug)
        {
        if(nReturn >= 1)
        ARdebug("Target has caster levels...");
        }
        else
        {
        ARdebug("Target no caster levels...");
        }*/


        if(nReturn >=1)return TRUE;
        return FALSE;


}


int ARGetHasClass(int nCLASS, object oPC)
 {

        if (GetLevelByClass(nCLASS, oPC)>=1)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
 }


//Main function to atempt steal
int ARStealSpell(object oCaster,object oTarget,int nSpellLevel,int nMETA)
{
        int nModCHA = GetAbilityModifier(ABILITY_CHARISMA,oCaster);
         //roll heal points
        int nHpLevel1 = d2(1) + nModCHA;
        int nHpLevel2 = d2(1) + nModCHA;
        int nHpLevel3 = d4(1) + nModCHA;
        int nHpLevel4 = d4(1) + nModCHA;
        int nHpLevel5 = d6(1) + nModCHA;
        int nHpLevel6 = d8(1) + nModCHA;
        int nHpLevel7 = d10(1) + nModCHA;
        int nHpLevel8 = d12(1) + nModCHA;
        int nHpLevel9 = d20(1) + nModCHA;

        if(nMETA==METAMAGIC_EMPOWER)
        {
        nHpLevel1 = nHpLevel1+(nHpLevel1/2);
        nHpLevel2 = nHpLevel2+(nHpLevel2/2);
        nHpLevel3 = nHpLevel3+(nHpLevel3/2);
        nHpLevel4 = nHpLevel4+(nHpLevel4/2);
        nHpLevel5 = nHpLevel5+(nHpLevel5/2);
        nHpLevel6 = nHpLevel6+(nHpLevel6/2);
        nHpLevel7 = nHpLevel7+(nHpLevel7/2);
        nHpLevel8 = nHpLevel8+(nHpLevel8/2);
        nHpLevel9 = nHpLevel9+(nHpLevel9/2);
        }
        if(nMETA==METAMAGIC_MAXIMIZE)
        {
        nHpLevel1 = 2+nModCHA;
        nHpLevel2 = 2+nModCHA;
        nHpLevel3 = 4+nModCHA;
        nHpLevel4 = 4+nModCHA;
        nHpLevel5 = 6+nModCHA;
        nHpLevel6 = 8+nModCHA;
        nHpLevel7 = 10+nModCHA;
        nHpLevel8 = 12+nModCHA;
        nHpLevel9 = 20+nModCHA;
        }


        effect eVis9 =EffectVisualEffect(VFX_IMP_EVIL_HELP);
        effect eVis8 =EffectVisualEffect(VFX_IMP_HEALING_G);
        effect eVis67 =EffectVisualEffect(VFX_IMP_HEALING_L);
        effect eVis45 =EffectVisualEffect(VFX_IMP_HEALING_M);
        effect eVis13 =EffectVisualEffect(VFX_IMP_HEALING_S);
        effect eNeg = EffectVisualEffect(VFX_IMP_DESTRUCTION);
        effect eHeal;
        effect eLink;

 switch(nSpellLevel)
     {
        case nSpellLevel9:
        {
            eHeal = EffectHeal(nHpLevel9);
            eLink = EffectLinkEffects(eVis9,eHeal);
            eLink  = EffectLinkEffects(EffectVisualEffect(VFX_IMP_HARM),eVis9);

            if(GetHasSpell(AR_SPELL_DOMINATE_MONSTER,oTarget)>1)
                {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_DOMINATE_MONSTER);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                 return FALSE;
                }
            if(GetHasSpell(AR_SPELL_ELEMENTAL_SWARM,oTarget)>1)
               {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_ELEMENTAL_SWARM);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }

            if(GetHasSpell(AR_SPELL_ENERGY_DRAIN,oTarget)>1)
                {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_ENERGY_DRAIN);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }

                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_GATE,oTarget)>1)
                {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_GATE);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_GREATER_SPELL_MANTLE,oTarget)>1)
                {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_SPELL_MANTLE);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_IMPLOSION,oTarget)>1)
                {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_IMPLOSION);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_MASS_DOMINATION,oTarget)>1)
                {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_DOMINATION);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_METEOR_SWARM,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_METEOR_SWARM);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_MORDENKAINENS_DISJUNCTION,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_MORDENKAINENS_DISJUNCTION);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_POWER_WORD_KILL,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_POWER_WORD_KILL);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_SHAPECHANGE,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_SHAPECHANGE);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_STORM_OF_VENGEANCE,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_STORM_OF_VENGEANCE);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_IX,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_IX);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_TIME_STOP,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_TIME_STOP);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_WAIL_OF_THE_BANSHEE,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_WAIL_OF_THE_BANSHEE);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_WEIRD,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_WEIRD);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_UNDEATHS_ETERNAL_FOE,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_UNDEATHS_ETERNAL_FOE);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_BIGBYS_CRUSHING_HAND,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_BIGBYS_CRUSHING_HAND);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_BLACK_BLADE_OF_DISASTER,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_BLACK_BLADE_OF_DISASTER);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_TIDE_OF_BATTLE,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_TIDE_OF_BATTLE);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_DEHYDRATE,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_DEHYDRATE);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                 return FALSE;
                }
            if(GetHasSpell(AR_SPELL_SILTSTORM,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_SILTSTORM);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                 return FALSE;
                }
            if(GetHasSpell(AR_SPELL_CALLOFTHEKING,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_CALLOFTHEKING);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                 return FALSE;
                }
            if(GetHasSpell(AR_SPELL_MASS_DROWN,oTarget)>1)
                            {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_DROWN);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                  return FALSE;
                }
            if(GetHasSpell(AR_SPELL_NATURE_AVATAR,oTarget)>1)
                {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_NATURE_AVATAR);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            if(GetHasSpell(AR_SPELL_UNYIELDING_ROOTS,oTarget)>1)
                {
                if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                    {
                     DecrementRemainingSpellUses(oTarget,AR_SPELL_UNYIELDING_ROOTS);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                     ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                     return TRUE;
                    }
                return FALSE;
                }
            return FALSE;

        }

        case nSpellLevel8:
        {
                eHeal = EffectHeal(nHpLevel8);
                eLink = EffectLinkEffects(eVis8,eHeal);

                if(GetHasSpell(AR_SPELL_CREATE_GREATER_UNDEAD,oTarget)>1)
                   {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CREATE_GREATER_UNDEAD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }

            if(GetHasSpell(AR_SPELL_GREATER_PLANAR_BINDING,oTarget)>1)
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_PLANAR_BINDING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INCENDIARY_CLOUD,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INCENDIARY_CLOUD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_BLINDNESS_AND_DEAFNESS,oTarget)>1){}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_BLINDNESS_AND_DEAFNESS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_CHARM,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_CHARM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_HEAL,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_HEAL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MIND_BLANK,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MIND_BLANK);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_NATURES_BALANCE,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_NATURES_BALANCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PREMONITION,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PREMONITION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_VIII,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_VIII);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURA_VERSUS_ALIGNMENT ,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURA_VERSUS_ALIGNMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HORRID_WILTING,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HORRID_WILTING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BOMBARDMENT,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BOMBARDMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_EARTHQUAKE,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_EARTHQUAKE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUNBURST,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUNBURST);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BIGBYS_CLENCHED_FIST,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BIGBYS_CLENCHED_FIST);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BLACKSTAFF,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BLACKSTAFF);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_OBSIDIANDEATH_DEF,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_OBSIDIANDEATH_DEF);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_HOLD_MONSTER,oTarget)>1) {}
                     {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_HOLD_MONSTER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATER_WALL_OF_DISPEL_MAGIC,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_WALL_OF_DISPEL_MAGIC);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
        }


       case nSpellLevel7:
        {
                eHeal = EffectHeal(nHpLevel7);
                eLink = EffectLinkEffects(eVis67,eHeal);

            if(GetHasSpell(AR_SPELL_CONTROL_UNDEAD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CONTROL_UNDEAD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DELAYED_BLAST_FIREBALL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DELAYED_BLAST_FIREBALL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FINGER_OF_DEATH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FINGER_OF_DEATH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FIRE_STORM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FIRE_STORM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATER_RESTORATION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_RESTORATION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MORDENKAINENS_SWORD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MORDENKAINENS_SWORD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_POWER_WORD_STUN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_POWER_WORD_STUN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PRISMATIC_SPRAY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PRISMATIC_SPRAY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PROTECTION_FROM_SPELLS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PROTECTION_FROM_SPELLS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_RESURRECTION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_RESURRECTION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SHADOW_SHIELD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SHADOW_SHIELD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SPELL_MANTLE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SPELL_MANTLE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_VII,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_VII);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUNBEAM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUNBEAM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WORD_OF_FAITH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WORD_OF_FAITH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CREEPING_DOOM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CREEPING_DOOM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DESTRUCTION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DESTRUCTION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURA_OF_VITALITY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURA_OF_VITALITY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_REGENERATE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_REGENERATE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ETHEREALNESS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ETHEREALNESS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BIGBYS_GRASPING_HAND,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BIGBYS_GRASPING_HAND);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREAT_THUNDERCLAP,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREAT_THUNDERCLAP);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ETHEREALNESS2,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ETHEREALNESS2);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BANEOFDEFILERS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BANEOFDEFILERS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WORD_OF_BALANCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WORD_OF_BALANCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_HOLD_PERSON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_HOLD_PERSON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }

        }

        case nSpellLevel6:
        {
                eHeal = EffectHeal(nHpLevel6);
                eLink = EffectLinkEffects(eVis67,eHeal);

            if(GetHasSpell(AR_SPELL_ACID_FOG,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ACID_FOG);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BLADE_BARRIER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BLADE_BARRIER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CHAIN_LIGHTNING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CHAIN_LIGHTNING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CIRCLE_OF_DEATH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CIRCLE_OF_DEATH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CREATE_UNDEAD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CREATE_UNDEAD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GLOBE_OF_INVULNERABILITY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GLOBE_OF_INVULNERABILITY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATER_SPELL_BREACH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_SPELL_BREACH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATER_STONESKIN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_STONESKIN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HARM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HARM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HEAL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HEAL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_HASTE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_HASTE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PLANAR_BINDING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PLANAR_BINDING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_VI,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_VI);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TENSERS_TRANSFORMATION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TENSERS_TRANSFORMATION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BANISHMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BANISHMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DROWN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DROWN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DIRGE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DIRGE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ISAACS_GREATER_MISSILE_STORM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ISAACS_GREATER_MISSILE_STORM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PLANAR_ALLY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PLANAR_ALLY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BIGBYS_FORCEFUL_HAND,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BIGBYS_FORCEFUL_HAND);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FLESH_TO_STONE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FLESH_TO_STONE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_STONE_TO_FLESH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_STONE_TO_FLESH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CRUMBLE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CRUMBLE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_UNDEATH_TO_DEATH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_UNDEATH_TO_DEATH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_STONEHOLD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_STONEHOLD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_SHADOW_X2,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_SHADOW_X2);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUNSTROKE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUNSTROKE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HEARTSEEKER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HEARTSEEKER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_BULLS_STRENGTH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_BULLS_STRENGTH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_CATS_GRACE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_CATS_GRACE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_EAGLE_SPLENDOR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_EAGLE_SPLENDOR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_ENDURANCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_ENDURANCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_FOXS_CUNNING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_FOXS_CUNNING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_OWLS_WISDOM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_OWLS_WISDOM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ACID_STORM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ACID_STORM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DISINTEGRATE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DISINTEGRATE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
        }

        case nSpellLevel5:
        {
                eHeal = EffectHeal(nHpLevel5);
                eLink = EffectLinkEffects(eVis45,eHeal);

            if(GetHasSpell(AR_SPELL_CIRCLE_OF_DOOM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CIRCLE_OF_DOOM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CLOUDKILL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CLOUDKILL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CONE_OF_COLD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CONE_OF_COLD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FEEBLEMIND,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FEEBLEMIND);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATER_DISPELLING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_DISPELLING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HEALING_CIRCLE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HEALING_CIRCLE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LESSER_MIND_BLANK,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LESSER_MIND_BLANK);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LESSER_PLANAR_BINDING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LESSER_PLANAR_BINDING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LESSER_SPELL_MANTLE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LESSER_SPELL_MANTLE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MIND_FOG,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MIND_FOG);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ETHEREAL_VISAGE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ETHEREAL_VISAGE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_RAISE_DEAD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_RAISE_DEAD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SLAY_LIVING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SLAY_LIVING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SPELL_RESISTANCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SPELL_RESISTANCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SPHERE_OF_CHAOS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SPHERE_OF_CHAOS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_V,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_V);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TRUE_SEEING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TRUE_SEEING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURA_BLINDING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURA_BLINDING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURA_STUN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURA_STUN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CONE_ACID,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CONE_ACID);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CONE_COLD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CONE_COLD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AWAKEN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AWAKEN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ENERGY_BUFFER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ENERGY_BUFFER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LEGEND_LORE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LEGEND_LORE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_MEPHIT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_MEPHIT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CELESTIAL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CELESTIAL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_OWLS_INSIGHT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_OWLS_INSIGHT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FIREBRAND,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FIREBRAND);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INFERNO,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INFERNO);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BIGBYS_INTERPOSING_HAND,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BIGBYS_INTERPOSING_HAND);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TRAP_ARROW,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TRAP_ARROW);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TRAP_BOLT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TRAP_BOLT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TRAP_DART,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TRAP_DART);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TRAP_SHURIKEN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TRAP_SHURIKEN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BREATH_PETRIFY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BREATH_PETRIFY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TOUCH_PETRIFY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TOUCH_PETRIFY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BALL_LIGHTNING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BALL_LIGHTNING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BATTLETIDE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BATTLETIDE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MESTILS_ACID_SHEATH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MESTILS_ACID_SHEATH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MONSTROUS_REGENERATION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MONSTROUS_REGENERATION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_VINE_MINE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_VINE_MINE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_EVIL_BLIGHT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_EVIL_BLIGHT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_STEALENERGY_DEF,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_STEALENERGY_DEF);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WISDOMOFSORCKING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WISDOMOFSORCKING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATER_HEROISM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_HEROISM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LEGIONS_CURSE_OF_PETTY_FAILING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LEGIONS_CURSE_OF_PETTY_FAILING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
        }

        case nSpellLevel4:
        {
                eHeal = EffectHeal(nHpLevel4);
                eLink = EffectLinkEffects(eVis45,eHeal);

            if(GetHasSpell(AR_SPELL_CURE_CRITICAL_WOUNDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CURE_CRITICAL_WOUNDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DEATH_WARD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DEATH_WARD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DISMISSAL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DISMISSAL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DIVINE_POWER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DIVINE_POWER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DOMINATE_PERSON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DOMINATE_PERSON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ELEMENTAL_SHIELD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ELEMENTAL_SHIELD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ENERVATION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ENERVATION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FLAME_STRIKE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FLAME_STRIKE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FREEDOM_OF_MOVEMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FREEDOM_OF_MOVEMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HAMMER_OF_THE_GODS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HAMMER_OF_THE_GODS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HOLD_MONSTER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HOLD_MONSTER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HOLY_SWORD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HOLY_SWORD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_IMPROVED_INVISIBILITY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_IMPROVED_INVISIBILITY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LESSER_SPELL_BREACH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LESSER_SPELL_BREACH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MINOR_GLOBE_OF_INVULNERABILITY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MINOR_GLOBE_OF_INVULNERABILITY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PHANTASMAL_KILLER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PHANTASMAL_KILLER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_RESTORATION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_RESTORATION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SHADOW_CONJURATION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SHADOW_CONJURATION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_STONESKIN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_STONESKIN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_IV,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_IV);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WALL_OF_FIRE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WALL_OF_FIRE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURA_COLD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURA_COLD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURA_ELECTRICITY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURA_ELECTRICITY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURA_FEAR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURA_FEAR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURA_FIRE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURA_FIRE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ICE_STORM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ICE_STORM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_EVARDS_BLACK_TENTACLES,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_EVARDS_BLACK_TENTACLES);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INFLICT_CRITICAL_WOUNDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INFLICT_CRITICAL_WOUNDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ISAACS_LESSER_MISSILE_STORM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ISAACS_LESSER_MISSILE_STORM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_CAMOFLAGE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_CAMOFLAGE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HOLY_SWORD2,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HOLY_SWORD2);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HEATEXHAUSTION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HEATEXHAUSTION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGMABLADE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGMABLADE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SILTSPRAY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SILTSPRAY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ACIDRAIN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ACIDRAIN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BACKLASH_PRES,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BACKLASH_PRES);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MASS_ULTRAVISION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MASS_ULTRAVISION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LOWER_SPELL_RESISTANCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LOWER_SPELL_RESISTANCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LEGIONS_SHIELD_OF_FAITH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LEGIONS_SHIELD_OF_FAITH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SONIC_ORB,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SONIC_ORB);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }


        }

        case nSpellLevel3:
        {
                eHeal = EffectHeal(nHpLevel3);
                eLink = EffectLinkEffects(eVis13,eHeal);

            if(GetHasSpell(AR_SPELL_ANIMATE_DEAD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ANIMATE_DEAD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BESTOW_CURSE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BESTOW_CURSE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CALL_LIGHTNING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CALL_LIGHTNING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CHARM_MONSTER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CHARM_MONSTER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CONFUSION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CONFUSION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CONTAGION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CONTAGION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CURE_SERIOUS_WOUNDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CURE_SERIOUS_WOUNDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DISPEL_MAGIC,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DISPEL_MAGIC);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DOMINATE_ANIMAL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DOMINATE_ANIMAL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FEAR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FEAR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FIREBALL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FIREBALL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }

                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FLAME_ARROW,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FLAME_ARROW);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATER_MAGIC_WEAPON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_MAGIC_WEAPON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GUST_OF_WIND,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GUST_OF_WIND);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HASTE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HASTE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INVISIBILITY_PURGE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INVISIBILITY_PURGE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INVISIBILITY_SPHERE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INVISIBILITY_SPHERE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LIGHTNING_BOLT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LIGHTNING_BOLT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGIC_VESTMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGIC_VESTMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_NEGATIVE_ENERGY_PROTECTION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_NEGATIVE_ENERGY_PROTECTION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_NEUTRALIZE_POISON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_NEUTRALIZE_POISON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_POISON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_POISON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PRAYER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PRAYER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PROTECTION_FROM_ELEMENTS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PROTECTION_FROM_ELEMENTS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_REMOVE_BLINDNESS_AND_DEAFNESS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_REMOVE_BLINDNESS_AND_DEAFNESS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_REMOVE_CURSE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_REMOVE_CURSE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_REMOVE_DISEASE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_REMOVE_DISEASE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SEARING_LIGHT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SEARING_LIGHT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SLOW,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SLOW);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_STINKING_CLOUD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_STINKING_CLOUD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_III,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_III);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_VAMPIRIC_TOUCH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_VAMPIRIC_TOUCH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGIC_CIRCLE_AGAINST_ALIGNMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGIC_CIRCLE_AGAINST_ALIGNMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_NEGATIVE_ENERGY_BURST,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_NEGATIVE_ENERGY_BURST);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WAR_CRY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WAR_CRY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FIND_TRAPS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FIND_TRAPS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_QUILLFIRE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_QUILLFIRE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INFLICT_SERIOUS_WOUNDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INFLICT_SERIOUS_WOUNDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WOUNDING_WHISPERS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WOUNDING_WHISPERS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATER_MAGIC_FANG,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATER_MAGIC_FANG);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SPIKE_GROWTH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SPIKE_GROWTH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DISPLACEMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DISPLACEMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CLAIRAUDIENCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CLAIRAUDIENCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INFESTATION_OF_MAGGOTS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INFESTATION_OF_MAGGOTS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HEALING_STING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HEALING_STING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MESTILS_ACID_BREATH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MESTILS_ACID_BREATH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SCINTILLATING_SPHERE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SCINTILLATING_SPHERE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BLADE_THIRST,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BLADE_THIRST);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_KEEN_EDGE ,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_KEEN_EDGE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREATERMAGICWEAPON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREATERMAGICWEAPON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELLMAGICVESTMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELLMAGICVESTMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DARKFIRE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DARKFIRE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GLYPH_OF_WARDING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GLYPH_OF_WARDING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUNBLADE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUNBLADE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SOOTHE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SOOTHE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ELEMENTALIMBUEMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ELEMENTALIMBUEMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WATERBREATHING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WATERBREATHING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BRAMBLEWOOD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BRAMBLEWOOD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CONSEVATION_PRES,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CONSEVATION_PRES);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TOUCHTHEBLACK,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TOUCHTHEBLACK);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }

            if(GetHasSpell(AR_SPELL_FORCEBLAST,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FORCEBLAST);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LEGIONS_CURSE_OF_IMPENDING_BLADES,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LEGIONS_CURSE_OF_IMPENDING_BLADES);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CURSE_OF_PETTY_FAILING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CURSE_OF_PETTY_FAILING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SPIDERSKIN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SPIDERSKIN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREENFIRE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREENFIRE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SERPENTS_SIGH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SERPENTS_SIGH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }


        }

        case nSpellLevel2:
        {
                eHeal = EffectHeal(nHpLevel2);
                eLink = EffectLinkEffects(eVis13,eHeal);


            if(GetHasSpell(AR_SPELL_AID,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AID);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BARKSKIN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BARKSKIN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BLINDNESS_AND_DEAFNESS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BLINDNESS_AND_DEAFNESS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }

            if(GetHasSpell(AR_SPELL_BULLS_STRENGTH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BULLS_STRENGTH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CATS_GRACE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CATS_GRACE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CHARM_PERSON_OR_ANIMAL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CHARM_PERSON_OR_ANIMAL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CLARITY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CLARITY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CURE_MODERATE_WOUNDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CURE_MODERATE_WOUNDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DARKNESS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DARKNESS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ENDURANCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ENDURANCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FLAME_LASH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FLAME_LASH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GHOUL_TOUCH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GHOUL_TOUCH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HOLD_ANIMAL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HOLD_ANIMAL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HOLD_PERSON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HOLD_PERSON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_IDENTIFY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_IDENTIFY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INVISIBILITY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INVISIBILITY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_KNOCK,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_KNOCK);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LESSER_DISPEL,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LESSER_DISPEL);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LESSER_RESTORATION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LESSER_RESTORATION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MELFS_ACID_ARROW,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MELFS_ACID_ARROW);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GHOSTLY_VISAGE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GHOSTLY_VISAGE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_REMOVE_PARALYSIS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_REMOVE_PARALYSIS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_RESIST_ELEMENTS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_RESIST_ELEMENTS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SEE_INVISIBILITY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SEE_INVISIBILITY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SILENCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SILENCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SOUND_BURST,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SOUND_BURST);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_II,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_II);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WEB,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WEB);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LESSER_BODY_ADJUSTMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LESSER_BODY_ADJUSTMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_EAGLE_SPLENDOR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_EAGLE_SPLENDOR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_OWLS_WISDOM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_OWLS_WISDOM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FOXS_CUNNING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FOXS_CUNNING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ULTRAVISION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ULTRAVISION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CONTINUAL_FLAME,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CONTINUAL_FLAME);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ONE_WITH_THE_LAND,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ONE_WITH_THE_LAND);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BLOOD_FRENZY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BLOOD_FRENZY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURAOFGLORY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURAOFGLORY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INFLICT_MODERATE_WOUNDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INFLICT_MODERATE_WOUNDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BALAGARNSIRONHORN,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BALAGARNSIRONHORN);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TASHAS_HIDEOUS_LAUGHTER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TASHAS_HIDEOUS_LAUGHTER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELLCATSGRACE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELLCATSGRACE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELLEAGLESPLENDOR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELLEAGLESPLENDOR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INVISIBILITY2,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INVISIBILITY2);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_COMBUST,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_COMBUST);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DEATH_ARMOR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DEATH_ARMOR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GEDLEES_ELECTRIC_LOOP,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GEDLEES_ELECTRIC_LOOP);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_STONE_BONES,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_STONE_BONES);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_FLAME_WEAPON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_FLAME_WEAPON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AURAOFGLORY_X2,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AURAOFGLORY_X2);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CLOUD_OF_BEWILDERMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CLOUD_OF_BEWILDERMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GLYPHOFWARDINGDEFAULT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GLYPHOFWARDINGDEFAULT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGMAJET,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGMAJET);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MIGHTOFSORCKING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MIGHTOFSORCKING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HEROISM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HEROISM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BALEFUL_TRANSPOSITION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BALEFUL_TRANSPOSITION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CURSE_OF_IMPENDING_BLADES,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CURSE_OF_IMPENDING_BLADES);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CREATE_MAGIC_TATOO,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CREATE_MAGIC_TATOO);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GLITTERDUST,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GLITTERDUST);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }

        }

        case nSpellLevel1:
        {

                eHeal = EffectHeal(nHpLevel1);
                eLink = EffectLinkEffects(eVis13,eHeal);

            if(GetHasSpell(AR_SPELL_BLESS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BLESS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BLESS_WEAPON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BLESS_WEAPON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BURNING_HANDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BURNING_HANDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CALM_EMOTIONS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CALM_EMOTIONS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CHARM_PERSON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CHARM_PERSON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_COLOR_SPRAY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_COLOR_SPRAY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CURE_LIGHT_WOUNDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CURE_LIGHT_WOUNDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DOOM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DOOM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ENDURE_ELEMENTS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ENDURE_ELEMENTS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ENTANGLE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ENTANGLE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_GREASE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_GREASE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGE_ARMOR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGE_ARMOR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGIC_MISSILE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGIC_MISSILE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGIC_WEAPON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGIC_WEAPON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_RAY_OF_ENFEEBLEMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_RAY_OF_ENFEEBLEMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_REMOVE_FEAR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_REMOVE_FEAR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_RESISTANCE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_RESISTANCE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SANCTUARY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SANCTUARY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SCARE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SCARE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SLEEP,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SLEEP);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_I,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SUMMON_CREATURE_I);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_REMOVEDISEASE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_REMOVEDISEASE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_PROTECTION_FROM_ALIGNMENT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_PROTECTION_FROM_ALIGNMENT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_NEGATIVE_ENERGY_RAY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_NEGATIVE_ENERGY_RAY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DIVINE_FAVOR,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DIVINE_FAVOR);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_TRUE_STRIKE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_TRUE_STRIKE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SHIELD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SHIELD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ENTROPIC_SHIELD,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ENTROPIC_SHIELD);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CAMOFLAGE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CAMOFLAGE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_INFLICT_LIGHT_WOUNDS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_INFLICT_LIGHT_WOUNDS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_AMPLIFY,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_AMPLIFY);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BANE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BANE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SHIELD_OF_FAITH,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SHIELD_OF_FAITH);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGIC_FANG,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGIC_FANG);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_EXPEDITIOUS_RETREAT,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_EXPEDITIOUS_RETREAT);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HORIZIKAULS_BOOM,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HORIZIKAULS_BOOM);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_IRONGUTS,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_IRONGUTS);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_SHELGARNS_PERSISTENT_BLADE,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_SHELGARNS_PERSISTENT_BLADE);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_DEAFENING_CLANG,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_DEAFENING_CLANG);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BLESSWEAPON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BLESSWEAPON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_ICE_DAGGER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_ICE_DAGGER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_MAGICWEAPON,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_MAGICWEAPON);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_WHIRLWIND,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_WHIRLWIND);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_CREATEWATER,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_CREATEWATER);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_HANDOFSORCKING,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_HANDOFSORCKING);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_BENIGN_TRANSPOSITION,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_BENIGN_TRANSPOSITION);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
            if(GetHasSpell(AR_SPELL_LESSER_SONIC_ORB,oTarget)>1)
                    {
                    if(MySavingThrow(SAVING_THROW_FORT,oTarget,GetSpellSaveDC(),SAVING_THROW_TYPE_NEGATIVE,oCaster)==0)
                        {
                         DecrementRemainingSpellUses(oTarget,AR_SPELL_LESSER_SONIC_ORB);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oCaster);
                         ApplyEffectToObject(DURATION_TYPE_INSTANT,eNeg,oTarget);
                         return TRUE;
                        }
                    return FALSE;
                    }
        }

        }
   SendMessageToPC(oCaster,"Target has no energy left to consume...");
   return FALSE;


}




 // Returns true if oTarget Has Spell of level nSpellLevel.
int ARHasSpellLevel(object oTarget,int nSpellLevel)
{
    int nReturn;

    switch(nSpellLevel)
     {
        case nSpellLevel9:
        {
            if(GetHasSpell(AR_SPELL_DOMINATE_MONSTER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ELEMENTAL_SWARM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ENERGY_DRAIN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GATE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_SPELL_MANTLE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_IMPLOSION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_DOMINATION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_METEOR_SWARM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MORDENKAINENS_DISJUNCTION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_POWER_WORD_KILL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SHAPECHANGE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_STORM_OF_VENGEANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_IX,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TIME_STOP,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WAIL_OF_THE_BANSHEE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WEIRD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_UNDEATHS_ETERNAL_FOE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BIGBYS_CRUSHING_HAND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BLACK_BLADE_OF_DISASTER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TIDE_OF_BATTLE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DEHYDRATE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SILTSTORM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CALLOFTHEKING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_DROWN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_NATURE_AVATAR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_UNYIELDING_ROOTS,oTarget)>1) nReturn+=1;

           if(nReturn >=1)return TRUE;
           return FALSE;

        }

        case nSpellLevel8:
        {
            if(GetHasSpell(AR_SPELL_CREATE_GREATER_UNDEAD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_PLANAR_BINDING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INCENDIARY_CLOUD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_BLINDNESS_AND_DEAFNESS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_CHARM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_HEAL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MIND_BLANK,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_NATURES_BALANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PREMONITION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_VIII,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURA_VERSUS_ALIGNMENT ,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HORRID_WILTING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BOMBARDMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_EARTHQUAKE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUNBURST,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BIGBYS_CLENCHED_FIST,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BLACKSTAFF,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_OBSIDIANDEATH_DEF,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_HOLD_MONSTER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_WALL_OF_DISPEL_MAGIC,oTarget)>1) nReturn+=1;

            if(nReturn >=1)return TRUE;
            return FALSE;


        }


       case nSpellLevel7:
        {
            if(GetHasSpell(AR_SPELL_CONTROL_UNDEAD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DELAYED_BLAST_FIREBALL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FINGER_OF_DEATH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FIRE_STORM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_RESTORATION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MORDENKAINENS_SWORD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_POWER_WORD_STUN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PRISMATIC_SPRAY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PROTECTION_FROM_SPELLS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_RESURRECTION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SHADOW_SHIELD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SPELL_MANTLE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_VII,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUNBEAM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WORD_OF_FAITH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CREEPING_DOOM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DESTRUCTION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURA_OF_VITALITY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_REGENERATE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ETHEREALNESS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BIGBYS_GRASPING_HAND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREAT_THUNDERCLAP,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ETHEREALNESS2,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BANEOFDEFILERS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WORD_OF_BALANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_HOLD_PERSON,oTarget)>1) nReturn+=1;

            if(nReturn >=1)return TRUE;
            return FALSE;

        }

        case nSpellLevel6:
        {
            if(GetHasSpell(AR_SPELL_ACID_FOG,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BLADE_BARRIER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CHAIN_LIGHTNING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CIRCLE_OF_DEATH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CREATE_UNDEAD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GLOBE_OF_INVULNERABILITY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_SPELL_BREACH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_STONESKIN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HARM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HEAL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_HASTE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PLANAR_BINDING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_VI,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TENSERS_TRANSFORMATION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BANISHMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DROWN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DIRGE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ISAACS_GREATER_MISSILE_STORM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PLANAR_ALLY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BIGBYS_FORCEFUL_HAND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FLESH_TO_STONE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_STONE_TO_FLESH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CRUMBLE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_UNDEATH_TO_DEATH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_STONEHOLD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_SHADOW_X2,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUNSTROKE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HEARTSEEKER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_BULLS_STRENGTH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_CATS_GRACE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_EAGLE_SPLENDOR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_ENDURANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_FOXS_CUNNING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_OWLS_WISDOM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ACID_STORM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DISINTEGRATE,oTarget)>1) nReturn+=1;

            if(nReturn >=1)return TRUE;
            return FALSE;
        }

        case nSpellLevel5:
        {
            if(GetHasSpell(AR_SPELL_CIRCLE_OF_DOOM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CLOUDKILL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CONE_OF_COLD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FEEBLEMIND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_DISPELLING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HEALING_CIRCLE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LESSER_MIND_BLANK,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LESSER_PLANAR_BINDING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LESSER_SPELL_MANTLE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MIND_FOG,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ETHEREAL_VISAGE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_RAISE_DEAD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SLAY_LIVING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SPELL_RESISTANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SPHERE_OF_CHAOS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_V,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TRUE_SEEING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURA_BLINDING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURA_STUN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CONE_ACID,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CONE_COLD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AWAKEN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ENERGY_BUFFER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LEGEND_LORE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_MEPHIT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CELESTIAL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_OWLS_INSIGHT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FIREBRAND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INFERNO,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BIGBYS_INTERPOSING_HAND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TRAP_ARROW,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TRAP_BOLT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TRAP_DART,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TRAP_SHURIKEN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BREATH_PETRIFY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TOUCH_PETRIFY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BALL_LIGHTNING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BATTLETIDE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MESTILS_ACID_SHEATH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MONSTROUS_REGENERATION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_VINE_MINE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_EVIL_BLIGHT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_STEALENERGY_DEF,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WISDOMOFSORCKING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_HEROISM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LEGIONS_CURSE_OF_PETTY_FAILING,oTarget)>1) nReturn+=1;

            if(nReturn >=1)return TRUE;
            return FALSE;
        }

        case nSpellLevel4:
        {
            if(GetHasSpell(AR_SPELL_CURE_CRITICAL_WOUNDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DEATH_WARD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DISMISSAL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DIVINE_POWER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DOMINATE_PERSON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ELEMENTAL_SHIELD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ENERVATION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FLAME_STRIKE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FREEDOM_OF_MOVEMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HAMMER_OF_THE_GODS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HOLD_MONSTER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HOLY_SWORD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_IMPROVED_INVISIBILITY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LESSER_SPELL_BREACH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MINOR_GLOBE_OF_INVULNERABILITY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PHANTASMAL_KILLER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_RESTORATION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SHADOW_CONJURATION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_STONESKIN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_IV,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WALL_OF_FIRE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURA_COLD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURA_ELECTRICITY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURA_FEAR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURA_FIRE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ICE_STORM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_EVARDS_BLACK_TENTACLES,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INFLICT_CRITICAL_WOUNDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ISAACS_LESSER_MISSILE_STORM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_CAMOFLAGE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HOLY_SWORD2,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HEATEXHAUSTION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGMABLADE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SILTSPRAY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ACIDRAIN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BACKLASH_PRES,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MASS_ULTRAVISION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LOWER_SPELL_RESISTANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LEGIONS_SHIELD_OF_FAITH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SONIC_ORB,oTarget)>1) nReturn+=1;

            if(nReturn >=1)return TRUE;
            return FALSE;


        }

        case nSpellLevel3:
        {
            if(GetHasSpell(AR_SPELL_ANIMATE_DEAD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BESTOW_CURSE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CALL_LIGHTNING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CHARM_MONSTER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CONFUSION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CONTAGION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CURE_SERIOUS_WOUNDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DISPEL_MAGIC,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DOMINATE_ANIMAL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FEAR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FIREBALL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FLAME_ARROW,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_MAGIC_WEAPON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GUST_OF_WIND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HASTE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INVISIBILITY_PURGE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INVISIBILITY_SPHERE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LIGHTNING_BOLT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGIC_VESTMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_NEGATIVE_ENERGY_PROTECTION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_NEUTRALIZE_POISON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_POISON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PRAYER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PROTECTION_FROM_ELEMENTS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_REMOVE_BLINDNESS_AND_DEAFNESS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_REMOVE_CURSE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_REMOVE_DISEASE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SEARING_LIGHT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SLOW,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_STINKING_CLOUD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_III,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_VAMPIRIC_TOUCH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGIC_CIRCLE_AGAINST_ALIGNMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_NEGATIVE_ENERGY_BURST,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WAR_CRY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FIND_TRAPS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_QUILLFIRE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INFLICT_SERIOUS_WOUNDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WOUNDING_WHISPERS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATER_MAGIC_FANG,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SPIKE_GROWTH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DISPLACEMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CLAIRAUDIENCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INFESTATION_OF_MAGGOTS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HEALING_STING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MESTILS_ACID_BREATH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SCINTILLATING_SPHERE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BLADE_THIRST,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_KEEN_EDGE ,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREATERMAGICWEAPON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELLMAGICVESTMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DARKFIRE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GLYPH_OF_WARDING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUNBLADE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SOOTHE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ELEMENTALIMBUEMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WATERBREATHING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BRAMBLEWOOD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CONSEVATION_PRES,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TOUCHTHEBLACK,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ONHITBANEOFDEFILERS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FORCEBLAST,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LEGIONS_CURSE_OF_IMPENDING_BLADES,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CURSE_OF_PETTY_FAILING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SPIDERSKIN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREENFIRE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SERPENTS_SIGH,oTarget)>1) nReturn+=1;

            if(nReturn >=1)return TRUE;
            return FALSE;


        }

        case nSpellLevel2:
        {
            if(GetHasSpell(AR_SPELL_AID,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BARKSKIN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BLINDNESS_AND_DEAFNESS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BULLS_STRENGTH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CATS_GRACE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CHARM_PERSON_OR_ANIMAL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CLARITY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CURE_MODERATE_WOUNDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DARKNESS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ENDURANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FLAME_LASH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GHOUL_TOUCH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HOLD_ANIMAL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HOLD_PERSON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_IDENTIFY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INVISIBILITY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_KNOCK,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LESSER_DISPEL,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LESSER_RESTORATION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MELFS_ACID_ARROW,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GHOSTLY_VISAGE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_REMOVE_PARALYSIS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_RESIST_ELEMENTS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SEE_INVISIBILITY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SILENCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SOUND_BURST,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_II,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WEB,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LESSER_BODY_ADJUSTMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_EAGLE_SPLENDOR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_OWLS_WISDOM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FOXS_CUNNING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ULTRAVISION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CONTINUAL_FLAME,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ONE_WITH_THE_LAND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BLOOD_FRENZY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURAOFGLORY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INFLICT_MODERATE_WOUNDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BALAGARNSIRONHORN,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TASHAS_HIDEOUS_LAUGHTER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELLCATSGRACE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELLEAGLESPLENDOR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INVISIBILITY2,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_COMBUST,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DEATH_ARMOR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GEDLEES_ELECTRIC_LOOP,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_STONE_BONES,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_FLAME_WEAPON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AURAOFGLORY_X2,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CLOUD_OF_BEWILDERMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GLYPHOFWARDINGDEFAULT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGMAJET,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MIGHTOFSORCKING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HEROISM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BALEFUL_TRANSPOSITION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CURSE_OF_IMPENDING_BLADES,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CREATE_MAGIC_TATOO,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GLITTERDUST,oTarget)>1) nReturn+=1;

            if(nReturn >=1)return TRUE;
            return FALSE;

        }

        case nSpellLevel1:
        {
            if(GetHasSpell(AR_SPELL_BLESS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BLESS_WEAPON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BURNING_HANDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CALM_EMOTIONS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CHARM_PERSON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_COLOR_SPRAY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CURE_LIGHT_WOUNDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DOOM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ENDURE_ELEMENTS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ENTANGLE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_GREASE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGE_ARMOR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGIC_MISSILE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGIC_WEAPON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_RAY_OF_ENFEEBLEMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_REMOVE_FEAR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_RESISTANCE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SANCTUARY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SCARE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SLEEP,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SUMMON_CREATURE_I,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_REMOVEDISEASE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_PROTECTION_FROM_ALIGNMENT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_NEGATIVE_ENERGY_RAY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DIVINE_FAVOR,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_TRUE_STRIKE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SHIELD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ENTROPIC_SHIELD,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CAMOFLAGE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_INFLICT_LIGHT_WOUNDS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_AMPLIFY,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BANE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SHIELD_OF_FAITH,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGIC_FANG,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_EXPEDITIOUS_RETREAT,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HORIZIKAULS_BOOM,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_IRONGUTS,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_SHELGARNS_PERSISTENT_BLADE,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_DEAFENING_CLANG,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BLESSWEAPON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_ICE_DAGGER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_MAGICWEAPON,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_WHIRLWIND,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_CREATEWATER,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_HANDOFSORCKING,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_BENIGN_TRANSPOSITION,oTarget)>1) nReturn+=1;
            if(GetHasSpell(AR_SPELL_LESSER_SONIC_ORB,oTarget)>1) nReturn+=1;

            if(nReturn >=1)return TRUE;
            return FALSE;

        }
   }


return FALSE;


}


void ARdebug( string sMessage ) {
  SendMessageToPC( GetFirstPC(), sMessage );
  SendMessageToAllDMs( sMessage );
  PrintString( sMessage );
}
//void main(){}



