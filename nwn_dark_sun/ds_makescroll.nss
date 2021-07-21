int nSpell, nXP, nGoldCost, nNewXP,nWizLevel,nSorLevel,nBarLevel;
float fXPCost, fNewXP, fBaseLevel, fGoldCost;
string sScroll;
object oCaster;

void main()
{
oCaster=GetLastSpellCaster();
nWizLevel=GetLevelByClass(CLASS_TYPE_WIZARD,oCaster);
nSorLevel=GetLevelByClass(CLASS_TYPE_SORCERER,oCaster);
nBarLevel=GetLevelByClass(CLASS_TYPE_BARD,oCaster);
fXPCost=12.5; //This is the default setting for the d20 rules but can be modified
nXP=GetXP(oCaster);
nSpell=GetLastSpell();





if(nSpell==SPELL_ACID_FOG)
{
fBaseLevel=66.0; //basically the spell level times the lowest caster level needed to cast the spell
sScroll="it_sparscr604"; //the respective scroll id
}
else if(nSpell==SPELL_ANIMATE_DEAD)
{
fBaseLevel=45.0;
sScroll="it_sparscr510";
}
else if(nSpell==SPELL_BESTOW_CURSE)
{
fBaseLevel=28.0;
sScroll="it_sparscr415";
}
else if(nSpell==SPELL_BLINDNESS_AND_DEAFNESS)
{
fBaseLevel=6.0;
sScroll="it_sparscr212";
}
else if(nSpell==SPELL_BULLS_STRENGTH)
{
fBaseLevel=6.0;
sScroll="it_sparscr213";
}
else if(nSpell==SPELL_BURNING_HANDS)
{
fBaseLevel=1.0;
sScroll="it_sparscr113";
}
else if(nSpell==SPELL_CATS_GRACE)
{
fBaseLevel=6.0;
sScroll="it_sparscr214";
}
else if(nSpell==SPELL_CHAIN_LIGHTNING)
{
fBaseLevel=66.0;
sScroll="it_sparscr608";
}
else if(nSpell==SPELL_CHARM_MONSTER)
{
fBaseLevel=28.0;
sScroll="it_sparscr406";
}
else if(nSpell==SPELL_CHARM_PERSON)
{
fBaseLevel=1.0;
sScroll="it_sparscr108";
}
else if(nSpell==SPELL_CIRCLE_OF_DEATH)
{
fBaseLevel=66.0;
sScroll="it_sparscr611";
}
else if(nSpell==SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE)
{
fBaseLevel=15.0;
sScroll="it_sparscr308";
}
else if(nSpell==SPELL_CLARITY)
{
fBaseLevel=6.0;
sScroll="it_sparscr218";
}
else if(nSpell==SPELL_CLOUDKILL)
{
fBaseLevel=45.0;
sScroll="it_sparscr503";
}
else if(nSpell==SPELL_COLOR_SPRAY)
{
fBaseLevel=1.0;
sScroll="it_sparscr111";
}
else if(nSpell==SPELL_CONE_OF_COLD)
{
fBaseLevel=45.0;
sScroll="it_sparscr508";
}
else if(nSpell==SPELL_CONFUSION)
{
fBaseLevel=28.0;
sScroll="it_sparscr407";
}
else if(nSpell==SPELL_CONTAGION)
{
fBaseLevel=28.0;
sScroll="it_sparscr412";
}
else if(nSpell==SPELL_CONTROL_UNDEAD)
{
fBaseLevel=91.0;
sScroll="it_sparscr708";
}
else if(nSpell==SPELL_DARKNESS)
{
fBaseLevel=6.0;
sScroll="it_sparscr207";
}
else if(nSpell==SPELL_DAZE)
{
fBaseLevel=0.5;
sScroll="it_sparscr";
}
else if(nSpell==SPELL_DELAYED_BLAST_FIREBALL)
{
fBaseLevel=91.0;
sScroll="it_sparscr705";
}
else if(nSpell==SPELL_DISMISSAL)
{
fBaseLevel=45.0;
sScroll="it_sparscr502";
}
else if(nSpell==SPELL_DISPEL_MAGIC)
{
fBaseLevel=15.0;
sScroll="it_sparscr302";
}
else if(nSpell==SPELL_DOMINATE_MONSTER)
{
fBaseLevel=153.0;
sScroll="it_sparscr906";
}
else if(nSpell==SPELL_DOMINATE_PERSON)
{
fBaseLevel=45.0;
sScroll="it_sparscr504";
}
else if(nSpell==SPELL_EAGLE_SPLEDOR)
{
fBaseLevel=6.0;
sScroll="it_sparscr220";
}
else if(nSpell==SPELL_ELEMENTAL_SHIELD)
{
fBaseLevel=28.0;
sScroll="it_sparscr417";
}
else if(nSpell==SPELL_ENDURANCE)
{
fBaseLevel=6.0;
sScroll="it_sparscr216";
}
else if(nSpell==SPELL_ENDURE_ELEMENTS)
{
fBaseLevel=1.0;
sScroll="it_sparscr102";
}
else if(nSpell==SPELL_ENERGY_DRAIN)
{
fBaseLevel=153.0;
sScroll="it_sparscr909";
}
else if(nSpell==SPELL_ENERVATION)
{
fBaseLevel=28.0;
sScroll="it_sparscr413";
}
else if(nSpell==SPELL_ETHEREAL_VISAGE)
{
fBaseLevel=66.0;
sScroll="it_sparscr609";
}
else if(nSpell==SPELL_FEAR)
{
fBaseLevel=28.0;
sScroll="it_sparscr414";
}
else if(nSpell==SPELL_FEEBLEMIND)
{
fBaseLevel=45.0;
sScroll="it_sparscr505";
}
else if(nSpell==SPELL_FINGER_OF_DEATH)
{
fBaseLevel=91.0;
sScroll="it_sparscr709";
}
else if(nSpell==SPELL_FIREBALL)
{
fBaseLevel=15.0;
sScroll="it_sparscr310";
}
else if(nSpell==SPELL_FLAME_ARROW)
{
fBaseLevel=15.0;
sScroll="it_sparscr305";
}
else if(nSpell==SPELL_FOXS_CUNNING)
{
fBaseLevel=6.0;
sScroll="it_sparscr221";
}
else if(nSpell==SPELL_GATE)
{
fBaseLevel=153.0;
sScroll="it_sparscr903";
}
else if(nSpell==SPELL_GHOSTLY_VISAGE)
{
fBaseLevel=6.0;
sScroll="it_sparscr209";
}
else if(nSpell==SPELL_GHOUL_TOUCH)
{
fBaseLevel=6.0;
sScroll="it_sparscr210";
}
else if(nSpell==VFX_DUR_GLOBE_INVULNERABILITY)
{
fBaseLevel=66.0;
sScroll="it_sparscr602";
}
else if(nSpell==SPELL_GREASE)
{
fBaseLevel=1.0;
sScroll="it_sparscr104";
}
else if(nSpell==SPELL_GREATER_DISPELLING)
{
fBaseLevel=66.0;
sScroll="it_sparscr603";
}
else if(nSpell==SPELL_GREATER_PLANAR_BINDING)
{
fBaseLevel=120.0;
sScroll="it_sparscr804";
}
else if(nSpell==SPELL_GREATER_SHADOW_CONJURATION_ACID_ARROW)
{
fBaseLevel=45.0;
sScroll="it_sparscr509";
}
else if(nSpell==SPELL_GREATER_SHADOW_CONJURATION_MINOR_GLOBE)
{
fBaseLevel=45.0;
sScroll="it_sparscr509";
}
else if(nSpell==SPELL_GREATER_SHADOW_CONJURATION_MIRROR_IMAGE)
{
fBaseLevel=45.0;
sScroll="it_sparscr509";
}
else if(nSpell==SPELL_GREATER_SHADOW_CONJURATION_SUMMON_SHADOW)
{
fBaseLevel=45.0;
sScroll="it_sparscr509";
}
else if(nSpell==SPELL_GREATER_SHADOW_CONJURATION_WEB)
{
fBaseLevel=45.0;
sScroll="it_sparscr509";
}
else if(nSpell==SPELL_GREATER_SPELL_BREACH)
{
fBaseLevel=66.0;
sScroll="it_sparscr613";
}
else if(nSpell==SPELL_GREATER_SPELL_MANTLE)
{
fBaseLevel=153.0;
sScroll="it_sparscr913";
}
else if(nSpell==SPELL_GREATER_STONESKIN)
{
fBaseLevel=66.0;
sScroll="it_sparscr614";
}
else if(nSpell==SPELL_HASTE)
{
fBaseLevel=15.0;
sScroll="it_sparscr313";
}
else if(nSpell==SPELL_HOLD_MONSTER)
{
fBaseLevel=45.0;
sScroll="it_sparscr506";
}
else if(nSpell==SPELL_HOLD_PERSON)
{
fBaseLevel=15.0;
sScroll="it_sparscr309";
}
else if(nSpell==SPELL_HORRID_WILTING)
{
fBaseLevel=120.0;
sScroll="it_sparscr";
}
else if(nSpell==SPELL_IDENTIFY)
{
fBaseLevel=1.0;
sScroll="it_sparscr107";
}
else if(nSpell==SPELL_IMPROVED_INVISIBILITY)
{
fBaseLevel=28.0;
sScroll="it_sparscr409";
}
else if(nSpell==SPELL_INCENDIARY_CLOUD)
{
fBaseLevel=120.0;
sScroll="it_sparscr805";
}
else if(nSpell==SPELL_INVISIBILITY)
{
fBaseLevel=6.0;
sScroll="it_sparscr208";
}
else if(nSpell==SPELL_INVISIBILITY_SPHERE)
{
fBaseLevel=15.0;
sScroll="it_sparscr315";
}
else if(nSpell==SPELL_KNOCK)
{
fBaseLevel=6.0;
sScroll="it_sparscr217";
}
else if(nSpell==SPELL_LESSER_DISPEL)
{
fBaseLevel=6.0;
sScroll="it_sparscr219";
}
else if(nSpell==SPELL_LESSER_MIND_BLANK)
{
fBaseLevel=45.0;
sScroll="it_sparscr512";
}
else if(nSpell==SPELL_LESSER_PLANAR_BINDING)
{
fBaseLevel=45.0;
sScroll="it_sparscr513";
}
else if(nSpell==SPELL_LESSER_SPELL_BREACH)
{
fBaseLevel=28.0;
sScroll="it_sparscr418";
}
else if(nSpell==SPELL_LESSER_SPELL_MANTLE)
{
fBaseLevel=45.0;
sScroll="it_sparscr514";
}
else if(nSpell==SPELL_LIGHT)
{
fBaseLevel=0.5;
sScroll="it_sparscr005";
}
else if(nSpell==SPELL_LIGHTNING_BOLT)
{
fBaseLevel=15.0;
sScroll="it_sparscr311";
}
else if(nSpell==SPELL_MAGE_ARMOR)
{
fBaseLevel=1.0;
sScroll="it_sparscr105";
}
else if(nSpell==SPELL_MAGIC_CIRCLE_AGAINST_CHAOS)
{
fBaseLevel=15.0;
sScroll="it_sparscr303";
}
else if(nSpell==SPELL_MAGIC_CIRCLE_AGAINST_EVIL)
{
fBaseLevel=15.0;
sScroll="it_sparscr303";
}
else if(nSpell==SPELL_MAGIC_CIRCLE_AGAINST_GOOD)
{
fBaseLevel=15.0;
sScroll="it_sparscr303";
}
else if(nSpell==SPELL_MAGIC_CIRCLE_AGAINST_LAW)
{
fBaseLevel=15.0;
sScroll="it_sparscr303";
}
else if(nSpell==SPELL_MAGIC_MISSILE)
{
fBaseLevel=1.0;
sScroll="it_sparscr111";
}
else if(nSpell==SPELL_MASS_BLINDNESS_AND_DEAFNESS)
{
fBaseLevel=120.0;
sScroll="it_sparscr808";
}
else if(nSpell==SPELL_MASS_CHARM)
{
fBaseLevel=120.0;
sScroll="it_sparscr807";
}
else if(nSpell==SPELL_MASS_HASTE)
{
fBaseLevel=66.0;
sScroll="it_sparscr612";
}
else if(nSpell==SPELL_MELFS_ACID_ARROW)
{
fBaseLevel=6.0;
sScroll="it_sparscr203";
}
else if(nSpell==SPELL_METEOR_SWARM)
{
fBaseLevel=153.0;
sScroll="it_sparscr907";
}
else if(nSpell==SPELL_MIND_BLANK)
{
fBaseLevel=120.0;
sScroll="it_sparscr802";
}
else if(nSpell==SPELL_MIND_FOG)
{
fBaseLevel=45.0;
sScroll="it_sparscr507";
}
else if(nSpell==SPELL_MINOR_GLOBE_OF_INVULNERABILITY)
{
fBaseLevel=28.0;
sScroll="it_sparscr402";
}
else if(nSpell==SPELL_MORDENKAINENS_DISJUNCTION)
{
fBaseLevel=153.0;
sScroll="it_sparscr902";
}
else if(nSpell==SPELL_MORDENKAINENS_SWORD)
{
fBaseLevel=91.0;
sScroll="it_sparscr706";
}
else if(nSpell==SPELL_NEGATIVE_ENERGY_BURST)
{
fBaseLevel=15.0;
sScroll="it_sparscr316";
}
else if(nSpell==SPELL_NEGATIVE_ENERGY_RAY)
{
fBaseLevel=1.0;
sScroll="it_sparscr114";
}
else if(nSpell==SPELL_OWLS_WISDOM)
{
fBaseLevel=6.0;
sScroll="it_sparscr222";
}
else if(nSpell==SPELL_PHANTASMAL_KILLER)
{
fBaseLevel=28.0;
sScroll="it_sparscr410";
}
else if(nSpell==SPELL_PLANAR_BINDING)
{
fBaseLevel=66.0;
sScroll="it_sparscr605";
}
else if(nSpell==SPELL_POLYMORPH_SELF)
{
fBaseLevel=28.0;
sScroll="it_sparscr416";
}
else if(nSpell==SPELL_POWER_WORD_KILL)
{
fBaseLevel=153.0;
sScroll="it_sparscr904";
}
else if(nSpell==SPELL_POWER_WORD_STUN)
{
fBaseLevel=91.0;
sScroll="it_sparscr703";
}
else if(nSpell==SPELL_PREMONITION)
{
fBaseLevel=120.0;
sScroll="it_sparscr809";
}
else if(nSpell==SPELL_PRISMATIC_SPRAY)
{
fBaseLevel=91.0;
sScroll="it_sparscr707";
}
else if(nSpell==SPELL_PROTECTION__FROM_CHAOS)
{
fBaseLevel=1.0;
sScroll="it_sparscr103";
}
else if(nSpell==SPELL_PROTECTION_FROM_EVIL)
{
fBaseLevel=1.0;
sScroll="it_sparscr103";
}
else if(nSpell==SPELL_PROTECTION_FROM_GOOD)
{
fBaseLevel=1.0;
sScroll="it_sparscr103";
}
else if(nSpell==SPELL_PROTECTION_FROM_LAW)
{
fBaseLevel=1.0;
sScroll="it_sparscr103";
}
else if(nSpell==SPELL_PROTECTION_FROM_ELEMENTS)
{
fBaseLevel=15.0;
sScroll="it_sparscr304";
}
else if(nSpell==SPELL_PROTECTION_FROM_SPELLS)
{
fBaseLevel=120.0;
sScroll="it_sparscr803";
}
else if(nSpell==SPELL_RAY_OF_ENFEEBLEMENT)
{
fBaseLevel=1.0;
sScroll="it_sparscr112";
}
else if(nSpell==SPELL_RAY_OF_FROST)
{
fBaseLevel=0.5;
sScroll="it_sparscr003";
}
else if(nSpell==SPELL_REMOVE_CURSE)
{
fBaseLevel=28.0;
sScroll="it_sparscr403";
}
else if(nSpell==SPELL_RESIST_ELEMENTS)
{
fBaseLevel=6.0;
sScroll="it_sparscr202";
}
else if(nSpell==SPELL_RESISTANCE)
{
fBaseLevel=0.5;
sScroll="it_sparscr002";
}
else if(nSpell==SPELL_SCARE)
{
fBaseLevel=6.0;
sScroll="it_sparscr211";
}
else if(nSpell==SPELL_SEE_INVISIBILITY)
{
fBaseLevel=6.0;
sScroll="it_sparscr206";
}
else if(nSpell==SPELL_SHADES_CONE_OF_COLD)
{
fBaseLevel=66.0;
sScroll="it_sparscr610";
}
else if(nSpell==SPELL_SHADES_FIREBALL)
{
fBaseLevel=66.0;
sScroll="it_sparscr610";
}
else if(nSpell==SPELL_SHADES_STONESKIN)
{
fBaseLevel=66.0;
sScroll="it_sparscr610";
}
else if(nSpell==SPELL_SHADES_SUMMON_SHADOW)
{
fBaseLevel=66.0;
sScroll="it_sparscr610";
}
else if(nSpell==SPELL_SHADES_WALL_OF_FIRE)
{
fBaseLevel=66.0;
sScroll="it_sparscr610";
}
else if(nSpell==SPELL_SHADOW_CONJURATION_DARKNESS)
{
fBaseLevel=66.0;
sScroll="it_sparscr610";
}
else if(nSpell==SPELL_SHADOW_CONJURATION_INIVSIBILITY)
{
fBaseLevel=28.0;
sScroll="it_sparscr411";
}
else if(nSpell==SPELL_SHADOW_CONJURATION_MAGE_ARMOR)
{
fBaseLevel=28.0;
sScroll="it_sparscr411";
}
else if(nSpell==SPELL_SHADOW_CONJURATION_MAGIC_MISSILE)
{
fBaseLevel=28.0;
sScroll="it_sparscr411";
}
else if(nSpell==SPELL_SHADOW_CONJURATION_SUMMON_SHADOW)
{
fBaseLevel=28.0;
sScroll="it_sparscr411";
}
else if(nSpell==SPELL_SHAPECHANGE)
{
fBaseLevel=153.0;
sScroll="it_sparscr911";
}
else if(nSpell==SPELL_SLEEP)
{
fBaseLevel=1.0;
sScroll="it_sparscr109";
}
else if(nSpell==SPELL_SLOW)
{
fBaseLevel=15.0;
sScroll="it_sparscr314";
}
else if(nSpell==SPELL_SPELL_MANTLE)
{
fBaseLevel=91.0;
sScroll="it_sparscr702";
}
else if(nSpell==SPELL_STINKING_CLOUD)
{
fBaseLevel=15.0;
sScroll="it_sparscr306";
}
else if(nSpell==SPELL_STONESKIN)
{
fBaseLevel=28.0;
sScroll="it_sparscr404";
}
else if(nSpell==SPELL_SUMMON_CREATURE_I)
{
fBaseLevel=1.0;
sScroll="it_sparscr106";
}
else if(nSpell==SPELL_SUMMON_CREATURE_II)
{
fBaseLevel=6.0;
sScroll="it_sparscr204";
}
else if(nSpell==SPELL_SUMMON_CREATURE_III)
{
fBaseLevel=15.0;
sScroll="it_sparscr307";
}
else if(nSpell==SPELL_SUMMON_CREATURE_IV)
{
fBaseLevel=28.0;
sScroll="it_sparscr405";
}
else if(nSpell==SPELL_SUMMON_CREATURE_V)
{
fBaseLevel=45.0;
sScroll="it_sparscr511";
}
else if(nSpell==SPELL_SUMMON_CREATURE_VI)
{
fBaseLevel=66.0;
sScroll="it_sparscr606";
}
else if(nSpell==SPELL_SUMMON_CREATURE_VII)
{
fBaseLevel=91.0;
sScroll="it_sparscr704";
}
else if(nSpell==SPELL_SUMMON_CREATURE_VIII)
{
fBaseLevel=120.0;
sScroll="it_sparscr806";
}
else if(nSpell==SPELL_SUMMON_CREATURE_IX)
{
fBaseLevel=153.0;
sScroll="it_sparscr905";
}
else if(nSpell==SPELL_TENSERS_TRANSFORMATION)
{
fBaseLevel=66.0;
sScroll="it_sparscr615";
}
else if(nSpell==SPELL_TIME_STOP)
{
fBaseLevel=153.0;
sScroll="it_sparscr912";
}
else if(nSpell==SPELL_TRUE_SEEING)
{
fBaseLevel=66.0;
sScroll="it_sparscr607";
}
else if(nSpell==SPELL_VAMPIRIC_TOUCH)
{
fBaseLevel=15.0;
sScroll="it_sparscr312";
}
else if(nSpell==SPELL_WAIL_OF_THE_BANSHEE)
{
fBaseLevel=153.0;
sScroll="it_sparscr910";
}
else if(nSpell==SPELL_WALL_OF_FIRE)
{
fBaseLevel=28.0;
sScroll="it_sparscr408";
}
else if(nSpell==SPELL_WEB)
{
fBaseLevel=6.0;
sScroll="it_sparscr205";
}
else if(nSpell==SPELL_WEIRD)
{
fBaseLevel=153.0;
sScroll="it_sparscr908";
}
// else if(nSpell=) //Find Ultravision spell
// {
// fBaseLevel=.0;
// sScroll="it_sparscr";
// }






else
{
AssignCommand(oCaster,SpeakString("It is not possible to make that spell into a scroll"));
}


if (!(sScroll == "")) {
if(!(nWizLevel==0))
{
fNewXP=(nXP - (fBaseLevel * fXPCost));
nNewXP=FloatToInt(fNewXP);
fGoldCost=(fBaseLevel * 25);
nGoldCost=FloatToInt(fGoldCost);
SetXP(oCaster,nNewXP);
TakeGoldFromCreature(nGoldCost,oCaster,TRUE);
CreateItemOnObject(sScroll,oCaster,1);
}
else if(!(nSorLevel==0))
{
fNewXP=(nXP - (fBaseLevel * fXPCost));
nNewXP=FloatToInt(fNewXP);
fGoldCost=(fBaseLevel * 25);
nGoldCost=FloatToInt(fGoldCost);
SetXP(oCaster,nNewXP);
TakeGoldFromCreature(nGoldCost,oCaster,TRUE);
CreateItemOnObject(sScroll,oCaster,1);
}
else if (!(nBarLevel==0))
{
fNewXP=(nXP - (fBaseLevel * fXPCost));
nNewXP=FloatToInt(fNewXP);
fGoldCost=(fBaseLevel * 25);
nGoldCost=FloatToInt(fGoldCost);
SetXP(oCaster,nNewXP);
TakeGoldFromCreature(nGoldCost,oCaster,TRUE);
CreateItemOnObject(sScroll,oCaster,1);
}
else
AssignCommand(oCaster,SpeakString("You lack the knowledge to create this item."));
}
AssignCommand(oCaster,SpeakString("Made " +sScroll));
CreateItemOnObject(sScroll,OBJECT_SELF,1);
}
