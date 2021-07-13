
//Checks to see if the player has been in the current area and
//if they have not, sends description and awards XP.
//oPC = Player nReveal: 1 = Reveals whole map - 0 = Does not - 2 Hides Map
//Info Type can be classed as the following:
void PlayerExplore(object oPC, int nReveal);

void PlayerExplore(object oPC, int nReveal)
{
    if (!GetIsPC(oPC)) return;
    if (nReveal == 1)ExploreAreaForPlayer(GetArea(oPC), oPC, TRUE);
    if (nReveal == 2)ExploreAreaForPlayer(GetArea(oPC), oPC, FALSE);

//GET AREA DETAILS
    object oArea = GetArea(oPC);
    string sArea = GetTag(oArea);
//DATABASE FUNCTIONS GO HERE
    int nHasExplored = GetCampaignInt("Exploring Athas", sArea, oPC);
        if (nHasExplored == 1) return;
//AREAS START FROM HERE
//ADD ONE "if (sArea =="") FOR EACH AREA YOU WISH TO DESCRIBE

    if (sArea == "AltarukREBUILD")//THE VARIABLE USED IS THE TAG OF THE AREA
        {
        //EDIT THE XP GIVEN AND JOURNAL ENTRY ID NUMBER TO SUIT
        AddJournalQuestEntry("Exploring Athas", 1, oPC, FALSE, FALSE);//ONLY CHANGE THE ID NUMBER
        GiveXPToCreature(oPC, 10);//DEFAULT IS 10 XP
        SetCampaignInt("Exploring Athas", sArea, 1, oPC);//DO NOT CHANGE THIS NUMBER
        return;
        }

    if (sArea == "TheVillageofKled")//THE VARIABLE USED IS THE TAG OF THE AREA
        {
        //EDIT THE XP GIVEN AND JOURNAL ENTRY ID NUMBER TO SUIT
        AddJournalQuestEntry("Exploring Athas", 2, oPC, FALSE, FALSE);//ONLY CHANGE THE ID NUMBER
        GiveXPToCreature(oPC, 10);//DEFAULT IS 10 XP
        SetCampaignInt("Exploring Athas", sArea, 1, oPC);//DO NOT CHANGE THIS NUMBER
        return;
        }

    if (sArea == "CaravanWayREBUILD")//THE VARIABLE USED IS THE TAG OF THE AREA
        {
        //EDIT THE XP GIVEN AND JOURNAL ENTRY ID NUMBER TO SUIT
        AddJournalQuestEntry("Exploring Athas", 3, oPC, FALSE, FALSE);//ONLY CHANGE THE ID NUMBER
        GiveXPToCreature(oPC, 10);//DEFAULT IS 10 XP
        SetCampaignInt("Exploring Athas", sArea, 1, oPC);//DO NOT CHANGE THIS NUMBER
        return;
        }

return;
}

//void main(){}

