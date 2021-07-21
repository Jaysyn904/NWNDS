
void main()
{
    object oItem=GetLocalObject(OBJECT_SELF, "Weapon1");
    if(GetItemPossessor(oItem)!=OBJECT_SELF) DestroyObject(oItem);
    oItem=GetLocalObject(OBJECT_SELF, "Weapon2");
    if(GetItemPossessor(oItem)!=OBJECT_SELF) DestroyObject(oItem);

    if(GetIsDead(OBJECT_SELF) || !GetIsObjectValid(GetMaster()))
    {
        object oItem;
        int nSlot;

        for(nSlot=0; nSlot<=17; nSlot++)
        {
            oItem=GetItemInSlot(nSlot, OBJECT_SELF);
            if (GetIsObjectValid(oItem)) DestroyObject(oItem, 0.1);
        }

        AssignCommand(OBJECT_SELF, SetIsDestroyable(TRUE));

        DestroyObject(OBJECT_SELF, 0.4);

    }
    else
    {
        DelayCommand(3.0, ExecuteScript("ps_psychcln_hb", OBJECT_SELF));
    }

}
