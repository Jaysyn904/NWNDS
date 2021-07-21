void main()
{
    object oModule = GetModule();
    string sText = "--------\n";
    int x;

    for (x = 1; x <= 10; x++)
    {
        switch (x)
        {
            case 1:     sText += "First - "; break;
            case 2:     sText += "Second - "; break;
            case 3:     sText += "Third - "; break;
            case 4:     sText += "Fourth - "; break;
            case 5:     sText += "Fifth - "; break;
            case 6:     sText += "Sixth - "; break;
            case 7:     sText += "Seventh - "; break;
            case 8:     sText += "Eighth - "; break;
            case 9:     sText += "Ninth - "; break;
            case 10:    sText += "Tenth - "; break;
        }
        sText += GetLocalString(oModule, "sPlayerKills" + IntToString(x)) + "\n";
    }
    SpeakString(sText);
}
