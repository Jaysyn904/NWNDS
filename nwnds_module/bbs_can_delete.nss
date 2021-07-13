int StartingConditional()
{
string sAuthor = GetLocalString(GetPCSpeaker(), "PostAuthor");
string sName = GetName(GetPCSpeaker()) + " (" + GetPCPlayerName(GetPCSpeaker()) + ")";
if(sName == sAuthor)
    return TRUE;
else
    return FALSE;
}
