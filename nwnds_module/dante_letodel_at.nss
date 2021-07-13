// This is the script dante_letodel_at
//#include "delchar_include"
//#include "aps_include"
//#include "sha_subr_consts"

//void DeletePCSubRace(string sPlayer,string sCharName);

/*void main()
{
    object oPlayer = GetPCSpeaker();
    string sName = GetName(oPlayer);
    string sPlayer = GetPCPlayerName(oPlayer);
    if(sName != "")
    {
        //DeletePCSubRace(sPlayer, sName);
        BootPC(oPlayer);
        DelayCommand(6.0f, deletechar(sPlayer, sName));
    }
    else
    {
        SendMessageToPC(oPlayer, "You will need to see a DM about getting this character deleted.");
        SendMessageToAllDMs("PC Player Name: "+sPlayer+" just tried to delete a character without a name.");
        WriteTimestampedLogEntry("PC Player Name: "+sPlayer+" just tried to delete a character without a name.");
    }
}*/



/* void DeletePCSubRace(string sPlayer,string sCharName)
{

    sPlayer = SQLEncodeSpecialChars(sPlayer);
    sCharName = SQLEncodeSpecialChars(sCharName);

     string sSelSQL = "SELECT val FROM "+ SUBRACE_DATABASE +"  WHERE player='" + sPlayer +
                     "' AND tag='" + sCharName + "';";

        SQLExecDirect(sSelSQL);
        if (SQLFetch() == SQL_SUCCESS) // player/pc records found first try
            {
             string sDelSQL = "DELETE FROM " + SUBRACE_DATABASE +
                " WHERE player='" + sPlayer +
                            "' AND tag='" + sCharName + "';";

            // Delete stament
            SQLExecDirect(sDelSQL);
            // Reselect to see if we deleted the Records
            SQLExecDirect(sSelSQL);
                 if (SQLFetch() == SQL_SUCCESS) // nothing deleted. try again
                     {
                      SendMessageToAllDMs("Player/PC: " + sPlayer + "/" + sCharName +
                       " has not been deleted from the subrace DB../n Sending second attempt..");
                      // Delete stament
                      SQLExecDirect(sDelSQL);
                      // Reselect to see if we deleted the Records
                      SQLExecDirect(sSelSQL);
                      if (SQLFetch() == SQL_SUCCESS)
                          {
                          SendMessageToAllDMs("Error Deleting PC from Subrace DB: Second attempt failed: " +
                           sPlayer + "/" + sCharName);
                           return;
                          }
                          SendMessageToAllDMs("Player/PC: " + sPlayer + "/" + sCharName +
                       " has been deleted from the subrace DB: Second attempt worked..");
                     }
                 else // PC was deleted..
                     {
                     SendMessageToAllDMs("Player/PC: " + sPlayer + "/" + sCharName +
                       " has been deleted from the subrace DB..");

                     }
                return;
             } */
       /*  // player not found in db.. may need manual delete
         SendMessageToAllDMs("Error Deleting PC from Subrace DB: Player/PC not found: " +
                           sPlayer + "/" + sCharName + "May need manual delete ");
return;*/

//}



