//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This script represents the standard encounter table
for the BESIE Random Encounter System By Ray Miller.
It is meant to be used as an include, and will not
compile on its own.
*/
//:://////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: God knows.  I wrote this months ago!
//:://////////////////////////////////////////////


string GetRndEncCreature(float fMinCR = 0.0, float fMaxCR = 9999.0, string sCreatureTable = "")
{
// IF NOT INITIALIZED THEN DO SO
    /*if(!GetLocalInt(GetModule(), "re_bInitialized"))
        {
        SetRndEncProperties();
        }*/

// DECLARE AND INTIALIZE VARIABLES
    object oMod = GetModule();
    string sChoice = "nil";
    string sBuild;
    int bCustom;
    int iCounter1;
    int iCounter2 = 0;
    int iCounter3;
    int iVarNum;
    float fCR;
    if (fMinCR > 18.0) fMinCR = 18.0;
    sCreatureTable = GetStringLowerCase(sCreatureTable);
    if(GetStringLeft(sCreatureTable, 8) == "commoner") sCreatureTable = "z" + GetStringRight(sCreatureTable, GetStringLength(sCreatureTable) - 8);

/* The following code was added with v1.8.  It checks to see if the template contains the string '2da'
if so it checks to ensure the tag name matches the file name of a 2DA file by looking for the 'TableLength'
parameter on Row 0.  If it is present, a check is made to ensure that the parameter is correct.  If so, the
standard or 'old style' table will be ignored and this routine will draw an encounter from the 2da file. */
    if(GetStringLeft(sCreatureTable, 3) == "2da")
        {
        string s2DAMatch = "re_" + GetStringRight(GetStringLowerCase(sCreatureTable), GetStringLength(sCreatureTable) - 4);
        int iTableLength = StringToInt(Get2DAString(s2DAMatch, "TableLength", 0));
        if(iTableLength && Get2DAString(s2DAMatch, "ResRef", iTableLength) != "" && Get2DAString(s2DAMatch, "ResRef", iTableLength + 1) == "")
            {
            int iRnd = Random(iTableLength) + 1;
            string sTreasure = Get2DAString(s2DAMatch, "Treasure", iRnd);
            int iMinimum = StringToInt(Get2DAString(s2DAMatch, "Minimum", iRnd));
            int iMaximum = StringToInt(Get2DAString(s2DAMatch, "Maximum", iRnd));
            if(!iMinimum && !iMaximum) iMaximum = 1;
            SetLocalInt(oMod, "re_iMinNumberOfCreatures", iMinimum);
            SetLocalInt(oMod, "re_iMaxNumberOfCreatures", iMaximum);
            string sCreature = Get2DAString(s2DAMatch, "ResRef", iRnd);
            if(sTreasure != "") SetLocalString(GetModule(), "re_s2DATreasure", sTreasure);
            return sCreature;
            }
        else
            {
            string sError = "BESIE error: 2DA Table " + s2DAMatch + " is not present or is invalid!";
            object oPC = GetFirstPC();
            SendMessageToAllDMs(sError);
            while(GetIsObjectValid(oPC))
                {
                SendMessageToPC(oPC, sError);
                oPC = GetNextPC();
                }
            WriteTimestampedLogEntry(sError);
            return "";
            }
        }

// PICK RANDOM ABERRATION
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "n")
            {
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_BATTDEVOUR";
                    fCR = 11.0;
                    break;

                    case 1:sChoice = "X2_BEHOLDER001";
                    fCR = 11.0;
                    break;

                    case 2:sChoice = "X2_BEHOLDER003";
                    fCR = 15.0;
                    break;

                    case 3:sChoice = "X2_DRIDER001";
                    fCR = 6.0;
                    break;

                    case 4:sChoice = "X2_DRIDER002";
                    fCR = 10.0;
                    break;

                    case 5:sChoice = "X2_DRIDER003";
                    fCR = 17.0;
                    break;

                    case 6:sChoice = "X2_DRIDER004";
                    fCR = 23.0;
                    break;

                    case 7:sChoice = "X2_DRIDER005";
                    fCR = 28.0;
                    break;

                    case 8:sChoice = "X2_FDRIDER002";
                    fCR = 7.0;
                    break;

                    case 9:sChoice = "X2_DRIDERW01";
                    fCR = 8.0;
                    break;

                    case 10:sChoice = "NW_ETTERCAP";
                    fCR = 5.0;
                    break;

                    case 11:sChoice = "X2_BEHOLDER002";
                    fCR = 3.0;
                    break;

                    case 12:sChoice = "X2_FDRIDER001";
                    fCR = 6.0;
                    break;

                    case 13:sChoice = "NW_HORROR";
                    fCR = 5.0;
                    break;

                    case 14:sChoice = "NW_DEVOUR";
                    fCR = 7.0;
                    break;

                    case 15:sChoice = "X2_MINDFLAYER001";
                    fCR = 9.0;
                    break;

                    case 16:sChoice = "X2_MINDFDARKENER";
                    fCR = 16.0;
                    break;

                    case 17:sChoice = "X2_MINDFVENERATR";
                    fCR = 20.0;
                    break;

                    case 18:sChoice = "X2_MINDFLAYER002";
                    fCR = 19.0;
                    break;

                    case 19:sChoice = "NW_UMBERHULK";
                    fCR = 9.0;
                    break;

                    case 20:sChoice = "NW_WILLOWISP";
                    fCR = 8.0;
                    break;

                    case 21:sChoice = "";
                    fCR = 0.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && sChoice != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }


// PICK RANDOM ANIMAL
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "a")
            {
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_BEARDIREBOSS";
                    fCR = 15.0;
                    break;

                    case 1:sChoice = "NW_BEARBLCK";
                    fCR = 2.0;
                    break;

                    case 2:sChoice = "NW_BEARBRWN";
                    fCR = 5.0;
                    break;

                    case 3:sChoice = "NW_BEARDIRE";
                    fCR = 9.0;
                    break;

                    case 4:sChoice = "NW_BEARKODIAK";
                    fCR = 6.0;
                    break;

                    case 5:sChoice = "NW_BEARPOLAR";
                    fCR = 6.0;
                    break;

                    case 6:sChoice = "NW_BEASTMALAR001";
                    fCR = 7.0;
                    break;

                    case 7:sChoice = "NW_DIREWOLF";
                    fCR = 5.0;
                    break;

                    case 8:sChoice = "NW_WOLFDIREBOSS";
                    fCR = 11.0;
                    break;

                    case 9:sChoice = "NW_WOLFWINT";
                    fCR = 5.0;
                    break;

                    case 10:sChoice = "NW_WOLF";
                    fCR = 1.0;
                    break;

                    case 11:sChoice = "NW_WORG";
                    fCR = 3.0;
                    break;

                    case 12:sChoice = "NW_COUGAR";
                    fCR = 2.0;
                    break;

                    case 13:sChoice = "NW_CRAGCAT";
                    fCR = 2.0;
                    break;

                    case 14:sChoice = "NW_DIRETIGER";
                    fCR = 11.0;
                    break;

                    case 15:sChoice = "NW_JAGUAR";
                    fCR = 3.0;
                    break;

                    case 16:sChoice = "NW_CAT";
                    fCR = 2.0;
                    break;

                    case 17:sChoice = "NW_LION";
                    fCR = 3.0;
                    break;

                    case 18:sChoice = "NW_PANTHER";
                    fCR = 2.0;
                    break;

                    case 19:sChoice = "NW_BADGER";
                    fCR = 0.5;
                    break;

                    case 20:sChoice = "NW_BOAR";
                    fCR = 2.0;
                    break;

                    case 21:sChoice = "NW_DIREBADG";
                    fCR = 3.0;
                    break;

                    case 22:sChoice = "NW_BOARDIRE";
                    fCR = 5.0;
                    break;

                    case 23:sChoice = "NW_RAT001";
                    fCR = 0.12;
                    break;

                    case 24:sChoice = "NW_RATDIRE001";
                    fCR = 0.33;
                    break;

                    case 25:sChoice = "";
                    fCR = 0.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && sChoice != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM CONSTRUCT
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "c")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_BATHORROR";
                    fCR = 13.0;
                    break;

                    case 1:sChoice = "NW_GolBone";
                    fCR = 11.0;
                    break;

                    case 2:sChoice = "NW_GolClay";
                    fCR = 10.0;
                    break;

                    case 3:sChoice = "NW_GOLFLESH";
                    fCR = 8.0;
                    break;

                    case 4:sChoice = "NW_HELMHORR";
                    fCR = 11.0;
                    break;

                    case 5:sChoice = "NW_GOLIRON";
                    fCR = 16.0;
                    break;

                    case 6:sChoice = "NW_MINOGON";
                    fCR = 8.0;
                    break;

                    case 7:sChoice = "NW_SHGUARD";
                    fCR = 13.0;
                    break;

                    case 8:sChoice = "NW_GOLSTONE";
                    fCR = 12.0;
                    break;

                    case 9:sChoice = "X2_GOLEM002";
                    fCR = 32.0;
                    break;

                    case 10:sChoice = "nw_goldmflesh001";
                    fCR = 25.0;
                    break;

                    case 11:sChoice = "X2_GOLIRON_HUGE";
                    fCR = 21.0;
                    break;

                    case 12:sChoice = "X2_GOLEM001";
                    fCR = 35.0;
                    break;

                    case 13:sChoice = "";
                    fCR = 0.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && sChoice != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM DRAGON
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "d")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_DRGBLACK001";
                    fCR = 13.0;
                    break;

                    case 1:sChoice = "NW_DRGBLUE001";
                    fCR = 14.0;
                    break;

                    case 2:sChoice = "NW_DRGGREEN001";
                    fCR = 14.0;
                    break;

                    case 3:sChoice = "NW_DRGRED001";
                    fCR = 15.0;
                    break;

                    case 4:sChoice = "NW_DRGWHITE001";
                    fCR = 12.0;
                    break;

                    case 5:sChoice = "NW_DRGBLACK002";
                    fCR = 17.0;
                    break;

                    case 6:sChoice = "NW_DRGBLUE002";
                    fCR = 18.0;
                    break;

                    case 7:sChoice = "NW_DRGGREEN002";
                    fCR = 18.0;
                    break;

                    case 8:sChoice = "NW_DRGRED002";
                    fCR = 19.0;
                    break;

                    case 9:sChoice = "NW_DRGWHITE002";
                    fCR = 16.0;
                    break;

                    case 10:sChoice = "NW_DRGBLACK003";
                    fCR = 21.0;
                    break;

                    case 11:sChoice = "NW_DRGBLUE003";
                    fCR = 23.0;
                    break;

                    case 12:sChoice = "NW_DRGGREEN003";
                    fCR = 23.0;
                    break;

                    case 13:sChoice = "NW_DRGRED003";
                    fCR = 25.0;
                    break;

                    case 14:sChoice = "NW_HALFDRA001";
                    fCR = 13.0;
                    break;

                    case 15:sChoice = "X2_DRAGONSHAD001";
                    fCR = 22.0;
                    break;

                    case 16:sChoice = "X2_DRAGONPRIS001";
                    fCR = 37.0;
                    break;

                    case 17:sChoice = "X0_WYRMLING_BLK";
                    fCR = 3.0;
                    break;

                    case 18:sChoice = "X0_WYRMLING_BLU";
                    fCR = 5.0;
                    break;

                    case 19:sChoice = "X0_WYRMLING_GRN";
                    fCR = 4.0;
                    break;

                    case 20:sChoice = "X0_WYRMLING_RED";
                    fCR = 5.0;
                    break;

                    case 21:sChoice = "X0_WYRMLING_WHT";
                    fCR = 3.0;
                    break;

                    case 22:sChoice = "";
                    fCR = 0.0;
                    break;

                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && sChoice != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM ELEMENTAL
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "e")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_AIR";
                    fCR = 4.0;
                    break;

                    case 1:sChoice = "NW_Earth";
                    fCR = 4.0;
                    break;

                    case 2:sChoice = "NW_AIRELDER";
                    fCR = 20.0;
                    break;

                    case 3:sChoice = "NW_EARTHELD";
                    fCR = 17.0;
                    break;

                    case 4:sChoice = "NW_FIREELDER";
                    fCR = 17.0;
                    break;

                    case 5:sChoice = "NW_WATELDER";
                    fCR = 16.0;
                    break;

                    case 6:sChoice = "NW_FIRE";
                    fCR = 3.0;
                    break;

                    case 7:sChoice = "NW_AIRGREAT";
                    fCR = 18.0;
                    break;

                    case 8:sChoice = "NW_EARTHGREAT";
                    fCR = 15.0;
                    break;

                    case 9:sChoice = "NW_FIREGREAT";
                    fCR = 15.0;
                    break;

                    case 10:sChoice = "NW_WATERGREAT";
                    fCR = 14.0;
                    break;

                    case 11:sChoice = "NW_AIRHUGE";
                    fCR = 13.0;
                    break;

                    case 12:sChoice = "NW_EARTHHUGE";
                    fCR = 11.0;
                    break;

                    case 13:sChoice = "NW_FIREHUGE";
                    fCR = 12.0;
                    break;

                    case 14:sChoice = "NW_WATERHUGE";
                    fCR = 11.0;
                    break;

                    case 15:sChoice = "NW_INVSTALK";
                    fCR = 6.0;
                    break;

                    case 16:sChoice = "NW_WATER";
                    fCR = 4.0;
                    break;

                    case 17:sChoice = "";
                    fCR = 0.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM GIANT
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "g")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_ETTIN";
                    fCR = 8.0;
                    break;

                    case 1:sChoice = "NW_GNTHILL";
                    fCR = 10.0;
                    break;

                    case 2:sChoice ="NW_GNTMOUNT";
                    fCR = 10.0;
                    break;

                    case 3:sChoice = "NW_GNTFIRE";
                    fCR = 12.0;
                    break;

                    case 4:sChoice = "NW_GNTFROST";
                    fCR = 10.0;
                    break;

                    case 5:sChoice = "NW_OGRE01";
                    fCR = 3.0;
                    break;

                    case 6:sChoice = "NW_OGRE02";
                    fCR = 3.0;
                    break;

                    case 7:sChoice = "NW_OGRECHIEF01";
                    fCR = 6.0;
                    break;

                    case 8:sChoice = "NW_OGRECHIEF02";
                    fCR = 6.0;
                    break;

                    case 9:sChoice = "nw_ogreboss";
                    fCR = 9.0;
                    break;

                    case 10:sChoice = "NW_OGREMAGEBOSS";
                    fCR = 21.0;
                    break;

                    case 11:sChoice = "NW_OGREMAGE01";
                    fCR = 5.0;
                    break;

                    case 12:sChoice = "NW_OGREMAGE02";
                    fCR = 5.0;
                    break;

                    case 13:sChoice = "NW_TROLL";
                    fCR = 5.0;
                    break;

                    case 14:sChoice = "NW_TROLLCHIEF";
                    fCR = 8.0;
                    break;

                    case 15:sChoice = "NW_TROLLBOSS";
                    fCR = 9.0;
                    break;

                    case 16:sChoice = "NW_TROLLWIZ";
                    fCR = 8.0;
                    break;

                    case 17:sChoice = "X0_GNTFIREFEM";
                    fCR = 10.0;
                    break;

                    case 18:sChoice = "X0_GNTFROSTFEM";
                    fCR = 9.0;
                    break;

                    case 19:sChoice = "";
                    fCR = 0.0;
                    break;

                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM HUMANOID
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "h")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_BUGBEARA";
                    fCR = 2.0;
                    break;

                    case 1:sChoice = "NW_BUGBEARB";
                    fCR = 2.0;
                    break;

                    case 2:sChoice = "nw_bugbearboss";
                    fCR = 10.0;
                    break;

                    case 3:sChoice = "NW_BUGCHIEFA";
                    fCR = 5.0;
                    break;

                    case 4:sChoice = "NW_BUGCHIEFB";
                    fCR = 5.0;
                    break;

                    case 5:sChoice = "NW_BUGWIZA";
                    fCR = 4.0;
                    break;

                    case 6:sChoice = "NW_BUGWIZB";
                    fCR = 4.0;
                    break;

                    case 7:sChoice = "NW_GRIG";
                    fCR = 2.0;
                    break;

                    case 8:sChoice = "NW_PIXIE";
                    fCR = 2.0;
                    break;

                    case 9:sChoice = "NW_GOBLINA";
                    fCR = 0.25;
                    break;

                    case 10:sChoice = "NW_GOBLINB";
                    fCR = 0.25;
                    break;

                    case 11:sChoice = "NW_GOBLINBOSS";
                    fCR = 11.0;
                    break;

                    case 12:sChoice = "NW_GOBCHIEFA";
                    fCR = 4.0;
                    break;

                    case 13:sChoice = "NW_GOBCHIEFB";
                    fCR = 3.0;
                    break;

                    case 14:sChoice = "NW_GOBWIZA";
                    fCR = 3.0;
                    break;

                    case 15:sChoice = "NW_GOBWIZB";
                    fCR = 3.0;
                    break;

                    case 16:sChoice = "NW_OLDCHIEFA";
                    fCR = 4.0;
                    break;

                    case 17:sChoice = "NW_OLDCHIEFB";
                    fCR = 4.0;
                    break;

                    case 19:sChoice = "NW_OLDMAGEA";
                    fCR = 4.0;
                    break;

                    case 20:sChoice = "NW_OLDMAGEB";
                    fCR = 4.0;
                    break;

                    case 21:sChoice = "NW_OLDWARB";
                    fCR = 2.0;
                    break;

                    case 22:sChoice = "NW_OLDWARRA";
                    fCR = 2.0;
                    break;

                    case 23:sChoice = "NW_YUAN_TI001";
                    fCR = 5.0;
                    break;

                    case 24:sChoice = "NW_YUAN_TI003";
                    fCR = 6.0;
                    break;

                    case 25:sChoice = "NW_YUAN_TI002";
                    fCR = 5.0;
                    break;

                    case 26:sChoice = "NW_MINOTAUR";
                    fCR = 4.0;
                    break;

                    case 27:sChoice = "NW_MinChief";
                    fCR = 8.0;
                    break;

                    case 28:sChoice = "NW_MINOTAURBOSS";
                    fCR = 14.0;
                    break;

                    case 29:sChoice = "NW_MINWIZ";
                    fCR = 9.0;
                    break;

                    case 30:sChoice = "NW_ORCA";
                    fCR = 0.25;
                    break;

                    case 31:sChoice = "NW_ORCB";
                    fCR = 0.25;
                    break;

                    case 32:sChoice = "NW_OrcChiefA";
                    fCR = 3.0;
                    break;

                    case 33:sChoice = "NW_ORCCHIEFB";
                    fCR = 3.0;
                    break;

                    case 34:sChoice = "nw_orcboss";
                    fCR = 10.0;
                    break;

                    case 35:sChoice = "NW_ORCWIZA";
                    fCR = 4.0;
                    break;

                    case 36:sChoice = "NW_ORCWIZB";
                    fCR = 4.0;
                    break;

                    case 37:sChoice = "NW_KOBOLD001";
                    fCR = 0.33;
                    break;

                    case 38:sChoice = "NW_KOBOLD002";
                    fCR = 0.33;
                    break;

                    case 39:sChoice = "NW_KOBOLD004";
                    fCR = 2.0;
                    break;

                    case 40:sChoice = "NW_KOBOLD006";
                    fCR = 2.0;
                    break;

                    case 41:sChoice = "NW_KOBOLD005";
                    fCR = 2.0;
                    break;

                    case 42:sChoice = "NW_KOBOLD003";
                    fCR = 2.0;
                    break;

                    case 43:sChoice = "NW_GNOLL001";
                    fCR = 1.0;
                    break;

                    case 44:sChoice = "NW_GNOLL002";
                    fCR = 3.0;
                    break;

                    case 45:sChoice = "NW_HOBGOBLIN001";
                    fCR = 0.33;
                    break;

                    case 46:sChoice = "NW_HOBGOBLIN002";
                    fCR = 2.0;
                    break;

                    case 47:sChoice = "X0_ASABI_CHIEF";
                    fCR = 6.0;
                    break;

                    case 48:sChoice = "X0_ASABI_SHAMAN";
                    fCR = 5.0;
                    break;

                    case 49:sChoice = "X0_ASABI_WARRIOR";
                    fCR = 2.0;
                    break;

                    case 50:sChoice = "X0_MEDUSA";
                    fCR = 6.0;
                    break;

                    case 51:sChoice = "X0_STINGER";
                    fCR = 3.0;
                    break;

                    case 52:sChoice = "X0_STINGER_CHIEF";
                    fCR = 7.0;
                    break;

                    case 53:sChoice = "X0_STINGER_MAGE";
                    fCR = 5.0;
                    break;

                    case 54:sChoice = "X0_STINGER_WAR";
                    fCR = 5.0;
                    break;

                    case 55:sChoice = "nw_seahag";
                    fCR = 4.0;
                    break;

                    case 56:sChoice = "";
                    fCR = 4.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM INSECT
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "i")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_BTLBOMB";
                    fCR = 3.0;
                    break;

                    case 1:sChoice = "NW_BTLFIRE";
                    fCR = 0.25;
                    break;

                    case 2:sChoice = "nw_beetleboss";
                    fCR = 16.0;
                    break;

                    case 3:sChoice = "NW_BTLFIRE02";
                    fCR = 3.0;
                    break;

                    case 4:sChoice = "NW_BTLSTAG";
                    fCR = 7.0;
                    break;

                    case 5:sChoice = "NW_BTLSTINK";
                    fCR = 3.0;
                    break;

                    case 6:sChoice = "NW_SPIDDIRE";
                    fCR = 7.0;
                    break;

                    case 7:sChoice = "NW_SPIDGIANT";
                    fCR = 3.0;
                    break;

                    case 8:sChoice = "NW_SPIDPHASE";
                    fCR = 3.0;
                    break;

                    case 9:sChoice = "NW_SPIDERBOSS";
                    fCR = 14.0;
                    break;

                    case 10:sChoice = "NW_SPIDSWRD";
                    fCR = 4.0;
                    break;

                    case 11:sChoice = "NW_SPIDWRA";
                    fCR = 4.0;
                    break;

                    case 12:sChoice = "";
                    fCR = 0.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM MISCELLANEOUS
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "m")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "X0_BASILISK";
                    fCR = 5.0;
                    break;

                    case 1:sChoice = "X0_COCKATRICE";
                    fCR = 5.0;
                    break;

                    case 2:sChoice = "X2_HARPY001";
                    fCR = 3.0;
                    break;

                    case 3:sChoice = "NW_GRAYREND";
                    fCR = 8.0;
                    break;

                    case 4:sChoice = "X2_DEEPROTHE001";
                    fCR = 1.0;
                    break;

                    case 5:sChoice = "X0_GORGON";
                    fCR = 7.0;
                    break;

                    case 6:sChoice = "NW_KRENSHAR";
                    fCR = 2.0;
                    break;

                    case 7:sChoice = "NW_STIRGE";
                    fCR = 0.33;
                    break;

                    case 8:sChoice = "X0_MANTICORE";
                    fCR = 6.0;
                    break;

                    case 9:sChoice = "X2_GELCUBE";
                    fCR = 3.0;
                    break;

                    case 10:sChoice = "";
                    fCR = 5.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM PLANAR
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "p")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_DEMON";
                    fCR = 15.0;
                    break;

                    case 1:sChoice = "NW_HALFFND001";
                    fCR = 8.0;
                    break;

                    case 2:sChoice = "NW_HELLHOUND";
                    fCR = 4.0;
                    break;

                    case 3:sChoice = "NW_BEASTXVIM";
                    fCR = 5.0;
                    break;

                    case 4:sChoice = "NW_RAKSHASA";
                    fCR = 7.0;
                    break;

                    case 5:sChoice = "NW_SHMASTIF";
                    fCR = 4.0;
                    break;

                    case 6:sChoice = "NW_DMSUCUBUS";
                    fCR = 7.0;
                    break;

                    case 7:sChoice = "NW_DMVROCK";
                    fCR = 10.0;
                    break;

                    case 8:sChoice = "NW_MEPAIR";
                    fCR = 3.0;
                    break;

                    case 9:sChoice = "NW_MEPDUST";
                    fCR = 3.0;
                    break;

                    case 10:sChoice = "NW_MEPEARTH";
                    fCR = 3.0;
                    break;

                    case 11:sChoice = "NW_MEPFIRE";
                    fCR = 3.0;
                    break;

                    case 12:sChoice = "NW_MEPICE";
                    fCR = 3.0;
                    break;

                    case 13:sChoice = "NW_IMP";
                    fCR = 3.0;
                    break;

                    case 14:sChoice = "NW_MEPMAGMA";
                    fCR = 3.0;
                    break;

                    case 15:sChoice = "NW_MEPOOZE";
                    fCR = 3.0;
                    break;

                    case 16:sChoice = "NW_DMQUASIT";
                    fCR = 3.0;
                    break;

                    case 17:sChoice = "NW_MEPSALT";
                    fCR = 3.0;
                    break;

                    case 19:sChoice = "NW_MEPSTEAM";
                    fCR = 3.0;
                    break;

                    case 20:sChoice = "NW_MEPWATER";
                    fCR = 3.0;
                    break;

                    case 21:sChoice = "NW_TIEFLING02";
                    fCR = 0.5;
                    break;

                    case 22:sChoice = "NW_SLAADBL";
                    fCR = 7.0;
                    break;

                    case 23:sChoice = "NW_SLAADDETH";
                    fCR = 15.0;
                    break;

                    case 24:sChoice = "NW_SLAADDTHBOSS";
                    fCR = 15.0;
                    break;

                    case 25:sChoice = "NW_SLAADGRAY";
                    fCR = 10.0;
                    break;

                    case 26:sChoice = "NW_SLAADGRYBOSS";
                    fCR = 11.0;
                    break;

                    case 27:sChoice = "NW_SLAADGRN";
                    fCR = 9.0;
                    break;

                    case 28:sChoice = "NW_SLAADRED";
                    fCR = 6.0;
                    break;

                    case 29:sChoice = "X2_SPIDERDEMO001";
                    fCR = 12.0;
                    break;

                    case 30:sChoice = "x2_erinyes";
                    fCR = 8.0;
                    break;

                    case 31:sChoice = "X2_PITFIEND001";
                    fCR = 15.0;
                    break;

                    case 32:sChoice = "X0_FORM_MYRMARCH";
                    fCR = 11.0;
                    break;

                    case 33:sChoice = "X0_FORM_QUEEN";
                    fCR = 20.0;
                    break;

                    case 34:sChoice = "X0_FORM_TASKMAST";
                    fCR = 7.0;
                    break;

                    case 35:sChoice = "X0_FORM_WARRIOR";
                    fCR = 4.0;
                    break;

                    case 36:sChoice = "X0_FORM_WORKER";
                    fCR = 1.0;
                    break;

                    case 37:sChoice = "X2_SLAADBLACK001";
                    fCR = 30.0;
                    break;

                    case 38:sChoice = "X2_SLAADWHITE001";
                    fCR = 25.0;
                    break;

                    case 39:sChoice = "";
                    fCR = 0.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM SHAPECHANGER
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "s")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_ARANEA";
                    fCR = 3.0;
                    break;

                    case 1:sChoice = "NW_WERECAT";
                    fCR = 5.0;
                    break;

                    case 2:sChoice = "NW_WERERAT001";
                    fCR = 0.5;
                    break;

                    case 3:sChoice = "NW_WEREWOLF";
                    fCR = 2.0;
                    break;

                    case 4:sChoice = "NW_WERERAT";
                    fCR = 0.5;
                    break;

                    case 5:sChoice = "";
                    fCR = 0.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM UNDEAD
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "u")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_GHAST";
                    fCR = 4.0;
                    break;

                    case 1:sChoice = "NW_GHOUL";
                    fCR = 2.0;
                    break;

                    case 2:sChoice = "NW_GHOULLORD";
                    fCR = 5.0;
                    break;

                    case 3:sChoice = "NW_GHOULBOSS";
                    fCR = 10.0;
                    break;

                    case 4:sChoice = "NW_MUMCLERIC";
                    fCR = 10.0;
                    break;

                    case 5:sChoice = "NW_MUMMY";
                    fCR = 5.0;
                    break;

                    case 6:sChoice = "NW_MUMMYBOSS";
                    fCR = 11.0;
                    break;

                    case 7:sChoice = "NW_MUMFIGHT";
                    fCR = 10.0;
                    break;

                    case 8:sChoice = "NW_ZOMBWARR02";
                    fCR = 19.0;
                    break;

                    case 9:sChoice = "NW_Bodak";
                    fCR = 9.0;
                    break;

                    case 10:sChoice = "NW_CURST004";
                    fCR = 6.0;
                    break;

                    case 11:sChoice = "NW_CURST003";
                    fCR = 5.0;
                    break;

                    case 12:sChoice = "NW_CURST002";
                    fCR = 6.0;
                    break;

                    case 13:sChoice = "NW_CURST001";
                    fCR = 5.0;
                    break;

                    case 14:sChoice = "NW_DOOMKGHT";
                    fCR = 10.0;
                    break;

                    case 15:sChoice = "NW_DOOMKGHTBOSS";
                    fCR = 15.0;
                    break;

                    case 16:sChoice = "NW_LICH001";
                    fCR = 28.0;
                    break;

                    case 17:sChoice = "NW_LICH003";
                    fCR = 17.0;
                    break;

                    case 19:sChoice = "NW_LICHBOSS";
                    fCR = 21.0;
                    break;

                    case 20:sChoice = "NW_MOHRG";
                    fCR = 12.0;
                    break;

                    case 21:sChoice = "NW_REVENANT001";
                    fCR = 7.0;
                    break;

                    case 22:sChoice = "NW_SKELDEVOUR";
                    fCR = 13.0;
                    break;

                    case 23:sChoice = "NW_VAMPIRE";
                    fCR = 6.0;
                    break;

                    case 24:sChoice = "NW_VAMPIRE003";
                    fCR = 16.0;
                    break;

                    case 25:sChoice = "NW_VAMPIRE004";
                    fCR = 13.0;
                    break;

                    case 26:sChoice = "NW_VAMPIRE002";
                    fCR = 13.0;
                    break;

                    case 27:sChoice = "NW_VAMPIRE001";
                    fCR = 12.0;
                    break;

                    case 28:sChoice = "NW_WIGHT";
                    fCR = 4.0;
                    break;

                    case 29:sChoice = "NW_VAMPIRE_SHAD";
                    fCR = 3.0;
                    break;

                    case 30:sChoice = "NW_SHADOW";
                    fCR = 3.0;
                    break;

                    case 31:sChoice = "NW_SHFIEND";
                    fCR = 7.0;
                    break;

                    case 32:sChoice = "NW_SKELETON";
                    fCR = 0.5;
                    break;

                    case 33:sChoice = "NW_SKELCHIEF";
                    fCR = 7.0;
                    break;

                    case 34:sChoice = "NW_SKELMAGE";
                    fCR = 4.0;
                    break;

                    case 35:sChoice = "NW_SKELPRIEST";
                    fCR = 4.0;
                    break;

                    case 36:sChoice = "NW_SKELWARR01";
                    fCR = 6.0;
                    break;

                    case 37:sChoice = "NW_SKELWARR02";
                    fCR = 6.0;
                    break;

                    case 38:sChoice = "NW_ALLIP";
                    fCR = 3.0;
                    break;

                    case 39:sChoice = "NW_SPECTRE";
                    fCR = 6.0;
                    break;

                    case 40:sChoice = "NW_WRAITH";
                    fCR = 5.0;
                    break;

                    case 41:sChoice = "NW_ZOMBTYRANT";
                    fCR = 3.0;
                    break;

                    case 42:sChoice = "NW_ZOMBIE01";
                    fCR = 1.0;
                    break;

                    case 43:sChoice = "NW_ZOMBIE02";
                    fCR = 1.0;
                    break;

                    case 44:sChoice = "NW_ZOMBIEBOSS";
                    fCR = 8.0;
                    break;

                    case 45:sChoice = "NW_ZOMBWARR01";
                    fCR = 4.0;
                    break;

                    case 47:sChoice = "X2_SPIDERDEMO001";
                    fCR = 12.0;
                    break;

                    case 48:sChoice = "x2_erinyes";
                    fCR = 8.0;
                    break;

                    case 49:sChoice = "X2_PITFIEND001";
                    fCR = 15.0;
                    break;

                    case 50:sChoice = "X0_FORM_MYRMARCH";
                    fCR = 11.0;
                    break;

                    case 51:sChoice = "X0_FORM_QUEEN";
                    fCR = 20.0;
                    break;

                    case 52:sChoice = "X0_FORM_TASKMAST";
                    fCR = 7.0;
                    break;

                    case 53:sChoice = "X0_FORM_WARRIOR";
                    fCR = 4.0;
                    break;

                    case 54:sChoice = "X0_FORM_WORKER";
                    fCR = 1.0;
                    break;

                    case 55:sChoice = "X2_SLAADBLACK001";
                    fCR = 30.0;
                    break;

                    case 56:sChoice = "X2_SLAADWHITE001";
                    fCR = 25.0;
                    break;

                    case 57:sChoice = "X2_MINDFLAYER003";
                    fCR = 18.0;
                    break;

                    case 58:sChoice = "X2_DEMILICH001";
                    fCR = 24.0;
                    break;

                    case 59:sChoice = "X2_DRACOLICH001";
                    fCR = 43.0;
                    break;

                    case 60:sChoice = "";
                    fCR = 0.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }
// PICK RANDOM BANDIT
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(GetSubString(sCreatureTable, iCounter1, 1) == "b")
            {
            iCounter2 = 0; //Reset the counter
            sChoice = "nil"; //Reset sChoice
            while(sChoice != "")
                {
                switch(iCounter2)
                    {
                    case 0:sChoice = "NW_DUECLER001";
                    fCR = 1.0;
                    break;

                    case 1:sChoice = "NW_DUECLER005";
                    fCR = 5.0;
                    break;

                    case 2:sChoice = "NW_DUECLER010";
                    fCR = 8.0;
                    break;

                    case 3:sChoice = "NW_DUECLER015";
                    fCR = 10.0;
                    break;

                    case 4:sChoice = "NW_DUECLER020";
                    fCR = 15.0;
                    break;

                    case 5:sChoice = "NW_DUEMAGE001";
                    fCR = 1.0;
                    break;

                    case 6:sChoice = "NW_DUEMAGE005";
                    fCR = 4.0;
                    break;

                    case 7:sChoice = "NW_DUEMAGE010";
                    fCR = 7.0;
                    break;

                    case 8:sChoice = "NW_DUEMAGE015";
                    fCR = 11.0;
                    break;

                    case 9:sChoice = "NW_DUEMAGE020";
                    fCR = 14.0;
                    break;

                    case 10:sChoice = "NW_DUEROGUE001";
                    fCR = 1.0;
                    break;

                    case 11:sChoice = "NW_DUEROGUE005";
                    fCR = 4.0;
                    break;

                    case 12:sChoice = "NW_DUEROGUE010";
                    fCR = 7.0;
                    break;

                    case 13:sChoice = "NW_DUEROGUE015";
                    fCR = 10.0;
                    break;

                    case 14:sChoice = "NW_DUEROGUE020";
                    fCR = 13.0;
                    break;

                    case 15:sChoice = "NW_DUEFIGHT001";
                    fCR = 1.0;
                    break;

                    case 16:sChoice = "NW_DUEFIGHT005";
                    fCR = 4.0;
                    break;

                    case 17:sChoice = "NW_DUEFIGHT010";
                    fCR = 7.0;
                    break;

                    case 19:sChoice = "NW_DUEFIGHT015";
                    fCR = 11.0;
                    break;

                    case 20:sChoice = "NW_DUEFIGHT020";
                    fCR = 14.0;
                    break;

                    case 21:sChoice = "NW_DWARFMERC001";
                    fCR = 0.5;
                    break;

                    case 22:sChoice = "NW_DWARFMERC002";
                    fCR = 2.0;
                    break;

                    case 23:sChoice = "NW_DWARFMERC003";
                    fCR = 4.0;
                    break;

                    case 24:sChoice = "NW_DWARFMERC004";
                    fCR = 7.0;
                    break;

                    case 25:sChoice = "NW_DWARFMERC005";
                    fCR = 9.0;
                    break;

                    case 26:sChoice = "NW_DWARFMERC006";
                    fCR = 13.0;
                    break;

                    case 27:sChoice = "NW_DROWROGUE001";
                    fCR = 1.0;
                    break;

                    case 28:sChoice = "NW_DROWROGUE005";
                    fCR = 3.0;
                    break;

                    case 29:sChoice = "NW_DROWROGUE010";
                    fCR = 7.0;
                    break;

                    case 30:sChoice = "NW_DROWROGUE015";
                    fCR = 10.0;
                    break;

                    case 31:sChoice = "NW_DROWROGUE020";
                    fCR = 13.0;
                    break;

                    case 33:sChoice = "NW_DROWMAGE001";
                    fCR = 1.0;
                    break;

                    case 34:sChoice = "NW_DROWMAGE005";
                    fCR = 4.0;
                    break;

                    case 35:sChoice = "NW_DROWMAGE010";
                    fCR = 7.0;
                    break;

                    case 36:sChoice = "NW_DROWMAGE015";
                    fCR = 11.0;
                    break;

                    case 37:sChoice = "NW_DROWMAGE020";
                    fCR = 15.0;
                    break;

                    case 38:sChoice = "NW_DROWFIGHT001";
                    fCR = 1.0;
                    break;

                    case 39:sChoice = "NW_DROWFIGHT005";
                    fCR = 4.0;
                    break;

                    case 40:sChoice = "NW_DROWFIGHT010";
                    fCR = 8.0;
                    break;

                    case 41:sChoice = "NW_DROWFIGHT015";
                    fCR = 11.0;
                    break;

                    case 42:sChoice = "NW_DROWFIGHT020";
                    fCR = 15.0;
                    break;

                    case 43:sChoice = "NW_DROWCLER001";
                    fCR = 1.0;
                    break;

                    case 44:sChoice = "NW_DROWCLER005";
                    fCR = 4.0;
                    break;

                    case 45:sChoice = "NW_DROWCLER010";
                    fCR = 8.0;
                    break;

                    case 46:sChoice = "NW_DROWCLER015";
                    fCR = 12.0;
                    break;

                    case 47:sChoice = "NW_DROWCLER020";
                    fCR = 16.0;
                    break;

                    case 48:sChoice = "NW_HALFMERC001";
                    fCR = 1.0;
                    break;

                    case 49:sChoice = "NW_HALFMERC002";
                    fCR = 3.0;
                    break;

                    case 50:sChoice = "NW_HALFMERC003";
                    fCR = 5.0;
                    break;

                    case 51:sChoice = "NW_HALFMERC004";
                    fCR = 7.0;
                    break;

                    case 52:sChoice = "NW_HALFMERC005";
                    fCR = 10.0;
                    break;

                    case 53:sChoice = "NW_HALFMERC006";
                    fCR = 13.0;
                    break;

                    case 54:sChoice = "NW_BANDIT006";
                    fCR = 7.0;
                    break;

                    case 55:sChoice = "NW_BANDIT001";
                    fCR = 0.5;
                    break;

                    case 56:sChoice = "NW_BANDIT002";
                    fCR = 0.5;
                    break;

                    case 57:sChoice = "NW_BANDIT007";
                    fCR = 11.0;
                    break;

                    case 58:sChoice = "NW_BANDIT004";
                    fCR = 3.0;
                    break;

                    case 59:sChoice = "NW_BANDIT005";
                    fCR = 4.0;
                    break;

                    case 60:sChoice = "NW_BANDIT003";
                    fCR = 1.0;
                    break;

                    case 61:sChoice = "NW_GYPSY006";
                    fCR = 11.0;
                    break;

                    case 62:sChoice = "NW_GYPSY005";
                    fCR = 8.0;
                    break;

                    case 63:sChoice = "NW_GYPSY004";
                    fCR = 4.0;
                    break;

                    case 64:sChoice = "NW_GYPSY007";
                    fCR = 10.0;
                    break;

                    case 65:sChoice = "NW_GYPSY002";
                    fCR = 0.5;
                    break;

                    case 66:sChoice = "NW_GYPSY001";
                    fCR = 0.5;
                    break;

                    case 67:sChoice = "NW_GYPSY003";
                    fCR = 4.0;
                    break;

                    case 68:sChoice = "NW_HUMANMERC005";
                    fCR = 12.0;
                    break;

                    case 69:sChoice = "NW_HUMANMERC006";
                    fCR = 15.0;
                    break;

                    case 70:sChoice = "NW_HUMANMERC001";
                    fCR = 2.0;
                    break;

                    case 71:sChoice = "NW_HUMANMERC002";
                    fCR = 3.0;
                    break;

                    case 72:sChoice = "NW_HUMANMERC003";
                    fCR = 6.0;
                    break;

                    case 73:sChoice = "NW_HUMANMERC004";
                    fCR = 9.0;
                    break;

                    case 74:sChoice = "";
                    fCR = 12.0;
                    break;
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
                    iVarNum++;
                    }
                iCounter2++;
                }
            }
        }

// PICK RANDOM CREATURE FROM CUSTOM TABLE
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(bCustom
        && (GetSubString(sCreatureTable, iCounter1, 1) == "0" || StringToInt(GetSubString(sCreatureTable, iCounter1, 1)) > 0))
            {
            sBuild = sBuild + GetSubString(sCreatureTable, iCounter1, 1);
            }
        else if(bCustom)
            {
            SetLocalInt(OBJECT_SELF, "re_iVarNum", iVarNum);
            SetLocalFloat(OBJECT_SELF, "re_fMinCR", fMinCR);
            SetLocalFloat(OBJECT_SELF, "re_fMaxCR", fMaxCR);
            ExecuteScript("re_custom" + sBuild, OBJECT_SELF);
            iVarNum = GetLocalInt(OBJECT_SELF, "re_iVarNum");
            DeleteLocalInt(OBJECT_SELF, "re_iVarNum");
            DeleteLocalFloat(OBJECT_SELF, "re_fMinCR");
            DeleteLocalFloat(OBJECT_SELF, "re_fMaxCR");
            bCustom = FALSE;
            sBuild = "";
            }
        if(GetSubString(sCreatureTable, iCounter1, 1) == "x")
            {
            bCustom = TRUE;
            }
        }

// PICK RANDOM CREATURE FROM COMMONER TABLE (For the commoner spawner)
    for(iCounter1 = 0; iCounter1 <= GetStringLength(sCreatureTable); iCounter1++)
        {
        if(bCustom
        && (GetSubString(sCreatureTable, iCounter1, 1) == "0" || StringToInt(GetSubString(sCreatureTable, iCounter1, 1)) > 0))
            {
            sBuild = sBuild + GetSubString(sCreatureTable, iCounter1, 1);
            }
        else if(bCustom)
            {
            ExecuteScript("re_commoner" + sBuild, OBJECT_SELF);
            iVarNum = GetLocalInt(OBJECT_SELF, "re_iVarNum");
            DeleteLocalInt(OBJECT_SELF, "re_iVarNum");
            bCustom = FALSE;
            sBuild = "";
            }
        if(GetSubString(sCreatureTable, iCounter1, 1) == "z")
            {
            bCustom = TRUE;
            }
        }



// SELECT THE RANDOM CREATURE
    if(!iVarNum) return "";
    int iRnd = Random(iVarNum);
    string sCreature = GetLocalString(oMod, "re_sCreatureList" + IntToString(iRnd));
    // Copy the Min and Max number of creatures from the corresponding simulated "array" to the
    // root variable in the module object.
    SetLocalInt(oMod, "re_iMinNumberOfCreatures", GetLocalInt(oMod, "re_iMinNumberOfCreatures" + IntToString(iRnd)));
    SetLocalInt(oMod, "re_iMaxNumberOfCreatures", GetLocalInt(oMod, "re_iMaxNumberOfCreatures" + IntToString(iRnd)));
    // Reset the local module variables that store min and max number of creatures
    // so we don't use old numbers at a later time.
    for(iCounter3 = 1; iCounter3 <= iVarNum; iCounter3++)
        {
        SetLocalInt(oMod, "re_iMinNumberOfCreatures" + IntToString(iCounter3), 0);
        SetLocalInt(oMod, "re_iMaxNumberOfCreatures" + IntToString(iCounter3), 0);
        }
    return sCreature;
}
