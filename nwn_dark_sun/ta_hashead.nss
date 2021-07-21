int StartingConditional()
{
    int nShow = OBJECT_INVALID != GetItemPossessedBy(GetPCSpeaker(), "QST_LASKCHFHEAD");
    return nShow;
}
