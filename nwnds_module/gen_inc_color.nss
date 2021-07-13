// Genji Include Color gen_inc_color
// first: 1-4-03

// requires a waypoint called "dm_vault_drop" in a dm only area,
// and genji's coloring book placeable "gen_coloringbook". Which should have been downloaded with this.

// --------------------------------------------------------------[ function prototypes ]

// simple function to use the name of a item holding escape sequences that, though they will not compile,
// they can be interpreted at run time and produce rbg scales between 32 and 255 in increments.
// -- allows 3375 colors to be made.
// for example SendMessageToPC(pc,GetRGB(15,15,1)+ "Help, I'm on fire!") will produce yellow text.
// more examples:
/*
    GetRGB() := WHITE // no parameters, default is white
    GetRGB(15,15,1):= YELLOW
    GetRGB(15,5,1) := ORANGE
    GetRGB(15,1,1) := RED
    GetRGB(7,7,15) := BLUE
    GetRGB(1,15,1) := NEON GREEN
    GetRGB(1,11,1) := GREEN
    GetRGB(9,6,1)  := BROWN
    GetRGB(11,9,11):= LIGHT PURPLE
    GetRGB(12,10,7):= TAN
    GetRGB(8,1,8)  := PURPLE
    GetRGB(13,9,13):= PLUM
    GetRGB(1,7,7)  := TEAL
    GetRGB(1,15,15):= CYAN
    GetRGB(1,1,15) := BRIGHT BLUE
*/
// issues? contact genji@thegenji.com
// special thanks to ADAL-Miko and Rich Dersheimer in the bio forums.
#include "wow_inc_headers"
// --------------------------------------------------------------[ function implementations ]
string GetTextColor(string sColor = "WHITE")
{
    string sReturn;
    if(sColor == "WHITE") sReturn = GetRGB();
    else if(sColor == "YELLOW") sReturn = GetRGB(15, 15, 1);
    else if(sColor == "ORANGE") sReturn = GetRGB(15, 5, 1);
    else if(sColor == "RED") sReturn = GetRGB(15, 1, 1);
    else if(sColor == "BLUE") sReturn = GetRGB(7, 7, 15);
    else if(sColor == "NEON_GREEN") sReturn = GetRGB(1, 15, 1);
    else if(sColor == "GREEN") sReturn = GetRGB(1, 11, 1);
    else if(sColor == "BROWN") sReturn = GetRGB(9, 6, 1);
    else if(sColor == "LIGHT_PURPLE") sReturn = GetRGB(11, 9, 11);
    else if(sColor == "TAN") sReturn = GetRGB(12, 10, 7);
    else if(sColor == "PURPLE") sReturn = GetRGB(8, 1, 8);
    else if(sColor == "PLUM") sReturn = GetRGB(13, 9, 13);
    else if(sColor == "TEAL") sReturn = GetRGB(1, 7, 7);
    else if(sColor == "CYAN") sReturn = GetRGB(1, 15, 15);
    else if(sColor == "BRIGHT_BLUE") sReturn = GetRGB(1, 1, 15);
    return sReturn;
}

string GetRGB(int red = 15,int green = 15,int blue = 15)
{
    object coloringBook = GetObjectByTag("Gen_ColoringBook");
    if (coloringBook == OBJECT_INVALID)
        coloringBook = CreateObject(OBJECT_TYPE_ITEM,"gen_coloringbook",GetLocation(GetWaypointByTag("DM_ONLY_AREA")));
    string buffer = GetName(coloringBook);
    if(red > 15) red = 15; if(green > 15) green = 15; if(blue > 15) blue = 15;
    return "<c" + GetSubString(buffer, red - 1, 1) + GetSubString(buffer, green - 1, 1) + GetSubString(buffer, blue - 1, 1) +">";
}

//void main () {}
