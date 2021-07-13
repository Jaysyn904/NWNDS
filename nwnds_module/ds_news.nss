void main()
{
object oPC = GetLastUsedBy();
ExploreAreaForPlayer(GetArea(oPC),oPC);
ExploreAreaForPlayer(GetObjectByTag("AltarukREBUILD"),oPC);
ExploreAreaForPlayer(GetObjectByTag("TheVillageofKled"),oPC);
ExploreAreaForPlayer(GetObjectByTag("TyrMerchantDistrictREBUILD"),oPC);
ExploreAreaForPlayer(GetObjectByTag("NobleQuarters"),oPC);
ExploreAreaForPlayer(GetObjectByTag("TyrNoblesQuartersREBUILD"),oPC);
ExploreAreaForPlayer(GetObjectByTag("TyrSSArena"),oPC);
ExploreAreaForPlayer(GetObjectByTag("GladatorialStadiumFoyer"),oPC);
ExploreAreaForPlayer(GetObjectByTag("TyrTheKingsGardens"),oPC);
ExploreAreaForPlayer(GetObjectByTag("TyrTemplarsQuarters"),oPC);
ExploreAreaForPlayer(GetObjectByTag("TyrTheGoldenCity"),oPC);
ExploreAreaForPlayer(GetObjectByTag("TyrTheWarrens"),oPC);
ActionStartConversation(GetLastUsedBy());

}
