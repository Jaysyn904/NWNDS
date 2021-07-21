//::///////////////////////////////////////////////
//:: FileName ka_haselemstone.nss
/*
    
    Detects the presence of elemental stones
    
*/    
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Kiriani Agriviar
//:: Created On: 
//:://////////////////////////////////////////////

int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetItemPossessedBy(oPC, "crft_coldstone") != OBJECT_INVALID ||
    GetItemPossessedBy(oPC, "crft_brimstone") != OBJECT_INVALID || 
    GetItemPossessedBy(oPC, "crft_acidcrystal") != OBJECT_INVALID || 
    GetItemPossessedBy(oPC, "crft_shokcrystal") != OBJECT_INVALID) 
    
    return TRUE;
    
else return FALSE;
}
