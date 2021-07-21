int StartingConditional()
{
    int nPrice = GetLocalInt(OBJECT_SELF, "CURRENTPRICE");

    if(GetGold(GetPCSpeaker()) >= nPrice)
    {  return TRUE;  }

    return FALSE;

}
