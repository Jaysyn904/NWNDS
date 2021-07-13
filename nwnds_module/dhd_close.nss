//******************************************************************************
//* stargatish portal script put on_close for dhd
//* written by BWW aka Lord Nikon
//* 12/05/04
//* clears runes out of inventory and gets ready for next use
//******************************************************************************

void main()
{
  object oItem = GetFirstItemInInventory(OBJECT_SELF);
  object oSelf = OBJECT_SELF;

  if (oItem == OBJECT_INVALID) return;
  while (oItem != OBJECT_INVALID)
   {
    DestroyObject(oItem);
    oItem = GetNextItemInInventory(OBJECT_SELF);
    if (oItem == OBJECT_INVALID) break;
   }
   //SendMessageToPC(GetFirstPC(),"DONE WITH CLOSE SCRIPT");

}
