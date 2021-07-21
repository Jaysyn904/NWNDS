void WhatsBeenPutIn();
void WhatsBeenTakenOut();
void CreateSomething(string szThing);

void main()
{
    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        WhatsBeenPutIn();

        if ((GetLocalInt(OBJECT_SELF, "nIceKey") > 0) && (GetLocalInt(OBJECT_SELF, "nFireKey") > 0) && (GetLocalInt(OBJECT_SELF, "nEarthKey") > 0) && (GetLocalInt(OBJECT_SELF, "nAirKey") > 0) && (GetLocalInt(OBJECT_SELF, "nClockworkAmulet1") > 0) && (GetLocalInt(OBJECT_SELF, "nClockworkAmulet2") > 0) && (GetLocalInt(OBJECT_SELF, "nClockworkAmulet3") > 0))
        {
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), OBJECT_SELF));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), OBJECT_SELF));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM), OBJECT_SELF));

            DelayCommand(0.5, CreateSomething("elementalkey"));

            SetLocalInt(OBJECT_SELF, "nIceKey", GetLocalInt(OBJECT_SELF, "nIceKey") - 1);
            SetLocalInt(OBJECT_SELF, "nFireKey", GetLocalInt(OBJECT_SELF, "nFireKey") - 1);
            SetLocalInt(OBJECT_SELF, "nEarthKey", GetLocalInt(OBJECT_SELF, "nEarthKey") - 1);
            SetLocalInt(OBJECT_SELF, "nAirKey", GetLocalInt(OBJECT_SELF, "nAirKey") - 1);
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet1", GetLocalInt(OBJECT_SELF, "nClockworkAmulet1") - 1);
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet2", GetLocalInt(OBJECT_SELF, "nClockworkAmulet2") - 1);
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet3", GetLocalInt(OBJECT_SELF, "nClockworkAmulet3") - 1);


            object oToDestroy = GetItemPossessedBy(OBJECT_SELF, "icekey");
            DelayCommand(0.2, DestroyObject(oToDestroy));
            oToDestroy = GetItemPossessedBy(OBJECT_SELF, "firekey");
            DelayCommand(0.2, DestroyObject(oToDestroy));
            oToDestroy = GetItemPossessedBy(OBJECT_SELF, "earthkey");
            DelayCommand(0.2, DestroyObject(oToDestroy));
            oToDestroy = GetItemPossessedBy(OBJECT_SELF, "airkey");
            DelayCommand(0.2, DestroyObject(oToDestroy));
            oToDestroy = GetItemPossessedBy(OBJECT_SELF, "clockworkamulet");
            DelayCommand(0.2, DestroyObject(oToDestroy));
            oToDestroy = GetItemPossessedBy(OBJECT_SELF, "clockworkamul001");
            DelayCommand(0.2, DestroyObject(oToDestroy));
            oToDestroy = GetItemPossessedBy(OBJECT_SELF, "clockworkamul002");
            DelayCommand(0.2, DestroyObject(oToDestroy));
        }
    }

    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
        WhatsBeenTakenOut();
}

void WhatsBeenPutIn()
{
    string sTag;
    object oItem = GetInventoryDisturbItem();
    if (GetIsObjectValid(oItem))
    {
        sTag = GetTag(oItem);
        if (sTag == "icekey")
        {
            SetLocalInt(OBJECT_SELF, "nIceKey", GetLocalInt(OBJECT_SELF, "nIceKey") + 1);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ICESTORM), OBJECT_SELF));
        }
        else if (sTag == "firekey")
        {
            SetLocalInt(OBJECT_SELF, "nFireKey", GetLocalInt(OBJECT_SELF, "nFireKey") + 1);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), OBJECT_SELF));
        }
        else if (sTag == "earthkey")
        {
            SetLocalInt(OBJECT_SELF, "nEarthKey", GetLocalInt(OBJECT_SELF, "nEarthKey") + 1);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), OBJECT_SELF, 6.0));
        }
        else if (sTag == "airkey")
        {
            SetLocalInt(OBJECT_SELF, "nAirKey", GetLocalInt(OBJECT_SELF, "nAirKey") + 1);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), OBJECT_SELF));
        }
        else if (sTag == "clockworkamulet")
        {
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet1", GetLocalInt(OBJECT_SELF, "nClockworkAmulet1") + 1);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_LIGHT_BLUE_20), OBJECT_SELF, 12.0));
        }
        else if (sTag == "clockworkamul001")
        {
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet2", GetLocalInt(OBJECT_SELF, "nClockworkAmulet2") + 1);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_LIGHT_RED_20), OBJECT_SELF, 12.0));
        }
        else if (sTag == "clockworkamul002")
        {
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet3", GetLocalInt(OBJECT_SELF, "nClockworkAmulet3") + 1);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_LIGHT_PURPLE_20), OBJECT_SELF, 12.0));
        }
    }
}

void WhatsBeenTakenOut()
{
    string sTag;
    object oItem = GetInventoryDisturbItem();
    if (GetIsObjectValid(oItem))
    {
        sTag = GetTag(oItem);
        if (sTag == "icekey")
            SetLocalInt(OBJECT_SELF, "nIceKey", GetLocalInt(OBJECT_SELF, "nIceKey") - 1);
        else if (sTag == "firekey")
            SetLocalInt(OBJECT_SELF, "nFireKey", GetLocalInt(OBJECT_SELF, "nFireKey") - 1);
        else if (sTag == "earthkey")
            SetLocalInt(OBJECT_SELF, "nEarthKey", GetLocalInt(OBJECT_SELF, "nEarthKey") - 1);
        else if (sTag == "airkey")
            SetLocalInt(OBJECT_SELF, "nAirKey", GetLocalInt(OBJECT_SELF, "nAirKey") - 1);
        else if (sTag == "clockworkamulet")
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet1", GetLocalInt(OBJECT_SELF, "nClockworkAmulet1") - 1);
        else if (sTag == "clockworkamul001")
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet2", GetLocalInt(OBJECT_SELF, "nClockworkAmulet2") - 1);
        else if (sTag == "clockworkamul002")
            SetLocalInt(OBJECT_SELF, "nClockworkAmulet3", GetLocalInt(OBJECT_SELF, "nClockworkAmulet3") - 1);
    }
}

void CreateSomething(string szThing)
{
    CreateItemOnObject(szThing);
}
