//NiteCap 6-27-08
//Divining pool script


// only shows PC's with in the +/- 6 level range
// oSeer should point to the object using the script ie PC using the script
// oToBeSeen is the PC to check v/s the oSeer
int GetPCCanBeSeen(object oSeer, object oToBeSeen);


//beg main
/*void main()
{
object oUser = GetLastUsedBy();
object oPC = GetFirstPC();
string SpeakText;

    while (GetIsPC(oPC))
    {
      if(!GetIsDM(oPC) || !GetIsDMPossessed(oPC))
        {
        if (GetPCCanBeSeen(oUser,oPC))
            {
            SpeakText += GetName(oPC);
            SpeakText += " is in ";
            SpeakText += GetName(GetArea(oPC));
            SpeakText += "\n";
            oPC = GetNextPC();
            }
        }
       oPC = GetNextPC();
    }
    SpeakString(SpeakText);
}
   //end main


int GetPCCanBeSeen(object oSeer, object oToBeSeen)
{
    int iUHD = GetHitDice(oSeer);
    int iPCHD=GetHitDice(oToBeSeen);
    // base is unseen
    int bSeen=FALSE;

    //if the user's hitdice are more than the PC oToBeSeen
    if (iUHD = iPCHD)
        {
        if((iUHD - iPCHD) <= 6)bSeen=TRUE;
        }
    //if the user's hitdice are less than the PC oToBeSeen
    if (iPCHD >= iUHD)
        {
        if((iPCHD-iUHD)<=6)bSeen=TRUE;
        }
        //let us see?
    return bSeen;
}

*/


//Old Script
void main()
{
//if (GetIsDM(GetLastUsedBy()) == TRUE){
object oPC = GetFirstPC();
string SpeakText;
while ( GetIsPC (oPC) == TRUE)
{
if (GetHitDice(oPC) > 19) {
SpeakText += GetName(oPC);
SpeakText += " is in ";
SpeakText += GetName(GetArea(oPC));
SpeakText += "\n";
}
oPC = GetNextPC();
}
SpeakString(SpeakText);
}
