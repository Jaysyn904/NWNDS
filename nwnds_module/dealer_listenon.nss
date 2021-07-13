void main()
{
    //Set the Dealer to listen for Black Jack commands
    SetListening(OBJECT_SELF, TRUE);
    //Change variables so that PC and Dealer show as currently playing a game.
    SetLocalInt(GetPCSpeaker(),"nPlayingBlackJack",1);
    SetLocalInt(OBJECT_SELF,"nPlayingBlackJack",1);
}
