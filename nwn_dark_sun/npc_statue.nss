//:: Name: NPC Statues
//:: FileName: npc_statue
// Used to make a sort of "living statue" prop to
// add a bit of eerie ambience to an area.
// 1. Create a custom NPC
// 2. Place whatever you wish in its inventory--
//    torches/light items recommended
// 3. Remove all scripts from NPC
// 4. Place this script in OnSpawn
// 5. Place NPC in area
//
// Created By:  Todmaerin
// Created On:  6/23/02
void main()
{
 // Target NPC
 object oTarget = OBJECT_SELF;

 // Don't want this wearing off now, do we?
 int nDurationType = DURATION_TYPE_PERMANENT;

 // Declare effect1, the paralyze.
 effect eEffect1 = EffectParalyze();

 // Declare effect2, the stoneskin visual
 effect eEffect2 = EffectVisualEffect (VFX_DUR_PROT_STONESKIN);

 // now apply it, and keep it.
 ApplyEffectToObject (nDurationType, eEffect1, oTarget);
 ApplyEffectToObject (nDurationType, eEffect2, oTarget);
 SetPlotFlag(oTarget, TRUE);
}
