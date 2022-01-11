/**
 * @file
 * This file defines names of switches that can be used to modify
 * the behaviour of certain parts of the PRC pack.
 * It also contains functions for getting and setting the values of
 * these switches and in addition some functions dealing with the
 * implementation of certain switches.
 */

 /*

 Creating your personal switch settings
 For singleplayer, you can create a 2da file and place it in the overide
 Then via the PRC Options switch you can read that 2da and it will
 use it to set switches for you.
 This will not work in multiplayer.
 An example is below. Copy and paste it into a plain text file saved
 as personal_switch.2da

 If there is a file named personal_switch.2da then it will be loaded
 at module load and the switches set accordingly.


2DA V2.0

    SwitchName                              SwitchType SwitchValue
0   FOO                                     float      3.14159
1   BAR                                     int        12321
2   BAZ                                     string     "Go For The Eyes Boo, Go For The Eyes!"
3   PRC_PNP_TRUESEEING                      int        1
4   PRC_TIMESTOP_LOCAL                      int        1
5   PRC_TIMESTOP_NO_HOSTILE                 int        1
6   PRC_TIMESTOP_BLANK_PC                   int        1
7   PRC_PNP_ELEMENTAL_SWARM                 int        1
8   PRC_PNP_TENSERS_TRANSFORMATION          int        1
9   PRC_PNP_BLACK_BLADE_OF_DISASTER         int        1
10  PRC_PNP_FIND_TRAPS                      int        1
11  PRC_PNP_DARKNESS                        int        1
12  PRC_PNP_DARKNESS_35ED                   int        1
13  PRC_PNP_ANIMATE_DEAD                    int        1
14  PRC_35ED_WORD_OF_FAITH                  int        1
15  PRC_CREATE_UNDEAD_UNCONTROLLED          int        1
16  PRC_CREATE_UNDEAD_PERMANENT             int        1
17  PRC_SLEEP_NO_HD_CAP                     int        1
18  PRC_USE_NEW_IMBUE_ARROW                 int        1
19  PRC_ORC_WARLORD_COHORT                  int        1
20  PRC_LICH_ALTER_SELF_DISABLE             int        1
21  PRC_TRUE_NECROMANCER_ALTERNATE_VISUAL   int        1
22  PRC_THRALLHERD_LEADERSHIP               int        1
23  PRC_PNP_UNIMPINGED                      int        1
24  PRC_PNP_IMPENETRABILITY                 int        1
25  PRC_PNP_DULLBLADES                      int        1
26  PRC_PNP_CHAMPIONS_VALOR                 int        1
27  PRC_STAFF_CASTER_LEVEL                  int        1
28  PRC_PNP_ABILITY_DAMAGE_EFFECTS          int        1
29  PRC_PNP_REST_HEALING                    int        1
30  PRC_PNP_SOMATIC_COMPOMENTS              int        1
31  PRC_PNP_SOMATIC_ITEMS                   int        1
32  PRC_MULTISUMMON                         int        1
33  PRC_SUMMON_ROUND_PER_LEVEL              int        1
34  PRC_PNP_FAMILIAR_FEEDING                int        1
35  PRC_PNP_HOLY_AVENGER_IPROP              int        1
36  PRC_PNP_SLINGS                          int        1
37  PRC_PNP_RACIAL_SPEED                    int        1
38  PRC_PNP_ARMOR_SPEED                     int        1
39  PRC_REMOVE_PLAYER_SPEED                 int        1
40  PRC_BREW_POTION_CASTER_LEVEL            int        1
41  PRC_SCRIBE_SCROLL_CASTER_LEVEL          int        1
42  PRC_CRAFT_WAND_CASTER_LEVEL             int        1
43  PRC_CRAFTING_BASE_ITEMS                 int        1
44  PRC_XP_USE_SIMPLE_LA                    int        1
45  PRC_XP_USE_SIMPLE_RACIAL_HD             int        1
 */

 /* This variable MUST be updated with every new version of the PRC!!! */

 const string PRC_VERSION                           = "PRC 3.9.0";

 /* This variable MUST be updated every time 'assemble_spellbooks.bat' is run!!! */

 const string AMS_VERSION                           = "AMS_1.7.6";

/******************************************************************************\
*                                  Spell switches                              *
\******************************************************************************/

/** Material Components
 * Set switch to 1 to activate this
 * This allows material components in NWN through the materialcomp.2da
 * Just put the SpellID and UTC resref in, MINUS the .utc on the end.
 * This also requires the names of the items, formatted like so ("" included): "Object Name"
 * 
 * Set switch to 2 to activate this
 * Deducts gold instead of requiring material components
 * Put the gold value in the Cost column
 
 * Set switch to 3 to activate both at the same time
 * WARNING: This will slow spellcasting down due to 2da reads and inventory loops
 */
const string PRC_MATERIAL_COMPONENTS                 = "PRC_MATERIAL_COMPONENTS";

const string PRC_DISABLE_COMPONENTS_SHOP             = "PRC_DISABLE_COMPONENTS_SHOP";

/** Bioware True Seeing can see stealthed creatures.
 * This replaces the trueseeing effect with a See Invisible + Ultravision + Spot bonus.
 * This affects the spell and power True Seeing and the Dragon Disciple class
 */
const string PRC_PNP_TRUESEEING                      = "PRC_PNP_TRUESEEING";

/**
 * PRC_PNP_TRUESEEING must be on.
 * Value of spot skill bonus that True Seeing grants.
 * Defaults to +15 if not set.
 */
const string PRC_PNP_TRUESEEING_SPOT_BONUS           = "PRC_PNP_TRUESEEING_SPOT_BONUS";

/** Remove the cap PRC added to this spell */
const string PRC_BIOWARE_GRRESTORE                   = "PRC_BIOWARE_GRRESTORE";
/** Remove the cap PRC added to this spell */
const string PRC_BIOWARE_HEAL                        = "PRC_BIOWARE_HEAL";
/** Remove the cap PRC added to this spell */
const string PRC_BIOWARE_MASS_HEAL                   = "PRC_BIOWARE_MASS_HEAL";
/** Remove the cap PRC added to this spell */
const string PRC_BIOWARE_HARM                        = "PRC_BIOWARE_HARM";
/** Remove the cap PRC added to this spell */
const string PRC_BIOWARE_NEUTRALIZE_POISON           = "PRC_BIOWARE_NEUTRALIZE_POISON";
/** Remove the cap PRC added to this spell */
const string PRC_BIOWARE_REMOVE_DISEASE              = "PRC_BIOWARE_REMOVE_DISEASE";

/** 
 * This replaces the 3.0 Spell Focus bonuses with the 3.5 edition ones
 */
const string PRC_35_SPELL_FOCUS                      = "PRC_35_SPELL_FOCUS";

/* Blindness/Deafness effect is permanent */
const string PRC_PNP_BLINDNESS_DEAFNESS              = "PRC_PNP_BLINDNESS_DEAFNESS";

/**
 * Sets caltrops duration in seconds.
 * Defaults = permanent
 */
const string PRC_CALTROPS_DURATION                   = "PRC_CALTROPS_DURATION";

/***
 * Timestop has Bioware durations (9 seconds or 18 for Greater Timestop) rather
 * than PnP durations (1d4+1 or 2d4+2)
 */
const string PRC_TIMESTOP_BIOWARE_DURATION           = "PRC_TIMESTOP_BIOWARE_DURATION";

/**
 * Timestop has only a local affect, i.e doesn't stop people on the other areas of the module.
 * Note that AOEs continue to act during a timestop, and durations/delayed events still occur.
 */
const string PRC_TIMESTOP_LOCAL                      = "PRC_TIMESTOP_LOCAL";

/**
 * PRC_TIMESTOP_LOCAL must be enabled.
 * Caster can't perform any hostile actions while in timestop.
 */
const string PRC_TIMESTOP_NO_HOSTILE                 = "PRC_TIMESTOP_NO_HOSTILE";

/**
 * PRC_TIMESTOP_LOCAL must be enabled.
 * PCs can't see anything while stopped.
 * This might look to the player like their game crashed.
 */
const string PRC_TIMESTOP_BLANK_PC                   = "PRC_TIMESTOP_BLANK_PC";

/**
 * Instead of Bioware's sequential summons it creates multiple elementals.
 * Only works if PRC_MULTISUMMON is on
 */
const string PRC_PNP_ELEMENTAL_SWARM                 = "PRC_PNP_ELEMENTAL_SWARM";

/**
 * If you pass a save, you can't be affected by that aura for 24h.
 * NOTE: Not implemented yet
 */
const string PRC_PNP_FEAR_AURAS                      = "PRC_PNP_FEAR_AURAS";

/**
 * Not a polymorph but ability bonuses instead.
 */
const string PRC_PNP_TENSERS_TRANSFORMATION          = "PRC_PNP_TENSERS_TRANSFORMATION";

/**
 * Less powerful, more PnP accurate version.
 * Caster must concentrate to maintain it.
 */
const string PRC_PNP_BLACK_BLADE_OF_DISASTER         = "PRC_PNP_BLACK_BLADE_OF_DISASTER";

/**
 * Traps are only shown, not disarmed
 */
const string PRC_PNP_FIND_TRAPS                      = "PRC_PNP_FIND_TRAPS";

/**
 * PnP Darkness
 * Is a mobile AOE based off an item
 */
const string PRC_PNP_DARKNESS                        = "PRC_PNP_DARKNESS";

/**
 * Bioware Invisibility, Improved Invisibility
 */
const string PRC_BIOWARE_INVISIBILITY                = "PRC_BIOWARE_INVISIBILITY";

/**
 * 3.5ed Darkness
 * Gives 20% concelement rather than bioware darkness
 */
const string PRC_PNP_DARKNESS_35ED                   = "PRC_PNP_DARKNESS_35ED";

/**
 * Undead summons are permanent, but can only have 4HD/casterlevel in total
 * Does not enforce the requirement for a corpse
 * Also applies to ghoul gauntlet which otherwise will create one ghoul
 * if you dont already have a summon
 */
const string PRC_PNP_ANIMATE_DEAD                    = "PRC_PNP_ANIMATE_DEAD";

/**
 * This sets the HP limit for Symbol of Death, Symbol of Fear and Symbol of Stunning
 * spells. Default = 150.
 */
const string PRC_SYMBOL_HP_LIMIT                     = "PRC_SYMBOL_HP_LIMIT";

/**
 * "Word of Faith" spells use 3.5 ed rules rather than 3.0ed
 * basically instead of 12+ / <12 / <8 / <4 its relative to caster level
 * at >=CL / <CL / <CL-5 / <CL-10
 * This basically makes it more powerful at higher levels
 */
const string PRC_35ED_WORD_OF_FAITH                  = "PRC_35ED_WORD_OF_FAITH";

/*
 * Undead created by Create Undead and Create Greater Undead are
 * not automatically under the casters control
 * If this is set, the undead are permanently created
 */
const string PRC_CREATE_UNDEAD_UNCONTROLLED          = "PRC_CREATE_UNDEAD_UNCONTROLLED";

/*
 * Undead created by Create Undead and Create Greater Undead are
 * not removed on resting etc
 */
const string PRC_CREATE_UNDEAD_PERMANENT             = "PRC_CREATE_UNDEAD_PERMANENT";

/*
 * Sleep and Deep Slumber dont have a limit on the
 * HD of a target to be effected.
 */
const string PRC_SLEEP_NO_HD_CAP                     = "PRC_SLEEP_NO_HD_CAP";

/**
 * By request, set this to use the 1.65 behaviour for implosion, phantasmal killer,
 * and weird, i.e. death immunity counts
 * This is in addition to the extra immunities 1.66 adds
 */
const string PRC_165_DEATH_IMMUNITY                  = "PRC_165_DEATH_IMMUNITY";

/*
 * This is for builders. It should not be set on the module, but should be set on players/creatures.
 * When this is set, it will override spell DC for all spells cast (including SLAs and items)
 * This will overrule all feats, racial bonuses, etc that would effect DC
*/
const string PRC_DC_TOTAL_OVERRIDE                   = "PRC_DC_TOTAL_OVERRIDE";

/*
 * This is for builders. It should not be set on the module, but should be set on players/creatures.
 * When this is set, it will override spell DC for all spells cast (including SLAs and items)
 * This will ony override base DC+spelllevel+statmod, feats race etc are added on top of this
 * If this is set to -1, DC is calculated including class & spell level
*/
const string PRC_DC_BASE_OVERRIDE                   = "PRC_DC_BASE_OVERRIDE";

/*
 * This is for builders. It should not be set on the module, but should be set on players/creatures.
 * When this is set, it will add to spell DC for all spells cast (including SLAs and items)
*/
const string PRC_DC_ADJUSTMENT                       = "PRC_DC_ADJUSTMENT";

/*
 * By default when calculating caster level for characters with PrCs, the highest class rule will 
 * be used (ie. Bard 2/Wizard 4/Elemental Savant 6 - Wizard is the highest arcane class so levels 
 * form PrC will be added to that class, and the caster level will be 2 for Bard and 10 for Wizard).
 * When this is set, the first class rule will be used (with the same character caster level would
 * be 8 for Bard and 4 for Wizard).
*/
const string PRC_CASTERLEVEL_FIRST_CLASS_RULE        = "PRC_CASTERLEVEL_FIRST_CLASS_RULE";

/*
 * This is for builders. It should not be set on the module, but should be set on players/creatures.
 * When this is set, it will override spell casterlevel for all spells cast (including SLAs and items)
*/
const string PRC_CASTERLEVEL_OVERRIDE                = "PRC_CASTERLEVEL_OVERRIDE";

/*
 * This is for builders. It should not be set on the module, but should be set on players/creatures.
 * When this is set, it will add to spell casterlevel for all spells cast (including SLAs and items)
*/
const string PRC_CASTERLEVEL_ADJUSTMENT              = "PRC_CASTERLEVEL_ADJUSTMENT";

/*
 * Mostly internal, but builders may find a use for it
 * Used to override GetLastSpellCastClass();
*/
const string PRC_CASTERCLASS_OVERRIDE                = "PRC_CASTERCLASS_OVERRIDE";

/*
 * Mostly internal, but builders may find a use for it
 * Used to override PRCGetSpellTargetLocation();
 * To activate set a location and an int on the module
 * The int must be TRUE
*/
const string PRC_SPELL_TARGET_LOCATION_OVERRIDE      = "PRC_SPELL_TARGET_LOCATION_OVERRIDE";

/*
 * Mostly internal, but builders may find a use for it
 * Used to override PRCGetSpellTargetObject();
 * To activate set a object and an int on the module
 * The int must be TRUE
*/
const string PRC_SPELL_TARGET_OBJECT_OVERRIDE        = "PRC_SPELL_TARGET_OBJECT_OVERRIDE";

/*
 * Mostly internal, but builders may find a use for it
 * Used to increase/decrease spell area (but it won't work with AoE)
 * works with widen spell
 * Float variable - area size is multiplied by it
*/
const string PRC_SPELL_AREA_SIZE_MULTIPLIER          = "PRC_SPELL_AREA_SIZE_MULTIPLIER";

/**
 * Mostly internal
 * Used to override PRCGetSpellCastItem();
 */
const string PRC_SPELLCASTITEM_OVERRIDE              = "PRC_SPELLCASTITEM_OVERRIDE";

/*
 * This is for builders. It should not be set on the module, but should be set on players/creatures.
 * When this is set, it will add to spell metamagic. Not all spells may accept this.
 * Only use Empower, Extend, or Maximize.
 * Still, Silent, and Quicken wont work
*/
const string PRC_METAMAGIC_ADJUSTMENT                 = "PRC_METAMAGIC_ADJUSTMENT";

/*
 * Mostly internal, but builders may find a use for it
 * Used to override PRCGetMetaMagicFeat();
 * Only use Empower, Extend, or Maximize.
 * Still, Silent, and Quicken wont work
*/
const string PRC_METAMAGIC_OVERRIDE                   = "PRC_METAMAGIC_OVERRIDE";

/*
 * Override for SpellID for PRCGetSpellID()
 * Doesnt effect spellID from effects, or automatic 2da reads
 */
const string PRC_SPELLID_OVERRIDE                     = "PRC_SPELLID_OVERRIDE";

/*
 * This switch toggles whether items are destroyed by Claws of the Bebilith or
 * simply unequipped.
 */
 const string PRC_BEBILITH_CLAWS_DESTROY              = "PRC_BEBILITH_CLAWS_DESTROY";

/*
 * When on, unidentified items will automatically by identified when aquired
 * respecting normal lore skill rules.
 */
 const string PRC_AUTO_IDENTIFY_ON_ACQUIRE              = "PRC_AUTO_IDENTIFY_ON_ACQUIRE";

/*
 * When on, identified items will automatically by unidentified when aquired
 * provided the new owner is not a friend/neutral and not to/from a store
 */
 const string PRC_AUTO_UNIDENTIFY_ON_UNACQUIRE              = "PRC_AUTO_UNIDENTIFY_ON_UNACQUIRE";

/*
 * Extra damage switch for Apocalypse from the Sky
 * spell does 10d6 by default, 40d4 with this set
 */

const string PRC_AFTS_EXTRA_DAMAGE                         = "PRC_AFTS_EXTRA_DAMAGE";


// switch whether unlearning spells for spont casters at level up should go according to PnP or Bioware rules
// if on, will unlearn according to Bioware rules (e.g. as many as you want)
const string PRC_BIO_UNLEARN = "PRC_BIO_UNLEARN";

/** PRC_UNLEARN_SPELL_MAXNR
If PRC_BIO_UNLEARN is ON, you may want to restrict the nr of spells that a spontaneous caster
can unlearn to just a few spells ("normal" Bioware rules allow unlearning all spells at every level).
When PRC_UNLEARN_SPELL_MAXNR is set to (hopefully) a small value, the spontaneous caster
will still be able to unlearn spells at EVERY level up with no restrictions to the spell level that may
be unlearned, but the maximum nr of spells that can be unlearned are determined by the value on the switch
When PRC_UNLEARN_SPELL_MAXNR is not set and PRC_BIO_UNLEARN is ON, the spont caster
may unlearn as many spells as he wishes at every level up

If PRC_BIO_UNLEARN is Off, the maximum spell level that can be unlearned and the caster level
at which unlearning a spell becomes possible will be determined according to PnP rules. However,
you may want to give your spont casters more than one single spell to unlearn via this switch. If
PRC_UNLEARN_SPELL_MAXNR is set to a positive value, this is the nr of spells that the spontaneous
caster may unlearn (assuming he is allowed to unlearn at least one spell according to PnP rules). If
PRC_UNLEARN_SPELL_MAXNR is not set and PRC_BIO_UNLEARN is Off, unlearning spells goes
according to the exact PnP rules, e.g. at most one spell may be unlearned (at specific caster levels and
with restrictions on the maximum spell level that can be unlearned)
*/
// holds the maximum nr of spells that can be unlearned when the spont caster is entitled to unlearn at least one spell
const string PRC_UNLEARN_SPELL_MAXNR = "PRC_UNLEARN_SPELL_MAXNR";

/******************************************************************************\
*                                  Class switches                              *
\******************************************************************************/

/*
 * This turns on the new improved imbue arrow functionallity
 * so all the player has to do is cast the spell at an arrow in their inventory
 * If this is off, players get the default bioware imbue arrow as a bonus feat on their hides
*/
const string PRC_USE_NEW_IMBUE_ARROW                 = "PRC_USE_NEW_IMBUE_ARROW";

/*
 * If this is set, the Dragon Disciple size increases at level 15 and 25
 * will give ability increases matching the new size
 * In any case, DDs will benefit from increased natural damage
*/
const string PRC_DRAGON_DISCIPLE_SIZE_CHANGES        = "PRC_DRAGON_DISCIPLE_SIZE_CHANGES";

/*
 *   Start of samurai switches
 */

/*
 * This values are divided by 100 when applied so a value of 100 is equivalent
 * to 1.0
 */

/*
 *
 *
 *
 */
const string PRC_SAMURAI_                            = "PRC_SAMURAI_";

/*
 * This allows samurai to sacrifice stolen items
 */
const string PRC_SAMURAI_ALLOW_STOLEN_SACRIFICE      = "PRC_SAMURAI_ALLOW_STOLEN_SACRIFICE";

/*
 * This allows samurai to sacrifice unidentified items
 * They will get full value for them however
 */
const string PRC_SAMURAI_ALLOW_UNIDENTIFIED_SACRIFICE= "PRC_SAMURAI_ALLOW_UNIDENTIFIED_SACRIFICE";

/*
 * This scales the value of sacrificed items
 * This values are divided by 100 when applied so a value of 100 is equivalent
 * to 1.0
 */
const string PRC_SAMURAI_SACRIFICE_SCALAR_x100       = "PRC_SAMURAI_SACRIFICE_SCALAR_x100";

/*
 * This scales the maximum value a samurai can have
 * This values are divided by 100 when applied so a value of 100 is equivalent
 * to 1.0
 */
const string PRC_SAMURAI_VALUE_SCALAR_x100           = "PRC_SAMURAI_VALUE_SCALAR_x100";

/*
 * Stop and Itemproperty being addeable
 * This is just a prefix, they should be finished as
 * PRC_SAMURAI_BAN_[type]_[subtype]_[param1]_[value]
 * If an itemproperty is missing one of those, or you wish to ban all of a
 * particular type use * instead of a number.
 * Examples:
 * Not allowing divine damage :                         PRC_SAMURAI_BAN_16_8_*_*
 * Not allowing divine damage vs undead:                PRC_SAMURAI_BAN_18_24_8_*
 * Not allowing +20 encancement weapons                 PRC_SAMURAI_BAN_6_*_*_20
 * see also DoSamuraiBanDefaults in inc_switch_setup
 *
 */
const string PRC_SAMURAI_BAN_                            = "PRC_SAMURAI_BAN_";

/*
 *  Normally, some bans on itemproperties are setup automatically.
 *  If this switch is set, then nothing is banned automatically
 *  thus giving admins full controll.
 */
const string PRC_SAMURAI_DISABLE_DEFAULT_BAN             = "PRC_SAMURAI_DISABLE_DEFAULT_BAN";

/*
 * Orc Warlord gets a single additional cohort that must be an orc of some sort instead
 * of multiple summons
 */
const string PRC_ORC_WARLORD_COHORT                  = "PRC_ORC_WARLORD_COHORT";

/*
 * Disables the Lichs Alter Self ability
 * This was original a fudge for the HotU fairy/wolf/elemental quest
 */
const string PRC_LICH_ALTER_SELF_DISABLE             = "PRC_LICH_ALTER_SELF_DISABLE";

/*
 * Reduces the True Necromancers aura visual effects
 * It continues to function the same though
 */
const string PRC_TRUE_NECROMANCER_ALTERNATE_VISUAL             = "PRC_TRUE_NECROMANCER_ALTERNATE_VISUAL";

/*
 * Thrallherd uses leadership system rather than its own summons
 * They still cannot use Leadership, Epic Leadership or Legendary Commander feats
 */
const string PRC_THRALLHERD_LEADERSHIP             = "PRC_THRALLHERD_LEADERSHIP";

/*
 * Prevents Spellfire wielders from absorbing their own
 * spells/powers
 */
const string PRC_SPELLFIRE_DISALLOW_CHARGE_SELF     = "PRC_SPELLFIRE_DISALLOW_CHARGE_SELF";

/*
 * Prevents Spellfire channelers from absorbing from
 * scrolls/potions
 */
const string PRC_SPELLFIRE_DISALLOW_DRAIN_SCROLL_POTION = "PRC_SPELLFIRE_DISALLOW_DRAIN_SCROLL_POTION";

/*
 * Disables the PRCs sorcerer newspelbook extension
 */
const string PRC_SORC_DISALLOW_NEWSPELLBOOK     = "PRC_SORC_DISALLOW_NEWSPELLBOOK";

/*
 * Disables the PRCs bards newspelbook extension
 */
const string PRC_BARD_DISALLOW_NEWSPELLBOOK     = "PRC_BARD_DISALLOW_NEWSPELLBOOK";

/*
 * Bards suffer no arcane spell failure chance when casting in light armor
 */
const string PRC_BARD_LIGHT_ARMOR_SPELLCASTING  = "PRC_BARD_LIGHT_ARMOR_SPELLCASTING";

/**
 * By default, CW Samurai get a plain katana and a plain wakizashi (shortsword) at 1st level.
 * Setting this to non-zero value prevents that.
 */
const string PRC_CWSAMURAI_NO_HEIRLOOM_DAISHO = "PRC_CWSAMURAI_NO_HEIRLOOM_DAISHO";

/**
 * Determines the number of wight henchmen a Soul Eater can have via their Soul Slave
 * class ability.
 * Default: 4
 * Special: Due to it not being possible to differentiate between a set 0 and an unset 0,
 *          to prevent any wight henchmen, set the switch to -1. (0 counts as the default)
 */
const string PRC_SOUL_EATER_MAX_SLAVES       = "PRC_SOUL_EATER_MAX_SLAVES";


/**
 * For the Psionic Slayer prestige class, this switch limits the Favored Enemy selection
 * to the Aberration racial type.
 *
 * This switch is provided to allow builders to more closely represent the Pen and Paper 
 * Illithid Slayer class, instead of the broader Open Game License "Slayer" class.
 *
 * Type: Int  
 * Values: 0 [Default] (Favored Enemy racial type is not limited)
 *		   1 (Favored Enemy race is limited to Aberration only)
 */
const string PRC_PSIONIC_SLAYER_FAV_ENEMY_ABERRATION_ONLY       = "PRC_PSIONIC_SLAYER_FAV_ENEMY_ABERRATION_ONLY";

/**
 * For the Psionic Slayer prestige class, this switch requires a character to make a "kill"
 * of a specific type of creature before the class becomes available.
 *
 * Use of this switch requires that the module builder add a "Psionic Slayer Kill Token" 
 * (included in the PRC Items) to the designated creature. 
 *
 * Alternately, a script or item can be made that will run the script "prc_psysly_killt" 
 * on the PC. This script will set the flag that allows the target PC to take the Psionic Slayer Class.
 * Example code:  
 *				ExecuteScript("prc_psysly_killt", oPC); // Where oPC is an player charcter object
 *
 * This switch is provided to allow builders to more closely represent the Pen and Paper 
 * Illithid Slayer class, instead of the broader Open Game License "Slayer" class.
 *
 * Type: Int  
 * Values: 0 [Default] (Kill Token / Script NOT required for taking the Psionic Slayer Class)
 *		   1 (Kill Token / Script REQUIRED before the Psionic Slayer Class is available to take)
 */
const string PRC_PSIONIC_SLAYER_REQUIRE_KILL_TOKEN       = "PRC_PSIONIC_SLAYER_REQUIRE_KILL_TOKEN";


/**
 * By default the Werewolf class uses the Bioware Polymorph effect to perfrom its
 * Hybrid Form Shapchange.
 *
 * This switch allows the Werewolf class to be toggled to use the PRC Shifter 
 * Shapchange code instead. 
 *
 * Type: Int 
 * Values: 0 [Default] (Werewolf Hybrid Shapchange uses Bioware Polymorph)
 *		   1 (Werewolf Hybrid Shapchange uses PRC Shifter shape change code)
 */
const string PRC_WEREWOLF_HYBRID_USE_SHIFTER_SHAPCHANGE       = "PRC_WEREWOLF_HYBRID_USE_SHIFTER_SHAPCHANGE";

/**
 * Sets the max bonus for the PnP Shifter shifting systems
 *
 * Type: Int 
 * Values: any greater than 0
 */
const string PRC_PNP_SHIFTER_BONUS                            = "PRC_PNP_SHIFTER_BONUS";

/*
 * This spawns one chicken every six seconds if the PC is a commoner
 * Chickens last 1 hour per switch value (so 1 is 1 hour, 2 is 2 hours, etc)
*/
const string PRC_CHICKEN_INFESTED                 = "PRC_CHICKEN_INFESTED";

/******************************************************************************\
  *                     Template and Weapon of Legacy switches                 *
\******************************************************************************/

/**
 * Disable players selecting templates via PRC Options convo
 */
const string PRC_DISABLE_CONVO_TEMPLATE_GAIN = "PRC_DISABLE_CONVO_TEMPLATE_GAIN";


/**
 * Disable players selecting Weapons of Legacy via PRC Options convo
 */
const string PRC_DISABLE_WOL_GAIN = "PRC_DISABLE_WOL_GAIN";

/**
 * Disable having to defeat the encounter areas to gain a Weapon of Legacy
 */
const string PRC_DISABLE_WOL_AREA = "PRC_DISABLE_WOL_AREA";

/******************************************************************************\
*                               Epic Spell switches                            *
\******************************************************************************/

/**
 * If set, then the switches below will not be set to default values.
 * Should be used if any customisation is done.
 */
const string PRC_EPIC_INGORE_DEFAULTS                = "PRC_EPIC_INGORE_DEFAULTS";

/**
 * Do epic spells cost XP to cast?
 * Defaults to: TRUE
 */
const string PRC_EPIC_XP_COSTS                       = "PRC_EPIC_XP_COSTS";

/**
 * Do casters take 10 when researching?
 * Defaults to: FALSE
 */
const string PRC_EPIC_TAKE_TEN_RULE                  = "PRC_EPIC_TAKE_TEN_RULE";

/**
 * Use caster's primary ability (divine casters Wis, arcane Int/Cha as appropriate)
 * Defaults to: FALSE
 */
const string PRC_EPIC_PRIMARY_ABILITY_MODIFIER_RULE  = "PRC_EPIC_PRIMARY_ABILITY_MODIFIER_RULE";

/**
 * Do epic spells do backlash damage if specified in the spell?
 * Defaults to: TRUE
 */
const string PRC_EPIC_BACKLASH_DAMAGE                = "PRC_EPIC_BACKLASH_DAMAGE";

/**
 * Do school foci change the research and casting DC?
 * Defaults to: TRUE
 */
const string PRC_EPIC_FOCI_ADJUST_DC                 = "PRC_EPIC_FOCI_ADJUST_DC";

/**
 * DC multiplier for gold to research.
 * Defaults to: 9000 as per PnP
 */
const string PRC_EPIC_GOLD_MULTIPLIER                = "PRC_EPIC_GOLD_MULTIPLIER";

/**
 * Amount the researched spell's gold cost is divided by to get it's XP cost.
 * Defaults to: 25
 */
const string PRC_EPIC_XP_FRACTION                    = "PRC_EPIC_XP_FRACTION";

/**
 * Proportion of research gold is lost in a failed attempt. The full cost is
 * divided by this value to get the amount lost.
 * Defaults to: 2 (i.e half)
 */
const string PRC_EPIC_FAILURE_FRACTION_GOLD          = "PRC_EPIC_FAILURE_FRACTION_GOLD";

/**
 * Probablity out of 100 of seeds being destroyed when learnt.
 * Defaults to: 50
 */
const string PRC_EPIC_BOOK_DESTRUCTION               = "PRC_EPIC_BOOK_DESTRUCTION";

/** 100% immunity and 20h duration instead of 50% and casterlevel+10 rounds. */
const string PRC_PNP_UNIMPINGED                      = "PRC_PNP_UNIMPINGED";

/** 100% immunity and 20h duration instead of 50% and casterlevel+10 rounds. */
const string PRC_PNP_IMPENETRABILITY                 = "PRC_PNP_IMPENETRABILITY";

/** 100% immunity and 20h duration instead of 50% and casterlevel+10 rounds. */
const string PRC_PNP_DULLBLADES                      = "PRC_PNP_DULLBLADES";

/** 20h instead of rounds per level */
const string PRC_PNP_CHAMPIONS_VALOR                  = "PRC_PNP_CHAMPIONS_VALOR";

/*
 * Disable learning epic spells via the PRC OPtions Convo
 * Does not need PRC_EPIC_INGORE_DEFAULTS to be set
 */
const string PRC_EPIC_CONVO_LEARNING_DISABLE         = "PRC_EPIC_CONVO_LEARNING_DISABLE";




/******************************************************************************\
*                                General switches                              *
\******************************************************************************/


/** DO NOT SET THIS SWITCH
 * If the PRC  is in use, this will be set automatically
 * It is only here to be used by other scripts
 * Bit surplus to requirements, since this very script is part of the PRC,
 * but fo completeness sake
 */
const string MARKER_PRC                              = "Marker_PRC";

/** DO NOT SET THIS SWITCH
 * The companion sets it automatically.
 * It is only here to be used by other scripts.
 */
const string MARKER_PRC_COMPANION                    = "Marker_PRCCompanion";

/** DO NOT SET THIS SWITCH
 * If CEP 1.68 and the PRC companion/merge is in use, this will be set automatically
 * It is only here to be used by other scripts
 */
const string MARKER_CEP1                             = "Marker_CEP1";

/** DO NOT SET THIS SWITCH
 * If CEP 2 and the PRC companion/merge is in use, this will be set automatically
 * It is only here to be used by other scripts
 */
const string MARKER_CEP2                             = "Marker_CEP2";

/** DO NOT SET THIS SWITCH
 * If Project Q and the PRC companion/merge is in use, this will be set automatically
 * It is only here to be used by other scripts
 */
const string MARKER_Q                                = "Marker_Q";

/**
 * Spells cast from magic staffs use the wielder's casterlevel rather than the
 * item's if the wielder's casterlevel is higher.
 * This makes magic staffs more valuable to mages, especially at high levels.
 */
const string PRC_STAFF_CASTER_LEVEL                  = "PRC_STAFF_CASTER_LEVEL";

/**
 * A wand must be equipped before it can cast a spell
 * 
 * Any value above 0 turns off the requirement to have a wand equipped to use it
 */
const string PRC_EQUIP_WAND                          = "PRC_EQUIP_WAND";

/**
 * NPCs go through spellhooking as if they are PCs.
 */
const string PRC_NPC_HAS_PC_SPELLCASTING             = "PRC_NPC_HAS_PC_SPELLCASTING";

/**
 * Stops players banking loads of XP without leveling by using the level they
 * would have with their current XP instead of whatever their level is.
 */
const string PRC_ECL_USES_XP_NOT_HD                  = "PRC_ECL_USES_XP_NOT_HD";

/**
 * Stops demilich, i.e. Lich class has only 4 levels
 */
const string PRC_DISABLE_DEMILICH                    = "PRC_DISABLE_DEMILICH";

/**
 * Defines the possible uses of the Epic Spell Laboratory. Values as follows:
 *
 * 0 = (default) Can teleport to the Epic Spell Laboratory, merchant sells all
 *     epic spells and new wizard scrolls.
 * 1 = Can teleport to the Epic Spell Laboratory, merchant sells only the epic
 *     spells available in HotU and new wizard scrolls.
 * 2 = Can teleport to the Epic Spell Laboratory, but the merchant is unavailable.
 * 3 = Cannot teleport to the Epic Spell Laboratory.
 */
const string PRC_SPELLSLAB                           = "PRC_SPELLSLAB";

/**
 * Disables the sale of scrolls from the epic spell laboratory.
 */
const string PRC_SPELLSLAB_NOSCROLLS                 = "PRC_SPELLSLAB_NOSCROLLS";

/**
 * Makes reaching 0 in an ability score have the special effects it should have
 * according to PnP.
 *
 * @see inc_abil_damage.nss
 */
const string PRC_PNP_ABILITY_DAMAGE_EFFECTS          = "PRC_PNP_ABILITY_DAMAGE_EFFECTS";

/**
 * Turns on the included version of supply based rest by demitious
 * See inc_sbr_readme.nss for details
 */
const string PRC_SUPPLY_BASED_REST                   = "PRC_SUPPLY_BASED_REST";

/**
 * Charaters only gain a number of hitpoints equal to their level from resting.
 */
const string PRC_PNP_REST_HEALING                    = "PRC_PNP_REST_HEALING";

/**
 * Resting causes game time to advance.
 * See inc_time.nss for details
 */
const string PRC_PNP_REST_TIME                       = "PRC_PNP_REST_TIME";

/**
 * Limits the amount of times that a player can rest
 * If this is set to -1, it's one rest per 24 hours
 * If this is set to -2, it's one rest per 16 hours (24 hours minus the 8 hours spent sleeping/learning spells in PnP that is resting)
 * If this is set to 1+, it's 1 (or 2, or 3) hours per level between rests
 * If this is set to 0, it's off
 */
const string PRC_PNP_REST_LIMIT                      = "PRC_PNP_REST_LIMIT";

/**
 * Wizards use PnP spellschools instead of Bioware's
 * They must be generalists, but there is no way to enforce that
 * If letoscript is enabled, then all wizards will be set to PnP Spellschool as their school
 * plus the ConvoCC will set it if this switch is on
 */
const string PRC_PNP_SPELL_SCHOOLS                   = "PRC_PNP_SPELL_SCHOOLS";

/**
 * Players have a variable tracking how far ahead of the module clock they are
 * and when all players are ahead, the module clock advances to catch up.
 * This includes 8 hours when resting and time spent crafting
 *
 * See inc_time for implementation
 *
 */
const string PRC_PLAYER_TIME                         = "PRC_PLAYER_TIME";

/**
 * You must have at least 1 hand free to cast spells with somatic components.
 * This means at most a small shield in the off hand and
 * no dual wielded weapons, though ranged and doublehanded are OK.
 */
const string PRC_PNP_SOMATIC_COMPOMENTS              = "PRC_PNP_SOMATIC_COMPOMENTS";

/**
 * You must have at least 1 hand free to use items that you do not have equipped.
 * This means at most a small shield in the off hand and
 * no dual weilded weapons, though ranged and doublehanded are OK.
 */
const string PRC_PNP_SOMATIC_ITEMS                   = "PRC_PNP_SOMATIC_ITEMS";

/**
 * Second or subsequent summons dont destroy the first.
 * Can cause lag with high numbers of summons and/or tight spaces
 */
const string PRC_MULTISUMMON                         = "PRC_MULTISUMMON";

/**
 * Summons last for a number of rounds equal to caster level, rather than 24h or other timings
 */
const string PRC_SUMMON_ROUND_PER_LEVEL              = "PRC_SUMMON_ROUND_PER_LEVEL";

/**
 * Enable Bioware version of Plant Domain Power (turn vermin) - makes this
 * domain power a little less useless in the OC.
 */
const string PRC_BIOWARE_PLANT_DOMAIN_POWER          = "PRC_BIOWARE_PLANT_DOMAIN_POWER";

/**
 * Enable Bioware version of Animal Domain Power (better summons)
 */
const string PRC_BIOWARE_ANIMAL_DOMAIN_POWER          = "PRC_BIOWARE_ANIMAL_DOMAIN_POWER";

/**
 * Animal companions follow PnP rules rather than Bioware's.
 */
const string PRC_PNP_ANIMAL_COMPANIONS               = "PRC_PNP_ANIMAL_COMPANIONS";

/**
 * Familiars follow PnP rules rather than Bioware's.
 * This makes them a lot weaker and less suited for combat.
 * Includes bonded summoner familiars.
 */
const string PRC_PNP_FAMILIARS                       = "PRC_PNP_FAMILIARS";

/**
 * This disables the ability to heal Bioware familiars by feading them
 * through the conversation
 */
const string PRC_PNP_FAMILIAR_FEEDING                = "PRC_PNP_FAMILIAR_FEEDING";

/**
 * Use PRC henchmen-familiars instead of BioWare's - this will allow
 * new classes to have familiars, but summoned creatures will no longer 
 * be 'true' familiars (ie. can't possess PRC familiar)
 */
const string PRC_FAMILIARS                           = "PRC_FAMILIARS";

/**
 * Enable spell sharing for all familiars and animal companions
 * By default it's only enabled for pnp and bonded familiars, paladin
 * mounts and healer celestial companions.
 */
const string PRC_ENABLE_SPELL_SHARING                 = "PRC_ENABLE_SPELL_SHARING";

/**
 * This disables the 2 free spells wizards get at levelup
 * The GUI still shows, but it does nothing or rather its effects are undone afterwards
 * It requires letoscript to work.
 * not implemented yet
 */
const string PRC_NO_FREE_WIZ_SPELLS                        = "PRC_NO_FREE_WIZ_SPELLS";


const string PRC_WITCH_DISABLE_SPELL_LEARN                 = "PRC_WITCH_DISABLE_SPELL_LEARN";

/**
 * Set to 1, it automatically applies Ambidexterity as a bonus feat
 * if you have Two Weapon Fighting
 *
 * Default: NWN standard
 */
const string PRC_35_TWO_WEAPON_FIGHTING                     = "PRC_35_TWO_WEAPON_FIGHTING";

/**
 * Set to 1, it ignores the Disarmable flag on NPCs
 *
 * Default: NWN standard
 */
const string PRC_PNP_DISARM                                 = "PRC_PNP_DISARM";

/**
 * Sets the behaviour of the PRC Power Attack. Set this to either
 * PRC_POWER_ATTACK_DISABLED or PRC_POWER_ATTACK_FULL_PNP if you give
 * it a value.
 *
 * Default: One cannot use a higher power attack setting than one could using
 *          Bioware Power Attack. ie, if one possessed PA, but not IPA, one
 *          can only use PA up to 5. And up to 10 with IPA.
 *
 * @see PRC_POWER_ATTACK_DISABLED
 * @see PRC_POWER_ATTACK_FULL_PNP
 */
const string PRC_POWER_ATTACK                        = "PRC_POWER_ATTACK";

/**
 * A possible value of PRC_POWER_ATTACK.
 * If this is used, PRC Power Attack is completely disabled. The feats will
 * not be granted to players and even if they somehow gain access to the feats,
 * they will have no effect.
 *
 * @see PRC_POWER_ATTACK
 */
const int PRC_POWER_ATTACK_DISABLED = -1;

/**
 * A possible value of PRC_POWER_ATTACK.
 * If this is used, PRC Power Attack behaves as the Pen and Paper version.
 * This means ability to sacrifice any amount of attack bonus, up to one's
 * BAB. The existence of Bioware IPA is ignored as a limiting factor, only
 * normal Power Attack is required.
 *
 * @see PRC_POWER_ATTACK
 */
const int PRC_POWER_ATTACK_FULL_PNP = 1;

/**
 * Sets the behaviour of the PRC Power Attack.
 * If this is set, the Bioware Power Attack modes are included in the
 * calculation against the characters BAB limit.
 * Default: PRC Power Attack ignores whether BW Power Attack is active or not,
 *          which may result in the character paying a total amount of AB
 *          greater than their BAB.
 */
const string PRC_POWER_ATTACK_STACK_WITH_BW          = "PRC_POWER_ATTACK_STACK_WITH_BW";


/*
 * Disabling specific feat and/or skills
 * Each of these has 2 parts. One part is a variable defining the size of the list
 * The other part is the list itself. The numbers are the row numbers in feat.2da or skills.2da
 * or spells.2da.
 * For example, if you want to disable Knockdown and Improved Knockdown you would set
 * the variables as follows:
 * PRC_DISABLE_FEAT_COUNT = 2
 * PRC_DISABLE_FEAT_1     = 23
 * PRC_DISABLE_FEAT_2     = 17
 */
const string PRC_DISABLE_FEAT_COUNT                  = "PRC_DISABLE_FEAT_COUNT";
const string PRC_DISABLE_FEAT_                       = "PRC_DISABLE_FEAT_";
const string PRC_DISABLE_SKILL_COUNT                 = "PRC_DISABLE_SKILL_COUNT";
const string PRC_DISABLE_SKILL_                      = "PRC_DISABLE_SKILL_";

//WARNING! WILL DO BAD THINGS TO SPONTANEOUS CASTERS AFFECTED
const string PRC_DISABLE_SPELL_COUNT                 = "PRC_DISABLE_SPELL_COUNT";
const string PRC_DISABLE_SPELL_                      = "PRC_DISABLE_SPELL_";

/*
 * Setting this will stop the GUI automatically appearing when a player is petrified on
 * hardcore
 * You can use a script named "prc_pw_petrific" which will always be run at petrification
 * (regardless of this switch) on hardcore to pop up the GUI as you want it, rather than
 * being forced to use biowares
*/
const string PRC_NO_PETRIFY_GUI                      = "PRC_NO_PETRIFY_GUI";


/*
 * Set this to remove the switch changing convo feat.
 * This should be set for PWs to avoid players screwing around with switches
 * A value of zero allows anyone to change switches
 * A value of 1 allows only DMs to change switches
 * Any other value prohibits everyone from changing switches
 */

const string PRC_DISABLE_SWITCH_CHANGING_CONVO       = "PRC_DISABLE_SWITCH_CHANGING_CONVO";

/*
 * Set this to remove checks to enforce domains
 * e.g. Fire Gensai dont have to take the Fire domain, etc
 */

const string PRC_DISABLE_DOMAIN_ENFORCEMENT          = "PRC_DISABLE_DOMAIN_ENFORCEMENT";

/*
 * Set this to remove replace bioware HolyAvenger itemproperties
 * with PnP HolyAvenger itemprperties instead
 * (for paladins, +5 +2d6 divine vs evil, castspel:dispel magic @ casterlevel = paladinlevels)
 * (for non paladins, +2)
 */

const string PRC_PNP_HOLY_AVENGER_IPROP              = "PRC_PNP_HOLY_AVENGER_IPROP";

/* Set this to enable the permanent death and XP cost functionality
 * of Necrotic Termination spell.
 */

 const string PRC_NEC_TERM_PERMADEATH                = "PRC_NEC_TERM_PERMADEATH" ;

 /*
  * Set this to enable alignment changes for the casting of spells with an alignment descriptor
  */
const string PRC_SPELL_ALIGNMENT_SHIFT              = "PRC_SPELL_ALIGNMENT_SHIFT";

 /*
  * Enforces restrictions for casting spells with descriptors of opposed alignments
  * Possible values:
  * 0 - off
  * 1 - all classes can cast, but casting causes alignment shift
  * 2 - casting causes alingment shift, some classes can't cast (cleric, favoured soul, etc)
  * 3 - casting is not allowed
  */
const string PRC_SPELL_ALIGNMENT_RESTRICT            = "PRC_SPELL_ALIGNMENT_RESTRICT";

 /*
  * Set this to give a number of Free cohorts as with leadership
  * This can be used to simulate a party of players
  * Unlike normal cohorts, those granted through this switch
  * do not have the -2 level lag.
  */
 const string PRC_BONUS_COHORTS                      = "PRC_BONUS_COHORTS";

 /*
  * Disable the use of custom cohorts
  */
 const string PRC_DISABLE_CUSTOM_COHORTS                      = "PRC_DISABLE_CUSTOM_COHORTS";

 /*
  * Disable the use of standard cohorts
  */
 const string PRC_DISABLE_STANDARD_COHORTS                      = "PRC_DISABLE_STANDARD_COHORTS";

 /*
  * Disable registration of custom cohorts
  */
 const string PRC_DISABLE_REGISTER_COHORTS                      = "PRC_DISABLE_REGISTER_COHORTS";
 
  /*
   * Disable cohorts starting with gear
   */
 const string PRC_DISABLE_COHORT_STARTING_GEAR                  = "PRC_DISABLE_COHORT_STARTING_GEAR";

 /*
  * Gives all slings equiped Mighty +20 for free
  * Simulates PnP rules where you can add strength to damage
  */
 const string PRC_PNP_SLINGS                      = "PRC_PNP_SLINGS";

 /*
  * This is a local variable set on NPCs that is converted to real XP
  * in the OnSpawn event. Used for epic spells and other XP-burning stuff
  */
 const string PRC_NPC_XP                             = "PRC_NPC_XP";

 /*
  * Applys speed increase/decrease effects
  * Simulates PnP rules where different races have different speeds
  */
 const string PRC_PNP_RACIAL_SPEED                      = "PRC_PNP_RACIAL_SPEED";

 /*
  * Applys speed increase/decrease effects
  * Simulates PnP rules where different armors have different speeds
  * Medium armor is a 25% speed reduction, Heavy is a 33% reduction
  */
 const string PRC_PNP_ARMOR_SPEED                      = "PRC_PNP_ARMOR_SPEED";
 
  /*
   * Applys a Discipline bonus equal to BAB to all characters if turned on
   * Bonus only applies to characters with 0 ranks in Discipline
   */
 const string PRC_PNP_KNOCKDOWN                      = "PRC_PNP_KNOCKDOWN"; 

 /*
  * by Bioware rules, PCs have approximatly a 7th faster movement than NPCs
  * so they can outrun them quite easily.
  * This switch removes that so they are on even footings.
  */
 const string PRC_REMOVE_PLAYER_SPEED                      = "PRC_REMOVE_PLAYER_SPEED";

 /*
  * Enforces racial appearance as defined in racialtypes.2da
  */
 const string PRC_ENFORCE_RACIAL_APPEARANCE                = "PRC_ENFORCE_RACIAL_APPEARANCE";

 /*
  * When set it will restore characters true appearance on module enter.
  * Created to counter BioWare 'horse script' appearance change. Might cause bugs with some
  * custom clothing haks.
  * If not enabled - players can restore appearance by using 'End PnP Polymorph' feat
  */
 const string PRC_ON_ENTER_RESTORE_APPEARANCE              = "PRC_ON_ENTER_RESTORE_APPEARANCE";

 /*
  * by default, on aquire script for races only runs for NPCs if they have a PC as a master
  * This runs it for all NPCs, note this will take significantly more CPU time.
  */
 const string PRC_NPC_FORCE_RACE_ACQUIRE                      = "PRC_NPC_FORCE_RACE_ACQUIRE";

 /*
  * by default, if you acquire a pre-1.68 cloak it will be randomly recolored so that it
  * doenst look beiger than beige. This disables that if you realy want beige cloaks for some reason.
  */
 const string PRC_DYNAMIC_CLOAK_AUTOCOLOUR_DISABLE                      = "PRC_DYNAMIC_CLOAK_AUTOCOLOUR_DISABLE";

 /*
  * this switch will disable automatic update of 'use limitation by class' properties for magic scrolls and wands.
  * By default a character of given class can use all wands/scrolls with the spells that are on her class spell-list.
  * NOTES:
  * - scrolls/wands with no limitations are never updated
  * - can be disabled by setting "ip_lock" local int to 1 on the scroll/wand
  */
 const string PRC_SCROLL_AUTOUPDATE_RESTR_DISABLE                      = "PRC_SCROLL_AUTOUPDATE_RESTR_DISABLE";

 /*
  * disable all the appearance-changing options on the PRC OPtions convo
  */
 const string PRC_APPEARNCE_CHANGE_DISABLE                      = "PRC_APPEARNCE_CHANGE_DISABLE";




/******************************************************************************\
*                      Death/Bleeding system                                   *
\******************************************************************************/
 /*
  * Turns on the PRC PnP Bleeding & Death system
  * see prc_inc_death for details
  * NOTE: This will only work if the module has no other scripts for
  * OnPlayerDying and OnPlayerDeath events. Otherwise those will interfere with
  * this system
  */
const string PRC_PNP_DEATH_ENABLE                           = "PRC_PNP_DEATH_ENABLE";

 /*
  *  if FALSE, dont bleed just die
  *  By PnP this would be 1 round, or 6 seconds
  */
const string PRC_DEATH_OR_BLEED     						= "PRC_DEATH_OR_BLEED";

/*
 * Damage when bleeding
 * By PnP, this would be 1
 */
const string PRC_DEATH_DAMAGE_FROM_BLEEDING        = "PRC_DEATH_DAMAGE_FROM_BLEEDING";

/*
 * Damage when stable
 * By PnP, this would be 0
 */
const string PRC_DEATH_DAMAGE_FROM_STABLE          = "PRC_DEATH_DAMAGE_FROM_STABLE";

/*
 * Healing when Stable
 * By PnP, this would be 0
 */
const string PRC_DEATH_HEAL_FROM_STABLE            = "PRC_DEATH_HEAL_FROM_STABLE";

/*
 * % chance to improve when bleeding
 * By PnP, this would be 10
 */
const string PRC_DEATH_BLEED_TO_STABLE_CHANCE      = "PRC_DEATH_BLEED_TO_STABLE_CHANCE";

/*
 * % chance to resume bleeding when stable
 * By PnP, this would be 0
 */
const string PRC_DEATH_STABLE_TO_BLEED_CHANCE      = "PRC_DEATH_STABLE_TO_BLEED_CHANCE";

/*
 * % chance to improve when stable
 * By PnP, this would be 10
 */
const string PRC_DEATH_STABLE_TO_DISABLED_CHANCE   = "PRC_DEATH_STABLE_TO_DISABLED_CHANCE";


/******************************************************************************\
*                               ACP switches                              *
\******************************************************************************/
/*
 * This is a set of settings for Ragnaroks Alternate Combat animations Pack (ACP)
 * Main hak:
 * http://nwvault.ign.com/View.php?view=hakpaks.Detail&id=5895
 * CEP heads:
 * http://nwvault.ign.com/View.php?view=hakpaks.Detail&id=5934
 * CEP robes:
 * http://nwvault.ign.com/View.php?view=hakpaks.Detail&id=5950
 * (credit to USAgreco66kg for those CEP files)
 *
 * Note on haks: You should NOT add the acp_2da hak if you have the PRC installed
 * Plus, once you press the OK button to add the ACP haks, make sure
 * you press cancel as soon as it appears. Otherwise, the toolset will crash
 * as it tries to compile the PRC scripts.
 *
 * If you are using CEP2, then you only need ragnaroks main package. Compatible robes
 * and heads are included within CEP2.
 *
 * As of NWN v1.67 there is no need to press the cancel button as the toolset no longer
 * attempts to compile scripts in haks.
 *
 */

/*
 * Set this to give players radial feats to change combat animations
 */
const string PRC_ACP_MANUAL                          = "PRC_ACP_MANUAL";

/*
 * Set this so that players will change combat animations automatically
 * based on weapons equiped and class
 */
const string PRC_ACP_AUTOMATIC                       = "PRC_ACP_AUTOMATIC";

/*
 * Set this so that NPCs will change combat animations automatically
 * based on weapons equiped and class
 * This can either be set on the module for a global setting
 * or set on individual NPCs for specific individuals
 */
const string PRC_ACP_NPC_AUTOMATIC                   = "PRC_ACP_NPC_AUTOMATIC";

/*
 * Set this for a number of minutes delay betwen changing animations
 * This is useful to stop people spamming the server with changes
 * If not set, it defaults to 90 seconds. To set to zero, set var to -1
 */
const string PRC_ACP_DELAY                           = "PRC_ACP_DELAY";


/******************************************************************************\
*                               File End switches                              *
\******************************************************************************/

/**
 * If this is set it will disable the defaults and the module builder must set
 * the values manually.
 * Otherwise it will set the automatically, and will take the PRC companion
 * into account, including CEP if its the CEP/PRC companion.
 */
const string FILE_END_MANUAL                         = "FILE_END_MANUAL";

/** Last line of classes.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_CLASSES                        = "FILE_END_CLASSES";

/** Last line of racialtypes.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_RACIALTYPES                    = "FILE_END_RACIALTYPES";

/** Last line of gender.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_GENDER                         = "FILE_END_GENDER";

/** Last line of portraits.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_PORTRAITS                      = "FILE_END_PORTRAITS";

/** Last line of skills.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_SKILLS                         = "FILE_END_SKILLS";

/** Defines the line after which none of the cls_feat_*.2da have entries.
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_CLASS_FEAT                     = "FILE_END_CLASS_FEAT";

/** Defines the line after which none of the cls_psipw_*.2da have entries.
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_CLASS_POWER                    = "FILE_END_CLASS_POWER";

/** Defines the line after which none of the cls_spgn_*.2da have entries.
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
 const string FILE_END_CLASS_SPELLBOOK               = "FILE_END_CLASS_SPELLBOOK";

/** Last line of feat.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_FEAT                           = "FILE_END_FEAT";

/** Last line of hen_familiar.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_FAMILIAR                       = "FILE_END_FAMILIAR";

/** Last line of hen_companion.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_ANIMALCOMP                     = "FILE_END_ANIMALCOMP";

/** Last line of domains.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_DOMAINS                        = "FILE_END_DOMAINS";

/** Last line of soundset.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_SOUNDSET                       = "FILE_END_SOUNDSET";

/** Last line of spells.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_SPELLS                         = "FILE_END_SPELLS";

/** Last line of appearance.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_APPEARANCE                     = "FILE_END_APPEARANCE";

/** Last line of wingmodel.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_WINGS                          = "FILE_END_WINGS";

/** Last line of tailmodel.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_TAILS                          = "FILE_END_TAILS";

/** Last line of baseitems.2da
 * This will be set automatically to a default unless FILE_END_MANUAL is turned on */
const string FILE_END_BASEITEMS                          = "FILE_END_BASEITEMS";



/******************************************************************************\
*                            Poison system switches                            *
\******************************************************************************/

/**
 * If this is set, uses the last three characters from the item's tag
 * instead of the local variable 'pois_idx' to define the poison the item
 * represents. The value is used as an index to poison.2da.
 */
const string PRC_USE_TAGBASED_INDEX_FOR_POISON       = "USE_TAGBASED_INDEX_FOR_POISON";

/**
 * Number of times the poisoned item works. Or if PRC_USES_PER_ITEM_POISON_DIE
 * is set, the number of dice rolled to determine it. Should be at least 1 if
 * set.
 * Default: 1
 */
const string PRC_USES_PER_ITEM_POISON_COUNT          = "PRC_USES_PER_ITEM_POISON_COUNT";

/**
 * Size of dice used to determine number of times the poisoned item works. Value
 * should be at least 2.
 * If value is less than 2, the die roll is skipped.
 * Default: No dice are rolled.
 */
const string PRC_USES_PER_ITEM_POISON_DIE            = "USES_PER_ITEM_POISON_DIE";

/**
 * If this is nonzero, only weapons that do slashing or piercing damage are allowed
 * to be poisoned.
 * Default: All weapons can be poisoned.
 */
const string PRC_ALLOW_ONLY_SHARP_WEAPONS            = "PRC_ALLOW_ONLY_SHARP_WEAPONS";

/**
 * If this is nonzero, inhaled and ingest poisons may be placed on weapons in
 * addition to contact and injury poisons.
 * Default: Only contact and injury poisons are allowed on weapons.
 */
const string PRC_ALLOW_ALL_POISONS_ON_WEAPONS        = "PRC_ALLOW_ALL_POISONS_ON_WEAPONS";

/**
 * If this is nonzero, a DEX check is rolled against Handle_DC in the poison's
 * column in poison.2da.
 * Possessing the Use Poison feat will always pass this check.
 * Default: A static 5% failure chance is used, as per the DMG.
 */
const string PRC_DEXBASED_WEAPON_POISONING_FAILURE_CHANCE = "PRC_DEXBASED_WEAPON_POISONING_FAILURE_CHANCE";

/**
 * Number of hits the poison will function on the weapon. Or if
 * PRC_USES_PER_WEAPON_POISON_DIE is set, the number of dice rolled.
 * If this is set, the value should be >= 1.
 * Default: 1
 */
const string PRC_USES_PER_WEAPON_POISON_COUNT        = "PRC_USES_PER_WEAPON_POISON_COUNT";

/**
 * Size of the die rolled when determining the amount of hits the poison will
 * work on. If this is set, the value should be at least 2.
 * Default: Dice aren't rolled.
 */
const string PRC_USES_PER_WEAPON_POISON_DIE          = "PRC_USES_PER_WEAPON_POISON_DIE";

/**
 * This is the name of the script to be run when someone attempts to poison food to
 * check if the targeted item is food. The default script returns FALSE for everything,
 * so you must define your own to have this functionality.
 *
 * This switch has string values instead of integers.
 *
 * Default: poison_is_food <- an example script, just returns false
 *
 * @see poison_is_food
 */
const string PRC_POISON_IS_FOOD_SCRIPT_NAME          = "PRC_POISON_IS_FOOD_SCRIPT_NAME";

/**
 * This switch determines whether a creature equipping a poisoned item is assumed to be
 * acting smartly in that it attempts to clean the item first. If it's not set, the
 * creature just directly equips the item and gets poisoned.
 *
 * Default: Off, the creature gets poisoned without any checks
 *
 * @see poison_onequip
 */
const string PRC_POISON_ALLOW_CLEAN_IN_EQUIP         = "PRC_POISON_ALLOW_CLEAN_IN_EQUIP";

/**
 * 
 * Default: crafting requires only gold and xp
 */
const string PRC_CRAFT_POISON_USE_INGREDIENST        = "PRC_CRAFT_POISON_USE_INGREDIENST";

/******************************************************************************\
*                             PRGT system switches                             *
\******************************************************************************/

//these three are strings not switches
const string PRC_PRGT_XP_SCRIPT_TRIGGERED            = "PRC_PRGT_XP_SCRIPT_TRIGGERED";
const string PRC_PRGT_XP_SCRIPT_DISARMED             = "PRC_PRGT_XP_SCRIPT_DISARMED";
const string PRC_PRGT_XP_SCRIPT_RECOVERED            = "PRC_PRGT_XP_SCRIPT_RECOVERED";

/**
 * @TODO: Write description.
 */
const string PRC_PRGT_XP_AWARD_FOR_TRIGGERED         = "PRC_PRGT_XP_AWARD_FOR_TRIGGERED";

/**
 * @TODO: Write description.
 */
const string PRC_PRGT_XP_AWARD_FOR_RECOVERED         = "PRC_PRGT_XP_AWARD_FOR_RECOVERED";

/**
 * @TODO: Write description.
 */
const string PRC_PRGT_XP_AWARD_FOR_DISARMED          = "PRC_PRGT_XP_AWARD_FOR_DISARMED";



/******************************************************************************\
*                               Psionics switches                              *
\******************************************************************************/

/**
 * If this is set, use ac_appearances.2da to determine an Astral Construct's
 * appearance instead of the values hardcoded into the script.
 */
const string PRC_PSI_ASTRAL_CONSTRUCT_USE_2DA        = "ASTRAL_CONSTRUCT_USE_2DA";

/**
 * If this is set, Astral Construct's duration will be multiplied by given
 * number. Examples:
 * 10  - duration is equal to 1 minute per manifester level
 * 600 - duration is equal to 1 hour per manifester level
 */
const string PRC_PSI_ASTRAL_CONSTRUCT_DUR_MOD        = "PRC_PSI_ASTRAL_CONSTRUCT_DUR_MOD";


/**
 * If this is set, The Astral Seed power will attempt to use the provided string as
 * the ResRef to create the Astral Seed object instead of the of the phylactery 
 * ResRef("x2_plc_phylact").
 * May be used by builders to create an object that CAN be destroyed, or has other traits,
 * as desired. 
 * Type: String
 * Values: "" [Default] (Blank, or not set: Use default phylactery ResRef for Astral Seed)
 *         STRING (Entered String will be used as the ResRef of created Astral Seed object)
 */
const string PRC_PSI_ASTRAL_SEED_RESREF        = "PRC_PSI_ASTRAL_SEED_RESREF";

/**
 * By default the Astral Seed power respawns the player, and then makes them immobile for 
 * 24-game-hours.
 * If this switch is set, it will adjust the imobility time period; shortening it, lengthing it, or 
 * effectively eliminating it.
 * Type: Int
 * Values: 0 [Default] (Not set: Use default 24 hour duration)
 *         -1          (Any negative value will result in a fixed duratoion of 2 seconds, which effectively eliminates the wait period)
 *         1           (Any potitive value: multiply duration by the value provided and then divide result by 1000. 
 *                      Values less than 1000 will shorten the duration, values higher than 1000 will lengthen it.)
 */
const string PRC_PSI_ASTRAL_SEED_RESPAWN_DELAY_X1000        = "PRC_PSI_ASTRAL_SEED_RESPAWN_DELAY_X1000";

/**
 * By default, when the Astral Seed power is activated upon death, the user loses one level's
 * worth of XP. This may not be compatabile with all death and respawn systems.
 * If this flag is set, the XP loss is completely eliminated. The standard PRC event hook script
 * of "prc_pw_astralseed" may be used to script any additional effects to occure upon Astral Seed
 * respawning, including scripting specific XP loss amount.
 * Type: Int 
 * Values: 0 [Default] (Not set: lose 1 level worth of XP upon Astral Seed respawn)
 *         1           (Any potitive value: Remove all XP loss from Astral Seed respawn)
 */
const string PRC_PSI_ASTRAL_SEED_RESPAWN_NO_LEVEL_LOSS        = "PRC_PSI_ASTRAL_SEED_RESPAWN_NO_LEVEL_LOSS";


/**
 * Setting this switch active makes Psychic Reformation only allow one to
 * reselect psionic powers instead of fully rebuilding their character.
 *
 * Possible values:
 * 0              = Off, Psychic Reformation behaves as specified in the power
 *                  description. That is, the target is deleveled by a certain
 *                  amount and then releveled back to where they were.
 * Nonzero, not 2 = On, Psychic Reformation only nulls a selected number of
 *                  the target's selected powers and allows reselection.
 * 2              = On, and the XP cost is reduced to 25 per level reformed.
 */
const string PRC_PSI_PSYCHIC_REFORMATION_NERF        = "PRC_PSI_PSYCHIC_REFORMATION_NERF";

/**
 * Determines how Rapid Metabolism works.
 * When set, heals the feat possessor by their Hit Dice + Constitution modifier
 * every 24h.
 * Default: Heals the feat possessor by 1 + their Constitution modifier every
 *          turn (60s).
 */
const string PRC_PNP_RAPID_METABOLISM                = "PRC_PNP_RAPID_METABOLISM";

/**
 * Determines how the epic feat Improved Metapsionics works.
 * When set, the total cost of metapsionics applied to power being manifested is
 * summed and Improved Metapsionics cost reduction is applied to the sum.
 * Default: Improved Metapsionics cost reduction is applied separately to each
 *          metapsionic used with power being manifested.
 */
const string PRC_PSI_IMP_METAPSIONICS_USE_SUM        = "PRC_PSI_IMP_METAPSIONICS_USE_SUM";


/**
 * A switch a player can personally toggle. If this is set, their augmentation level
 * is considered to be the amount of PP they are willing to pay for augmentation.
 * Default: A player's augmentation level is the number of times to augment the power.
 */
const string PRC_PLAYER_SWITCH_AUGMENT_IS_PP         = "PRC_PLAYER_SWITCH_AUGMENT_IS_PP";

/**
 * A switch a player can personally toggle. If set, the metapsionics code attempts
 * to avoid exceeding the manifester level cap by skipping application of
 * such active metapsionic feats where the cost would cause manifester level cap to
 * be exceeded. Quicken Power is exempt from ever being skipped if it is active.
 */
const string PRC_PLAYER_SWITCH_AUTOMETAPSI           = "PRC_PLAYER_SWITCH_AUTOMETAPSI";

/******************************************************************************\
*                               PnP Polymorphing switches                      *
\******************************************************************************/

/**
 * These switches are used to limit the targets that can be used with the
 * PRC Polymorph / Shifting mechanics.
 *
 * Remember, mimicing uses the targetting instance, whereas
 * shifting into that form again later creats a new instance from
 * the resref. Thus if you modify creatures after they have been
 * placed from the palette, odd things may happen.
 *
 * Also if you give any monster the "Archetypal Form" feat, the players
 * will not be able to take that monsters shape.
 */

/**
 * If set, the system compares user HD to target CR.
 * Default: user HD is compared to target HD
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_USECR                     = "PNP_SHFT_USECR";

/**
 * If set, the system does not allow target creatures of size Huge or greater.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_S_HUGE                    = "PNP_SHFT_S_HUGE";

/**
 * If set, the system does not allow target creatures of size Large.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_S_LARGE                   = "PNP_SHFT_S_LARGE";

/**
 * If set, the system does not allow target creatures of size Medium.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_S_MEDIUM                  = "PNP_SHFT_S_MEDIUM";

/**
 * If set, the system does not allow target creatures of size Small.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_S_SMALL                   = "PNP_SHFT_S_SMALL";

/**
 * If set, the system does not allow target creatures of size Tiny or smaller.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_S_TINY                    = "PNP_SHFT_S_TINY";

/**
 * If set, the system does not allow target creatures of type Outsider.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_OUTSIDER                = "PNP_SHFT_F_OUTSIDER";

/**
 * If set, the system does not allow target creatures of type Elemental.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_ELEMENTAL               = "PNP_SHFT_F_ELEMENTAL";

/**
 * If set, the system does not allow target creatures of type Construct.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_CONSTRUCT               = "PNP_SHFT_F_CONSTRUCT";

/**
 * If set, the system does not allow target creatures of type Undead.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_UNDEAD                  = "PNP_SHFT_F_UNDEAD";

/**
 * If set, the system does not allow target creatures of type Dragon.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_DRAGON                  = "PNP_SHFT_F_DRAGON";

/**
 * If set, the system does not allow target creatures of type Aberration.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_ABERRATION              = "PNP_SHFT_F_ABERRATION";

/**
 * If set, the system does not allow target creatures of type Ooze.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_OOZE                    = "PNP_SHFT_F_OOZE";

/**
 * If set, the system does not allow target creatures of type Magical Beast.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_MAGICALBEAST            = "PNP_SHFT_F_MAGICALBEAST";

/**
 * If set, the system does not allow target creatures of type Giant.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_GIANT                   = "PNP_SHFT_F_GIANT";

/**
 * If set, the system does not allow target creatures of type Vermin.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_VERMIN                  = "PNP_SHFT_F_VERMIN";

/**
 * If set, the system does not allow target creatures of type Beast.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_BEAST                   = "PNP_SHFT_F_BEAST";

/**
 * If set, the system does not allow target creatures of type Animal.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_ANIMAL                  = "PNP_SHFT_F_ANIMAL";

/**
 * If set, the system does not allow target creatures of type Monstrous Humanoid.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_MONSTROUSHUMANOID       = "PNP_SHFT_F_MONSTROUSHUMANOID";

/**
 * If set, the system does not allow target creatures of type Humanoid.
 * Values: 0 is not set, anything else is set.
 */
const string PNP_SHFT_F_HUMANOID                = "PNP_SHFT_F_HUMANOID";

/******************************************************************************\
*                            Combat System Switches                            *
\******************************************************************************/

/**
 * TODO: Write description.
 */
const string PRC_PNP_ELEMENTAL_DAMAGE                = "PRC_PNP_ELEMENTAL_DAMAGE";

/**
 * TODO: Write description.
 */
const string PRC_SPELL_SNEAK_DISABLE                 = "PRC_SPELL_SNEAK_DISABLE";

/**
 * Use 3.5 edition unarmed damage progression instead of 3.0 edition.
 * Default: Use 3.0 unarmed damage progression.
 */
const string PRC_3_5e_FIST_DAMAGE                    = "PRC_3_5e_FIST_DAMAGE";

/**
 * Use a Brawler character's size as a part of determining their unarmed
 * damage.
 * Default: A Brawler's size is ignored.
 */
const string PRC_BRAWLER_SIZE                        = "PRC_BRAWLER_SIZE";

/**
 * Use appearance size rather than racial-determined size
 * This also means it includes bonuses from classes and spells
 */
const string PRC_APPEARANCE_SIZE                        = "PRC_APPEARANCE_SIZE";

/**
  * This reenables the Bioware Monk attack progression, with up to 6 monk attacks per round
*/
const string PRC_BIOWARE_MONK_ATTACKS                  ="PRC_BIOWARE_MONK_ATTACKS";

/**
 * This switch (if on) takes care that only light weapons (one size smaller than the creature size)
 * are finessable, meaning that small races can only finesse tiny weapons
 */
const string PRC_SMALL_CREATURE_FINESSE                  ="PRC_SMALL_CREATURE_FINESSE";

/**
 * turns on combat debugging for scripted combat,
 * similar to Bioware's dm_enablecombatdebugging 1
 * will show a lot of info about the attack and damage rolls
 */
const string PRC_COMBAT_DEBUG                        = "PRC_COMBAT_DEBUG";

/**
 * switches on Biowares Divine Power version (bonus atacks come at full AB)
 */
const string PRC_BIOWARE_DIVINE_POWER                = "PRC_BIOWARE_DIVINE_POWER";

/**
 * if True, allows us to select a better target in prc combat functions
 * by switching from one target to another (closer) target
 * only relevant for melee combat (we never switch targets on ranged combat)
 */
const string PRC_ALLOW_SWITCH_OF_TARGET                = "PRC_ALLOW_SWITCH_OF_TARGET";

/**
 * disable coup the grace on first attack in round
 */
const string PRC_DISABLE_COUP_DE_GRACE                = "PRC_DISABLE_COUP_DE_GRACE";

/**
 * limit to the (non-dice) damage of a flame weapon or darkfire spell
 * if the switch is not set or zero, non-dice damage of flame weapon or darkfire is limited to 10
 * it is recommended not to set these switches higher than 10
 */
const string PRC_FLAME_WEAPON_DAMAGE_MAX             = "PRC_FLAME_WEAPON_DAMAGE_MAX";
const string PRC_DARKFIRE_DAMAGE_MAX                 = "PRC_DARKFIRE_DAMAGE_MAX";


/******************************************************************************\
*                           Craft System Switches                           *
\******************************************************************************/

/*
 * Completely disable the PRC Crafting System
 */
const string PRC_DISABLE_CRAFT                       = "PRC_DISABLE_CRAFT";

/*
 * Disables epic crafting
 */
const string PRC_DISABLE_CRAFT_EPIC                  = "PRC_DISABLE_CRAFT_EPIC";

/*
 * Set this on an area to disable crafting within that area
 * Best used in conjunction with the time elapsing and no-rest
 * This applies to both PRC Crafting and biowares scroll/wand/potions
 */
const string PRC_AREA_DISABLE_CRAFTING               = "PRC_AREA_DISABLE_CRAFTING";

/*
 * Inverts the behavior of previous switch
 * Will disable crafting on all areas BUT ones with the
 * PRC_AREA_DISABLE_CRAFTING switch set
 * Only works for new crafting system
 */
const string PRC_AREA_DISABLE_CRAFTING_INVERT        = "PRC_AREA_DISABLE_CRAFTING_INVERT";

/*
 * Multiply the delay (in seconds) after the creation of an item in which a PC
 * can't craft anything. This is divided by 100 to get a float.
 * Normally, it's set to the market price of the item. Set
 * it to less than 100 to reduce it instead. (default: 0).
 *
 * This is independant of PRC_PLAYER_TIME
 *
 */
const string PRC_CRAFT_TIMER_MULTIPLIER              = "PRC_CRAFT_TIMER_MULTIPLIER";

/*
 * Absolute maximum delay (in seconds) where crafting is disabled for a PC,
 * regardless of the item's market price. By default it's 0 (meaning that there's
 * no delay at all).
 *
 * This is independant of PRC_PLAYER_TIME
 *
 */
const string PRC_CRAFT_TIMER_MAX                     = "PRC_CRAFT_TIMER_MAX";

/*
 * Absolute minimum delay (in seconds) where crafting is disabled for a PC,
 * regardless of the item's market price. By default it's 0 (meaning that there's
 * no delay at all).
 *
 * This is independant of PRC_PLAYER_TIME
 *
 */
const string PRC_CRAFT_TIMER_MIN                     = "PRC_CRAFT_TIMER_MIN";

/**
 * These three switches modify Bioware crafting so that the items produced have the
 * casterlevel of the spellcaster who created them. Normally under Bioware, it is possible
 * for a level 3 caster to produce level 9 items and for a level 40 caster to only produce
 * level 5 items.
 * This also allows metamagic to apply to crafting. i.e you produce a wand of maximized fireball
 *
 * @see PRC_SCRIBE_SCROLL_CASTER_LEVEL
 * @see PRC_CRAFT_WAND_CASTER_LEVEL
 */
const string PRC_BREW_POTION_CASTER_LEVEL            = "PRC_BREW_POTION_CASTER_LEVEL";

/**
 * These three switches modify Bioware crafting so that the items produced have the
 * casterlevel of the spellcaster who created them. Normally under Bioware, it is possible
 * for a level 3 caster to produce level 9 items and for a level 40 caster to only produce
 * level 5 items.
 * This also allows metamagic to apply to crafting. i.e you produce a wand of maximized fireball
 *
 * @see PRC_BREW_POTION_CASTER_LEVEL
 * @see PRC_CRAFT_WAND_CASTER_LEVEL
 */
const string PRC_SCRIBE_SCROLL_CASTER_LEVEL          = "PRC_SCRIBE_SCROLL_CASTER_LEVEL";

/**
 * These three switches modify Bioware crafting so that the items produced have the
 * casterlevel of the spellcaster who created them. Normally under Bioware, it is possible
 * for a level 3 caster to produce level 9 items and for a level 40 caster to only produce
 * level 5 items.
 * This also allows metamagic to apply to crafting. i.e you produce a wand of maximized fireball
 *
 * @see PRC_BREW_POTION_CASTER_LEVEL
 * @see PRC_SCRIBE_SCROLL_CASTER_LEVEL
 */
const string PRC_CRAFT_WAND_CASTER_LEVEL             = "PRC_CRAFT_WAND_CASTER_LEVEL";

/**
 * As above, except it applies to rods
 */
const string PRC_CRAFT_ROD_CASTER_LEVEL             = "PRC_CRAFT_ROD_CASTER_LEVEL";

/**
 * As above, except it applies to staffs
 */
const string PRC_CRAFT_STAFF_CASTER_LEVEL             = "PRC_CRAFT_STAFF_CASTER_LEVEL";

/*
 * Characters with a crafting feat always have the appropriate base item in their inventory
 */
const string PRC_CRAFTING_BASE_ITEMS               = "PRC_CRAFTING_BASE_ITEMS";

/*
 * Max level of spells brewed into potions
 * defaults to 3
 */
const string X2_CI_BREWPOTION_MAXLEVEL               = "X2_CI_BREWPOTION_MAXLEVEL";

/*
 * cost modifier of spells brewed into poitions
 * defaults to 50
 */
const string X2_CI_BREWPOTION_COSTMODIFIER           = "X2_CI_BREWPOTION_COSTMODIFIER";

/*
 * cost modifier of spells scribed into scrolls
 * defaults to 25
 */
const string X2_CI_SCRIBESCROLL_COSTMODIFIER         = "X2_CI_SCRIBESCROLL_COSTMODIFIER";

/*
 * Max level of spells crafted into wands
 * defaults to 4
 */
const string X2_CI_CRAFTWAND_MAXLEVEL                = "X2_CI_CRAFTWAND_MAXLEVEL";

/*
 * cost modifier of spells crafted into wands
 * defaults to 750
 */
const string X2_CI_CRAFTWAND_COSTMODIFIER            = "X2_CI_CRAFTWAND_COSTMODIFIER";

/*
 * cost modifier of spells crafted into rods
 * note that adding a second spell costs 75% and 3 or more costs 50%
 * defaults to 750
 */
const string X2_CI_CRAFTROD_COSTMODIFIER            = "X2_CI_CRAFTROD_COSTMODIFIER";

/*
 * cost modifier of spells crafted into staffs
 * note that adding a second spell costs 75% and 3 or more costs 50%
 * defaults to 750
 */
const string X2_CI_CRAFTSTAFF_COSTMODIFIER            = "X2_CI_CRAFTSTAFF_COSTMODIFIER";

/**
 * Allows the use of arbitrary itemproperties and uses NWN item costs
 *  ie. not PnP
 */
const string PRC_CRAFTING_ARBITRARY                 = "PRC_CRAFTING_ARBITRARY";

/**
 * Scales the item costs overall for the purposes of crafting
 * defaults to 100
 */
const string PRC_CRAFTING_COST_SCALE                 = "PRC_CRAFTING_COST_SCALE";

/**
 * Scales the item costs for mundane item crafting
 * defaults to 100
 */
const string PRC_CRAFTING_MUNDANE_COST_SCALE        = "PRC_CRAFTING_MUNDANE_COST_SCALE";

/**
 * Sets crafting time per 1000gp in market price:
 * 1 - off, no time required
 * 2 - round
 * 3 - turn
 * 4 - hour
 * 5 - day
 * defaults to 1 hour/1000gp
 */
const string PRC_CRAFTING_TIME_SCALE                 = "PRC_CRAFTING_TIME_SCALE";

/**
 * TO DISABLE SPECIFIC PROPERTIES:
 *
 * Set a switch with the name:
 *
 * PRC_CRAFT_DISABLE_<name of crafting 2da file>_<line number of property>
 *
 * where the 2da files are named craft_* (lower case)
 * or itempropdef in the case of arbitrary crafting
 *
 * eg. PRC_CRAFT_DISABLE_itempropdef_15
 *
 * disables all castspell properties in arbitrary crafting mode
 */

/******************************************************************************\
*                           Teleport System Switches                           *
\******************************************************************************/

/**
 * Defines the maximum number of teleport target locations a PC may store.
 * Default: 50
 */
const string PRC_TELEPORT_MAX_TARGET_LOCATIONS          = "PRC_TELEPORT_MAX_TARGET_LOCATIONS";

/**
 * If this is set, all spells/powers/effects with the [Teleportation] descriptor
 * (ie, their scripts use GetCanTeleport()) fail.
 *
 * Default: Off
 */
const string PRC_DISABLE_TELEPORTATION                  = "PRC_DISABLE_TELEPORTATION";

/**
 * If a local integer variable by this name is set on an area, certain
 * teleportation destinations are unavailable based on the value of the variable.
 * This affects the return value of GetCanTeleport() when the bMovesCreature parameter
 * is true.
 *
 * Possible values are a bitwise combinations of the following:
 * PRC_DISABLE_TELEPORTATION_FROM_AREA
 * PRC_DISABLE_TELEPORTATION_TO_AREA
 * PRC_DISABLE_TELEPORTATION_WITHIN_AREA
 */
const string PRC_DISABLE_TELEPORTATION_IN_AREA          = "PRC_DISABLE_TELEPORTATION_IN_AREA";

/**
 * A value of PRC_DISABLE_TELEPORTATION_IN_AREA. This disables teleporting
 * from the area in question to other areas.
 */
const int PRC_DISABLE_TELEPORTATION_FROM_AREA           = 0x1;

/**
 * A value of PRC_DISABLE_TELEPORTATION_IN_AREA. This disables teleporting
 * from other areas to the area in question.
 */
const int PRC_DISABLE_TELEPORTATION_TO_AREA             = 0x2;

/**
 * A value of PRC_DISABLE_TELEPORTATION_IN_AREA. This disables both teleporting
 * from area in question to another location in that same area.
 */
const int PRC_DISABLE_TELEPORTATION_WITHIN_AREA         = 0x4;

/**
 * Forces spells/powers/effects that use GetTeleportError() to behave in a
 * specific way when their destination is in an area on which this local
 * variable is set.
 * Based on the value of this variable, such a spell/power will always behave in
 * a way described by one of the entries of Teleport results table. This happens
 * even if the spell/power would normally ignore the table.
 *
 * Default: Each spell / power behaves by it's normal specification.
 *
 * Values:
 * PRC_FORCE_TELEPORTATION_RESULT_ONTARGET
 * PRC_FORCE_TELEPORTATION_RESULT_OFFTARGET
 * PRC_FORCE_TELEPORTATION_RESULT_WAYOFFTARGET
 * PRC_FORCE_TELEPORTATION_RESULT_MISHAP
 */
const string PRC_FORCE_TELEPORTATION_RESULT             = "PRC_FORCE_TELEPORTATION_RESULT";

/**
 * A value of PRC_FORCE_TELEPORTATION_RESULT. This makes the spells affected by
 * the variable always succeed.
 */
const int PRC_FORCE_TELEPORTATION_RESULT_ONTARGET       = 1;

/**
 * A value of PRC_FORCE_TELEPORTATION_RESULT. This makes the spells affected by
 * the variable always dump the target(s) in a random location in the same area.
 */
const int PRC_FORCE_TELEPORTATION_RESULT_OFFTARGET      = 2;

/**
 * A value of PRC_FORCE_TELEPORTATION_RESULT. This makes the spells affected by
 * the variable always dump the target(s) in a random location among the users's
 * stored teleport choices, or if there are no others, just stay where the user is.
 */
const int PRC_FORCE_TELEPORTATION_RESULT_WAYOFFTARGET   = 3;

/**
 * A value of PRC_FORCE_TELEPORTATION_RESULT. This makes the spells affected by
 * the variable always do the following:
 * // Mishap:
 * // You and anyone else teleporting with you have gotten “scrambled.”
 * // You each take 1d10 points of damage, and you reroll on the chart to see where you wind up.
 * // For these rerolls, roll 1d20+80. Each time “Mishap” comes up, the characters take more damage and must reroll.
 */
const int PRC_FORCE_TELEPORTATION_RESULT_MISHAP         = 4;

/**
 * If a variable by this name is non-zero on a creature, that creature cannot
 * teleport. If you use this in your own scripts, please do not set it to
 * a static value or directly remove it.
 * Instead, increase it's value by one when the disabling occurs and decrease
 * by one when the disabling turns off. This is required in order to be able to
 * handle overlapping sources of forbiddance.
 *
 * Note: This stops all effects with the [Teleportation] descriptor, by causing
 * GetCanTeleport() to always return FALSE.
 */
const string PRC_DISABLE_CREATURE_TELEPORT              = "PRC_DISABLE_CREATURE_TELEPORT";


/******************************************************************************\
*                          Persistent World switches                           *
\******************************************************************************/

/**
 * Persistant time tracking.
 * When the first player logs on, the clock is set forward to the last time that
 * player logged off.
 */
const string PRC_PW_TIME                             = "PRC_PW_TIME";

/**
 * Number of rounds between exporting characters (1 round = 6 seconds).
 */
const string PRC_PW_PC_AUTOEXPORT                    = "PRC_PW_PC_AUTOEXPORT";

/**
 * A player's HP is stored via persistant locals every HB and restored on logon.
 */
const string PRC_PW_HP_TRACKING                      = "PRC_PW_HP_TRACKING";

/**
 * A player's location is stored via persistant locals every HB and restored
 * on logon.
 */
const string PRC_PW_LOCATION_TRACKING                = "PRC_PW_LOCATION_TRACKING";

/**
 * Player places map pins are tracked via persistant locals and restored on logon
 */
const string PRC_PW_MAPPIN_TRACKING                   = "PRC_PW_MAPPIN_TRACKING";

/**
 * Being dead is stored via persistant locals and restored on logon.
 */
const string PRC_PW_DEATH_TRACKING                   = "PRC_PW_DEATH_TRACKING";

/**
 * Spells cast are tracked via persistant locals and restored on logon
 */
const string PRC_PW_SPELL_TRACKING                   = "PRC_PW_SPELL_TRACKING";

/**
 * Players cant logon for this many minutes after a server load
 */
const string PRC_PW_LOGON_DELAY                      = "PRC_PW_LOGON_DELAY";



/******************************************************************************\
*                             XP system switches                               *
\******************************************************************************/

/**
 * This modifies the amount of XP a character recieves based on Level Adjustment
 * - Doesn't take racial hit dice into account.
 * - Should work with any prior XP system.
 * - Use this on pre-exisitng modules.
 */
const string PRC_XP_USE_SIMPLE_LA                    = "PRC_XP_USE_SIMPLE_LA";

/**
 * Any new characters entering the module are automatically given racial hit dice
 * Unlike PnP, they do not get to select what feats/skills the racial HD grant
 * Instead the default bioware package will be used.
 * Do not use if the ConvoCCs racial hit dice option is in use.
 */
const string PRC_XP_USE_SIMPLE_RACIAL_HD             = "PRC_XP_USE_SIMPLE_RACIAL_HD";

/**
 * Characters must earn their racial HD through the normal levelup process
 * Player must still take all their racial HD before they can take more
 * than one level in a non-racial class.
 * PRC_XP_USE_SIMPLE_RACIAL_HD must be on, and the convoCC racial hit dice option
 * must be off
 */
const string PRC_XP_USE_SIMPLE_RACIAL_HD_NO_FREE_XP  = "PRC_XP_USE_SIMPLE_RACIAL_HD_NO_FREE_XP";

/**
 * Characters are given racial HD via LevelupHenchman so can't select feats etc
 * Uses the default packages for each class, which are poor to say the least
 * PRC_XP_USE_SIMPLE_RACIAL_HD must be on, and the convoCC racial hit dice option
 * must be off
 */
const string PRC_XP_USE_SIMPLE_RACIAL_HD_NO_SELECTION  = "PRC_XP_USE_SIMPLE_RACIAL_HD_NO_SELECTION";

/**
 * Enables PRC XP system.
 * This may cause balance issues with pre-exisiting modules, so it is recomended
 * that only builders use this and do extensive playtesting and tweaking for
 * balance.
 *
 * Uses the dmgxp.2da file which is a copy of the XP tables in the DMG and ELH
 * these are based on the formula of 13.3333 encounters of CR = ECL to advance
 * a level.
 * Enconters of CR > ECL+8 or CR < ECL-8 dont give XP.
 * Tables are setup so that parties' levels will converge over time.
 */
const string PRC_XP_USE_PNP_XP                       = "PRC_XP_USE_PNP_XP";

/**
 * PRC XP system will use default bioware xptable.2da instead of dmgxp.2da
 */
const string PRC_XP_USE_BIOWARE_XPTABLE              = "PRC_XP_USE_BIOWARE_XPTABLE";

/**
 * This value is divided by 100 when applied so a value of 100 is equivalent to 1.0
 * slider for PnP XP system, multiplier for final XP amount
 * This can also be set on individual PCs for the same result. If it is not set, then
 * it defaults to 1.0.
 */
const string PRC_XP_SLIDER_x100                      = "PRC_XP_SLIDER_x100";

/**
 * Player groups will get small xp bonuses. Formula is group size - 1 * switch/100
 * so with a default value of 10 (10%) a party of 4 PCs receives 30% XP bonus
 */
const string PRC_XP_GROUP_BONUS                      = "PRC_XP_GROUP_BONUS";

/**
 * Use ECL for NPCs instead of CR.
 * Should be close, but I dont know how Bioware CR calculations work with the
 * PRC races.
 * Also note ECL is a measure of power in a campaign, wheras CR is measure of
 * power in a single encounter. Thus ECL weights use/day abilitieis more than
 * CR does.
 */
const string PRC_XP_USE_ECL_NOT_CR                   = "PRC_XP_USE_ECL_NOT_CR";

/**
 * If this is set, ECL = LA + racial hit dice
 * EVEN IF THE CHARACTER DOESNT HAVE ANY RACIAL HIT DICE!
 * So it penalizes the power races far more than PnP because they don't get any
 * of the other benefits of racial hit dice (BAB, HP, saves, skills, feats, etc)
 */
const string PRC_XP_INCLUDE_RACIAL_HIT_DIE_IN_LA     = "PRC_XP_INCLUDE_RACIAL_HIT_DIE_IN_LA";

/**
 * These values are divided by 100 when applied so a value of 100 is equivalent
 * to 1.0.
 * This is for purposes of party size for dividing XP awards by.
 * By PnP only PCs would count, and possibly henchmen too, but you might want to
 * tweak others for balance purposes, for example to hinder a solo wizard with
 * dozens of summons.
 */
const string PRC_XP_PC_PARTY_COUNT_x100              = "PRC_XP_PC_PARTY_COUNT_x100";
const string PRC_XP_HENCHMAN_PARTY_COUNT_x100        = "PRC_XP_HENCHMAN_PARTY_COUNT_x100";
const string PRC_XP_DOMINATED_PARTY_COUNT_x100       = "PRC_XP_DOMINATED_PARTY_COUNT_x100";
const string PRC_XP_ANIMALCOMPANION_PARTY_COUNT_x100 = "PRC_XP_ANIMALCOMPANION_PARTY_COUNT_x100";
const string PRC_XP_FAMILIAR_PARTY_COUNT_x100        = "PRC_XP_FAMILIAR_PARTY_COUNT_x100";
const string PRC_XP_SUMMONED_PARTY_COUNT_x100        = "PRC_XP_SUMMONED_PARTY_COUNT_x100";
const string PRC_XP_UNKNOWN_PARTY_COUNT_x100         = "PRC_XP_UNKNOWN_PARTY_COUNT_x100";

/**
 * Use SetXP rather than GiveXP. Will bypass any possible Bioware interference.
 */
const string PRC_XP_USE_SETXP                        = "PRC_XP_USE_SETXP";

/**
 * Give XP to NPCs
 */
const string PRC_XP_GIVE_XP_TO_NPCS                  = "PRC_XP_GIVE_XP_TO_NPCS";

/**
 * Setting this switch will turn off the messages about being too far awy to gain XP
 */
const string PRC_XP_DISABLE_SPAM                 	 = "PRC_XP_DISABLE_SPAM";

/**
 * PCs must be in the same area as the CR to gain XP.
 * Helps stop powerlevelling by detering low level characters hanging around
 * with 1 very strong char.
 */
const string PRC_XP_MUST_BE_IN_AREA                  = "PRC_XP_MUST_BE_IN_AREA";

/**
 * Maximum distance that a PC must be to gain XP.
 * Helps stop powerlevelling by detering low level characters hanging around
 * with 1 very strong char.
 */
const string PRC_XP_MAX_PHYSICAL_DISTANCE            = "PRC_XP_MAX_PHYSICAL_DISTANCE";

/**
 * Maximum level difference in levels between killer and PC being awarded XP.
 * Helps stop powerlevelling by detering low level characters hanging around
 * with 1 very strong char.
 */
const string PRC_XP_MAX_LEVEL_DIFF                   = "PRC_XP_MAX_LEVEL_DIFF";

/**
 * Gives XP to NPCs when no PCs are in their faction
 * This might cause lag if large numebrs of NPCs in the same faction.
 */
const string PRC_XP_GIVE_XP_TO_NON_PC_FACTIONS       = "PRC_XP_GIVE_XP_TO_NON_PC_FACTIONS";




/******************************************************************************\
*                      Database and Letoscript switches                        *
\******************************************************************************/

/**
 * Set this if you want to use the bioware db for 2da caching
 * the value is the number of Hbs between caching runs
 * Defaults to 300 (30 mins) if not set
 * cache will be flushed automatically when the PRC version changes
 * If this is set to -1 or lower, it is never stored for persistance over
 * module restarts.
 * The bioware database will bloat infinitely on Linux, due to biowares poor
 * handling.
 */
const string PRC_USE_BIOWARE_DATABASE                = "PRC_USE_BIOWARE_DATABASE";

/**
 * Set this if you are using NWNX and any sort of database.
 */
const string PRC_USE_DATABASE                        = "PRC_USE_DATABASE";

/**
 * Set this if you are using SQLite (the built-in database in NWNX-ODBC2).
 * This will use transactions and SQLite specific syntax.
 */
const string PRC_DB_SQLITE                          = "PRC_DB_SQLITE";

/**
 * This is the interval of each transaction. By default it is 600 seconds.
 * Shorter will mean slower, but less data lost in the event of a server crash.
 * Longer is visa versa.
 */
const string PRC_DB_SQLITE_INTERVAL                 = "PRC_DB_SQLITE_INTERVAL";

/**
 * Set this if you are using MySQL.
 * This will not use transactions and will use MySQL specific syntax
 */
const string PRC_DB_MYSQL                            = "PRC_DB_MYSQL";


/**
 * This will precache 2da files into the database.
 * The first time a module runs with this set it will lag a lot for a long time
 * as the game does 2da reads.
 * Afterwards it will be much faster.
 * This is a really, really long lag. Like days/weeks type length.
 * This is not the "normal" precaching that the spellbooks & psionics does.
 */
const string PRC_DB_PRECACHE                         = "PRC_DB_PRECACHE";

/**
 * TODO: Write description.
 */
const string PRC_USE_LETOSCRIPT                      = "PRC_USE_LETOSCRIPT";

/**
 * Set this to 1 if using build 18
 */
const string PRC_LETOSCRIPT_PHEONIX_SYNTAX           = "PRC_LETOSCRIPT_PHEONIX_SYNTAX";

/**
 * Set this to 1 to have Letoscript convert stat boosts on the hide to
 * permanent ones.
 */
const string PRC_LETOSCRIPT_FIX_ABILITIES            = "PRC_LETOSCRIPT_FIX_ABILITIES";

/**
 * Letoscript needs a string named PRC_LETOSCRIPT_NWN_DIR set to the
 * directory of NWN. If it doesnt work, try different slash options: // \\ / \
 */
const string PRC_LETOSCRIPT_NWN_DIR                  = "PRC_LETOSCRIPT_NWN_DIR";

/**
 * Switch so that Unicorn will use the SQL database for SCO/RCO
 * Must have the zeoslib.dlls installed for this
 *
 * UNTESTED!!!
 */
const string PRC_LETOSCRIPT_UNICORN_SQL              = "PRC_LETOSCRIPT_UNICORN_SQL";

/**
 * This is a string, not integer.
 * If the IP is set, Letoscript will use ActivatePortal instead of booting.
 * The IP and Password must be correct for your server or bad things will happen.
 * - If your IP is non-static make sure this is kept up to date.
 *
 * See the Lexicon entry on ActivatePortal for more information.
 *
 * @see PRC_LETOSCRIPT_PORTAL_PASSWORD
 */
const string PRC_LETOSCRIPT_PORTAL_IP                = "PRC_LETOSCRIPT_PORTAL_IP";

/**
 * This is a string, not integer.
 * If the IP is set, Letoscript will use ActivatePortal instead of booting.
 * The IP and Password must be correct for your server or bad things will happen.
 * - If your IP is non-static make sure this is kept up to date.
 *
 * See the Lexicon entry on ActivatePortal for more information.
 *
 * @see PRC_LETOSCRIPT_PORTAL_IP
 */
const string PRC_LETOSCRIPT_PORTAL_PASSWORD          = "PRC_LETOSCRIPT_PORTAL_PASSWORD";

/**
 * If set you must be using Unicorn.
 * Will use getnewest bic instead of filename reconstruction (which fails if
 * multiple characters have the same name)
 */
const string PRC_LETOSCRIPT_GETNEWESTBIC             = "PRC_LETOSCRIPT_GETNEWESTBIC";

//This switch is set automatically after prc_onmodload detects NWNX_Funcs plugin
const string PRC_NWNX_FUNCS                          = "PRC_NWNX_FUNCS";


/******************************************************************************\
*                              ConvoCC switches                                *
\******************************************************************************/

/**
 * Activates the ConvoCC.
 * This doesn't turn on the database and letoscript as well, which you must
 * do yourself.
 *
 * @see PRC_USE_DATABASE
 * @see PRC_USE_LETOSCRIPT
 */
const string PRC_CONVOCC_ENABLE                      = "PRC_CONVOCC_ENABLE";

/**
 * Avariel characters have bird wings.
 */
const string PRC_CONVOCC_AVARIEL_WINGS               = "PRC_CONVOCC_AVARIEL_WINGS";

/**
 * Fey'ri characters have bat wings.
 */
const string PRC_CONVOCC_FEYRI_WINGS                 = "PRC_CONVOCC_FEYRI_WINGS";

/**
 * Aasimar characters have the option of angel wings
 * Note: Not set by PRC_CONVOCC_ENFORCE_PNP_RACIAL as it isn't part of PnP
 */

const string PRC_CONVOCC_AASIMAR_WINGS               = "PRC_CONVOCC_AASIMAR_WINGS";

/**
 * Fey'ri characters have a demonic tail.
 */
const string PRC_CONVOCC_FEYRI_TAIL                  = "PRC_CONVOCC_FEYRI_TAIL";

/**
 * Teifling characters have the option of a demonic tail.
 */
const string PRC_CONVOCC_TIEFLING_TAIL               = "PRC_CONVOCC_TIEFLING_TAIL";

/**
 * Force Drow characters to be of the correct gender for their race.
 */
const string PRC_CONVOCC_DROW_ENFORCE_GENDER         = "PRC_CONVOCC_DROW_ENFORCE_GENDER";

/**
 * Force Genasi clerics to select the relevant elemental domain as one of
 * their feats.
 */
const string PRC_CONVOCC_GENASI_ENFORCE_DOMAINS      = "PRC_CONVOCC_GENASI_ENFORCE_DOMAINS";

/**
 * Female Rakshasa use the female rakshasa model. Use together with PRC_CONVOCC_USE_RACIAL_APPEARANCES
 * @see PRC_CONVOCC_USE_RACIAL_APPEARANCES
 */
const string PRC_CONVOCC_RAKSHASA_FEMALE_APPEARANCE = "PRC_CONVOCC_RAKSHASA_FEMALE_APPEARANCE";

/**
 * A combination switch to turn on all the racial enforcement settings.
 * @see PRC_CONVOCC_RAKSHASA_FEMALE_APPEARANCE
 * @see PRC_CONVOCC_GENASI_ENFORCE_DOMAINS
 * @see PRC_CONVOCC_DROW_ENFORCE_GENDER
 * @see PRC_CONVOCC_TIEFLING_TAIL
 * @see PRC_CONVOCC_FEYRI_TAIL
 * @see PRC_CONVOCC_FEYRI_WINGS
 * @see PRC_CONVOCC_AVARIEL_WINGS
 */
const string PRC_CONVOCC_ENFORCE_PNP_RACIAL          = "PRC_CONVOCC_ENFORCE_PNP_RACIAL";

/**
 * Note: feat enforcement switches don't do anything (TODO?)
 */

/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_BLOOD_OF_THE_WARLORD= "PRC_CONVOCC_ENFORCE_BLOOD_OF_THE_WARLORD";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_NIMBUSLIGHT    = "PRC_CONVOCC_ENFORCE_FEAT_NIMBUSLIGHT";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_HOLYRADIANCE   = "PRC_CONVOCC_ENFORCE_FEAT_HOLYRADIANCE";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_SERVHEAVEN     = "PRC_CONVOCC_ENFORCE_FEAT_SERVHEAVEN";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_SAC_VOW        = "PRC_CONVOCC_ENFORCE_FEAT_SAC_VOW";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_VOW_OBED       = "PRC_CONVOCC_ENFORCE_FEAT_VOW_OBED";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_THRALL_TO_DEMON= "PRC_CONVOCC_ENFORCE_FEAT_THRALL_TO_DEMON";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_DISCIPLE_OF_DARKNESS="PRC_CONVOCC_ENFORCE_FEAT_DISCIPLE_OF_DARKNESS";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_LICHLOVED      = "PRC_CONVOCC_ENFORCE_FEAT_LICHLOVED";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_EVIL_BRANDS    = "PRC_CONVOCC_ENFORCE_FEAT_EVIL_BRANDS";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_VILE_WILL_DEFORM="PRC_CONVOCC_ENFORCE_FEAT_VILE_WILL_DEFORM";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_VILE_DEFORM_OBESE="PRC_CONVOCC_ENFORCE_FEAT_VILE_DEFORM_OBESE";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_VILE_DEFORM_GAUNT="PRC_CONVOCC_ENFORCE_FEAT_VILE_DEFORM_GAUNT";
/** Separate enforcement of feats with special restrictions. */
const string PRC_CONVOCC_ENFORCE_FEAT_LOLTHS_MEAT   = "PRC_CONVOCC_ENFORCE_FEAT_LOLTHS_MEAT";


/**
 * A combination switch to turn on all the feat enforcement settings. Doesn't do anything
 */
const string PRC_CONVOCC_ENFORCE_FEATS               = "PRC_CONVOCC_ENFORCE_FEATS";

/**
 * Stops players from changing their wings. Turning this on gives players only the "none" choice
 * at the wing stage of the convoCC. Use in conjuction with the wing switches.
 * @see PRC_CONVOCC_AVARIEL_WINGS
 * @see PRC_CONVOCC_FEYRI_WINGS
 * @see PRC_CONVOCC_AASIMAR_WINGS
 */
const string PRC_CONVOCC_DISALLOW_CUSTOMISE_WINGS    = "PRC_CONVOCC_DISALLOW_CUSTOMISE_WINGS";

/**
 * Stops players from changing their tail. Turning this on gives players only the "none" choice
 * at the tail stage of the convoCC. Use in conjuction with the tail switches.
 * @see PRC_CONVOCC_FEYRI_TAIL
 * @see PRC_CONVOCC_TIEFLING_TAIL
 */
const string PRC_CONVOCC_DISALLOW_CUSTOMISE_TAIL     = "PRC_CONVOCC_DISALLOW_CUSTOMISE_TAIL";

/**
 * Stops players from changing their model at all. Doesn't do anything
 */
const string PRC_CONVOCC_DISALLOW_CUSTOMISE_MODEL    = "PRC_CONVOCC_DISALLOW_CUSTOMISE_MODEL";

/**
 * Players are only given a choice of appearances that match their race. For most races, this is the
 * default appearance defined in racialtypes.2da.
 * @see PRC_CONVOCC_RAKSHASA_FEMALE_APPEARANCE
 */
const string PRC_CONVOCC_USE_RACIAL_APPEARANCES      = "PRC_CONVOCC_USE_RACIAL_APPEARANCES";
/**
 * Player can only choose a portrait that matches their race as in portraits.2da. Because
 * Bioware's elf, dwarf etc. subrace portraits are labelled as eg. 'elf' not 'drow' and because
 * half elves have no portraits, this is actually done on appearance and not on race for PCs using
 * Bioware's PC appearance models.
 */
const string PRC_CONVOCC_USE_RACIAL_PORTRAIT         = "PRC_CONVOCC_USE_RACIAL_PORTRAIT";

/**
 * Players can only select from the player voicesets. NPC voicesets are not
 * complete, so wont play sounds for many things such as emotes.
 */
const string PRC_CONVOCC_ONLY_PLAYER_VOICESETS       = "PRC_CONVOCC_ONLY_PLAYER_VOICESETS";

/**
 * Only allows players to select voiceset of the same gender as their character.
 */
const string PRC_CONVOCC_RESTRICT_VOICESETS_BY_SEX   = "PRC_CONVOCC_RESTRICT_VOICESETS_BY_SEX";

/**
 * Allow players to keep their exisiting voiceset.
 * The ConvoCC cannot allow players to select custom voiceset, so the only way
 * for players to have them is to select them in the Bioware character creator
 * and then select to keep them in the ConvoCC.
 */
const string PRC_CONVOCC_ALLOW_TO_KEEP_VOICESET      = "PRC_CONVOCC_ALLOW_TO_KEEP_VOICESET";

/**
 * Allow players to keep their exisiting portrait.
 * The ConvoCC cannot allow players to select custom portraits, so the only way
 * for players to have them is to select them in the Bioware character creator
 * and then select to keep them in the ConvoCC.
 */
const string PRC_CONVOCC_ALLOW_TO_KEEP_PORTRAIT      = "PRC_CONVOCC_ALLOW_TO_KEEP_PORTRAIT";

/**
 * Only allow players to select portraits of the same gender as their character.
 * Most of the NPC portraits do not have a gender so are also removed.
 */
const string PRC_CONVOCC_RESTRICT_PORTRAIT_BY_SEX    = "PRC_CONVOCC_RESTRICT_PORTRAIT_BY_SEX";

/**
 * This option give players the ability to start with racial hit dice for some
 * of the more powerful races. These are defined in ECL.2da.
 * For these races, players do not pick a class in the ConvoCC but instead
 * select 1 or more levels in a racial class (such as monsterous humanoid, or
 * outsider).
 * This is not a complete ECL system, it merely gives players the racial hit
 * dice component of their race. It does not make any measure of the Level
 * Adjustment component. For example, a pixie has no racial hit dice, but has a
 * +4 level adjustment. Doesn't do anything
 */
const string PRC_CONVOCC_ENABLE_RACIAL_HITDICE       = "PRC_CONVOCC_ENABLE_RACIAL_HITDICE";

/**
 * This option allows players to keep their skillpoints from one level to
 * the next, if they want to.
 */
const string PRC_CONVOCC_ALLOW_SKILL_POINT_ROLLOVER  = "PRC_CONVOCC_ALLOW_SKILL_POINT_ROLLOVER";

/**
 * This will identify new characters based on XP as in v1.3
 * This is less secure than using the encrypted key.
 * @see PRC_CONVOCC_ENCRYPTION_KEY
 */
const string PRC_CONVOCC_USE_XP_FOR_NEW_CHAR         = "PRC_CONVOCC_USE_XP_FOR_NEW_CHAR";

/**
 * This is the key used to encrypt characters' names if USE_XP_FOR_NEW_CHAR
 * is false in order to identify returning characters. It should be in the
 * range 1-100.
 * If USE_XP_FOR_NEW_CHAR is true along with this, then returning characters
 * will be encrypted too, so once everone has logged on at least once,
 * USE_XP_FOR_NEW_CHAR can be set to false for greater security.
 *
 * WARNING: Changing this value after some PCs have gone through the convoCC will
 * cause them to have to go through it again. The encryption uses the player's
 * public CD key, so they won't be able to log into their account from different
 * NWN installs as the key won't match using this system
 */
const string PRC_CONVOCC_ENCRYPTION_KEY              = "PRC_CONVOCC_ENCRYPTION_KEY";

/**
 * As requested, an option to alter the amount of points available in the stat
 * point-buy at character creation.
 * Default: 30
 */
const string PRC_CONVOCC_STAT_POINTS                 = "PRC_CONVOCC_STAT_POINTS";

/**
 * As requirested, if set this will give a number of bonus feats equal to this
 * value to each created character, similar to human Quick To Master feat.
 */
const string PRC_CONVOCC_BONUS_FEATS                 = "PRC_CONVOCC_BONUS_FEATS";

/**
 * As requested, this will cap the maximum a stat can start at, excluding racial
 * modifies.
 * Default: 18
 */
const string PRC_CONVOCC_MAX_STAT                    = "PRC_CONVOCC_MAX_STAT";

/**
 * As requested, this will change the skill point multplier at level 1.
 * Default: 4
 */
const string PRC_CONVOCC_SKILL_MULTIPLIER            = "PRC_CONVOCC_SKILL_MULTIPLIER";

/**
 * As requested, this will give a bonus to skill points after multiplication.
 */
const string PRC_CONVOCC_SKILL_BONUS                 = "PRC_CONVOCC_SKILL_BONUS";

/**
 * When set, the convoCC NO LONGER STARTS AUTOMATICALLY on logging in. It must be called
 * by a script in the module. This allows the module builder to start the convoCC from a
 * particular area or trigger's On Enter event. The script should call the convoCC with
 * ExecuteScript("prc_ccc_main", oPC) where oPC is the PC. It's advisable to check the
 * entering object is a PC and not a NPC or DM.
 */

const string PRC_CONVOCC_CUSTOM_START_LOCATION       = "PRC_CONVOCC_CUSTOM_START_LOCATION";

/**
 * When set, this switch causes a custom script to be used to determine whether a PC should go
 * through the convoCC or not.
 * The script must:
 * - be called "ccc_custom_enter"
 * - set the local int "CONVOCC_LAST_STATUS" on the PC (OBJECT_SELF)
 * - include prc_ccc_const (for the constants the local int can be set to)
 * otherwise the PC will always be booted
 *
 * possible values for CONVOCC_LAST_STATUS:
 * CONVOCC_ENTER_BOOT_PC (causes the PC to get kicked)
 * CONVOCC_ENTER_NEW_PC (causes the PC to go through the convoCC)
 * CONVOCC_ENTER_RETURNING_PC (causes the PC to skip the convoCC)
 *
 * This switch will completely bypass the convoCC methods for determining whether to run the
 * convoCC on an entering PC, so if necessary, your custom marker for 'done' would be set
 * in 'ccc_custom_exit'
 * @see PRC_CONVOCC_CUSTOM_EXIT_SCRIPT
 */
const string PRC_CONVOCC_CUSTOM_ENTER_SCRIPT          = "PRC_CONVOCC_CUSTOM_ENTER_SCRIPT";

/**
 * When set, this switch causes a custom script to be executed at the last stage of the convoCC,
 * just before booting the player. The script must be named 'ccc_custom_exit'.
 * Possible uses include: giving PCs gold and/or equipment, giving PCs PW items
 * (even plot items get removed at the start of the convoCC), setting a new persistant location,
 * setting a custom marker for having done the convoCC in conjunction with
 * 'ccc_custom_enter'
 * @see PRC_CONVOCC_CUSTOM_ENTER_SCRIPT
 */

const string PRC_CONVOCC_CUSTOM_EXIT_SCRIPT          = "PRC_CONVOCC_CUSTOM_EXIT_SCRIPT";

/******************************************************************************\
*                              Truenaming switches                             *
\******************************************************************************/

/**
 * Sets the CR Multiplier for Evolving Mind utterances
 * This is divided by 100 to get a float.
 * Ex: To multiply by 1.5, set this value to 150
 *
 * The formula used is (CR * Multiplier) + 15
 *
 * defaults to PnP: (CR * 2) + 15
 */
const string PRC_TRUENAME_CR_MULTIPLIER              = "PRC_TRUENAME_CR_MULTIPLIER";

/**
 * Gives a bonus based on Truenamer level
 * PC Truenamer level is divided by this value
 * Ex: To give a bonus equal to 1/2 Truenamer level, set this to 2
 *
 * The formula used is (CR * Multiplier) + 15 - Bonus
 *
 * defaults to PnP: 0/No bonus
 */
const string PRC_TRUENAME_LEVEL_BONUS                = "PRC_TRUENAME_LEVEL_BONUS";

/**
 * Sets the Constant value added to the DC
 * Ex: To make the constant 10, simply set this value to 10
 *
 * The formula used is (CR * Multiplier) + Constant
 *
 * defaults to PnP: +15.
 */
const string PRC_TRUENAME_DC_CONSTANT                = "PRC_TRUENAME_DC_CONSTANT";

/**
 * Turns off the Law of Sequence when set to 1
 *
 * defaults to PnP: On
 */
const string PRC_LAW_OF_SEQUENCE                     = "PRC_LAW_OF_SEQUENCE";

/**
 * Turns off the Law of Resistance when set to 1
 *
 * defaults to PnP: On
 */
const string PRC_LAW_OF_RESISTANCE                   = "PRC_LAW_OF_RESISTANCE";

/**
 * Sets the Constant value added to the DC
 * Ex: To make the constant 10, simply set this value to 10
 *
 * The formula used is Constant + (2 * Utterance Level)
 *
 * defaults to PnP: +25.
 */
const string PRC_PERFECTED_MAP_CONSTANT              = "PRC_PERFECTED_MAP_CONSTANT";

/**
 * Sets the Multiplier value added to the DC
 * Ex: To make the multiplier 4, simply set this value to 4
 *
 * The formula used is 25 + (Multiplier * Utterance Level)
 *
 * defaults to PnP: 2.
 */
const string PRC_PERFECTED_MAP_MULTIPLIER            = "PRC_PERFECTED_MAP_MULTIPLIER";

/******************************************************************************\
*                                Binding switches                              *
\******************************************************************************/

/**
 * Sets how many seconds it takes to contact a vestige. 
 * Any number less than 6 is ignored
 */
const string PRC_CONTACT_VESTIGE_TIMER               = "PRC_CONTACT_VESTIGE_TIMER";

/**
 * Sets how many seconds it takes to bind a vestige. 
 * Any number less than 12 is ignored
 */
const string PRC_BIND_VESTIGE_TIMER                  = "PRC_BIND_VESTIGE_TIMER";

/******************************************************************************\
*                                Encounter switches                            *
\******************************************************************************/

/** Encounter areas
 *  Setting this will disable access to the encounter areas from the PRC Options convo
 */
const string PRC_DISABLE_ENCOUNTERS                  = "PRC_DISABLE_ENCOUNTERS";

/**
 * This script prevents hacking to another user account without Master Server Authentication
 *
 * Stores public cd keys for each account in database. In case the key was registered with
 * another account player is booted from the server.
 *
 * All credits go to FunkySwerve
 */
const string PRC_PW_SECURITY_CD_CHECK            = "PRC_PW_SECURITY_CD_CHECK";


/******************************************************************************\
*                             Debugging Switches                               *
\******************************************************************************/

/**
 * Toggles everything guarded by "if(DEBUG)". Mostly calls to DoDebug().
 */
const string PRC_DEBUG                               = "PRC_DEBUG";




///////////////////////
// Function protypes //
///////////////////////
/* NOTE: if you are looking for a function that used to be in here, it's probably in inc_switch_setup */

/**
 * Checks the state of a PRC switch.
 * NOTE: This will only work with switches that use integer values. You
 * must get the value of non-integer-valued switches manually.
 *
 * @param sSwitch  One of the PRC_* constant strings defined in prc_inc_switch
 * @return         The value of the switch queried
 */
int GetPRCSwitch(string sSwitch);

/**
 * Sets a PRC switch state.
 * NOTE: As this will only set switches with integer values, you will need
 * to manually set the (few) switches that should have a value other than
 * integer.
 *
 * @param sSwitch  One of the PRC_* constant strings defined in prc_inc_switch
 * @param nState   The integer value to set the switch to
 */
void SetPRCSwitch(string sSwitch, int nState);

//const string PRC_FILE_END_TOKEN = "prc_fe_tkn";

//////////////////////////
// Function definitions //
//////////////////////////

int GetPRCSwitch(string sSwitch)
{
    return GetLocalInt(GetModule(), sSwitch);
}

void SetPRCSwitch(string sSwitch, int nState)
{
    SetLocalInt(GetModule(), sSwitch, nState);
}
