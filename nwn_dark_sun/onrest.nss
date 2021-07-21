void main()
{
    object oPC=GetLastPCRested();

    if (GetLastRestEventType()==REST_EVENTTYPE_REST_FINISHED)
        ExecuteScript("lib_psionrest", GetLastPCRested());

}
