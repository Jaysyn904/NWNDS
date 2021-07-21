void ActionCreate(string sCreature, location lLoc);

void main()
{
    if (GetLocalInt(OBJECT_SELF, "Timer") >= 180)
    {
        object oCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (GetIsObjectValid(oCreature) == TRUE && GetDistanceToObject(oCreature) < 10.0)
        {
            effect eMind = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
            string sCreature = "ZOMBIE002";
            // * 50% chance of a Kragling instead
            if (Random(100) > 50)
            {
                sCreature = "kragling_f001";
            }
            location lLoc = GetLocation(OBJECT_SELF);
            DelayCommand(0.3, ActionCreate(sCreature, lLoc));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMind, lLoc);
            SetLocalInt(OBJECT_SELF, "Timer", 0);
        }
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "Timer", GetLocalInt(OBJECT_SELF, "Timer") + 6);
    }
}

void ActionCreate(string sCreature, location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, sCreature, lLoc);
}
