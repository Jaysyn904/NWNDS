// Script by: Nyadarus
// Created:   September 2003
// Used in:   The Hermit Quest
// Purpose:   This is the OnPerceived script for the Kaisharga on
//            Citadel Level 3.

object oSeen = GetLastPerceived();
int nCount = GetLocalInt(OBJECT_SELF,"SaidMyLine");
void main ()
{
    nCount ++;
    if (nCount==1)
    {
        if (GetIsPC(oSeen))
        {
            ActionSpeakString("... eykuhl nehdrak - What? Who are you?! How dare you interrupt!  You will pay for disrupting the ritual!  Attack!!");
            SetLocalInt(OBJECT_SELF,"SaidMyLine",nCount);
        }
    }
}
