const float fUnlifespan = 300.0;

string SpawnOf(object oSpawnKiller = OBJECT_INVALID)
{
    string sSpawn = "";
    string sKiller = GetName(oSpawnKiller, FALSE);
    object oLeft  = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oSpawnKiller);
    object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oSpawnKiller);
    string sLeftTag =   GetTag(oLeft);
    string sRightTag =  GetTag(oRight);
    if (!(GetStringRight(sKiller, 6) ==" Spawn") ||
        !(GetStringRight(sKiller, 6) ==" Rat"))
    if ((GetIsPC(GetMaster(oSpawnKiller))||(GetIsPC(oSpawnKiller))))
    {
        if ((FindSubString(sKiller, "Morg")>-1)||
           (sRightTag=="vampirespawner")||
           (sLeftTag=="vampirespawner")) sSpawn = "namechspawn";
        /* // No Vampires on Athas
        if ((FindSubString(sKiller, "Vampire")>-1)||(sRightTag=="vampirespawner")||(sLeftTag=="vampirespawner"))
        {
            if (GetGender(OBJECT_SELF)==GENDER_FEMALE) sSpawn = "vampirespawn_f";
            else sSpawn = "vampirespawn_m";
        } */
        else if ((FindSubString(sKiller, "Tyrantfog")>-1)||(sRightTag=="tyrantfogspawner")) sSpawn = "zombiespawn";
        else if (FindSubString(sKiller, "Ghoul")>-1) sSpawn = "ghoulspawn";
        else if (FindSubString(sKiller, "Ghast")>-1) sSpawn = "ghoulspawn";
        else if ((FindSubString(sKiller, "Shadow")>-1)||(sRightTag=="shadowspawner")) sSpawn = "shadowspawn";
        else if (FindSubString(sKiller, "Spectre")>-1) sSpawn = "spectrespawn";
        else if (FindSubString(sKiller, "Wraith")>-1) sSpawn = "wraithspawn";
        else if ((FindSubString(sKiller, "Wight")>-1)||(sRightTag=="wightspawner")) sSpawn = "wightspawn";
        else if (FindSubString(sKiller, "Crypt Chanter")>-1) sSpawn = "wraithspawn";
        else if (FindSubString(sKiller, "Bleakborn")>-1) sSpawn = "zombiespawn";
        else if (FindSubString(sKiller, "Bodak")>-1) sSpawn = "zombiespawn";
        else if (FindSubString(sKiller, "T'liz")>-1) sSpawn = "namechspawn";
        else if ((FindSubString(sKiller, "Meorty")>-1) ||
                 (FindSubString(sKiller, "Amithrang")>-1)) sSpawn = "namechspawn";
    }
    else // Monster Killer
    {
        if (FindSubString(sKiller, "Tyrantfog")>-1) sSpawn = "zombiespawn";
        else if (FindSubString(sKiller, "Ghast")>-1) sSpawn = "ghoulspawn";
        else if (FindSubString(sKiller, "Ghoul")>-1) sSpawn = "ghoulspawn";
        else if (((FindSubString(sKiller, "Meorty")>-1) ||
                  (FindSubString(sKiller, "Amithrang")>-1))) sSpawn = "namechspawn";
        else if (FindSubString(sKiller, "Shadow")>-1) sSpawn = "shadowspawn";
        else if (FindSubString(sKiller, "Spectre")>-1) sSpawn = "spectrespawn";
        else if (FindSubString(sKiller, "Crypt Chanter")>-1) sSpawn = "wraithspawn";
        else if (FindSubString(sKiller, "Bleakborn")>-1) sSpawn = "zombiespawn";
        else if (FindSubString(sKiller, "Bodak")>-1) sSpawn = "zombiespawn";
        else if (FindSubString(sKiller, "T'liz")>-1) sSpawn = "namechspawn";
        else if ((FindSubString(sKiller, "Morg")>-1)||
                 (sRightTag=="vampirespawner")||
                 (sLeftTag=="vampirespawner")) sSpawn = "namechspawn";
        /* //No Vampires on Athas
        {
            if (GetGender(OBJECT_SELF)==GENDER_FEMALE) sSpawn = "vampirespawn_f";
            else sSpawn = "vampirespawn_m";
        }*/
        else if (FindSubString(sKiller, "Wight")>-1) sSpawn = "wightspawn";
        if (FindSubString(sKiller, "Wraith")>-1) sSpawn = "wraithspawn";
   }
   return sSpawn;
}

int ShadeType(object oShadeKiller = OBJECT_INVALID)
{
    int iShade = 0;
    string sSpawn = "";
    string sKiller = GetName(oShadeKiller);
    object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oShadeKiller);
    string sRightTag =  GetTag(oRight);
    if ((FindSubString(sKiller, "Shadow")>-1)||(sRightTag=="shadowspawner")) iShade = 1;
    else if (FindSubString(sKiller, "Spectre")>-1) iShade = 2;
    if (FindSubString(sKiller, "Wraith")>-1) iShade = 3;
    return iShade;
}

int IsSpawnable(int iSpawnRace)
{
    int iSpawnable = 0;
    if ((iSpawnRace == RACIAL_TYPE_ANIMAL)||
        (iSpawnRace == RACIAL_TYPE_BEAST)||
        (iSpawnRace == RACIAL_TYPE_MAGICAL_BEAST)||
        (iSpawnRace == RACIAL_TYPE_SHAPECHANGER)||
        (iSpawnRace == RACIAL_TYPE_VERMIN)||
        (iSpawnRace == RACIAL_TYPE_ABERRATION)||
        (iSpawnRace == RACIAL_TYPE_FEY)||
        (iSpawnRace == RACIAL_TYPE_GIANT)||
        (iSpawnRace == RACIAL_TYPE_HUMANOID_GOBLINOID)||
        (iSpawnRace == RACIAL_TYPE_HUMANOID_MONSTROUS)||
        (iSpawnRace == RACIAL_TYPE_HUMANOID_ORC)||
        (iSpawnRace == RACIAL_TYPE_HUMANOID_REPTILIAN)||
        (iSpawnRace == RACIAL_TYPE_DRAGON)||
        (iSpawnRace == RACIAL_TYPE_DWARF)||
        (iSpawnRace == RACIAL_TYPE_ELF)||
        (iSpawnRace == RACIAL_TYPE_GNOME)||
        (iSpawnRace == RACIAL_TYPE_HALFELF)||
        (iSpawnRace == RACIAL_TYPE_HALFLING)||
        (iSpawnRace == RACIAL_TYPE_HUMAN)||
        (iSpawnRace == RACIAL_TYPE_HALFORC))
        iSpawnable = 1;
    return iSpawnable;
}

int IsNonHuman(int iSpawnRace)
{
    int iSpawnable = 0;
    if ((iSpawnRace == RACIAL_TYPE_ANIMAL)||
        (iSpawnRace == RACIAL_TYPE_BEAST)||
        (iSpawnRace == RACIAL_TYPE_DRAGON)||
        (iSpawnRace == RACIAL_TYPE_MAGICAL_BEAST)||
        (iSpawnRace == RACIAL_TYPE_VERMIN)||
        (iSpawnRace == RACIAL_TYPE_ABERRATION)||
        (iSpawnRace == RACIAL_TYPE_FEY)||
        (iSpawnRace == RACIAL_TYPE_GIANT) ||
        (iSpawnRace == RACIAL_TYPE_HUMANOID_GOBLINOID)||
        (iSpawnRace == RACIAL_TYPE_HUMANOID_MONSTROUS)||
        (iSpawnRace == RACIAL_TYPE_HUMANOID_ORC)||
        (iSpawnRace == RACIAL_TYPE_HUMANOID_REPTILIAN))
        iSpawnable = 1;
    return iSpawnable;
}

int UndeadCheck(object oMyKiller)
{
    int iPassed = 0;
    int iSpawnVFX = VFX_FNF_SUMMON_UNDEAD;
    //object oMyKiller = GetLastKiller();
    int iRace = GetRacialType(OBJECT_SELF);
    int iKillerRace = GetRacialType(oMyKiller);
    int iKillerUndeadClass = GetLevelByClass(CLASS_TYPE_UNDEAD, oMyKiller);
    object oLeft  = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oMyKiller);
    object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oMyKiller);
    string sLeftTag =   GetTag(oLeft);
    string sRightTag =  GetTag(oRight);
    if ((iKillerRace==RACIAL_TYPE_UNDEAD)
      ||(iKillerUndeadClass>0)
      ||(sRightTag=="tyrantfogspawner")
      ||(sRightTag=="shadowspawner")
      ||(sRightTag=="CR_SLAM_PSISHAD1")
      ||(sLeftTag=="CR_SLAM_PSISHAD1")
      ||(sRightTag=="vampirespawner")
      ||(sLeftTag=="vampirespawner"))
    if (IsSpawnable(iRace))
    {
    string sSpawnStr = SpawnOf(oMyKiller);
    if (sSpawnStr != "")
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(iSpawnVFX), OBJECT_SELF);
        object oSpawn = CreateObject(OBJECT_TYPE_CREATURE, sSpawnStr, GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oSpawn)) iPassed = 1;
        SetPortraitId(oSpawn, GetPortraitId(OBJECT_SELF));
        if (GetIsPC(GetMaster(oMyKiller))||(GetIsPC(oMyKiller)))
        {
            SetName(oSpawn,GetName(OBJECT_SELF,FALSE)+" "+GetName(oSpawn,TRUE));
            if (GetIsObjectValid(GetMaster(oMyKiller)))
                AddHenchman(GetMaster(oMyKiller), oSpawn);
            else AddHenchman(oMyKiller, oSpawn);
        }
        else
        {
            SetName(oSpawn,GetName(OBJECT_SELF,FALSE)+" "+GetName(oSpawn,TRUE));
            //if (FindSubString(GetName(OBJECT_SELF)," Spawn")==-1) SetName(GetName(OBJECT_SELF)+ " Spawn");
            ChangeFaction(oSpawn,oMyKiller);
        }
        int iShadeNum = 0;
        if (IsNonHuman(iRace))
        {
            SetCreatureAppearanceType(oSpawn,GetAppearanceType(OBJECT_SELF));
            iShadeNum = ShadeType(oMyKiller);
            switch (iShadeNum)
            {
                case 1: //dark shadows
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT,SupernaturalEffect(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR)),oSpawn,7.0);
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT,SupernaturalEffect(EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT)),oSpawn,7.0);
                break;
                case 2: //grey spectre
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT,SupernaturalEffect(EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT)),oSpawn,7.0);
                break;
                case 3: //light wraith
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT,SupernaturalEffect(EffectVisualEffect(VFX_DUR_GLOW_GREY)),oSpawn,7.0);
                break;
            }
        }
        if (iShadeNum>0) //Fly off
        {
            DelayCommand(fUnlifespan-1.5,ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectDisappear(), oSpawn));
            DestroyObject(oSpawn, fUnlifespan);
        }
        else // Decay and Disintegrate
        {
            DelayCommand(fUnlifespan-1.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DEATH), oSpawn));
            DestroyObject(oSpawn, fUnlifespan);
        }
    }
  }
  return iPassed;
}

//void main() {}
