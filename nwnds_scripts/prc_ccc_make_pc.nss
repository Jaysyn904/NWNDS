#include "prc_alterations"
#include "inc_letocommands"
#include "prc_racial_const"
#include "ccc_inc_convo"
// #include "inc_encrypt"
#include "prc_class_const"

void main()
{
    //define some varaibles
    object oPC = OBJECT_SELF;
    int i;
    //get some stored data
    int         nStr =              GetLocalInt(oPC, "Str");
    int         nDex =              GetLocalInt(oPC, "Dex");
    int         nCon =              GetLocalInt(oPC, "Con");
    int         nInt =              GetLocalInt(oPC, "Int");
    int         nWis =              GetLocalInt(oPC, "Wis");
    int         nCha =              GetLocalInt(oPC, "Cha");

    int         nRace =             GetLocalInt(oPC, "Race");

    int         nClass =            GetLocalInt(oPC, "Class");
    int         nHitPoints =        GetLocalInt(oPC, "HitPoints");

    int         nSex =              GetLocalInt(oPC, "Gender");

    int         nOrder =            GetLocalInt(oPC, "LawfulChaotic");
    int         nMoral =            GetLocalInt(oPC, "GoodEvil");
    
    int         nSkillPointsSaved=  GetLocalInt(oPC, "SavedSkillPoints");


    int         nFamiliar =         GetLocalInt(oPC, "Familiar");

    int         nAnimalCompanion =  GetLocalInt(oPC, "Companion");

    int         nDomain1 =          GetLocalInt(oPC, "Domain1");
    int         nDomain2 =          GetLocalInt(oPC, "Domain2");

    int         nSchool =           GetLocalInt(oPC, "School");
    
    int         nSpellsPerDay0 =    GetLocalInt(oPC, "SpellsPerDay0");
    int         nSpellsPerDay1 =    GetLocalInt(oPC, "SpellsPerDay1");


    int         nVoiceset =         GetLocalInt(oPC, "Soundset");
    int         nSkin =             GetLocalInt(oPC, "Skin");
    int         nHair =             GetLocalInt(oPC, "Hair");
    int         nTattooColour1 =    GetLocalInt(oPC, "TattooColour1");
    int         nTattooColour2 =    GetLocalInt(oPC, "TattooColour2");


    //clear existing stuff
    string sScript;
    sScript += LetoDelete("FeatList");
    sScript += LetoDelete("ClassList");
    sScript += LetoDelete("LvlStatList");
    sScript += LetoDelete("SkillList");
    sScript += LetoAdd("FeatList", "", "list");
    sScript += LetoAdd("ClassList", "", "list");
    sScript += LetoAdd("LvlStatList", "", "list");
    sScript += LetoAdd("SkillList", "", "list");

    //Sex
    sScript += SetGender(nSex);

    //Race
    sScript += SetRace(nRace);

    //Class
    sScript += LetoAdd("ClassList/Class", IntToString(nClass), "int");
    sScript += LetoAdd("ClassList/[0]/ClassLevel", "1", "short");
    sScript += LetoAdd("LvlStatList/LvlStatClass", IntToString(nClass), "byte");
    sScript += LetoAdd("LvlStatList/[0]/EpicLevel", "0", "byte");
    sScript += LetoAdd("LvlStatList/[0]/LvlStatHitDie", IntToString(nHitPoints), "byte");
    sScript += LetoAdd("LvlStatList/[0]/FeatList", "", "list");
    sScript += LetoAdd("LvlStatList/[0]/SkillList", "", "list");

    //Alignment
    sScript += LetoSet("LawfulChaotic", IntToString(nOrder), "byte");
    sScript += LetoSet("GoodEvil", IntToString(nMoral), "byte");

    //Familiar
    //has a random name
    if((nClass == CLASS_TYPE_WIZARD ||
        nClass == CLASS_TYPE_DEFILER ||
        nClass == CLASS_TYPE_SORCERER)
            && !GetPRCSwitch(PRC_PNP_FAMILIARS))
    {
        sScript += LetoSet("FamiliarType", IntToString(nFamiliar), "int");
        if(GetFamiliarName(oPC) == "")
            sScript += LetoSet("FamiliarName", RandomName(NAME_FAMILIAR), "string");
    }

    //Animal Companion
    //has a random name
    if(nClass == CLASS_TYPE_DRUID)
    {
        sScript += LetoSet("CompanionType", IntToString(nAnimalCompanion), "int");
        if(GetAnimalCompanionName(oPC) == "")
            sScript += LetoSet("CompanionName", RandomName(NAME_ANIMAL), "string");
    }

    //Domains
    if(nClass == CLASS_TYPE_CLERIC)
    {
        // fix for air domain being 0
        if (nDomain1 == -1)
            nDomain1 = 0;
        if (nDomain2 == -1)
            nDomain2 = 0;
        sScript += LetoAdd("ClassList/[0]/Domain1", IntToString(nDomain1), "byte");
        sScript += LetoAdd("ClassList/[0]/Domain2", IntToString(nDomain2), "byte");
    }

    //Ability Scores
    sScript += SetAbility(ABILITY_STRENGTH, nStr);
    sScript += SetAbility(ABILITY_DEXTERITY, nDex);
    sScript += SetAbility(ABILITY_CONSTITUTION, nCon);
    sScript += SetAbility(ABILITY_INTELLIGENCE, nInt);
    sScript += SetAbility(ABILITY_WISDOM, nWis);
    sScript += SetAbility(ABILITY_CHARISMA, nCha);

    //Feats
    //Make sure the list exists
    //Populate the list from array
    for(i=0;i<array_get_size(oPC, "Feats"); i++)
    {
        string si = IntToString(i);
        int nFeatID =array_get_int(oPC, "Feats", i);
        if(nFeatID != 0)
        {
            if(nFeatID == -1)//alertness fix
                nFeatID = 0;
            DoDebug("Feat array positon "+IntToString(i)+" is "+IntToString(nFeatID));
            sScript += LetoAdd("FeatList/Feat", IntToString(nFeatID), "word");
            sScript += LetoAdd("LvlStatList/[0]/FeatList/Feat", IntToString(nFeatID), "word");
        }
    }

    //Skills
    for (i=0;i<=GetPRCSwitch(FILE_END_SKILLS);i++)
    {
        sScript += LetoAdd("SkillList/Rank", IntToString(array_get_int(oPC, "Skills", i)), "byte");
        sScript += LetoAdd("LvlStatList/[_]/SkillList/Rank", IntToString(array_get_int(oPC, "Skills", i)), "byte");
    }
    sScript += LetoAdd("SkillPoints", IntToString(nSkillPointsSaved), "word");
    sScript += LetoAdd("LvlStatList/[_]/SkillPoints", IntToString(nSkillPointsSaved), "word");
    
    // saved skill points - this is set regardless to stop the skill point exploit
    sScript += LetoSet("SkillPoints", IntToString(nSkillPointsSaved), "word");

    //Spells
    if(nClass == CLASS_TYPE_WIZARD || nClass == CLASS_TYPE_DEFILER) // NWN Dark Sun class
    {
        sScript += LetoAdd("ClassList/[_]/KnownList0", "", "list");
        sScript += LetoAdd("ClassList/[_]/KnownList1", "", "list");
        sScript += LetoAdd("LvlStatList/[_]/KnownList0", "", "list");
        sScript += LetoAdd("LvlStatList/[_]/KnownList1", "", "list");
        for (i=0;i<array_get_size(oPC, "SpellLvl0");i++)
        {
            sScript += LetoAdd("ClassList/[_]/KnownList0/Spell", IntToString(array_get_int(oPC, "SpellLvl0", i)), "word");
            sScript += LetoAdd("LvlStatList/[_]/KnownList0/Spell", IntToString(array_get_int(oPC, "SpellLvl0", i)), "word");
        }
        for (i=0;i<array_get_size(oPC, "SpellLvl1");i++)
        {
            sScript += LetoAdd("ClassList/[_]/KnownList1/Spell", IntToString(array_get_int(oPC, "SpellLvl1", i)), "word");
            sScript += LetoAdd("LvlStatList/[_]/KnownList1/Spell", IntToString(array_get_int(oPC, "SpellLvl1", i)), "word");
        }
        //throw spellschoool in here too
        if(GetPRCSwitch(PRC_PNP_SPELL_SCHOOLS))
            sScript += LetoAdd("ClassList/[_]/School", IntToString(9), "byte");
        else
            sScript += LetoAdd("ClassList/[_]/School", IntToString(nSchool), "byte");
    }
    else if (nClass == CLASS_TYPE_BARD)
    {
        sScript += LetoAdd("ClassList/[_]/KnownList0", "", "list");
        sScript += LetoAdd("ClassList/[_]/SpellsPerDayList", "", "list");
        sScript += LetoAdd("LvlStatList/[_]/KnownList0", "", "list");
        for (i=0;i<array_get_size(oPC, "SpellLvl0");i++)
        {
            sScript += LetoAdd("ClassList/[_]/KnownList0/Spell", IntToString(array_get_int(oPC, "SpellLvl0", i)), "word");
            sScript += LetoAdd("LvlStatList/[_]/KnownList0/Spell", IntToString(array_get_int(oPC, "SpellLvl0", i)), "word");
        }
        //spells per day
        sScript += LetoAdd("ClassList/[_]/SpellsPerDayList/NumSpellsLeft", IntToString(nSpellsPerDay0), "word");
    }
    else if (nClass == CLASS_TYPE_SORCERER)
    {
        sScript += LetoAdd("ClassList/[_]/KnownList0", "", "list");
        sScript += LetoAdd("ClassList/[_]/KnownList1", "", "list");
        sScript += LetoAdd("ClassList/[_]/SpellsPerDayList", "", "list");
        sScript += LetoAdd("LvlStatList/[_]/KnownList0", "", "list");
        sScript += LetoAdd("LvlStatList/[_]/KnownList1", "", "list");
        for (i=0;i<array_get_size(oPC, "SpellLvl0");i++)
        {
            sScript += LetoAdd("ClassList/[_]/KnownList0/Spell", IntToString(array_get_int(oPC, "SpellLvl0", i)), "word");
            sScript += LetoAdd("LvlStatList/[_]/KnownList0/Spell", IntToString(array_get_int(oPC, "SpellLvl0", i)), "word");
        }
        for (i=0;i<array_get_size(oPC, "SpellLvl1");i++)
        {
            sScript += LetoAdd("ClassList/[_]/KnownList1/Spell", IntToString(array_get_int(oPC, "SpellLvl1", i)), "word");
            sScript += LetoAdd("LvlStatList/[_]/KnownList1/Spell", IntToString(array_get_int(oPC, "SpellLvl1", i)), "word");
        }
        //spells per day
        sScript += LetoAdd("ClassList/[_]/SpellsPerDayList/NumSpellsLeft", IntToString(nSpellsPerDay0), "word");
        sScript += LetoAdd("ClassList/[_]/SpellsPerDayList/NumSpellsLeft", IntToString(nSpellsPerDay1), "word");
    }

    //Appearance stuff

    if(nVoiceset != -1) //keep existing voiceset
        sScript += LetoSet("SoundSetFile", IntToString(nVoiceset), "word");
    if(nSkin != -1) // keep existing skin colour
        sScript += SetSkinColor(nSkin);
    if(nHair != -1) // keep existing hair colour
        sScript += SetHairColor(nHair);
    if (nTattooColour1 != -1)
        sScript += SetTattooColor(nTattooColour1, 1);
    if (nTattooColour2 != -1)
        sScript += SetTattooColor(nTattooColour2, 2);
    
    sScript += LetoSet("Tag", Encrypt(oPC), "string");
    //give an XP so the XP switch works
    SetXP(oPC, 1);

    SetLocalInt(oPC, "StopRotatingCamera", TRUE);
    SetCutsceneMode(oPC, FALSE);
    // clean up local variables
    DoCleanup();
    object oClone = GetLocalObject(oPC, "Clone");
    AssignCommand(oClone, SetIsDestroyable(TRUE));
    DestroyObject(oClone);
    //do anti-hacker stuff
    SetPlotFlag(oPC, FALSE);
    SetImmortal(oPC, FALSE);
    AssignCommand(oPC, SetIsDestroyable(TRUE));
    // removes the cutscene paralysis and invisibility
    ForceRest(oPC);
    // let the convoCC be used by someone else
    DeleteLocalObject(GetModule(), "ccc_active_pc");
    // Here's where the custom PW script is run if the switch is set
    if(GetPRCSwitch(PRC_CONVOCC_CUSTOM_EXIT_SCRIPT))
    {
        ExecuteScript("ccc_custom_exit", oPC);
    }
    StackedLetoScript(sScript);

    RunStackedLetoScriptOnObject(oPC, "OBJECT", "SPAWN");
}
