//::///////////////////////////////////////////////
//:: Default: BLACK JACK USER DEFINED
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    by the Black Jack dealer during the course of a game
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////
void CardCheck();
void AceCheck(int nCard, object oPC);
void InitialDeal(object oPC);
void DealerDrawRemainingCards();

void main()
{
    // on Spawn in - this should run
    // Set the words that the dealer is 'listening' for and give each an event number
    if (GetUserDefinedEventNumber() == 5000)
    {
        SetListenPattern(OBJECT_SELF, "Start", 500);
        SetListenPattern(OBJECT_SELF, "Hit", 1000);
        //SetListenPattern(OBJECT_SELF, "Hit Me", 1000);
        SetListenPattern(OBJECT_SELF, "Stand", 2000);
        SetListenPattern(OBJECT_SELF, "Total", 3000);
        SetListenPattern(OBJECT_SELF, "Quit", 4000); //NOT IMPLEMENTED YET
        SetListenPattern(OBJECT_SELF, "Join", 5000); //NOT IMPLEMENTED YET
        SetListening(OBJECT_SELF,FALSE);
    }
    // on Dialog event - this should fire
    if (GetUserDefinedEventNumber() == 1004)
    {
        //First off - Check to make sure that the Dealer has been told to start listening.
       if (GetIsListening(OBJECT_SELF))
       {
            //Get the object that the Dealer heard
            object oPC = GetLastSpeaker();
            //If that object is a PC
            if (GetIsPC(oPC))
            {
                // Get what the Dealer heard
                int nPattern = GetListenPatternNumber();
 //*****************************************************************************************
                //When someone says 'Start'
                if (nPattern == 500)
                {
                    //Make sure that the game is not already in progress for this player
                    if(GetLocalInt(oPC,"nGameOn") == 1)
                    {
                        SpeakString("What are you trying to pull, " + GetName(oPC) + ", you've already started!");
                    }
                    else
                    {
                        //Make sure the PC has enough money - if not - end the game
                        if (GetGold(oPC) >= GetLocalInt(OBJECT_SELF,"nWager"))
                        {
                            //Add one to the number of players variable on the Dealer
                            SetLocalInt(OBJECT_SELF,"nNumPlayers",GetLocalInt(OBJECT_SELF,"nNumPlayers") + 1);

                            // Zero out the nAceCount variable - used to track how many aces a player has in his current hand
                            SetLocalInt(oPC,"nAceCount",0);
                            SetLocalInt(oPC,"nGameOn",1);

                            //If the number of players playing is currently less than the maximum number of players
                            //set in the conversation with the dealer then the game is not full so just deal the
                            //one players hand
                            if (GetLocalInt(OBJECT_SELF,"nNumPlayers") < GetLocalInt(OBJECT_SELF,"nMaxPlayers"))
                            {
                                InitialDeal(oPC);
                                DelayCommand(6.0f,SpeakString(GetName(oPC) + ", you are in.  Who else? Please say 'Start'."));
                            }
                            // else the game is full so you can deal the Dealer's first card as well
                            else
                            {
                                //Zero out the Dealer's Ace count
                                SetLocalInt(OBJECT_SELF,"nAceCount",0);
                                //Draw Dealer's card
                                SetLocalInt(OBJECT_SELF,"nDealerTotal",Random(10)+1);
                                //Draw PCs initial hand
                                InitialDeal(oPC);

                                //If Dealer has an Ace - say so and record it
                                if (GetLocalInt(OBJECT_SELF,"nDealerTotal") == 1)
                                {
                                    DelayCommand(6.0f,SpeakString("Dealer is showing an Ace"));
                                    SetLocalInt(OBJECT_SELF,"nAceCount",1);
                                }
                                //else just say what the dealer has
                                else
                                {
                                    DelayCommand(6.0f,SpeakString("Dealer is showing a " + IntToString(GetLocalInt(OBJECT_SELF,"nDealerTotal"))));
                                }

                                //Make the Player Counter point to the first player - only he will be able to speak to the Dealer
                                //ask the first player what he wants to do
                                DelayCommand(7.5f,SpeakString("What do you want to do, " + GetLocalString(OBJECT_SELF,"Player1Tag")));
                                SetLocalString(OBJECT_SELF,"szCurrentPlayer","1");
                            }
                        }
                        else
                        {
                            //End the Game because someone is out of gold
                            SpeakString(GetName(oPC) + ", you don't have enough gold to play this game!  Get Lost!  Game Over!!");
                            SetListening(OBJECT_SELF,FALSE);
                            SetLocalInt(OBJECT_SELF, "nPlayingBlackJack", 0);
                        }
                    }
                }
//*****************************************************************************************
                // When someone says 'Hit' - Make sure all players are in the game, then go through them
                // one at a time till they say 'Stand'
                else if (nPattern == 1000)
                {
                    //check to make sure that everyone has entered the game (up to MaxPlayers), if not, say so
                    if (GetLocalInt(OBJECT_SELF,"nNumPlayers") < GetLocalInt(OBJECT_SELF,"nMaxPlayers"))
                    {
                        SpeakString("Hold your horses! Not everyone is in yet.");
                    }
                    //else everyone is in so continue
                    else
                    {
                        //Check that only the current player is speaking, if not - tell him its not his turn
                        if (GetName(oPC) != GetLocalString(OBJECT_SELF,"Player"+ GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag"))
                        {
                            SpeakString("Hold up, " + GetName(oPC) + ", its not your turn. Its " + GetLocalString(OBJECT_SELF,"Player"+ GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag") + "'s turn");
                        }
                        // else continue
                        else
                        {
                            // make sure that the current player has started the game and if he has, deal him a card
                            if (GetLocalInt(oPC,"nGameOn") == 1)
                            {
                                //Draw a card
                                SetLocalInt(oPC,"nBlackJackNextCard", Random(10)+1);
                                //Check if its an ace
                                AceCheck(GetLocalInt(oPC,"nBlackJackNextCard"),oPC);
                                //Add to the Total for that PC
                                SetLocalInt(oPC,"nBlackJackTotal", GetLocalInt(oPC,"nBlackJackTotal") + GetLocalInt(oPC,"nBlackJackNextCard"));
                                //Say something different if PC has an Ace
                                if (GetLocalInt(oPC,"nBlackJackNextCard")==1)
                                {
                                    SpeakString(GetLocalString(OBJECT_SELF,"Player"+ GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag")+". You've been dealt an Ace");
                                }
                                //Otherwise just say the total
                                else
                                {
                                    SpeakString(GetLocalString(OBJECT_SELF,"Player"+ GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag")+". You've been dealt a " + IntToString(GetLocalInt(oPC,"nBlackJackNextCard")));
                                }
                                //If the PC has any Aces - we may have to give him the option of adding ten to his total
                                if (GetLocalInt(oPC,"nAceCount") > 0)
                                {
                                    int nTempTotal = GetLocalInt(oPC,"nBlackJackTotal")+ 10;
                                    //If adding 10 would make it greater than 21 - then he can't use his ace
                                    if(nTempTotal > 21)
                                    {
                                        DelayCommand(2.0f, SpeakString("That gives you a total of " + IntToString(GetLocalInt(oPC,"nBlackJackTotal"))));
                                    }
                                    //otherwise, he may have two totals since aces can be 1 or 11
                                    else
                                    {
                                        DelayCommand(2.0f, SpeakString("That gives you a total of " + IntToString(GetLocalInt(oPC,"nBlackJackTotal")) + " or " + IntToString(nTempTotal)));
                                    }
                                }
                                else
                                {
                                    DelayCommand(2.0f, SpeakString("That gives you a total of " + IntToString(GetLocalInt(oPC,"nBlackJackTotal"))));
                                }
                                //If the PCs true total is greater than 21 then they busted
                                if (GetLocalInt(oPC,"nBlackJackTotal") > 21)
                                {
                                    DelayCommand(1.0f,SpeakString("YOU BUSTED " + GetName(oPC) +"! HAHAHAHHAAH!"));
                                    //Set a Busted variable that we can check on later
                                    SetLocalInt(oPC,"nBusted",1);
                                    DelayCommand(1.0f,AssignCommand(oPC,PlaySound("as_pl_laughingm2")));
                                    AssignCommand(OBJECT_SELF,PlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,1.0,1.0));
                                    AssignCommand(OBJECT_SELF,ActionSit(GetObjectByTag("CHAIR_NPC_BLACKJACK")));
                                    //Check to see if this is the last PC and call CardCheck() if it is
                                    if(StringToInt(GetLocalString(OBJECT_SELF,"szCurrentPlayer")) == GetLocalInt(OBJECT_SELF,"nMaxPlayers"))
                                    {
                                        DealerDrawRemainingCards();
                                        CardCheck();
                                    }
                                    else//If its not - advance to the next player
                                    {
                                        SetLocalString(OBJECT_SELF,"szCurrentPlayer",IntToString(StringToInt(GetLocalString(OBJECT_SELF,"szCurrentPlayer"))+ 1));
                                        DelayCommand(4.0f,SpeakString("What do you want to do, " + GetLocalString(OBJECT_SELF,"Player" + GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag") + "?"));
                                    }
                                }
                                else
                                {
                                    DelayCommand(4.0f,SpeakString("What do you want to do, " + GetLocalString(OBJECT_SELF,"Player" + GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag") + "?"));
                                }
                            }
                            else
                            {
                                SpeakString("What are you trying to pull, " + GetName(oPC) + ", you're not even in the game!");
                            }
                        }
                    }
                }
//*****************************************************************************************
                //When someone says 'Stand', end that players turn and if all players have 'Stood' then deal the
                //dealer's cards and see who wins.
                else if (nPattern == 2000)
                {


                    //Check that only the current player is speaking
                    if (GetName(oPC) != GetLocalString(OBJECT_SELF,"Player"+ GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag"))
                    {
                        if (GetLocalInt(oPC,"nGameOn") != 1)
                        {
                            SpeakString("What are you trying to pull, " + GetName(oPC) + "! We haven't even started yet!");
                        }
                        else
                        {
                            SpeakString("Hold up, its not your turn, " + GetName(oPC) + "! Its your turn, " + GetLocalString(OBJECT_SELF,"Player" + GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag"));
                        }
                    }
                    else
                    {
                        if (GetLocalInt(oPC,"nGameOn") != 1)
                        {
                            SpeakString("What are you trying to pull, " + GetName(oPC) + "! We haven't even started yet!");
                        }
                        else
                        {
                            //Confirm the player's 'Stand'
                            SpeakString(GetName(oPC) + " stands.");

                            //Calculate the Players true total (using Aces) and save it as his total
                            if (GetLocalInt(oPC,"nAceCount") > 0)
                            {
                                int nTempTotal = GetLocalInt(oPC,"nBlackJackTotal")+ 10;
                                if (nTempTotal < 22)
                                {
                                    SetLocalInt(oPC,"nBlackJackTotal",nTempTotal);
                                }
                            }
                            //Set the CurrentPlayer to the Next Player
                            SetLocalString(OBJECT_SELF,"szCurrentPlayer",IntToString(StringToInt(GetLocalString(OBJECT_SELF,"szCurrentPlayer"))+ 1));

                            //Check to see if all PCs have their cards, if so then the dealer can take his
                            if (StringToInt(GetLocalString(OBJECT_SELF,"szCurrentPlayer")) > GetLocalInt(OBJECT_SELF,"nMaxPlayers"))
                            {
                                //Loop for the dealer to get his remaining cards
                                DealerDrawRemainingCards();
                                CardCheck();
                            }
                            //if not all players have their cards - tell the next player that its their turn
                            else
                            {
                                DelayCommand(1.0f,SpeakString("Ok, "+ GetLocalString(OBJECT_SELF,"Player"+ GetLocalString(OBJECT_SELF,"szCurrentPlayer")+"Tag") + ", its your turn"));
                            }
                        }
                    }
                }
//*****************************************************************************************
                //If somebody shouts 'total
                else if (nPattern == 3000)
                {
                    if (GetLocalInt(oPC,"nGameOn") != 1)
                    {
                        SpeakString("What are you trying to pull, " + GetName(oPC) + "! We haven't even started yet!");
                    }
                    else
                    {
                        if (GetLocalInt(oPC,"nAceCount") > 0)
                        {
                            int nTempTotal = GetLocalInt(oPC,"nBlackJackTotal") + 10;
                            if (nTempTotal < 22)
                            {
                                SpeakString(GetName(oPC) + ", your total is " + IntToString(GetLocalInt(oPC,"nBlackJackTotal")) + " or " + IntToString(nTempTotal));
                            }
                            else
                            {
                                SpeakString(GetName(oPC) + ", your total is " + IntToString(GetLocalInt(oPC,"nBlackJackTotal")));
                            }

                        }
                        else
                        {
                            SpeakString(GetName(oPC) + ", your total is " + IntToString(GetLocalInt(oPC,"nBlackJackTotal")));
                        }

                    }
                }
//*****************************************************************************************
                //If somebody shouts 'Quit'   NOT IMPLEMENTED YET
                else if (nPattern == 4000)
                {

                }
//*****************************************************************************************
                //If somebody shouts 'Join'    NOT IMPLEMENTED YET
                else if (nPattern == 5000)
                {

                }

            }
       }
    }
}

//*****************************************************************************************
void CardCheck()
{
//Now check the dealers total against each total.
    int nMax = GetLocalInt(OBJECT_SELF,"nMaxPlayers");
    int nCount;
    for (nCount = 1;nCount < nMax+1; nCount++)
    {

        //Get the PCs Name we are looking for
        string szName = GetLocalString(OBJECT_SELF,"Player"+ IntToString(nCount)+"Tag");
        int nFound = FALSE;
        object oPC = GetFirstPC();
        while (nFound == FALSE)
        {
            if (szName == GetName(oPC))
            {
                nFound = TRUE;
            }
            else
            {
                oPC = GetNextPC();
            }
        }
        //Set that PCs GameOn variable to off so that he will have to shout Start to begin the next round
        SetLocalInt(oPC,"nGameOn",0);

        //if the Player Busted, they automatically lose
        if (GetLocalInt(oPC,"nBusted") == 1)
        {
            DelayCommand(3.75f,SpeakString(szName + ", you busted, so you lose!!!!"));
            //take gold
            DelayCommand(5.5f,TakeGoldFromCreature(GetLocalInt(OBJECT_SELF,"nWager"),oPC));
            DelayCommand(5.5f,PlayVoiceChat(VOICE_CHAT_CUSS,oPC));
            // reset busted variable
            SetLocalInt(oPC,"nBusted",0);
        }
        //if the Player got BlackJack - they win 3/2 on their wager
        else if(GetLocalInt(oPC,"nBlackJack") == 1)
        {
            DelayCommand(3.25f,SpeakString("BlackJack for, " + szName + "!!!!"));
            // give gold
            DelayCommand(5.5f, GiveGoldToCreature(oPC,(GetLocalInt(OBJECT_SELF,"nWager")*3)/2));
            DelayCommand(5.5f,PlayVoiceChat(VOICE_CHAT_CHEER,oPC));
            AssignCommand(oPC,PlaySound("as_mg_telepin1"));
            SetLocalInt(oPC,"nBlackJack",0);
        }
        else
        {
            // if the Dealer Busted and the Player is still in - they win
            if (GetLocalInt(OBJECT_SELF,"nBusted") == 1)
            {
                DelayCommand(4.25f,SpeakString("I busted, so you win, " + szName + "!!!!"));
                // give gold
                DelayCommand(5.5f, GiveGoldToCreature(oPC,GetLocalInt(OBJECT_SELF,"nWager")));
                DelayCommand(5.5f,PlayVoiceChat(VOICE_CHAT_CHEER,oPC));
                AssignCommand(oPC,PlaySound("as_mg_telepin1"));
            }
            else
            {
                //Check each PCs total vs the Dealer's total.
                if (GetLocalInt(OBJECT_SELF,"nDealerTotal") > GetLocalInt(oPC,"nBlackJackTotal"))
                {
                    DelayCommand(5.0f,SpeakString(szName + ", you lose!!!!"));
                    //TakeGold
                    DelayCommand(5.5f,TakeGoldFromCreature(GetLocalInt(OBJECT_SELF,"nWager"),oPC));
                    DelayCommand(5.5f,PlayVoiceChat(VOICE_CHAT_CUSS,oPC));
                    AssignCommand(oPC, PlaySound("as_mg_telepout1"));
                }
                else if (GetLocalInt(OBJECT_SELF,"nDealerTotal") < GetLocalInt(oPC,"nBlackJackTotal"))
                {
                    DelayCommand(5.75f,SpeakString(szName + ", you win!!!!"));
                    //Give Gold
                    DelayCommand(5.5f, GiveGoldToCreature(oPC,GetLocalInt(OBJECT_SELF,"nWager")));
                    DelayCommand(5.5f,PlayVoiceChat(VOICE_CHAT_CHEER,oPC));
                    AssignCommand(oPC,PlaySound("as_mg_telepin1"));
                }
                else
                {
                    DelayCommand(6.5f,SpeakString(szName + ", we push!!!!"));
                    DelayCommand(5.5f,PlayVoiceChat(VOICE_CHAT_TAUNT,oPC));
                }
            }
        }
    }
    //Set the number of current players back to 0 and 0 out the Dealers Busted variable
    SetLocalInt(OBJECT_SELF,"nNumPlayers",0);
    SetLocalInt(OBJECT_SELF,"nBusted",0);

}
// check to see if the card passed in is an Ace, if so - set a variable on that PC
void AceCheck(int nCard, object oPC)
{
    if (nCard == 1)
    {
        SetLocalInt(oPC,"nAceCount",GetLocalInt(oPC,"nAceCount") + 1);
    }
}

void InitialDeal(object oPC)
{
    //Deal a random card to the PC
    SetLocalInt(oPC,"nBlackJackCard1",Random(10)+1);
    //Check if it was an Ace (so either 1 or 11)
    AceCheck(GetLocalInt(oPC,"nBlackJackCard1"), oPC);
    //Deal a second card to the PC
    SetLocalInt(oPC,"nBlackJackCard2",Random(10)+1);
    //Check if it was an ace too
    AceCheck(GetLocalInt(oPC,"nBlackJackCard2"), oPC);
    SetLocalInt(oPC,"nBlackJackTotal", GetLocalInt(oPC,"nBlackJackCard1") + GetLocalInt(oPC,"nBlackJackCard2"));
    //Set a variable for each player so the dealer knows the Tags of everyone playing
    SetLocalString(OBJECT_SELF,"Player"+IntToString(GetLocalInt(OBJECT_SELF,"nNumPlayers"))+"Tag",GetName(oPC));

    if(GetLocalInt(oPC,"nBlackJackCard1") == 1)
    {

        if(GetLocalInt(oPC,"nBlackJackCard2") == 1)
        {
            DelayCommand(2.0f,SpeakString(GetName(oPC) + ", you've been dealt an Ace and another Ace"));
        }
        else
        {
            DelayCommand(2.0f,SpeakString(GetName(oPC) + ", you've been dealt an Ace and a " + IntToString(GetLocalInt(oPC,"nBlackJackCard2"))));
        }
    }
    else
    {
        if(GetLocalInt(oPC,"nBlackJackCard2") == 1)
        {
            DelayCommand(2.0f,SpeakString(GetName(oPC) + ", you've been dealt a " + IntToString(GetLocalInt(oPC,"nBlackJackCard1")) + " and an Ace."));
        }
        else
        {
            DelayCommand(2.0f,SpeakString(GetName(oPC) + ", you've been dealt a " + IntToString(GetLocalInt(oPC,"nBlackJackCard1")) + " and a " + IntToString(GetLocalInt(oPC,"nBlackJackCard2"))));
        }
    }
    string szTempString = ".";
    int nTempTotal = GetLocalInt(oPC,"nBlackJackTotal");
    if (GetLocalInt(oPC,"nAceCount") > 0)
    {
        int nCount;
        nTempTotal = nTempTotal + 10;
        if (nTempTotal < 22)
        {
            szTempString = " or " + IntToString(nTempTotal);
        }

     }

     DelayCommand(4.0f,SpeakString("This gives you a total of " + IntToString(GetLocalInt(oPC,"nBlackJackTotal")) + szTempString));
     //Check for BlackJack
     if (nTempTotal == 21)
     {
        DelayCommand(5.0f,SpeakString("BlackJack!!"));
        SetLocalInt(oPC,"nBlackJack",1);
        AssignCommand(oPC,PlaySound("as_cv_bell2"));
     }

}

void DealerDrawRemainingCards()
{
    string szTempString = "";
    //Draw cards for the dealer as long as the dealers total is less than 17 - Dealer stands on 17
    do
    {
        SetLocalInt(OBJECT_SELF,"nDealerCard2", Random(10)+1);
        AceCheck(GetLocalInt(OBJECT_SELF,"nDealerCard2"),OBJECT_SELF);
        SetLocalInt(OBJECT_SELF,"nDealerTotal", GetLocalInt(OBJECT_SELF,"nDealerTotal") + GetLocalInt(OBJECT_SELF,"nDealerCard2"));
        //If dealer drew an Ace - say so - calculate the total with any aces the Dealer may have
        if (GetLocalInt(OBJECT_SELF,"nDealerCard2") == 1)
        {
            int nTempTotal = GetLocalInt(OBJECT_SELF,"nDealerTotal") + 10;
            if (nTempTotal > 21)
            {
                szTempString = szTempString + "Dealer draws an Ace for a total of " + IntToString(GetLocalInt(OBJECT_SELF,"nDealerTotal")) + ". ";
            }
            else if (nTempTotal > 16)
            {
                SetLocalInt(OBJECT_SELF,"nDealerTotal",nTempTotal);
                szTempString = szTempString + "Dealer draws an Ace for a total of " + IntToString(nTempTotal)+ ". ";
            }
            else
            {
                szTempString = szTempString + "Dealer draws an Ace for a total of " + IntToString(nTempTotal)+ ". ";
            }
        }
        else
        {
            szTempString = szTempString + "Dealer draws a " + IntToString(GetLocalInt(OBJECT_SELF,"nDealerCard2")) + " for a total of " + IntToString(GetLocalInt(OBJECT_SELF,"nDealerTotal")) + ". ";
        }
    }
    while (GetLocalInt(OBJECT_SELF,"nDealerTotal") < 17);
    SetLocalString(OBJECT_SELF,"szDealerDraw",szTempString);
    //Check to see if the Dealer has gone over 21 and Busted
    if (GetLocalInt(OBJECT_SELF,"nDealerTotal") > 21)
    {

        DelayCommand(3.0f,PlayVoiceChat(VOICE_CHAT_CUSS,OBJECT_SELF));
        SetLocalInt(OBJECT_SELF,"nBusted",1);
    }
    //Display what the dealer has drawn - Best timing seemed to be to say everything at once rather
    //than speaking each time the dealer drew a card.
    DelayCommand(2.0f,SpeakString(GetLocalString(OBJECT_SELF,"szDealerDraw")));
}
