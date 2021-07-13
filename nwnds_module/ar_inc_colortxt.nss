// Sends a message to all PCs and DMs
// colors are: "darkred", "darkblue", "darkgreen",
//             "lightred", "lightblue", "lightgreen",
//             "white"
// You can also send a 3 digit RGB color code instead
// example: "ş  " would create light red
// 0-255:  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış
// (please note that 0 is actualy a space)
void ColorToAll(string color, string message);
// Sends a message to all players and dms
void ToAll(string message);
// oArea is the area you want the message to go to
// SendDMs TRUE if you want all DMS to receive this message
//         FALSE if you just want players
// Sends a message to all players in area
// colors are: "darkred", "darkblue", "darkgreen",
//             "lightred", "lightblue", "lightgreen",
//             "white"
// You can also send a 3 digit RGB color code instead
// example: "ş  " would create light red
// 0-255:  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış
// (please note that 0 is actualy a space)
void ColorToAllInArea(string color, object oArea, int SendDMs, string message);
// oArea is the area you want the message to go to
// SendDMs TRUE if you want all DMS to receive this message
//         FALSE if you just want players
// Sends a message to all players in area
void ToAllInArea(object oArea, int SendDMs, string message);
// Sends a message to a PC in color
// colors are: "darkred", "darkblue", "darkgreen",
//             "lightred", "lightblue", "lightgreen",
//             "white"
// You can also send a 3 digit RGB color code instead
// example: "ş  " would create light red
// 0-255:  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış
// (please note that 0 is actualy a space)
void ColorToOne(string color, string message, object oPC);
// Wraps a rainbow string, no visable output
// alone, needs to be used with other functions
// ToAll, SendMessageToPC, etc. Do not use with a color
// function, it will conflict
string Rainbow(string s);
// returns a three digit string usable by other textblitz functions
string RandomColor();
void ColorToAll(string color, string message)
{
  if (GetStringLength(color) == 3)
  {
    ToAll("<c" + color + ">" + message + "</c>");
    return;
  }
  if (color == "darkred") color = "~  ";
  if (color == "lightred") color = "ş  ";
  if (color == "darkblue") color = "  ~";
  if (color == "lightblue") color = "  ş";
  if (color == "darkgreen") color = " ~ ";
  if (color == "lightgreen") color = " ş ";
  if (color == "white") color = "şşş";
  ToAll("<c" + color + ">" + message + "</c>");
}
void ToAll(string message)
{
  SendMessageToAllDMs(message);
  object oPC = GetFirstPC();
  while(oPC != OBJECT_INVALID)
  {
    SendMessageToPC(oPC, message);
    oPC = GetNextPC();
  }
}
void ToAllInArea(object oArea, int SendDMs, string message)
{
  object oPC = GetFirstObjectInArea(oArea);
  while(oPC != OBJECT_INVALID)
  {
    if (GetIsPC(oPC)) SendMessageToPC(oPC, message);
    if (GetIsDM(oPC) && SendDMs) SendMessageToPC(oPC, message);
    oPC = GetNextObjectInArea(oArea);
  }
}
void ColorToAllInArea(string color, object oArea, int SendDMs, string message)
{
  if (GetStringLength(color) == 3)
  {
    ToAllInArea(oArea, SendDMs, "<c" + color + ">" + message + "</c>");
    return;
  }
  if (color == "darkred") color = "~  ";
  if (color == "lightred") color = "ş  ";
  if (color == "darkblue") color = "  ~";
  if (color == "lightblue") color = "  ş";
  if (color == "darkgreen") color = " ~ ";
  if (color == "lightgreen") color = " ş ";
  if (color == "white") color = "şşş";
  ToAllInArea(oArea, SendDMs, "<c" + color + ">" + message + "</c>");
}
void ColorToOne(string color, string message, object oPC)
{
  if (GetStringLength(color) == 3)
  {
    SendMessageToPC(oPC, "<c" + color + ">" + message + "</c>");
    return;
  }
  if (color == "darkred") color = "~  ";
  if (color == "lightred") color = "ş  ";
  if (color == "darkblue") color = "  ~";
  if (color == "lightblue") color = "  ş";
  if (color == "darkgreen") color = " ~ ";
  if (color == "lightgreen") color = " ş ";
  if (color == "white") color = "şşş";
  SendMessageToPC(oPC, "<c" + color + ">" + message + "</c>");
}
// returns a three digit string usable by other textblitz functions
string RandomColor()
{
  string x = "!#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹Œ‘’“”•–—˜™š›œŸ¡¢£¤¥§¨©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüış";
  string c1 = "";
  string c2 = "";
  string c3 = "";
  while (c1 == "") c1 = GetSubString(x, Random(251), 1);
  while (c2 == "") c2 = GetSubString(x, Random(251), 1);
  while (c3 == "") c3 = GetSubString(x, Random(251), 1);
  return c1 + c2 + c3;
}
string Rainbow(string s)
{
  int max = GetStringLength(s);
  int i = 0;
  string final = "";
  while(i < max)
  {
    final += "<c" + RandomColor() + ">" + GetSubString(s, i, 1) + "</c>";
    i += 1;
  }
  return final;
}

