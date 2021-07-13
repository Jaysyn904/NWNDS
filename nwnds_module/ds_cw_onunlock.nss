void main()
{
    object oPlayer = GetLastUnlocked();
    object oKey = GetItemPossessedBy(oPlayer, "elementalkey");
    DestroyObject(oKey);

    string sItem;
    switch (d20())
    {
        case 1: sItem = "fistsofdrunkenma";  break;
        case 2: sItem = "theceruleanarm";  break;
        case 3: sItem = "sunslasher";  break;
        case 4: sItem = "bootsofthedra";  break;
        case 5: sItem = "hadesedge";  break;
        case 6: sItem = "ragnarok";  break;
        case 7: sItem = "severer";  break;
        case 8: sItem = "drakebonegythk";  break;
        case 9: sItem = "grafnaspride";  break;
        case 10: sItem = "devestation";  break;
        case 11: sItem = "villichimaster";  break;
        case 12: sItem = "blackhelmofhusil";  break;
        case 13: sItem = "heredatschainoff";  break;
        case 14: sItem = "lightingstriker";  break;
        case 15: sItem = "imbuedboots";  break;
        case 16: sItem = "kylesboots";  break;
        case 17: sItem = "defilersguise";  break;
        case 18: sItem = "nevasglare";  break;
        case 19: sItem = "drakeivoryblade";  break;
        case 20: sItem = "forgedplateofthe";  break;
    }
    CreateItemOnObject(sItem);
}
