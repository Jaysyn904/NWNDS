void ActionCreate(string sCreature, location lLoc);

void main()
{
    if (GetLocalInt(OBJECT_SELF, "Timer") >= 180)
    {
        object oCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (GetIsObjectValid(oCreature) == TRUE && GetDistanceToObject(oCreature) < 10.0)
        {
            effect eMind = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
            string sCreature = "NW_SKELWARR01";
            // * 10% chance of a skeleton chief instead
            if (Random(100) > 90)
            {
                sCreature = "NW_SKELCHIEF";
            }
            location lLoc = GetLocation(OBJECT_SELF);
            DelayCommand(0.3, ActionCreate(sCreature, lLoc));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMind, GetLocation(OBJECT_SELF));
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
