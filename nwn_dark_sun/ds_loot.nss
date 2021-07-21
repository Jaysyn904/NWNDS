int nRandom = d100();
string sItem;
int nStack = 1;

void dsoCreateItemOnObject(string sItemTemplate, object oTarget = OBJECT_SELF, int nStackSize = 1)
      {
      // Make sure it's a blueprint by trimming to 16 and lowercasing it
//      SpeakString("Will create item "+sItemTemplate+" stack "+IntToString(nStackSize));
      sItemTemplate = GetSubString(sItemTemplate, 0, 16);
      sItemTemplate = GetStringLowerCase(sItemTemplate);
      //SpeakString("Attempting to create item "+sItemTemplate+" stack "+IntToString(nStackSize));
      object oItem = CreateItemOnObject(sItemTemplate, oTarget, nStackSize);
      }

void TrashLoot () {
nRandom = d20();
switch (nRandom)
    {
case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "Bandage";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Bandage";  break;
case 9: sItem = "Ginseng";  break;
case 10: sItem = "Ginseng";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;

    }//switch
//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);

} // TrashLoot


void UberLoot () {
nRandom = d100();
switch (nRandom)
    {
case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "AcidCrystal";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Brimstone";  break;
case 9: sItem = "ChargedCrystal";  break;
case 10: sItem = "IceNine";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;
case 20: sItem = "iconicamuletofch";  break;
case 21: sItem = "iconicamuletofst";  break;
case 22: sItem = "iconicringofdext";  break;
case 23: sItem = "iconicamuletofwi";  break;
case 24: sItem = "iconicringofinte";  break;
case 25: sItem = "iconicringofs";  break;
case 26: sItem = "iconicringofwisd";  break;
case 27: sItem = "iconicamuletofco";  break;
case 28: sItem = "iconicamuletofde";  break;
case 29: sItem = "iconicamuletofin";  break;
case 30: sItem = "iconicringofcons";  break;
case 31: sItem = "jingsgarb";  break;
case 32: sItem = "rhulthaunmaste";  break;
case 33: sItem = "robeofillwill";  break;
case 34: sItem = "phandarashelm";  break;
case 35: sItem = "beastmasterarm";  break;
case 36: sItem = "battleragearmo";  break;
case 37: sItem = "forgedshieldof";  break;
case 38: sItem = "halfbreedsguardi";  break;
case 39: sItem = "girdleofpower";  break;
case 40: sItem = "jandorasgarb";  break;
case 41: sItem = "jandorastiara";  break;
case 42: sItem = "bracersofwardi";  break;
case 43: sItem = "torakswrap";  break;
case 44: sItem = "spectralcloak";  break;
case 45: sItem = "blindingedgegaun";  break;
case 46: sItem = "greaterringofadr";  break;
case 47: sItem = "scorchedaxeof"; break;
case 48: sItem = "ragnarok"; break;
case 49: sItem = "ginosbackstabb"; break;
case 50: sItem = "thecleavelander"; break;
case 51: sItem = "lifesapper"; break;
case 52: sItem = "heartpiercer"; break;
case 53: sItem = "thewifebeater"; break;
case 54: sItem = "theeclipse"; break;
case 55: sItem = "justlshammer"; break;
case 56: sItem = "sunstaff"; break;
case 57: sItem = "destinysedge"; break;
case 58: sItem = "theicyheart"; break;
case 59: sItem = "jandorasbracers"; break;
case 60: sItem = "beastmasterarm"; break;
case 61: sItem = "theoldballandcha"; break;
case 62: sItem = "heartripper"; break;
case 63: sItem = "beastmasterbla"; break;
case 64: sItem = "theharvester"; break;
case 65: sItem = "devestation"; break;
case 66: sItem = "shininggythka"; break;
case 67: sItem = "drakebonegythk"; break;
case 68: sItem = "robesofthewis"; break;
case 69: sItem = "lalorsspine"; break;
case 70: sItem = "psitana"; break;
case 71: sItem = "solarflare"; break;
case 72: sItem = "lalisbliss"; break;
case 73: sItem = "messengerofraj"; break;
case 74: sItem = "embraceofthespir"; break;
case 75: sItem = "regaliaofsanshir"; break;
case 76: sItem = "helmofsanshir"; break;
case 77: sItem = "sanshirswall"; break;
case 78: sItem = "sanshirsfury"; break;
case 79: sItem = "heartofthecalder"; break;
case 80: sItem = "mountainsoul"; break;


    }//switch
//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);

} // UberLoot


void Loot()
{
int nBump = GetHitDice(OBJECT_SELF);
//SpeakString("My hit dice "+IntToString(nBump));




if (nBump < 6) {
switch (nRandom)
    {
case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "AcidCrystal";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Brimstone";  break;
case 9: sItem = "ChargedCrystal";  break;
case 10: sItem = "IceNine";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;

case 15: sItem = "it_thnmisc002";  break;
case 16: sItem = "it_torch002";  break;
case 17: sItem = "it_thnmisc002";  break;
case 18: sItem = "it_msmlmisc024";  break;
case 19: sItem = "it_msmlmisc025";  break;
case 20: sItem = "it_msmlmisc012";  break;
case 21: sItem = "wswss002";  break;
case 22: sItem = "wblcl002";  break;
case 23: sItem = "wblfh002";  break;
case 24: sItem = "BoneLightFlail";  break;
case 25: sItem = "wblhl002";  break;
case 26: sItem = "wblhw002";  break;
case 27: sItem = "wblml002";  break;
case 28: sItem = "wblms002";  break;
case 29: sItem = "DoubleBladedSpear";  break;
case 30: sItem = "wplhb002";  break;
case 31: sItem = "wplss002";  break;
case 32: sItem = "WoodenQuarterstaff";  break;
case 33: sItem = "wbwxh002";  break;
case 34: sItem = "wbwxl002";  break;
case 35: sItem = "wbwln002";  break;
case 36: sItem = "wbwsh002";  break;
case 37: sItem = "wbwsl002";  break;
case 38: sItem = "Compress";  break;
case 39: sItem = "MagicCornJuice";  break;
case 40: sItem = "MagicOrangeJuice";  break;
case 41: sItem = "MagicSpinachJuice";  break;
case 42: sItem = "MagicalBannanaJuice";  break;
case 43: sItem = "AcidCrystal";  break;
case 44: sItem = "Bandage";  break;
case 45: sItem = "Brimstone";  break;
case 46: sItem = "ChargedCrystal";  break;
case 47: sItem = "IceNine";  break;
case 48: sItem = "ErdluBlood";  break;
case 49: sItem = "Ginseng";  break;
case 50: sItem = "Spinach";  break;
case 51: sItem = "Water";  break;
case 52: sItem = "water001";  break;
case 53: sItem = "water002";  break;
case 54: sItem = "aarcl006";           break;
case 55: sItem = "Compress";           break;
case 56: sItem = "aarcl007";   break;
case 57: sItem = "Compress";           break;
case 58: sItem = "aarcl004";   break;
case 59: sItem = "aarcl011";           break;
case 60: sItem = "aarcl010";  break;
case 61: sItem = "aarcl013";  break;
case 62: sItem = "aarcl003";  break;
case 63: sItem = "aarcl002";  break;
case 64: sItem = "aarcl015";  break;
case 65: sItem = "ARHE005";  break;
case 66: sItem = "ARHE002";  break;
case 67: sItem = "ashlw002";  break;
case 68: sItem = "ashsw002";  break;
case 69: sItem = "ashto002";  break;
case 70: sItem = "waxhn002";  break;
case 71: sItem = "wswdg002";  break;
case 72: sItem = "wswls002";  break;
case 73: sItem = "woodenquartersta";  break;
case 74: sItem = "bonescythe";  break;
case 75: sItem = "bonesickle";  break;
case 76: sItem = "bonekama";  break;
case 77: sItem = "alchbasics";  break;



// Stack these  12-50
case 81: sItem = "Chatchka";  break;
case 82: sItem = "wthax002";  break;
case 83: sItem = "wthdt002";  break;
case 84: sItem = "wamar002";  break;
case 85: sItem = "wambo002";  break;
case 86: sItem = "wambu002";  break;
}

//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
//dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);
} // end under 6 chart


if (nBump > 5 && nBump < 11) {
switch (nRandom)
    {
case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "AcidCrystal";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Brimstone";  break;
case 9: sItem = "ChargedCrystal";  break;
case 10: sItem = "IceNine";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;


case 20: sItem = "aarcl008";  break;
case 21: sItem = "aarcl012";  break;
case 22: sItem = "aarcl009";  break;
case 23: sItem = "ironhelmet";  break;
case 24: sItem = "spelunkershelm";  break;
case 25: sItem = "aarcl014";  break;
case 26: sItem = "aarcl005";  break;
case 27: sItem = "ashmlw003";  break;
case 28: sItem = "ashmsw003";  break;
case 29: sItem = "ashmto003";  break;
case 30: sItem = "bookoflore";  break;
case 31: sItem = "bracersofdefense";  break;
case 32: sItem = "cloakofcamoflaug";  break;
case 33: sItem = "lesseramuletofin";  break;
case 34: sItem = "lesseramuletofst";  break;
case 35: sItem = "lesseramuletofwi";  break;
case 36: sItem = "lesserringofinte";  break;
case 37: sItem = "lesserringofwisd";  break;
case 38: sItem = "basichealersk";  break;
case 39: sItem = "it_contain003";  break;
case 40: sItem = "adventurersamule";  break;
case 41: sItem = "arachnidsnecklac";  break;
case 42: sItem = "waxgr002";  break;
case 43: sItem = "waxmhn003";  break;
case 44: sItem = "waxbt002";  break;
case 45: sItem = "wswmbs003";  break;
case 46: sItem = "wswmdg003";  break;
case 47: sItem = "wswmgs003";  break;
case 48: sItem = "wswmls003";  break;
case 49: sItem = "wswmrp003";  break;
case 50: sItem = "wswmsc003";  break;
case 51: sItem = "wswmss003";  break;
case 52: sItem = "ironspikedclub";  break;
case 53: sItem = "wblmfl003";  break;
case 54: sItem = "wblmfh003";  break;
case 55: sItem = "wblmhl003";  break;
case 56: sItem = "wblmhw003";  break;
case 57: sItem = "wblmml003";  break;
case 58: sItem = "wblmms003";  break;
case 59: sItem = "wandofmissiles";  break;
case 60: sItem = "wplmhb003";  break;
case 61: sItem = "wplmss003";  break;
case 62: sItem = "giantslayersling";  break;
case 63: sItem = "ironscalemail";  break;
case 64: sItem = "irondoubleblad";  break;
case 65: sItem = "ironkukri";  break;
case 66: sItem = "IronKama";  break;
case 67: sItem = "IronScythe";  break;
case 68: sItem = "IronSickle";  break;
case 69: sItem = "ironshodquarte";  break;
case 70: sItem = "parryingdagger";  break;
case 71: sItem = "lesseramuletofco";  break;
case 72: sItem = "lesseramuletofde";  break;
case 73: sItem = "lesserringofstre";  break;
case 74: sItem = "lesserringofdext";  break;
case 75: sItem = "lesserringofcons";  break;
case 76: sItem = "lesseramuletofch";  break;
case 77: sItem = "lesserringofchar";  break;
case 78: sItem = "vineclothing"; break;
case 79: sItem = "cloakofwarding"; break;
case 81: sItem = "bloodgrassbolts";  break;
case 82: sItem = "bloodgrassarrow";  break;
case 83: sItem = "timiristhorn";  break;
case 84: sItem = "preciousbootsofr";  break;
case 85: sItem = "jeweledglovesofs";  break;
case 86: sItem = "alchbasics2";  break;
case 87: sItem = "alchbasics3";  break;
case 88: sItem = "bookofelementa";  break;
case 89: sItem = "bookofelemenweap";  break;
case 90: sItem = "charmofprotect";  break;
case 91: sItem = "glovesofdeftne";  break;
case 92: sItem = "charmofprotect";  break;
case 93: sItem = "it_mglove005";  break;
case 94: sItem = "charmofprotect";  break;
case 95: sItem = "glovesofpilfer";  break;
case 96: sItem = "glovesofthegl";  break;
case 97: sItem = "glovesoftheta";  break;
case 98: sItem = "elvenboots";  break;
case 99: sItem = "sandalsofnimbl";  break;
case 100: sItem = "toolbelt";  break;
} // switch
//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
//dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);
} // if

if (nBump > 10 && nBump < 16) {
switch (nRandom)
    {


case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "AcidCrystal";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Brimstone";  break;
case 9: sItem = "ChargedCrystal";  break;
case 10: sItem = "IceNine";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;


case 20: sItem = "shroudofdecay";  break;
case 21: sItem = "ringofdexterity";  break;
case 22: sItem = "agafarireinforce";  break;
case 23: sItem = "ashmlw004";  break;
case 24: sItem = "ashmsw004";  break;
case 25: sItem = "ashmto004";  break;
case 26: sItem = "agararimedshield";  break;
case 27: sItem = "agararismshield";  break;
case 28: sItem = "smallshieldofpro";  break;
case 29: sItem = "amuletofcharisma";  break;
case 30: sItem = "mirrorshield";  break;
case 31: sItem = "towershieldofspe";  break;
case 32: sItem = "gladiatorsgauntl";  break;
case 33: sItem = "glovesoftheeleme";  break;
case 34: sItem = "amuletofintellig";  break;
case 35: sItem = "amuletofstrength";  break;
case 36: sItem = "amuletofwisdom";  break;
case 37: sItem = "defilersgreed";  break;
case 38: sItem = "dispelring";  break;
case 39: sItem = "ringofintelligen";  break;
case 40: sItem = "ringofpolymorph";  break;
case 41: sItem = "ringofwisdom";  break;
case 42: sItem = "ringofcharisma";  break;
case 43: sItem = "fireaxe001";  break;
case 44: sItem = "wandoflightning";  break;
case 45: sItem = "steelbandedmai";  break;
case 46: sItem = "steelhelmet";  break;
case 47: sItem = "steelchainshir";  break;
case 48: sItem = "steelringmail";  break;
case 49: sItem = "steelstuddedar";  break;
case 50: sItem = "steelchainmail";  break;
case 51: sItem = "steelscalemail";  break;
case 52: sItem = "steelgreataxe";  break;
case 53: sItem = "steelhandaxe";  break;
case 54: sItem = "steelbattleaxe";  break;
case 55: sItem = "steelbastardsw";  break;
case 56: sItem = "steeldagger";  break;
case 57: sItem = "steelgreatsword";  break;
case 58: sItem = "steellongsword";  break;
case 59: sItem = "steelrapier";  break;
case 60: sItem = "steelscimitar";  break;
case 61: sItem = "steelshortswor";  break;
case 62: sItem = "steelspikedclu";  break;
case 63: sItem = "steelflail";  break;
case 64: sItem = "steelheavyflai";  break;
case 65: sItem = "steellighthamm";  break;
case 66: sItem = "steelwarhammer";  break;
case 67: sItem = "steelmace";  break;
case 68: sItem = "steelmorningsta";  break;
case 69: sItem = "steeldoublebla";  break;
case 70: sItem = "SteelKama";  break;
case 71: sItem = "SteelKukri";  break;
case 72: sItem = "SteelScythe";  break;
case 73: sItem = "steelsickle";  break;
case 74: sItem = "SteelHalberd";  break;
case 75: sItem = "SteelSpear";  break;
case 76: sItem = "steelshodquart";  break;
case 77: sItem = "amuletofconstitu";  break;
case 78: sItem = "amuletofdexterit";  break;
case 79: sItem = "ringofconstituti";  break;
case 80: sItem = "ringofstrength";  break;
case 81: sItem = "glitteringchatck";  break;
case 82: sItem = "zombieberries";  break;
case 83: sItem = "steelthrowinga";  break;
case 84: sItem = "steelthrowingd";  break;
case 85: sItem = "robeofmysticrune"; break;
case 86: sItem = "gridshands"; break;
case 87: sItem = "wrensbow"; break;
case 88: sItem = "steelstuddedgaun"; break;
case 89: sItem = "alassrashope"; break;
case 90: sItem = "greatersandston"; break;
case 91: sItem = "bookofgreaterele"; break;
case 92: sItem = "forestcloak"; break;
case 93: sItem = "bookofelemclothi"; break;
case 94: sItem = "mekillothidela"; break;
case 95: sItem = "kankshellbrace"; break;
case 96: sItem = "mekillothidehe"; break;
case 97: sItem = "mekillothidear"; break;
case 98: sItem = "mekillothideligh"; break;
case 99: sItem = "mekillothidmed"; break;
case 100: sItem = "mekillothidesm"; break;


    }  //switch
//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
//dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);
} //if
if (nBump > 15 && nBump < 20) {
switch (nRandom)
    {
case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "AcidCrystal";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Brimstone";  break;
case 9: sItem = "ChargedCrystal";  break;
case 10: sItem = "IceNine";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;


case 20: sItem = "mcloth009";  break;
case 21: sItem = "mcloth016";  break;
case 22: sItem = "cloth014";  break;
case 23: sItem = "cloth008";  break;
case 24: sItem = "mcloth015";  break;
case 25: sItem = "mcloth008";  break;
case 26: sItem = "cloth005";  break;
case 27: sItem = "agafariplate";  break;
case 28: sItem = "maarcl054";  break;
case 29: sItem = "dragonforgedhelm";  break;
case 30: sItem = "eagleeyehelmet";  break;
case 31: sItem = "helmofeyes";  break;
case 32: sItem = "thieveshood";  break;
case 33: sItem = "agafaribreastpla";  break;
case 34: sItem = "it_mboots006";  break;
case 35: sItem = "cloakofthewastes";  break;
case 36: sItem = "necromancerscloa";  break;
case 37: sItem = "dragonforgedgaun";  break;
case 39: sItem = "ringofcontrolled";  break;
case 40: sItem = "it_mring006";  break;
case 41: sItem = "advancedhealer";  break;
case 42: sItem = "hornofaknar";  break;
case 43: sItem = "rockstemcleaver";  break;
case 44: sItem = "rockstemchopper";  break;
case 45: sItem = "rockstemcutter";  break;
case 46: sItem = "diseasedbastards";  break;
case 47: sItem = "dewsticker";  break;
case 48: sItem = "dewstalk";  break;
case 49: sItem = "dewslicer";  break;
case 50: sItem = "dewstabber";  break;
case 51: sItem = "lesserwarhammero";  break;
case 52: sItem = "rodofteeth";  break;
case 53: sItem = "flamethrower";  break;
case 54: sItem = "tempest";  break;
case 55: sItem = "steelhalfplate";  break;
case 56: sItem = "steelplatemail";  break;
case 57: sItem = "hugoshand"; break;
case 58: sItem = "mysticarrow";  break;
case 59: sItem = "mysticbolt";  break;
case 60: sItem = "giantslayerstone";  break;
case 61: sItem = "kapow"; break;
case 62: sItem = "theentertainer"; break;
case 63: sItem = "rockstemhacker"; break;
case 64: sItem = "ringofclairsen"; break;
case 65: sItem = "ebonlotulis"; break;
case 66: sItem = "imbuedbardsfr"; break;
case 67: sItem = "gemofseeing"; break;
case 68: sItem = "sharpshadowblad"; break;
case 69: sItem = "rangersbeltof"; break;
case 70: sItem = "tarilsjournalone"; break;
case 71: sItem = "tarilsjournaltwo"; break;

    }  //switch
//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
//dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);
} //if

if (nBump > 19 && nBump < 25) {
switch (nRandom)
    {
case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "AcidCrystal";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Brimstone";  break;
case 9: sItem = "ChargedCrystal";  break;
case 10: sItem = "IceNine";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;

case 20: sItem = "spiderarmor";  break;
case 21: sItem = "championsbuckle";  break;
case 22: sItem = "preserversgloves";  break;
case 23: sItem = "amuletofstealth";  break;
case 24: sItem = "greateramuletofi";  break;
case 25: sItem = "greateramuletofs";  break;
case 26: sItem = "greateramuletofw";  break;
case 27: sItem = "greaterringofint";  break;
case 28: sItem = "greaterringofwis";  break;
case 29: sItem = "experthealers";  break;
case 30: sItem = "heartofashelgora";  break;
case 31: sItem = "athasianheat";  break;
case 32: sItem = "hadesedge";  break;
case 33: sItem = "helswrath";  break;
case 34: sItem = "steakknife";  break;
case 35: sItem = "thekeeperofbalan";  break;
case 36: sItem = "masblade";  break;
case 37: sItem = "drakeivoryblade";  break;
case 38: sItem = "thewhacker";  break;
case 39: sItem = "insanityscrescen";  break;
case 40: sItem = "greateramuletofh";  break;
case 41: sItem = "greaterringofcha";  break;
case 42: sItem = "villichigarb";  break;
case 43: sItem = "ninelivessteal";  break;
case 44: sItem = "crushblow";  break;
case 45: sItem = "starofmourning";  break;
case 46: sItem = "preservershope";  break;
case 47: sItem = "eyegouger";  break;
case 48: sItem = "pandorasbow";  break;
case 49: sItem = "greateramuletofc";  break;
case 50: sItem = "greateramuletofd";  break;
case 51: sItem = "greaterringofcon";  break;
case 52: sItem = "greaterringofdex";  break;
case 53: sItem = "greaterringofstr";  break;
case 54: sItem = "dragonforgedboot"; break;
case 55: sItem = "soracksbreeches"; break;
case 56: sItem = "magnificationlen"; break;
case 57: sItem = "greatercloakof"; break;
case 58: sItem = "dwarfhideboots"; break;
case 59: sItem = "lifeslasher"; break;
case 60: sItem = "sureshot"; break;
case 61: sItem = "phrinsbow"; break;
case 62: sItem = "luteofzephyr"; break;
case 63: sItem = "garraouksedge"; break;
case 64: sItem = "livingsash"; break;
case 65: sItem = "beltofinertial"; break;
case 66: sItem = "ashenshield"; break;
case 67: sItem = "lifeshapedsmal"; break;
case 68: sItem = "lifeshapedlarg"; break;
case 69: sItem = "bonebreaker"; break;
case 70: sItem = "koshisfriend"; break;
case 71: sItem = "strangescroll"; break;

    } //switch
//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
//dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);
} //if

if (nBump > 24 && nBump < 40) {
switch (nRandom)
    {
case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "AcidCrystal";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Brimstone";  break;
case 9: sItem = "ChargedCrystal";  break;
case 10: sItem = "IceNine";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;

case 20: sItem = "dragonforgedplat";  break;
case 21: sItem = "defilersbane";  break;
case 22: sItem = "deadmanshide";  break;
case 23: sItem = "protectorofthegl";  break;
case 24: sItem = "lichhaircloak";  break;
case 25: sItem = "mastersamuletofi";  break;
case 26: sItem = "mastersamuletofs";  break;
case 27: sItem = "mastersamuletofw";  break;
case 28: sItem = "mastersringofint";  break;
case 29: sItem = "mastersringofwis";  break;
case 30: sItem = "ringofhate";  break;
case 31: sItem = "dragonforgedbast";  break;
case 32: sItem = "faynorsfang";  break;
case 33: sItem = "screamingscimita";  break;
case 34: sItem = "silentscream";  break;
case 35: sItem = "chiblade";  break;
case 36: sItem = "staffoftheomega";  break;
case 37: sItem = "staffofdefense";  break;
case 38: sItem = "staffofthehumble";  break;
case 39: sItem = "it_msmlmisc017";  break;
case 40: sItem = "mastersamuletofc";  break;
case 41: sItem = "mastersamuletofd";  break;
case 42: sItem = "mastersringofcon";  break;
case 43: sItem = "mastersringofdex";  break;
case 44: sItem = "mastersringofstr";  break;
case 45: sItem = "mastersamuletofh";  break;
case 46: sItem = "mastersringofcha";  break;
case 47: sItem = "midnightstar"; break;
case 48: sItem = "shocker"; break;
case 49: sItem = "sunrunnerring"; break;
case 50: sItem = "helmetofforeseei"; break;
case 51: sItem = "lichsgreedring"; break;
case 52: sItem = "forgottenaxe"; break;
case 53: sItem = "ekairfather"; break;
case 54: sItem = "magicacornjui002"; break;
case 55: sItem = "drakeforgedgreat"; break;
case 56: sItem = "zanscord"; break;
case 57: sItem = "thesunbasher"; break;
case 58: sItem = "jazstsboots"; break;
case 59: sItem = "bootsofthedra"; break;
case 60: sItem = "thestoryteller"; break;
case 61: sItem = "ceruleanslasher"; break;
case 62: sItem = "severer"; break;
case 63: sItem = "shieldofraging"; break;
case 64: sItem = "imbuedtalid"; break;
case 65: sItem = "bastionsblade"; break;
case 66: sItem = "robeofthewis"; break;
case 67: sItem = "giantsarmbow"; break;
case 68: sItem = "bowoftheguardedl"; break;
case 69: sItem = "possessedshortbo"; break;
case 70: sItem = "deadaimheavyc"; break;
case 71: sItem = "deadaimcrossbo"; break;
case 72: sItem = "gemidansharp"; break;
case 73: sItem = "theceruleanarm"; break;
case 74: sItem = "lalorsspine"; break;
case 75: sItem = "staffofthebla"; break;
case 76: sItem = "staffofthegra"; break;
case 77: sItem = "bootsoftheearth"; break;
case 78: sItem = "starofbodach"; break;
case 79: sItem = "baneofearth"; break;
case 80: sItem = "galianschain"; break;
case 81: sItem = "strangescroll"; break;

        } //switch
//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
//dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);
} //if
if (nBump > 40 && nBump < 60) {
switch (nRandom)
    {
case 1: sItem = "Compress";  break;
case 2: sItem = "MagicCornJuice";  break;
case 3: sItem = "MagicOrangeJuice";  break;
case 4: sItem = "MagicSpinachJuice";  break;
case 5: sItem = "MagicalBannanaJuice";  break;
case 6: sItem = "AcidCrystal";  break;
case 7: sItem = "Bandage";  break;
case 8: sItem = "Brimstone";  break;
case 9: sItem = "ChargedCrystal";  break;
case 10: sItem = "IceNine";  break;
case 11: sItem = "ErdluBlood";  break;
case 12: sItem = "Ginseng";  break;
case 13: sItem = "Spinach";  break;
case 14: sItem = "Water";  break;

case 20: sItem = "imbueddraqomanbl";  break;
case 21: sItem = "dregothsrage";  break;
case 22: sItem = "heartofthecalder";  break;
case 23: sItem = "thearmofdrego";  break;
case 24: sItem = "beastmasterarm";  break;
case 25: sItem = "iconicamuletofch";  break;
case 26: sItem = "iconicringofdext";  break;
case 27: sItem = "iconicamuletofst";  break;
case 28: sItem = "iconicamuletofwi";  break;
case 29: sItem = "iconicringofinte";  break;
case 30: sItem = "iconicringofs";  break;
case 31: sItem = "jingsgarb";  break;
case 32: sItem = "rhulthaunmaste";  break;
case 33: sItem = "robeofillwill";  break;
case 34: sItem = "phandarashelm";  break;
case 35: sItem = "forgedshieldof";  break;
case 36: sItem = "halfbreedsguardi";  break;
case 37: sItem = "girdleofpower";  break;
case 38: sItem = "jandorasgarb";  break;
case 39: sItem = "jandorastiara";  break;
case 40: sItem = "bracersofwardi";  break;
case 41: sItem = "torakswrap";  break;
case 42: sItem = "iconicringofwisd";  break;
case 43: sItem = "iconicamuletofco";  break;
case 44: sItem = "iconicamuletofde";  break;
case 45: sItem = "iconicringofchar";  break;
case 46: sItem = "iconicamuletofin";  break;
case 47: sItem = "iconicringofcons"; break;
case 48: sItem = "spectralcloak"; break;
case 49: sItem = "blindingedgegaun"; break;
case 50: sItem = "staffoftime"; break;
case 51: sItem = "bootsofevasion"; break;
case 52: sItem = "bloodbonearmor"; break;
case 53: sItem = "greaterringofadr"; break;
case 54: sItem = "scorchedaxeof"; break;
case 55: sItem = "giftoftheelem"; break;
case 56: sItem = "ragnarok"; break;
case 57: sItem = "ginosbackstabb"; break;
case 58: sItem = "jazstsboots"; break;
case 59: sItem = "bootsofthedra"; break;
case 60: sItem = "shimmeringblade"; break;
case 61: sItem = "thecleavelander"; break;
case 62: sItem = "lifesapper"; break;
case 63: sItem = "heartpiercer"; break;
case 64: sItem = "thewifebeater"; break;
case 65: sItem = "theeclipse"; break;
case 66: sItem = "justlshammer"; break;
case 67: sItem = "sunstaff"; break;
case 68: sItem = "theicyheart"; break;
case 69: sItem = "possessedshortbo"; break;
case 70: sItem = "theoldballandcha"; break;
case 71: sItem = "theharvester"; break;
case 72: sItem = "gemidansharp"; break;
case 73: sItem = "imbueddraqomanch"; break;
case 74: sItem = "lalorsspine"; break;
case 75: sItem = "destinysedge"; break;
case 76: sItem = "harbringerofsilt"; break;
case 77: sItem = "mindshatterflail"; break;
case 78: sItem = "nightstalker"; break;
case 79: sItem = "psimitar"; break;
case 80: sItem = "soulsharvest"; break;
case 81: sItem = "ds_a8_gorgoth001"; break;
case 82: sItem = "ds_h0_gorgoth001"; break;
case 83: sItem = "embraceofthespir"; break;
case 84: sItem = "devestation"; break;
case 85: sItem = "drakebonegythk"; break;
case 86: sItem = "guardianofthe"; break;
case 87: sItem = "heartofland"; break;
case 88: sItem = "messengerofraj"; break;
case 89: sItem = "retscutter"; break;
case 90: sItem = "solarflare"; break;
case 91: sItem = "lalisbliss"; break;
case 92: sItem = "shimmeringblade"; break;
case 93: sItem = "thecleavelander"; break;
case 94: sItem = "gauntletsoffai"; break;
case 95: sItem = "regaliaofsanshir"; break;
case 96: sItem = "helmofsanshir"; break;
case 97: sItem = "sanshirswall"; break;
case 98: sItem = "sanshirsfury"; break;
case 99: sItem = "heartofthecalder"; break;

    }


    // switch
//if (nRandom > 80)
//nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
//dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);
}//if

if (nRandom > 80)
nStack = 10+d20(2);
//SpeakString("Item rolled case "+IntToString(nRandom)+" sItem "+sItem+" Stack "+IntToString(nStack));
dsoCreateItemOnObject(sItem,OBJECT_SELF,nStack);


if (nBump > 56 && nBump < 61) {
UberLoot();
}

if (nBump > 58) {
int nTries =0;
int nDrops = d4();
while (nTries < nDrops) {

UberLoot();
nTries++;
}


}

}

//void main()
//{
//Loot();
//}
