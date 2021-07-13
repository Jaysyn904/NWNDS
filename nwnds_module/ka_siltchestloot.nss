void main()
{
    object oPlayer = GetLastUnlocked();
    object oKey = GetItemPossessedBy(oPlayer, "strangebonekey");
    DestroyObject(oKey);

    string sItem;
    switch (d20())
    {
        case 1: sItem = "robesofthearc";  break;
        case 2: sItem = "robesofthedep";  break;
        case 3: sItem = "imbueddrakeforge";  break;
        case 4: sItem = "phandarashelm";  break;
        case 5: sItem = "pyreenforgedplat";  break;
        case 6: sItem = "rangerspride";  break;
        case 7: sItem = "armoroftheoasis";  break;
        case 8: sItem = "bardssong";  break;
        case 9: sItem = "sanshirswall";  break;
        case 10: sItem = "malifsbuckler";  break;
        case 11: sItem = "villichimasgua";  break;
        case 12: sItem = "beltoftheundying";  break;
        case 13: sItem = "battlebracers";  break;
        case 14: sItem = "jandorasbracers";  break;
        case 15: sItem = "zephrynsgloves";  break;
        case 16: sItem = "bootsofthedra";  break;
        case 17: sItem = "bootsoftheearth";  break;
        case 18: sItem = "bootsoftheblack";  break;
        case 19: sItem = "necromancerscloa";  break;
        case 20: sItem = "torakswrap";  break;
    }
    CreateItemOnObject(sItem);
}
