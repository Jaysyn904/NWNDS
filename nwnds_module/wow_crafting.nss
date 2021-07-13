//Athas Reborn Forge OnDisturbed Script//

int lsn=151;
//lsstype=1

void SetItemLocals()
{
//Shadow Arrows Stack of 99 (Shadow Sphere + Wooden Arrow + Flourospar)//
SetLocalString(OBJECT_SELF, "lsn1", "shadowarrow");
SetLocalInt(OBJECT_SELF, "lsc_shadowarrow", 3);
SetLocalString(OBJECT_SELF, "lsi1_shadowarrow", "NW_WAMAR001");
SetLocalString(OBJECT_SELF, "lsi2_shadowarrow", "ShadowSphere");
SetLocalString(OBJECT_SELF, "lsi3_shadowarrow", "NW_IT_GEM015");
SetLocalInt(OBJECT_SELF, "lss_shadowarrow", -10);
SetLocalInt(OBJECT_SELF, "lsv_shadowarrow", VFX_FNF_SMOKE_PUFF);

//Shadow Bolts Stack of 99 (Shadow Sphere + Wooden Bolt + Flourospar)//
SetLocalString(OBJECT_SELF, "lsn2", "shadowbolts");
SetLocalInt(OBJECT_SELF, "lsc_shadowbolts", 3);
SetLocalString(OBJECT_SELF, "lsi1_shadowbolts", "NW_WAMBO001");
SetLocalString(OBJECT_SELF, "lsi2_shadowbolts", "ShadowSphere");
SetLocalString(OBJECT_SELF, "lsi3_shadowbolts", "NW_IT_GEM015");
SetLocalInt(OBJECT_SELF, "lss_shadowbolts", -10);
SetLocalInt(OBJECT_SELF, "lsv_shadowbolts", VFX_FNF_SMOKE_PUFF);

//Shadow Bullets Stack of 99 (Shadow Sphere + Stone Bullet + Flourospar)//
SetLocalString(OBJECT_SELF, "lsn3", "shadowbullet");
SetLocalInt(OBJECT_SELF, "lsc_shadowbullet", 3);
SetLocalString(OBJECT_SELF, "lsi1_shadowbullet", "NW_WAMBU001");
SetLocalString(OBJECT_SELF, "lsi2_shadowbullet", "ShadowSphere");
SetLocalString(OBJECT_SELF, "lsi3_shadowbullet", "NW_IT_GEM015");
SetLocalInt(OBJECT_SELF, "lss_shadowbullet", -10);
SetLocalInt(OBJECT_SELF, "lsv_shadowbullet", VFX_FNF_SMOKE_PUFF);

//Fire Arrows Stack of 99 (Brimstone + Wooden Arrow + Fire Agate)//
SetLocalString(OBJECT_SELF, "lsn4", "wammar003");
SetLocalInt(OBJECT_SELF, "lsc_wammar003", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammar003", "NW_IT_GEM002");
SetLocalString(OBJECT_SELF, "lsi2_wammar003", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi3_wammar003", "NW_WAMAR001");
SetLocalInt(OBJECT_SELF, "lss_wammar003", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammar003", VFX_FNF_SMOKE_PUFF);

//Fire Bolts Stack of 99 (Brimstone + Wooden Bolt + Fire Agate)//
SetLocalString(OBJECT_SELF, "lsn5", "wammbo006");
SetLocalInt(OBJECT_SELF, "lsc_wammbo006", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammbo006", "NW_IT_GEM002");
SetLocalString(OBJECT_SELF, "lsi2_wammbo006", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi3_wammbo006", "NW_WAMBO001");
SetLocalInt(OBJECT_SELF, "lss_wammbo006", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammbo006", VFX_FNF_SMOKE_PUFF);

//Fire Bullets Stack of 99 (Brimstone + Stone Bullet + Fire Agate)//
SetLocalString(OBJECT_SELF, "lsn6", "wammbu006");
SetLocalInt(OBJECT_SELF, "lsc_wammbu006", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammbu006", "NW_IT_GEM002");
SetLocalString(OBJECT_SELF, "lsi2_wammbu006", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi3_wammbu006", "NW_WAMBU001");
SetLocalInt(OBJECT_SELF, "lss_wammbu006", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammbu006", VFX_FNF_SMOKE_PUFF);

//Fire Darts Stack of 50 (Brimstone + Wooden Dart + Fire Agate)//
SetLocalString(OBJECT_SELF, "lsn7", "firedart");
SetLocalInt(OBJECT_SELF, "lsc_firedart", 3);
SetLocalString(OBJECT_SELF, "lsi1_firedart", "NW_IT_GEM002");
SetLocalString(OBJECT_SELF, "lsi2_firedart", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi3_firedart", "NW_WTHDT001");
SetLocalInt(OBJECT_SELF, "lss_firedart", -10);
SetLocalInt(OBJECT_SELF, "lsv_firedart", VFX_FNF_SMOKE_PUFF);

//Fire Throwing Axes Stack of 50 (Brimstone + Stone Throwing Axe + Fire Agate)//
SetLocalString(OBJECT_SELF, "lsn8", "fireaxe");
SetLocalInt(OBJECT_SELF, "lsc_fireaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_fireaxe", "NW_IT_GEM002");
SetLocalString(OBJECT_SELF, "lsi2_fireaxe", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi3_fireaxe", "NW_WTHAX001");
SetLocalInt(OBJECT_SELF, "lss_fireaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_fireaxe", VFX_FNF_SMOKE_PUFF);

//Fire Chatchkas Stack of 50 (Brimstone + Obsidian Chatchka + Fire Agate)//
SetLocalString(OBJECT_SELF, "lsn9", "firechatchka");
SetLocalInt(OBJECT_SELF, "lsc_firechatchka", 3);
SetLocalString(OBJECT_SELF, "lsi1_firechatchka", "NW_IT_GEM002");
SetLocalString(OBJECT_SELF, "lsi2_firechatchka", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi3_firechatchka", "Chatchka");
SetLocalInt(OBJECT_SELF, "lss_firechatchka", -10);
SetLocalInt(OBJECT_SELF, "lsv_firechatchka", VFX_FNF_SMOKE_PUFF);

//Ice Arrows Stack of 99 (Coldstone + Wooden Arrow + Aventurine)//
SetLocalString(OBJECT_SELF, "lsn10", "wammar006");
SetLocalInt(OBJECT_SELF, "lsc_wammar006", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammar006", "NW_IT_GEM014");
SetLocalString(OBJECT_SELF, "lsi2_wammar006", "IceNine");
SetLocalString(OBJECT_SELF, "lsi3_wammar006", "NW_WAMAR001");
SetLocalInt(OBJECT_SELF, "lss_wammar006", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammar006", VFX_FNF_SMOKE_PUFF);

//Ice Bolts Stack of 99 (Coldstone + Wooden Bolt + Aventurine)//
SetLocalString(OBJECT_SELF, "lsn11", "wammbo002");
SetLocalInt(OBJECT_SELF, "lsc_wammbo002", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammbo002", "NW_IT_GEM014");
SetLocalString(OBJECT_SELF, "lsi2_wammbo002", "IceNine");
SetLocalString(OBJECT_SELF, "lsi3_wammbo002", "NW_WAMBO001");
SetLocalInt(OBJECT_SELF, "lss_wammbo002", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammbo002", VFX_FNF_SMOKE_PUFF);

//Ice Bullets Stack of 99 (Coldstone + Stone Bullet + Aventurine)//
SetLocalString(OBJECT_SELF, "lsn12", "wammbu007");
SetLocalInt(OBJECT_SELF, "lsc_wammbu007", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammbu007", "NW_IT_GEM014");
SetLocalString(OBJECT_SELF, "lsi2_wammbu007", "IceNine");
SetLocalString(OBJECT_SELF, "lsi3_wammbu007", "NW_WAMBU001");
SetLocalInt(OBJECT_SELF, "lss_wammbu007", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammbu007", VFX_FNF_SMOKE_PUFF);

//Ice Darts Stack of 50 (Coldstone + Wooden Dart + Aventurine)//
SetLocalString(OBJECT_SELF, "lsn13", "icedart");
SetLocalInt(OBJECT_SELF, "lsc_icedart", 3);
SetLocalString(OBJECT_SELF, "lsi1_icedart", "NW_IT_GEM014");
SetLocalString(OBJECT_SELF, "lsi2_icedart", "IceNine");
SetLocalString(OBJECT_SELF, "lsi3_icedart", "NW_WTHDT001");
SetLocalInt(OBJECT_SELF, "lss_icedart", -10);
SetLocalInt(OBJECT_SELF, "lsv_icedart", VFX_FNF_SMOKE_PUFF);

//Ice Throwing Axes Stack of 50 (Coldstone + Stone Throwing Axe + Aventurine)//
SetLocalString(OBJECT_SELF, "lsn14", "iceaxe");
SetLocalInt(OBJECT_SELF, "lsc_iceaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_iceaxe", "NW_IT_GEM014");
SetLocalString(OBJECT_SELF, "lsi2_iceaxe", "IceNine");
SetLocalString(OBJECT_SELF, "lsi3_iceaxe", "NW_WTHAX001");
SetLocalInt(OBJECT_SELF, "lss_iceaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_iceaxe", VFX_FNF_SMOKE_PUFF);

//Ice Chatchkas Stack of 50 (Coldstone + Obsidian Chatchka + Aventurine)//
SetLocalString(OBJECT_SELF, "lsn15", "icechatchka");
SetLocalInt(OBJECT_SELF, "lsc_icechatchka", 3);
SetLocalString(OBJECT_SELF, "lsi1_icechatchka", "NW_IT_GEM014");
SetLocalString(OBJECT_SELF, "lsi2_icechatchka", "IceNine");
SetLocalString(OBJECT_SELF, "lsi3_icechatchka", "Chatchka");
SetLocalInt(OBJECT_SELF, "lss_icechatchka", -10);
SetLocalInt(OBJECT_SELF, "lsv_icechatchka", VFX_FNF_SMOKE_PUFF);

//Acid Arrows Stack of 99 (Acid Crystal + Wooden Arrow + Malachite)//
SetLocalString(OBJECT_SELF, "lsn16", "wammar004");
SetLocalInt(OBJECT_SELF, "lsc_wammar004", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammar004", "NW_IT_GEM007");
SetLocalString(OBJECT_SELF, "lsi2_wammar004", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi3_wammar004", "NW_WAMAR001");
SetLocalInt(OBJECT_SELF, "lss_wammar004", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammar004", VFX_FNF_SMOKE_PUFF);

//Acid Bolts Stack of 99 (Acid Crystal + Wooden Bolt + Malachite)//
SetLocalString(OBJECT_SELF, "lsn17", "wammbo004");
SetLocalInt(OBJECT_SELF, "lsc_wammbo004", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammbo004", "NW_IT_GEM007");
SetLocalString(OBJECT_SELF, "lsi2_wammbo004", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi3_wammbo004", "NW_WAMBO001");
SetLocalInt(OBJECT_SELF, "lss_wammbo004", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammbo004", VFX_FNF_SMOKE_PUFF);

//Acid Bullets Stack of 99 (Acid Crystal + Stone Bullet + Malachite)//
SetLocalString(OBJECT_SELF, "lsn18", "wammbu009");
SetLocalInt(OBJECT_SELF, "lsc_wammbu009", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammbu009", "NW_IT_GEM007");
SetLocalString(OBJECT_SELF, "lsi2_wammbu009", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi3_wammbu009", "NW_WAMBU001");
SetLocalInt(OBJECT_SELF, "lss_wammbu009", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammbu009", VFX_FNF_SMOKE_PUFF);

//Acid Darts Stack of 50 (Acid Crystal + Wooden Dart + Malachite)//
SetLocalString(OBJECT_SELF, "lsn19", "aciddart");
SetLocalInt(OBJECT_SELF, "lsc_aciddart", 3);
SetLocalString(OBJECT_SELF, "lsi1_aciddart", "NW_IT_GEM007");
SetLocalString(OBJECT_SELF, "lsi2_aciddart", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi3_aciddart", "NW_WTHDT001");
SetLocalInt(OBJECT_SELF, "lss_aciddart", -10);
SetLocalInt(OBJECT_SELF, "lsv_aciddart", VFX_FNF_SMOKE_PUFF);

//Acid Throwing Axes Stack of 50 (Acid Crystal + Stone Throwing Axe + Malachite)//
SetLocalString(OBJECT_SELF, "lsn20", "acidaxe");
SetLocalInt(OBJECT_SELF, "lsc_acidaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidaxe", "NW_IT_GEM007");
SetLocalString(OBJECT_SELF, "lsi2_acidaxe", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi3_acidaxe", "NW_WTHAX001");
SetLocalInt(OBJECT_SELF, "lss_acidaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidaxe", VFX_FNF_SMOKE_PUFF);

//Acid Chatchkas Stack of 50 (Acid Crystal + Obsidian Chatchka + Malachite)//
SetLocalString(OBJECT_SELF, "lsn21", "acidchatchka");
SetLocalInt(OBJECT_SELF, "lsc_acidchatchka", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidchatchka", "NW_IT_GEM007");
SetLocalString(OBJECT_SELF, "lsi2_acidchatchka", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi3_acidchatchka", "Chatchka");
SetLocalInt(OBJECT_SELF, "lss_acidchatchka", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidchatchka", VFX_FNF_SMOKE_PUFF);

//Lightning Arrows Stack of 99 (Charged Crystal + Wooden Arrow + Phenalope)//
SetLocalString(OBJECT_SELF, "lsn22", "wammar007");
SetLocalInt(OBJECT_SELF, "lsc_wammar007", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammar007", "NW_IT_GEM004");
SetLocalString(OBJECT_SELF, "lsi2_wammar007", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi3_wammar007", "NW_WAMAR001");
SetLocalInt(OBJECT_SELF, "lss_wammar007", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammar007", VFX_FNF_SMOKE_PUFF);

//Lightning Bolts Stack of 99 (Charged Crystal + Wooden Bolt + Phenalope)//
SetLocalString(OBJECT_SELF, "lsn23", "wammbo003");
SetLocalInt(OBJECT_SELF, "lsc_wammbo003", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammbo003", "NW_IT_GEM004");
SetLocalString(OBJECT_SELF, "lsi2_wammbo003", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi3_wammbo003", "NW_WAMBO001");
SetLocalInt(OBJECT_SELF, "lss_wammbo003", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammbo003", VFX_FNF_SMOKE_PUFF);

//Lightning Bullets Stack of 99 (Charged Crystal + Stone Bullet + Phenalope)//
SetLocalString(OBJECT_SELF, "lsn24", "wammbu008");
SetLocalInt(OBJECT_SELF, "lsc_wammbu008", 3);
SetLocalString(OBJECT_SELF, "lsi1_wammbu008", "NW_IT_GEM004");
SetLocalString(OBJECT_SELF, "lsi2_wammbu008", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi3_wammbu008", "NW_WAMBU001");
SetLocalInt(OBJECT_SELF, "lss_wammbu008", -10);
SetLocalInt(OBJECT_SELF, "lsv_wammbu008", VFX_FNF_SMOKE_PUFF);

//Lightning Darts Stack of 50 (Charged Crystal + Wooden Dart + Phenalope)//
SetLocalString(OBJECT_SELF, "lsn25", "lightningdart");
SetLocalInt(OBJECT_SELF, "lsc_lightningdart", 3);
SetLocalString(OBJECT_SELF, "lsi1_lightningdart", "NW_IT_GEM004");
SetLocalString(OBJECT_SELF, "lsi2_lightningdart", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi3_lightningdart", "NW_WTHDT001");
SetLocalInt(OBJECT_SELF, "lss_lightningdart", -10);
SetLocalInt(OBJECT_SELF, "lsv_lightningdart", VFX_FNF_SMOKE_PUFF);

//Lightning Throwing Axes Stack of 50 (Charged Crystal + Stone Throwing Axe + Phenalope)//
SetLocalString(OBJECT_SELF, "ls26", "lightningaxe");
SetLocalInt(OBJECT_SELF, "lsc_lightningaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_lightningaxe", "NW_IT_GEM004");
SetLocalString(OBJECT_SELF, "lsi2_lightningaxe", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi3_lightningaxe", "NW_WTHAX001");
SetLocalInt(OBJECT_SELF, "lss_lightningaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_lightningaxe", VFX_FNF_SMOKE_PUFF);

//Lightning Chatchkas Stack of 50 (Charged Crystal + Obsidian Chatchka + Phenalope)//
SetLocalString(OBJECT_SELF, "lsn27", "lightningchatchk");
SetLocalInt(OBJECT_SELF, "lsc_lightningchatchk", 3);
SetLocalString(OBJECT_SELF, "lsi1_lightningchatchk", "NW_IT_GEM004");
SetLocalString(OBJECT_SELF, "lsi2_lightningchatchk", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi3_lightningchatchk", "Chatchka");
SetLocalInt(OBJECT_SELF, "lss_lightningchatchk", -10);
SetLocalInt(OBJECT_SELF, "lsv_lightningchatchk", VFX_FNF_SMOKE_PUFF);

//Air Drake Heavy Armor (Bone Brigadine + Ruby + Air Drake Hide + Celestial Elxir)//
SetLocalString(OBJECT_SELF, "lsn28", "airdrakearmorh");
SetLocalInt(OBJECT_SELF, "lsc_airdrakearmorh", 4);
SetLocalString(OBJECT_SELF, "lsi1_airdrakearmorh", "NW_AARCL006");
SetLocalString(OBJECT_SELF, "lsi2_airdrakearmorh", "AirDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_airdrakearmorh", "NW_HEN_SHA1QT");
SetLocalString(OBJECT_SELF, "lsi4_airdrakearmorh", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_airdrakearmorh", -10);
SetLocalInt(OBJECT_SELF, "lsv_airdrakearmorh", VFX_FNF_SMOKE_PUFF);

//Air Drake Medium Armor (Bone Scale Mail + Ruby + Air Drake Hide + Celestial Elxir)//
SetLocalString(OBJECT_SELF, "lsn29", "airdrakearmorm");
SetLocalInt(OBJECT_SELF, "lsc_airdrakearmorm", 4);
SetLocalString(OBJECT_SELF, "lsi1_airdrakearmorm", "BoneScaleMail");
SetLocalString(OBJECT_SELF, "lsi2_airdrakearmorm", "AirDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_airdrakearmorm", "NW_HEN_SHA1QT");
SetLocalString(OBJECT_SELF, "lsi4_airdrakearmorm", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_airdrakearmorm", -10);
SetLocalInt(OBJECT_SELF, "lsv_airdrakearmorm", VFX_FNF_SMOKE_PUFF);

//Air Drake Light Armor (Bone Studded Leather + Ruby + Air Drake Hide + Celestial Elxir)//
SetLocalString(OBJECT_SELF, "lsn30", "airdrakearmorl");
SetLocalInt(OBJECT_SELF, "lsc_airdrakearmorl", 4);
SetLocalString(OBJECT_SELF, "lsi1_airdrakearmorl", "NW_AARCL002");
SetLocalString(OBJECT_SELF, "lsi2_airdrakearmorl", "AirDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_airdrakearmorl", "NW_HEN_SHA1QT");
SetLocalString(OBJECT_SELF, "lsi4_airdrakearmorl", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_airdrakearmorl", -10);
SetLocalInt(OBJECT_SELF, "lsv_airdrakearmorl", VFX_FNF_SMOKE_PUFF);

//Air Drake Helmet (Bone Helmet + Ruby + Air Drake Hide + Celestial Elxir)//
SetLocalString(OBJECT_SELF, "lsn31", "airdrakehelmet");
SetLocalInt(OBJECT_SELF, "lsc_airdrakehelmet", 4);
SetLocalString(OBJECT_SELF, "lsi1_airdrakehelmet", "BoneHelmet");
SetLocalString(OBJECT_SELF, "lsi2_airdrakehelmet", "AirDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_airdrakehelmet", "NW_HEN_SHA1QT");
SetLocalString(OBJECT_SELF, "lsi4_airdrakehelmet", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_airdrakehelmet", -10);
SetLocalInt(OBJECT_SELF, "lsv_airdrakehelmet", VFX_FNF_SMOKE_PUFF);

//Water Drake Heavy Armor (Bone Brigadine + Ruby + Water Drake Hide + Erdlu Blood)//
SetLocalString(OBJECT_SELF, "lsn32", "waterdrakearmorh");
SetLocalInt(OBJECT_SELF, "lsc_waterdrakearmorh", 4);
SetLocalString(OBJECT_SELF, "lsi1_waterdrakearmorh", "NW_AARCL006");
SetLocalString(OBJECT_SELF, "lsi2_waterdrakearmorh", "WaterDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_waterdrakearmorh", "ErdluBlood");
SetLocalString(OBJECT_SELF, "lsi4_waterdrakearmorh", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_waterdrakearmorh", -10);
SetLocalInt(OBJECT_SELF, "lsv_waterdrakearmorh", VFX_FNF_SMOKE_PUFF);

//Water Drake Medium Armor (Bone Scale Mail + Ruby + Water Drake Hide + Erdlu Blood)//
SetLocalString(OBJECT_SELF, "lsn33", "waterdrakearmom");
SetLocalInt(OBJECT_SELF, "lsc_waterdrakearmom", 4);
SetLocalString(OBJECT_SELF, "lsi1_waterdrakearmom", "BoneScaleMail");
SetLocalString(OBJECT_SELF, "lsi2_waterdrakearmom", "ErdluBlood");
SetLocalString(OBJECT_SELF, "lsi3_waterdrakearmom", "WaterDrakeHide");
SetLocalString(OBJECT_SELF, "lsi4_waterdrakearmom", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_waterdrakearmom", -10);
SetLocalInt(OBJECT_SELF, "lsv_waterdrakearmom", VFX_FNF_SMOKE_PUFF);

//Water Drake Light Armor (Bone Studded Leather + Ruby + Water Drake Hide + Erdlu Blood)//
SetLocalString(OBJECT_SELF, "lsn34", "waterdrakearmol");
SetLocalInt(OBJECT_SELF, "lsc_waterdrakearmol", 4);
SetLocalString(OBJECT_SELF, "lsi1_waterdrakearmol", "NW_AARCL002");
SetLocalString(OBJECT_SELF, "lsi2_waterdrakearmol", "WaterDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_waterdrakearmol", "ErdluBlood");
SetLocalString(OBJECT_SELF, "lsi4_waterdrakearmol", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_waterdrakearmol", -10);
SetLocalInt(OBJECT_SELF, "lsv_waterdrakearmol", VFX_FNF_SMOKE_PUFF);

//Water Drake Helmet (Bone Helmet + Ruby + Water Drake Hide + Erdlu Blood)//
SetLocalString(OBJECT_SELF, "lsn35", "waterdrakehelmet");
SetLocalInt(OBJECT_SELF, "lsc_waterdrakehelmet", 4);
SetLocalString(OBJECT_SELF, "lsi1_waterdrakehelmet", "BoneHelmet");
SetLocalString(OBJECT_SELF, "lsi2_waterdrakehelmet", "WaterDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_waterdrakehelmet", "ErdluBlood");
SetLocalString(OBJECT_SELF, "lsi4_waterdrakehelmet", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_waterdrakehelmet", -10);
SetLocalInt(OBJECT_SELF, "lsv_waterdrakehelmet", VFX_FNF_SMOKE_PUFF);

//Earth Drake Heavy Armor (Bone Brigadine + Ruby + Earth Drake Hide + Erdlu Blood)//
SetLocalString(OBJECT_SELF, "lsn36", "earthdrakeh");
SetLocalInt(OBJECT_SELF, "lsc_earthdrakeh", 4);
SetLocalString(OBJECT_SELF, "lsi1_earthdrakeh", "NW_AARCL006");
SetLocalString(OBJECT_SELF, "lsi2_earthdrakeh", "EarthDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_earthdrakeh", "ErdluBlood");
SetLocalString(OBJECT_SELF, "lsi4_earthdrakeh", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_earthdrakeh", -10);
SetLocalInt(OBJECT_SELF, "lsv_earthdrakeh", VFX_FNF_SMOKE_PUFF);

//Earth Drake Medium Armor (Bone Scale Mail + Ruby + Earth Drake Hide + Erdlu Blood)//
SetLocalString(OBJECT_SELF, "lsn37", "earthdrakem");
SetLocalInt(OBJECT_SELF, "lsc_earthdrakem", 4);
SetLocalString(OBJECT_SELF, "lsi1_earthdrakem", "BoneScaleMail");
SetLocalString(OBJECT_SELF, "lsi2_earthdrakem", "EarthDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_earthdrakem", "ErdluBlood");
SetLocalString(OBJECT_SELF, "lsi4_earthdrakem", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_earthdrakem", -10);
SetLocalInt(OBJECT_SELF, "lsv_earthdrakem", VFX_FNF_SMOKE_PUFF);

//Earth Drake Light Armor (Bone Studded Leather + Ruby + Earth Drake Hide + Erdlu Blood)//
SetLocalString(OBJECT_SELF, "lsn38", "earthdrakel");
SetLocalInt(OBJECT_SELF, "lsc_earthdrakel", 4);
SetLocalString(OBJECT_SELF, "lsi1_earthdrakel", "NW_AARCL002");
SetLocalString(OBJECT_SELF, "lsi2_earthdrakel", "EarthDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_earthdrakel", "ErdluBlood");
SetLocalString(OBJECT_SELF, "lsi4_earthdrakel", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_earthdrakel", -10);
SetLocalInt(OBJECT_SELF, "lsv_earthdrakel", VFX_FNF_SMOKE_PUFF);

//Earth Drake Helmet (Bone Helmet + Ruby + Earth Drake Hide + Erdlu Blood)//
SetLocalString(OBJECT_SELF, "lsn39", "earthdrakehelm");
SetLocalInt(OBJECT_SELF, "lsc_earthdrakehelm", 4);
SetLocalString(OBJECT_SELF, "lsi1_earthdrakehelm", "BoneHelmet");
SetLocalString(OBJECT_SELF, "lsi2_earthdrakehelm", "EarthDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_earthdrakehelm", "ErdluBlood");
SetLocalString(OBJECT_SELF, "lsi4_earthdrakehelm", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_earthdrakehelm", -10);
SetLocalInt(OBJECT_SELF, "lsv_earthdrakehelm", VFX_FNF_SMOKE_PUFF);

//Fire Drake Heavy Armor (Bone Brigadine + Ruby + Fire Drake Hide + Celestial Elxir)//
SetLocalString(OBJECT_SELF, "lsn40", "firedrakearmor");
SetLocalInt(OBJECT_SELF, "lsc_firedrakearmor", 4);
SetLocalString(OBJECT_SELF, "lsi1_firedrakearmor", "NW_AARCL006");
SetLocalString(OBJECT_SELF, "lsi2_firedrakearmor", "FireDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_firedrakearmor", "NW_HEN_SHA1QT");
SetLocalString(OBJECT_SELF, "lsi4_firedrakearmor", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_firedrakearmor", -10);
SetLocalInt(OBJECT_SELF, "lsv_firedrakearmor", VFX_FNF_SMOKE_PUFF);

//Fire Drake Medium Armor (Bone Scale Mail + Ruby + Fire Drake Hide + Celestial Elxir)//
SetLocalString(OBJECT_SELF, "lsn41", "firedrakearmorm");
SetLocalInt(OBJECT_SELF, "lsc_firedrakearmorm", 4);
SetLocalString(OBJECT_SELF, "lsi1_firedrakearmorm", "BoneScaleMail");
SetLocalString(OBJECT_SELF, "lsi2_firedrakearmorm", "FireDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_firedrakearmorm", "NW_HEN_SHA1QT");
SetLocalString(OBJECT_SELF, "lsi4_firedrakearmorm", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_firedrakearmorm", -10);
SetLocalInt(OBJECT_SELF, "lsv_firedrakearmorm", VFX_FNF_SMOKE_PUFF);

//Fire Drake Light Armor (Bone Studded Leather + Ruby + Fire Drake Hide + Celestial Elxir)//
SetLocalString(OBJECT_SELF, "lsn42", "firedrakearmorl");
SetLocalInt(OBJECT_SELF, "lsc_firedrakearmorl", 4);
SetLocalString(OBJECT_SELF, "lsi1_firedrakearmorl", "NW_AARCL002");
SetLocalString(OBJECT_SELF, "lsi2_firedrakearmorl", "FireDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_firedrakearmorl", "NW_HEN_SHA1QT");
SetLocalString(OBJECT_SELF, "lsi4_firedrakearmorl", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_firedrakearmorl", -10);
SetLocalInt(OBJECT_SELF, "lsv_firedrakearmorl", VFX_FNF_SMOKE_PUFF);

//Fire Drake Helmet (Bone Helmet + Ruby + Fire Drake Hide + Celestial Elxir)//
SetLocalString(OBJECT_SELF, "lsn43", "firedrakehelm");
SetLocalInt(OBJECT_SELF, "lsc_firedrakehelm", 4);
SetLocalString(OBJECT_SELF, "lsi1_firedrakehelm", "BoneHelmet");
SetLocalString(OBJECT_SELF, "lsi2_firedrakehelm", "FireDrakeHide");
SetLocalString(OBJECT_SELF, "lsi3_firedrakehelm", "NW_HEN_SHA1QT");
SetLocalString(OBJECT_SELF, "lsi4_firedrakehelm", "NW_IT_GEM006");
SetLocalInt(OBJECT_SELF, "lss_firedrakehelm", -10);
SetLocalInt(OBJECT_SELF, "lsv_firedrakehelm", VFX_FNF_SMOKE_PUFF);

//Flame Short Sword (Emerald + Obsidian Short Sword + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn44", "flameblade");
SetLocalInt(OBJECT_SELF, "lsc_flameblade", 3);
SetLocalString(OBJECT_SELF, "lsi1_flameblade", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flameblade", "NW_WSWSS002");
SetLocalString(OBJECT_SELF, "lsi3_flameblade", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flameblade", -10);
SetLocalInt(OBJECT_SELF, "lsv_flameblade", VFX_FNF_SMOKE_PUFF);

//Ice Short Sword (Emerald + Obsidian Short Sword + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn45", "iceblade");
SetLocalInt(OBJECT_SELF, "lsc_iceblade", 3);
SetLocalString(OBJECT_SELF, "lsi1_iceblade", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_iceblade", "NW_WSWSS002");
SetLocalString(OBJECT_SELF, "lsi3_iceblade", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_iceblade", -10);
SetLocalInt(OBJECT_SELF, "lsv_iceblade", VFX_FNF_SMOKE_PUFF);

//Acid Short Sword (Emerald + Obsidian Short Sword + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn46", "acidblade");
SetLocalInt(OBJECT_SELF, "lsc_acidblade", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidblade", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidblade", "NW_WSWSS002");
SetLocalString(OBJECT_SELF, "lsi3_acidblade", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidblade", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidblade", VFX_FNF_SMOKE_PUFF);

//Charged Short Sword (Emerald + Obsidian Short Sword + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn47", "chargedblade");
SetLocalInt(OBJECT_SELF, "lsc_chargedblade", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedblade", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedblade", "NW_WSWSS002");
SetLocalString(OBJECT_SELF, "lsi3_chargedblade", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedblade", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedblade", VFX_FNF_SMOKE_PUFF);

//Fire Kama (Emerald + Obsidian Kama + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn48", "firekama");
SetLocalInt(OBJECT_SELF, "lsc_firekama", 3);
SetLocalString(OBJECT_SELF, "lsi1_firekama", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_firekama", "ObsidianKama");
SetLocalString(OBJECT_SELF, "lsi3_firekama", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_firekama", -10);
SetLocalInt(OBJECT_SELF, "lsv_firekama", VFX_FNF_SMOKE_PUFF);

//Ice Kama (Emerald + Obsidian Kama + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn49", "icekama");
SetLocalInt(OBJECT_SELF, "lsc_icekama", 3);
SetLocalString(OBJECT_SELF, "lsi1_icekama", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icekama", "ObsidianKama");
SetLocalString(OBJECT_SELF, "lsi3_icekama", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icekama", -10);
SetLocalInt(OBJECT_SELF, "lsv_icekama", VFX_FNF_SMOKE_PUFF);

//Acid Kama (Emerald + Obsidian Kama + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn50", "acidkama");
SetLocalInt(OBJECT_SELF, "lsc_acidkama", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidkama", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidkama", "ObsidianKama");
SetLocalString(OBJECT_SELF, "lsi3_acidkama", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidkama", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidkama", VFX_FNF_SMOKE_PUFF);

//Charged Kama (Emerald + Obsidian Kama + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn51", "chargedkama");
SetLocalInt(OBJECT_SELF, "lsc_chargedkama", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedkama", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedkama", "ObsidianKama");
SetLocalString(OBJECT_SELF, "lsi3_chargedkama", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedkama", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedkama", VFX_FNF_SMOKE_PUFF);

//Flame Longsword (Emerald + Obsidian Longsword + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn52", "flamesword");
SetLocalInt(OBJECT_SELF, "lsc_flamesword", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamesword", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamesword", "NW_WSWLS002");
SetLocalString(OBJECT_SELF, "lsi3_flamesword", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamesword", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamesword", VFX_FNF_SMOKE_PUFF);

//Ice Longsword (Emerald + Obsidian Longsword + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn53", "icesword");
SetLocalInt(OBJECT_SELF, "lsc_icesword", 3);
SetLocalString(OBJECT_SELF, "lsi1_icesword", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icesword", "NW_WSWLS002");
SetLocalString(OBJECT_SELF, "lsi3_icesword", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icesword", -10);
SetLocalInt(OBJECT_SELF, "lsv_icesword", VFX_FNF_SMOKE_PUFF);

//Acid Longsword (Emerald + Obsidian Longsword + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn54", "acidsword");
SetLocalInt(OBJECT_SELF, "lsc_acidsword", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidsword", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidsword", "NW_WSWLS002");
SetLocalString(OBJECT_SELF, "lsi3_acidsword", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidsword", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidsword", VFX_FNF_SMOKE_PUFF);

//Charged Longsword (Emerald + Obsidian Longsword + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn55", "chargedsword");
SetLocalInt(OBJECT_SELF, "lsc_chargedsword", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedsword", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedsword", "NW_WSWLS002");
SetLocalString(OBJECT_SELF, "lsi3_chargedsword", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedsword", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedsword", VFX_FNF_SMOKE_PUFF);

//Flame Spear (Emerald + Wooden Spear + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn56", "firespear");
SetLocalInt(OBJECT_SELF, "lsc_firespear", 3);
SetLocalString(OBJECT_SELF, "lsi1_firespear", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_firespear", "NW_WPLSS002");
SetLocalString(OBJECT_SELF, "lsi3_firespear", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_firespear", -10);
SetLocalInt(OBJECT_SELF, "lsv_firespear", VFX_FNF_SMOKE_PUFF);

//Ice Spear (Emerald + Wooden Spear + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn57", "icespear");
SetLocalInt(OBJECT_SELF, "lsc_icespear", 3);
SetLocalString(OBJECT_SELF, "lsi1_icespear", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icespear", "NW_WPLSS002");
SetLocalString(OBJECT_SELF, "lsi3_icespear", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icespear", -10);
SetLocalInt(OBJECT_SELF, "lsv_icespear", VFX_FNF_SMOKE_PUFF);

//Acid Spear (Emerald + Wooden Spear + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn58", "acidspear");
SetLocalInt(OBJECT_SELF, "lsc_acidspear", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidspear", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidspear", "NW_WPLSS002");
SetLocalString(OBJECT_SELF, "lsi3_acidspear", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidspear", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidspear", VFX_FNF_SMOKE_PUFF);

//Charged Spear (Emerald + Wooden Spear + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn59", "chargedspear");
SetLocalInt(OBJECT_SELF, "lsc_chargedspear", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedspear", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedspear", "NW_WPLSS002");
SetLocalString(OBJECT_SELF, "lsi3_chargedspear", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedspear", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedspear", VFX_FNF_SMOKE_PUFF);

//Flame Halberd (Emerald + Obsidian Halberd + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn60", "flamehalberd");
SetLocalInt(OBJECT_SELF, "lsc_flamehalberd", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamehalberd", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamehalberd", "NW_WPLHB002");
SetLocalString(OBJECT_SELF, "lsi3_flamehalberd", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamehalberd", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamehalberd", VFX_FNF_SMOKE_PUFF);

//Ice Halberd (Emerald + Wooden Spear + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn61", "icehalberd");
SetLocalInt(OBJECT_SELF, "lsc_icehalberd", 3);
SetLocalString(OBJECT_SELF, "lsi1_icehalberd", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icehalberd", "NW_WPLHB002");
SetLocalString(OBJECT_SELF, "lsi3_icehalberd", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icehalberd", -10);
SetLocalInt(OBJECT_SELF, "lsv_icehalberd", VFX_FNF_SMOKE_PUFF);

//Acid Halberd (Emerald + Wooden Spear + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn62", "acidhalberd");
SetLocalInt(OBJECT_SELF, "lsc_acidhalberd", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidhalberd", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidhalberd", "NW_WPLHB002");
SetLocalString(OBJECT_SELF, "lsi3_acidhalberd", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidhalberd", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidhalberd", VFX_FNF_SMOKE_PUFF);

//Charged Halberd (Emerald + Wooden Spear + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn63", "chargedhalberd");
SetLocalInt(OBJECT_SELF, "lsc_chargedhalberd", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedhalberd", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedhalberd", "NW_WPLHB002");
SetLocalString(OBJECT_SELF, "lsi3_chargedhalberd", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedhalberd", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedhalberd", VFX_FNF_SMOKE_PUFF);

//Flame Scimitar (Emerald + Obsidian Scimitar + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn64", "flamescimitar");
SetLocalInt(OBJECT_SELF, "lsc_flamescimitar", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamescimitar", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamescimitar", "ObsidianScimitar");
SetLocalString(OBJECT_SELF, "lsi3_flamescimitar", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamescimitar", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamescimitar", VFX_FNF_SMOKE_PUFF);

//Ice Scimitar (Emerald + Obsidian Scimitar + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn65", "icescimitar");
SetLocalInt(OBJECT_SELF, "lsc_icescimitar", 3);
SetLocalString(OBJECT_SELF, "lsi1_icescimitar", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icescimitar", "ObsidianScimitar");
SetLocalString(OBJECT_SELF, "lsi3_icescimitar", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icescimitar", -10);
SetLocalInt(OBJECT_SELF, "lsv_icescimitar", VFX_FNF_SMOKE_PUFF);

//Acid Scimitar (Emerald + Obsidian Scimitar + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn66", "acidscimitar");
SetLocalInt(OBJECT_SELF, "lsc_acidscimitar", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidscimitar", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidscimitar", "ObsidianScimitar");
SetLocalString(OBJECT_SELF, "lsi3_acidscimitar", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidscimitar", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidscimitar", VFX_FNF_SMOKE_PUFF);

//Charged Scimitar (Emerald + Obsidian Scimitar + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn67", "chargedscimitar");
SetLocalInt(OBJECT_SELF, "lsc_chargedscimitar", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedscimitar", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedscimitar", "ObsidianScimitar");
SetLocalString(OBJECT_SELF, "lsi3_chargedscimitar", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedscimitar", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedscimitar", VFX_FNF_SMOKE_PUFF);

//Flame Kukri (Emerald + Obsidian Kukri + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn68", "firekukri");
SetLocalInt(OBJECT_SELF, "lsc_firekukri", 3);
SetLocalString(OBJECT_SELF, "lsi1_firekukri", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_firekukri", "ObsidianKukri");
SetLocalString(OBJECT_SELF, "lsi3_firekukri", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_firekukri", -10);
SetLocalInt(OBJECT_SELF, "lsv_firekukri", VFX_FNF_SMOKE_PUFF);

//Ice Kukri (Emerald + Obsidian Kukri + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn69", "icekukri");
SetLocalInt(OBJECT_SELF, "lsc_icekukri", 3);
SetLocalString(OBJECT_SELF, "lsi1_icekukri", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icekukri", "ObsidianKukri");
SetLocalString(OBJECT_SELF, "lsi3_icekukri", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icekukri", -10);
SetLocalInt(OBJECT_SELF, "lsv_icekukri", VFX_FNF_SMOKE_PUFF);

//Acid Kukri (Emerald + Obsidian Kukri + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn70", "acidkukri");
SetLocalInt(OBJECT_SELF, "lsc_acidkukri", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidkukri", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidkukri", "ObsidianKukri");
SetLocalString(OBJECT_SELF, "lsi3_acidkukri", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidkukri", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidkukri", VFX_FNF_SMOKE_PUFF);

//Charged Kukri (Emerald + Obsidian Kukri + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn71", "chargedkukri");
SetLocalInt(OBJECT_SELF, "lsc_chargedkukri", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedkukri", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedkukri", "ObsidianKukri");
SetLocalString(OBJECT_SELF, "lsi3_chargedkukri", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedkukri", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedkukri", VFX_FNF_SMOKE_PUFF);

//Flame Rapier (Emerald + Obsidian Rapier + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn72", "flamerapier");
SetLocalInt(OBJECT_SELF, "lsc_flamerapier", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamerapier", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamerapier", "ObsidianRapier");
SetLocalString(OBJECT_SELF, "lsi3_flamerapier", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamerapier", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamerapier", VFX_FNF_SMOKE_PUFF);

//Ice Rapier (Emerald + Obsidian Rapier + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn73", "icerapier");
SetLocalInt(OBJECT_SELF, "lsc_icerapier", 3);
SetLocalString(OBJECT_SELF, "lsi1_icerapier", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icerapier", "ObsidianRapier");
SetLocalString(OBJECT_SELF, "lsi3_icerapier", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icerapier", -10);
SetLocalInt(OBJECT_SELF, "lsv_icerapier", VFX_FNF_SMOKE_PUFF);

//Acid Rapier (Emerald + Obsidian Rapier + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn74", "acidrapier");
SetLocalInt(OBJECT_SELF, "lsc_acidrapier", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidrapier", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidrapier", "ObsidianRapier");
SetLocalString(OBJECT_SELF, "lsi3_acidrapier", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidrapier", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidrapier", VFX_FNF_SMOKE_PUFF);

//Charged Rapier (Emerald + Obsidian Rapier + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn75", "chargedrapier");
SetLocalInt(OBJECT_SELF, "lsc_chargedrapier", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedrapier", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedrapier", "ObsidianRapier");
SetLocalString(OBJECT_SELF, "lsi3_chargedrapier", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedrapier", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedrapier", VFX_FNF_SMOKE_PUFF);

//Flame Bastard Sword (Emerald + Obsidian Bastard Sword + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn76", "flamebastard");
SetLocalInt(OBJECT_SELF, "lsc_flamebastard", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamebastard", "ObsidianBastardSword");
SetLocalString(OBJECT_SELF, "lsi2_flamebastard", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi3_flamebastard", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamebastard", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamebastard", VFX_FNF_SMOKE_PUFF);

//Ice Bastard Sword (Emerald + Obsidian Bastard Sword + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn77", "icebastard");
SetLocalInt(OBJECT_SELF, "lsc_icebastard", 3);
SetLocalString(OBJECT_SELF, "lsi1_icebastard", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icebastard", "ObsidianBastardSword");
SetLocalString(OBJECT_SELF, "lsi3_icebastard", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icebastard", -10);
SetLocalInt(OBJECT_SELF, "lsv_icebastard", VFX_FNF_SMOKE_PUFF);

//Acid Bastard Sword (Emerald + Obsidian Bastard Sword + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn78", "acidbastard");
SetLocalInt(OBJECT_SELF, "lsc_acidbastard", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidbastard", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidbastard", "ObsidianBastardSword");
SetLocalString(OBJECT_SELF, "lsi3_acidbastard", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidbastard", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidbastard", VFX_FNF_SMOKE_PUFF);

//Charged Bastard Sword (Emerald + Obsidian Bastard Sword + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn79", "chargedbastard");
SetLocalInt(OBJECT_SELF, "lsc_chargedbastard", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedbastard", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedbastard", "ObsidianBastardSword");
SetLocalString(OBJECT_SELF, "lsi3_chargedbastard", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedbastard", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedbastard", VFX_FNF_SMOKE_PUFF);

//Flame Whip (Emerald + Leather Whip + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn80", "firewhip");
SetLocalInt(OBJECT_SELF, "lsc_firewhip", 3);
SetLocalString(OBJECT_SELF, "lsi1_firewhip", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_firewhip", "LeatherWhip");
SetLocalString(OBJECT_SELF, "lsi3_firewhip", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_firewhip", -10);
SetLocalInt(OBJECT_SELF, "lsv_firewhip", VFX_FNF_SMOKE_PUFF);

//Ice Whip (Emerald + Leather Whip + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn81", "icewhip");
SetLocalInt(OBJECT_SELF, "lsc_icewhip", 3);
SetLocalString(OBJECT_SELF, "lsi1_icewhip", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icewhip", "LeatherWhip");
SetLocalString(OBJECT_SELF, "lsi3_icewhip", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icewhip", -10);
SetLocalInt(OBJECT_SELF, "lsv_icewhip", VFX_FNF_SMOKE_PUFF);

//Acid Whip (Emerald + Leather Whip + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn82", "acidwhip");
SetLocalInt(OBJECT_SELF, "lsc_acidwhip", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidwhip", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidwhip", "LeatherWhip");
SetLocalString(OBJECT_SELF, "lsi3_acidwhip", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidwhip", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidwhip", VFX_FNF_SMOKE_PUFF);

//Charged Whip (Emerald + Leather Whip + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn83", "chargedwhip");
SetLocalInt(OBJECT_SELF, "lsc_chargedwhip", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedwhip", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedwhip", "LeatherWhip");
SetLocalString(OBJECT_SELF, "lsi3_chargedwhip", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedwhip", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedwhip", VFX_FNF_SMOKE_PUFF);

//Flame Katana (Emerald + Obsidian Katana + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn84", "flamekatana");
SetLocalInt(OBJECT_SELF, "lsc_flamekatana", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamekatana", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamekatana", "ObsidianKatana");
SetLocalString(OBJECT_SELF, "lsi3_flamekatana", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamekatana", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamekatana", VFX_FNF_SMOKE_PUFF);

//Ice Katana (Emerald + Obsidian Katana + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn85", "icekatana");
SetLocalInt(OBJECT_SELF, "lsc_icekatana", 3);
SetLocalString(OBJECT_SELF, "lsi1_icekatana", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icekatana", "ObsidianKatana");
SetLocalString(OBJECT_SELF, "lsi3_icekatana", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icekatana", -10);
SetLocalInt(OBJECT_SELF, "lsv_icekatana", VFX_FNF_SMOKE_PUFF);

//Acid Katana (Emerald + Obsidian Katana + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn86", "acidkatana");
SetLocalInt(OBJECT_SELF, "lsc_acidkatana", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidkatana", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidkatana", "ObsidianKatana");
SetLocalString(OBJECT_SELF, "lsi3_acidkatana", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidkatana", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidkatana", VFX_FNF_SMOKE_PUFF);

//Charged Katana (Emerald + Obsidian Katana + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn87", "chargedkatana");
SetLocalInt(OBJECT_SELF, "lsc_chargedkatana", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedkatana", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedkatana", "ObsidianKatana");
SetLocalString(OBJECT_SELF, "lsi3_chargedkatana", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedkatana", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedkatana", VFX_FNF_SMOKE_PUFF);

//Flame Greataxe (Emerald + Obsidian Greataxe + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn88", "flamegreataxe");
SetLocalInt(OBJECT_SELF, "lsc_flamegreataxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamegreataxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamegreataxe", "ObsidianGreataxe");
SetLocalString(OBJECT_SELF, "lsi3_flamegreataxe", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamegreataxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamegreataxe", VFX_FNF_SMOKE_PUFF);

//Ice Greataxe (Emerald + Obsidian Greataxe + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn89", "icegreataxe");
SetLocalInt(OBJECT_SELF, "lsc_icegreataxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_icegreataxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icegreataxe", "ObsidianGreataxe");
SetLocalString(OBJECT_SELF, "lsi3_icegreataxe", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icegreataxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_icegreataxe", VFX_FNF_SMOKE_PUFF);

//Acid Greataxe (Emerald + Obsidian Greataxe + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn90", "acidgreataxe");
SetLocalInt(OBJECT_SELF, "lsc_acidgreataxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidgreataxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidgreataxe", "ObsidianGreataxe");
SetLocalString(OBJECT_SELF, "lsi3_acidgreataxe", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidgreataxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidgreataxe", VFX_FNF_SMOKE_PUFF);

//Charged Greataxe (Emerald + Obsidian Greataxe + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn91", "chargedgreataxe");
SetLocalInt(OBJECT_SELF, "lsc_chargedgreataxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedgreataxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedgreataxe", "ObsidianGreataxe");
SetLocalString(OBJECT_SELF, "lsi3_chargedgreataxe", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedgreataxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedgreataxe", VFX_FNF_SMOKE_PUFF);

//Flame Battleaxe (Emerald + Obsidian Battleaxe + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn92", "flamebattleaxe");
SetLocalInt(OBJECT_SELF, "lsc_flamebattleaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamebattleaxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamebattleaxe", "ObsidianBattleaxe");
SetLocalString(OBJECT_SELF, "lsi3_flamebattleaxe", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamebattleaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamebattleaxe", VFX_FNF_SMOKE_PUFF);

//Ice Battleaxe (Emerald + Obsidian Battleaxe + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn93", "icebattleaxe");
SetLocalInt(OBJECT_SELF, "lsc_icebattleaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_icebattleaxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icebattleaxe", "ObsidianBattleaxe");
SetLocalString(OBJECT_SELF, "lsi3_icebattleaxe", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icebattleaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_icebattleaxe", VFX_FNF_SMOKE_PUFF);

//Acid Battleaxe (Emerald + Obsidian Battleaxe + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn94", "acidbattleaxe");
SetLocalInt(OBJECT_SELF, "lsc_acidbattleaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidbattleaxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidbattleaxe", "ObsidianBattleaxe");
SetLocalString(OBJECT_SELF, "lsi3_acidbattleaxe", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidbattleaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidbattleaxe", VFX_FNF_SMOKE_PUFF);

//Charged Battleaxe (Emerald + Obsidian Battleaxe + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn95", "chargedbattleax");
SetLocalInt(OBJECT_SELF, "lsc_chargedbattleax", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedbattleax", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedbattleax", "ObsidianBattleaxe");
SetLocalString(OBJECT_SELF, "lsi3_chargedbattleax", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedbattleax", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedbattleax", VFX_FNF_SMOKE_PUFF);

//Flame Handaxe (Emerald + Obsidian Handaxe + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn96", "flameaxe");
SetLocalInt(OBJECT_SELF, "lsc_flameaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_flameaxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flameaxe", "ObsidianHandaxe");
SetLocalString(OBJECT_SELF, "lsi3_flameaxe", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flameaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_flameaxe", VFX_FNF_SMOKE_PUFF);

//Ice Handaxe (Emerald + Obsidian Handaxe + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn97", "iceaxe2");
SetLocalInt(OBJECT_SELF, "lsc_iceaxe2", 3);
SetLocalString(OBJECT_SELF, "lsi1_iceaxe2", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_iceaxe2", "ObsidianHandaxe");
SetLocalString(OBJECT_SELF, "lsi3_iceaxe2", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_iceaxe2", -10);
SetLocalInt(OBJECT_SELF, "lsv_iceaxe2", VFX_FNF_SMOKE_PUFF);

//Acid Handaxe (Emerald + Obsidian Handaxe + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn98", "acidaxe2");
SetLocalInt(OBJECT_SELF, "lsc_acidaxe2", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidaxe2", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidaxe2", "ObsidianHandaxe");
SetLocalString(OBJECT_SELF, "lsi3_acidaxe2", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidaxe2", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidaxe2", VFX_FNF_SMOKE_PUFF);

//Charged Handaxe (Emerald + Obsidian Handaxe + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn99", "chargedaxe");
SetLocalInt(OBJECT_SELF, "lsc_chargedaxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedaxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedaxe", "ObsidianHandaxe");
SetLocalString(OBJECT_SELF, "lsi3_chargedaxe", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedaxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedaxe", VFX_FNF_SMOKE_PUFF);

//Flame Waraxe (Emerald + Obsidian War + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn100", "flamewaraxe");
SetLocalInt(OBJECT_SELF, "lsc_flamewaraxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamewaraxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamewaraxe", "ObsidianWaraxe");
SetLocalString(OBJECT_SELF, "lsi3_flamewaraxe", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamewaraxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamewaraxe", VFX_FNF_SMOKE_PUFF);

//Ice Waraxe (Emerald + Obsidian War + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn101", "icewaraxe");
SetLocalInt(OBJECT_SELF, "lsc_icewaraxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_icewaraxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icewaraxe", "ObsidianWaraxe");
SetLocalString(OBJECT_SELF, "lsi3_icewaraxe", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icewaraxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_icewaraxe", VFX_FNF_SMOKE_PUFF);

//Acid Waraxe (Emerald + Obsidian War + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn102", "acidwaraxe");
SetLocalInt(OBJECT_SELF, "lsc_acidwaraxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidwaraxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidwaraxe", "ObsidianWaraxe");
SetLocalString(OBJECT_SELF, "lsi3_acidwaraxe", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidwaraxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidwaraxe", VFX_FNF_SMOKE_PUFF);

//Charged Waraxe (Emerald + Obsidian War + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn103", "chargedwaraxe");
SetLocalInt(OBJECT_SELF, "lsc_chargedwaraxe", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedwaraxe", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedwaraxe", "ObsidianWaraxe");
SetLocalString(OBJECT_SELF, "lsi3_chargedwaraxe", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedwaraxe", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedwaraxe", VFX_FNF_SMOKE_PUFF);

//Flame Two-Bladed Sword (Emerald + Obsidian Two-Bladed Sword + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn104", "flametwobladed");
SetLocalInt(OBJECT_SELF, "lsc_flametwobladed", 3);
SetLocalString(OBJECT_SELF, "lsi1_flametwobladed", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flametwobladed", "ObsidianTwoBladedSword");
SetLocalString(OBJECT_SELF, "lsi3_flametwobladed", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flametwobladed", -10);
SetLocalInt(OBJECT_SELF, "lsv_flametwobladed", VFX_FNF_SMOKE_PUFF);

//Ice Two-Bladed Sword (Emerald + Obsidian Two-Bladed Sword + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn105", "icetwobladeds");
SetLocalInt(OBJECT_SELF, "lsc_icetwobladeds", 3);
SetLocalString(OBJECT_SELF, "lsi1_icetwobladeds", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icetwobladeds", "ObsidianTwoBladedSword");
SetLocalString(OBJECT_SELF, "lsi3_icetwobladeds", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icetwobladeds", -10);
SetLocalInt(OBJECT_SELF, "lsv_icetwobladeds", VFX_FNF_SMOKE_PUFF);

//Acid Two-Bladed Sword (Emerald + Obsidian Two-Bladed Sword + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn106", "acidtwobladed");
SetLocalInt(OBJECT_SELF, "lsc_acidtwobladed", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidtwobladed", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidtwobladed", "ObsidianTwoBladedSword");
SetLocalString(OBJECT_SELF, "lsi3_acidtwobladed", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidtwobladed", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidtwobladed", VFX_FNF_SMOKE_PUFF);

//Charged Two-Bladed Sword (Emerald + Obsidian Two-Bladed Sword + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn107", "chargedtwoblad");
SetLocalInt(OBJECT_SELF, "lsc_chargedtwoblad", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedtwoblad", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedtwoblad", "ObsidianTwoBladedSword");
SetLocalString(OBJECT_SELF, "lsi3_chargedtwoblad", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedtwoblad", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedtwoblad", VFX_FNF_SMOKE_PUFF);

//Flame Flail (Emerald + Obsidian Flail + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn108", "flameflail");
SetLocalInt(OBJECT_SELF, "lsc_flameflail", 3);
SetLocalString(OBJECT_SELF, "lsi1_flameflail", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flameflail", "ObsidianFlail");
SetLocalString(OBJECT_SELF, "lsi3_flameflail", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flameflail", -10);
SetLocalInt(OBJECT_SELF, "lsv_flameflail", VFX_FNF_SMOKE_PUFF);

//Ice Flail (Emerald + Obsidian Flail + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn109", "iceflail");
SetLocalInt(OBJECT_SELF, "lsc_iceflail", 3);
SetLocalString(OBJECT_SELF, "lsi1_iceflail", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_iceflail", "ObsidianFlail");
SetLocalString(OBJECT_SELF, "lsi3_iceflail", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_iceflail", -10);
SetLocalInt(OBJECT_SELF, "lsv_iceflail", VFX_FNF_SMOKE_PUFF);

//Acid Flail (Emerald + Obsidian Flail + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn110", "acidflail");
SetLocalInt(OBJECT_SELF, "lsc_acidflail", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidflail", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidflail", "ObsidianFlail");
SetLocalString(OBJECT_SELF, "lsi3_acidflail", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidflail", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidflail", VFX_FNF_SMOKE_PUFF);

//Charged Flail (Emerald + Obsidian Flail + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn111", "chargedflail");
SetLocalInt(OBJECT_SELF, "lsc_chargedflail", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedflail", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedflail", "ObsidianFlail");
SetLocalString(OBJECT_SELF, "lsi3_chargedflail", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedflail", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedflail", VFX_FNF_SMOKE_PUFF);

//Flame Warhammer (Emerald + Obsidian Warhammer + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn112", "flamewarhammer");
SetLocalInt(OBJECT_SELF, "lsc_flamewarhammer", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamewarhammer", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamewarhammer", "ObsidianWarhammer");
SetLocalString(OBJECT_SELF, "lsi3_flamewarhammer", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamewarhammer", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamewarhammer", VFX_FNF_SMOKE_PUFF);

//Ice Warhammer (Emerald + Obsidian Warhammer + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn113", "icewarhammer");
SetLocalInt(OBJECT_SELF, "lsc_icewarhammer", 3);
SetLocalString(OBJECT_SELF, "lsi1_icewarhammer", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icewarhammer", "ObsidianWarhammer");
SetLocalString(OBJECT_SELF, "lsi3_icewarhammer", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icewarhammer", -10);
SetLocalInt(OBJECT_SELF, "lsv_icewarhammer", VFX_FNF_SMOKE_PUFF);

//Acid Warhammer (Emerald + Obsidian Warhammer + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn114", "acidwarhammer");
SetLocalInt(OBJECT_SELF, "lsc_acidwarhammer", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidwarhammer", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidwarhammer", "ObsidianWarhammer");
SetLocalString(OBJECT_SELF, "lsi3_acidwarhammer", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidwarhammer", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidwarhammer", VFX_FNF_SMOKE_PUFF);

//Charged Warhammer (Emerald + Obsidian Warhammer + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn115", "chargedwarhamme");
SetLocalInt(OBJECT_SELF, "lsc_chargedwarhamme", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedwarhamme", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedwarhamme", "ObsidianWarhammer");
SetLocalString(OBJECT_SELF, "lsi3_chargedwarhamme", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedwarhamme", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedwarhamme", VFX_FNF_SMOKE_PUFF);

//Flame Dagger (Emerald + Obsidian Dagger + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn116", "flamedagger");
SetLocalInt(OBJECT_SELF, "lsc_flamedagger", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamedagger", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamedagger", "NW_WSWDG002");
SetLocalString(OBJECT_SELF, "lsi3_flamedagger", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamedagger", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamedagger", VFX_FNF_SMOKE_PUFF);

//Ice Dagger (Emerald + Obsidian Dagger + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn117", "icedagger");
SetLocalInt(OBJECT_SELF, "lsc_icedagger", 3);
SetLocalString(OBJECT_SELF, "lsi1_icedagger", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icedagger", "NW_WSWDG002");
SetLocalString(OBJECT_SELF, "lsi3_icedagger", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icedagger", -10);
SetLocalInt(OBJECT_SELF, "lsv_icedagger", VFX_FNF_SMOKE_PUFF);

//Acid Dagger (Emerald + Obsidian Dagger + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn118", "aciddagger");
SetLocalInt(OBJECT_SELF, "lsc_aciddagger", 3);
SetLocalString(OBJECT_SELF, "lsi1_aciddagger", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_aciddagger", "NW_WSWDG002");
SetLocalString(OBJECT_SELF, "lsi3_aciddagger", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_aciddagger", -10);
SetLocalInt(OBJECT_SELF, "lsv_aciddagger", VFX_FNF_SMOKE_PUFF);

//Charged Dagger (Emerald + Obsidian Dagger + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn119", "chargeddagger");
SetLocalInt(OBJECT_SELF, "lsc_chargeddagger", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargeddagger", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargeddagger", "NW_WSWDG002");
SetLocalString(OBJECT_SELF, "lsi3_chargeddagger", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargeddagger", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargeddagger", VFX_FNF_SMOKE_PUFF);

//Flame Quarterstaff (Emerald + Wooden Quarterstaff + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn120", "flamequartersta");
SetLocalInt(OBJECT_SELF, "lsc_flamequartersta", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamequartersta", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamequartersta", "WoodenQuarterstaff");
SetLocalString(OBJECT_SELF, "lsi3_flamequartersta", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamequartersta", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamequartersta", VFX_FNF_SMOKE_PUFF);

//Ice Quarterstaff (Emerald + Wooden Quarterstaff + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn121", "icequarterstaff");
SetLocalInt(OBJECT_SELF, "lsc_icequarterstaff", 3);
SetLocalString(OBJECT_SELF, "lsi1_icequarterstaff", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icequarterstaff", "WoodenQuarterstaff");
SetLocalString(OBJECT_SELF, "lsi3_icequarterstaff", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icequarterstaff", -10);
SetLocalInt(OBJECT_SELF, "lsv_icequarterstaff", VFX_FNF_SMOKE_PUFF);

//Acid Quarterstaff (Emerald + Wooden Quarterstaff + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn122", "acidquarterstaf");
SetLocalInt(OBJECT_SELF, "lsc_acidquarterstaf", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidquarterstaf", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidquarterstaf", "WoodenQuarterstaff");
SetLocalString(OBJECT_SELF, "lsi3_acidquarterstaf", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidquarterstaf", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidquarterstaf", VFX_FNF_SMOKE_PUFF);

//Charged Quarterstaff (Emerald + Wooden Quarterstaff + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn123", "chargedquarters");
SetLocalInt(OBJECT_SELF, "lsc_chargedquarters", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedquarters", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedquarters", "WoodenQuarterstaff");
SetLocalString(OBJECT_SELF, "lsi3_chargedquarters", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedquarters", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedquarters", VFX_FNF_SMOKE_PUFF);

//Flame Mace (Emerald + Obsidian Mace + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn124", "flamemace");
SetLocalInt(OBJECT_SELF, "lsc_flamemace", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamemace", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamemace", "ObsidianMace");
SetLocalString(OBJECT_SELF, "lsi3_flamemace", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamemace", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamemace", VFX_FNF_SMOKE_PUFF);

//Ice Mace (Emerald + Obsidian Mace + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn125", "icemace");
SetLocalInt(OBJECT_SELF, "lsc_icemace", 3);
SetLocalString(OBJECT_SELF, "lsi1_icemace", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icemace", "ObsidianMace");
SetLocalString(OBJECT_SELF, "lsi3_icemace", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icemace", -10);
SetLocalInt(OBJECT_SELF, "lsv_icemace", VFX_FNF_SMOKE_PUFF);

//Acid Mace (Emerald + Obsidian Mace + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn126", "acidmace");
SetLocalInt(OBJECT_SELF, "lsc_acidmace", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidmace", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidmace", "ObsidianMace");
SetLocalString(OBJECT_SELF, "lsi3_acidmace", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidmace", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidmace", VFX_FNF_SMOKE_PUFF);

//Charged Mace (Emerald + Obsidian Mace + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn127", "chargedmace");
SetLocalInt(OBJECT_SELF, "lsc_chargedmace", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedmace", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedmace", "ObsidianMace");
SetLocalString(OBJECT_SELF, "lsi3_chargedmace", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedmace", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedmace", VFX_FNF_SMOKE_PUFF);

//Flame Morningstar (Emerald + Obsidian Morningstar + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn128", "flamemorningsta");
SetLocalInt(OBJECT_SELF, "lsc_flamemorningsta", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamemorningsta", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamemorningsta", "ObsidianMorningstar");
SetLocalString(OBJECT_SELF, "lsi3_flamemorningsta", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamemorningsta", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamemorningsta", VFX_FNF_SMOKE_PUFF);

//Ice Morningstar (Emerald + Obsidian Morningstar + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn129", "icemorningstar");
SetLocalInt(OBJECT_SELF, "lsc_icemorningstar", 3);
SetLocalString(OBJECT_SELF, "lsi1_icemorningstar", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icemorningstar", "ObsidianMorningstar");
SetLocalString(OBJECT_SELF, "lsi3_icemorningstar", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icemorningstar", -10);
SetLocalInt(OBJECT_SELF, "lsv_icemorningstar", VFX_FNF_SMOKE_PUFF);

//Acid Morningstar (Emerald + Obsidian Morningstar + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn130", "acidmorningstar");
SetLocalInt(OBJECT_SELF, "lsc_acidmorningstar", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidmorningstar", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidmorningstar", "ObsidianMorningstar");
SetLocalString(OBJECT_SELF, "lsi3_acidmorningstar", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidmorningstar", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidmorningstar", VFX_FNF_SMOKE_PUFF);

//Charged Morningstar (Emerald + Obsidian Morningstar + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn131", "chargedmornings");
SetLocalInt(OBJECT_SELF, "lsc_chargedmornings", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedmornings", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedmornings", "ObsidianMorningstar");
SetLocalString(OBJECT_SELF, "lsi3_chargedmornings", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedmornings", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedmornings", VFX_FNF_SMOKE_PUFF);

//Flame Greatsword (Emerald + Obsidian Greatsword + Brimstone)//
SetLocalString(OBJECT_SELF, "lsn132", "flamegreatsword");
SetLocalInt(OBJECT_SELF, "lsc_flamegreatsword", 3);
SetLocalString(OBJECT_SELF, "lsi1_flamegreatsword", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_flamegreatsword", "ObsidianGreatsword");
SetLocalString(OBJECT_SELF, "lsi3_flamegreatsword", "Brimstone");
SetLocalInt(OBJECT_SELF, "lss_flamegreatsword", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamegreatsword", VFX_FNF_SMOKE_PUFF);

//Ice Greatsword (Emerald + Obsidian Greatsword + Coldstone)//
SetLocalString(OBJECT_SELF, "lsn133", "icegreatsword");
SetLocalInt(OBJECT_SELF, "lsc_icegreatsword", 3);
SetLocalString(OBJECT_SELF, "lsi1_icegreatsword", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_icegreatsword", "ObsidianGreatsword");
SetLocalString(OBJECT_SELF, "lsi3_icegreatsword", "IceNine");
SetLocalInt(OBJECT_SELF, "lss_icegreatsword", -10);
SetLocalInt(OBJECT_SELF, "lsv_icegreatsword", VFX_FNF_SMOKE_PUFF);

//Acid Greatsword (Emerald + Obsidian Greatsword + Acid Crystal)//
SetLocalString(OBJECT_SELF, "lsn134", "acidgreatsword");
SetLocalInt(OBJECT_SELF, "lsc_acidgreatsword", 3);
SetLocalString(OBJECT_SELF, "lsi1_acidgreatsword", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_acidgreatsword", "ObsidianGreatsword");
SetLocalString(OBJECT_SELF, "lsi3_acidgreatsword", "AcidCrystal");
SetLocalInt(OBJECT_SELF, "lss_acidgreatsword", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidgreatsword", VFX_FNF_SMOKE_PUFF);

//Charged Greatsword (Emerald + Obsidian Greatsword + Charged Crystal)//
SetLocalString(OBJECT_SELF, "lsn135", "chargedgreatswo");
SetLocalInt(OBJECT_SELF, "lsc_chargedgreatswo", 3);
SetLocalString(OBJECT_SELF, "lsi1_chargedgreatswo", "NW_IT_GEM012");
SetLocalString(OBJECT_SELF, "lsi2_chargedgreatswo", "ObsidianGreatsword");
SetLocalString(OBJECT_SELF, "lsi3_chargedgreatswo", "ChargedCrystal");
SetLocalInt(OBJECT_SELF, "lss_chargedgreatswo", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedgreatswo", VFX_FNF_SMOKE_PUFF);

//Ice Heavy Armor (Bone Brigadine + Coldstone + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn136", "icearmorh");
SetLocalInt(OBJECT_SELF, "lsc_icearmorh", 4);
SetLocalString(OBJECT_SELF, "lsi1_icearmorh", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_icearmorh", "NW_AARCL006");
SetLocalString(OBJECT_SELF, "lsi3_icearmorh", "IceNine");
SetLocalString(OBJECT_SELF, "lsi4_icearmorh", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_icearmorh", -10);
SetLocalInt(OBJECT_SELF, "lsv_icearmorh", VFX_FNF_SMOKE_PUFF);

//Flame Heavy Armor (Bone Brigadine + Brimstone + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn137", "flamearmorh");
SetLocalInt(OBJECT_SELF, "lsc_flamearmorh", 4);
SetLocalString(OBJECT_SELF, "lsi1_flamearmorh", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_flamearmorh", "NW_AARCL006");
SetLocalString(OBJECT_SELF, "lsi3_flamearmorh", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi4_flamearmorh", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_flamearmorh", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamearmorh", VFX_FNF_SMOKE_PUFF);

//Acid Heavy Armor (Bone Brigadine + Acid Crystal + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn138", "acidarmorh");
SetLocalInt(OBJECT_SELF, "lsc_acidarmorh", 4);
SetLocalString(OBJECT_SELF, "lsi1_acidarmorh", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_acidarmorh", "NW_AARCL006");
SetLocalString(OBJECT_SELF, "lsi3_acidarmorh", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi4_acidarmorh", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_acidarmorh", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidarmorh", VFX_FNF_SMOKE_PUFF);

//Charged Heavy Armor (Bone Brigadine + Charged Crystal + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn139", "chargedarmorh");
SetLocalInt(OBJECT_SELF, "lsc_chargedarmorh", 4);
SetLocalString(OBJECT_SELF, "lsi1_chargedarmorh", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_chargedarmorh", "NW_AARCL006");
SetLocalString(OBJECT_SELF, "lsi3_chargedarmorh", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi4_chargedarmorh", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_chargedarmorh", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedarmorh", VFX_FNF_SMOKE_PUFF);

//Ice Medium Armor (Bone Scale Mail + Coldstone + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn140", "icearmorm");
SetLocalInt(OBJECT_SELF, "lsc_icearmorm", 4);
SetLocalString(OBJECT_SELF, "lsi1_icearmorm", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_icearmorm", "BoneScaleMail");
SetLocalString(OBJECT_SELF, "lsi3_icearmorm", "IceNine");
SetLocalString(OBJECT_SELF, "lsi4_icearmorm", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_icearmorm", -10);
SetLocalInt(OBJECT_SELF, "lsv_icearmorm", VFX_FNF_SMOKE_PUFF);

//Flame Medium Armor (Bone Scale Mail  + Brimstone + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn141", "flamearmorm");
SetLocalInt(OBJECT_SELF, "lsc_flamearmorm", 4);
SetLocalString(OBJECT_SELF, "lsi1_flamearmorm", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_flamearmorm", "BoneScaleMail");
SetLocalString(OBJECT_SELF, "lsi3_flamearmorm", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi4_flamearmorm", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_flamearmorm", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamearmorm", VFX_FNF_SMOKE_PUFF);

//Acid Medium Armor (Bone Scale Mail  + Acid Crystal + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn142", "acidarmorm");
SetLocalInt(OBJECT_SELF, "lsc_acidarmorm", 4);
SetLocalString(OBJECT_SELF, "lsi1_acidarmorm", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_acidarmorm", "BoneScaleMail");
SetLocalString(OBJECT_SELF, "lsi3_acidarmorm", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi4_acidarmorm", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_acidarmorm", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidarmorm", VFX_FNF_SMOKE_PUFF);

//Charged Medium Armor (Bone Scale Mail  + Charged Crystal + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn143", "chargedarmorm");
SetLocalInt(OBJECT_SELF, "lsc_chargedarmorm", 4);
SetLocalString(OBJECT_SELF, "lsi1_chargedarmorm", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_chargedarmorm", "BoneScaleMail");
SetLocalString(OBJECT_SELF, "lsi3_chargedarmorm", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi4_chargedarmorm", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_chargedarmorm", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedarmorm", VFX_FNF_SMOKE_PUFF);

//Ice Light Armor (Bone Studded Leather + Coldstone + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn144", "icearmorl");
SetLocalInt(OBJECT_SELF, "lsc_icearmorl", 4);
SetLocalString(OBJECT_SELF, "lsi1_icearmorl", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_icearmorl", "NW_AARCL002");
SetLocalString(OBJECT_SELF, "lsi3_icearmorl", "IceNine");
SetLocalString(OBJECT_SELF, "lsi4_icearmorl", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_icearmorl", -10);
SetLocalInt(OBJECT_SELF, "lsv_icearmorl", VFX_FNF_SMOKE_PUFF);

//Flame Light Armor (Bone Studded Leather + Brimstone + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn145", "flamearmorl");
SetLocalInt(OBJECT_SELF, "lsc_flamearmorl", 4);
SetLocalString(OBJECT_SELF, "lsi1_flamearmorl", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_flamearmorl", "NW_AARCL002");
SetLocalString(OBJECT_SELF, "lsi3_flamearmorl", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi4_flamearmorl", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_flamearmorl", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamearmorl", VFX_FNF_SMOKE_PUFF);

//Acid Light Armor (Bone Studded Leather + Acid Crystal + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn146", "acidarmorl");
SetLocalInt(OBJECT_SELF, "lsc_acidarmorl", 4);
SetLocalString(OBJECT_SELF, "lsi1_acidarmorl", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_acidarmorl", "NW_AARCL002");
SetLocalString(OBJECT_SELF, "lsi3_acidarmorl", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi4_acidarmorl", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_acidarmorl", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidarmorl", VFX_FNF_SMOKE_PUFF);

//Charged Light Armor (Bone Studded Leather + Charged Crystal + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn147", "chargedarmorl");
SetLocalInt(OBJECT_SELF, "lsc_chargedarmorl", 4);
SetLocalString(OBJECT_SELF, "lsi1_chargedarmorl", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_chargedarmorl", "NW_AARCL002");
SetLocalString(OBJECT_SELF, "lsi3_chargedarmorl", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi4_chargedarmorl", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_chargedarmorl", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedarmorl", VFX_FNF_SMOKE_PUFF);

//Ice Helmet (Bone Helmet + Coldstone + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn148", "icehelmet");
SetLocalInt(OBJECT_SELF, "lsc_icehelmet", 4);
SetLocalString(OBJECT_SELF, "lsi1_icehelmet", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_icehelmet", "BoneHelmet");
SetLocalString(OBJECT_SELF, "lsi3_icehelmet", "IceNine");
SetLocalString(OBJECT_SELF, "lsi4_icehelmet", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_icehelmet", -10);
SetLocalInt(OBJECT_SELF, "lsv_icehelmet", VFX_FNF_SMOKE_PUFF);

//Flame Helmet (Bone Helmet + Brimstone + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn149", "flamehelmet");
SetLocalInt(OBJECT_SELF, "lsc_flamehelmet", 4);
SetLocalString(OBJECT_SELF, "lsi1_flamehelmet", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_flamehelmet", "BoneHelmet");
SetLocalString(OBJECT_SELF, "lsi3_flamehelmet", "Brimstone");
SetLocalString(OBJECT_SELF, "lsi4_flamehelmet", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_flamehelmet", -10);
SetLocalInt(OBJECT_SELF, "lsv_flamehelmet", VFX_FNF_SMOKE_PUFF);

//Acid Helmet (Bone Helmet + Acid Crystal + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn150", "acidhelmet");
SetLocalInt(OBJECT_SELF, "lsc_acidhelmet", 4);
SetLocalString(OBJECT_SELF, "lsi1_acidhelmet", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_acidhelmet", "BoneHelmet");
SetLocalString(OBJECT_SELF, "lsi3_acidhelmet", "AcidCrystal");
SetLocalString(OBJECT_SELF, "lsi4_acidhelmet", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_acidhelmet", -10);
SetLocalInt(OBJECT_SELF, "lsv_acidhelmet", VFX_FNF_SMOKE_PUFF);

//Charged Helmet (Bone Helmet + Charged Crystal + Ruby + Slaad's Tongue)//
SetLocalString(OBJECT_SELF, "lsn151", "chargedhelmet");
SetLocalInt(OBJECT_SELF, "lsc_chargedhelmet", 4);
SetLocalString(OBJECT_SELF, "lsi1_chargedhelmet", "NW_IT_GEM006");
SetLocalString(OBJECT_SELF, "lsi2_chargedhelmet", "BoneHelmet");
SetLocalString(OBJECT_SELF, "lsi3_chargedhelmet", "ChargedCrystal");
SetLocalString(OBJECT_SELF, "lsi4_chargedhelmet", "NW_IT_MSMLMISC10");
SetLocalInt(OBJECT_SELF, "lss_chargedhelmet", -10);
SetLocalInt(OBJECT_SELF, "lsv_chargedhelmet", VFX_FNF_SMOKE_PUFF);

}

void CreateGold(object oTarget, int nAmount)
{
    CreateItemOnObject("nw_it_gold001", oTarget, nAmount);
}

// Wanye added:  Custom function to return TRUE if the item type is an
// item type that can affect the total amount in the stack created.
int wow_CheckBaseItemType(object oItem)
{
    int nReturn;
    int nType = GetBaseItemType(oItem);
    switch(nType)
    {
        // Just add in any types here that will affect the number in the
        // stack created.
        case BASE_ITEM_ARROW:
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        case BASE_ITEM_DART:
        case BASE_ITEM_THROWINGAXE:
        {
            nReturn = TRUE;
            break;
        }
        default:
        {
            break;
        }
    }
    return nReturn;
}

void main()
{
    object oOwner = OBJECT_SELF;

    if (!GetLocalInt(OBJECT_SELF, "lsvar_set"))
    {
        SetItemLocals();
        SetLocalInt(OBJECT_SELF, "lsvar_set", TRUE);
    }
    if (lsn==0  || GetInventoryDisturbType() != INVENTORY_DISTURB_TYPE_ADDED) return;

    object oItem;
    int nNth, nIngredients, nCurrent, nCount, nGold, nStack, nRecipe, nOkay, nHasGold;
    string sCurrent, sNth, sRequired;

    for(nNth = 1; nNth <= lsn; nNth++)
    {
        sNth = IntToString(nNth);
        sCurrent = GetLocalString(oOwner, "lsn"+sNth);
        nIngredients = GetLocalInt(oOwner, "lsc_"+sCurrent);
        nCurrent = 0;
        nStack = 0;
        nGold = 0;

        for(nCount = 1; nCount <= nIngredients; nCount++)
        {
            sNth = IntToString(nCount);
            sRequired = GetLocalString(oOwner, "lsi"+sNth+"_"+sCurrent);

            if (GetStringLeft(sRequired, 8)=="  gold  ")
            {
                nGold = StringToInt(GetStringRight(sRequired, GetStringLength(sRequired)-8));
                if (GetGold(oOwner)>=nGold) nCurrent++;

            }
            else
            {
                oItem = GetItemPossessedBy(oOwner, sRequired);
                if(GetIsObjectValid(oItem))
                {
                    nCurrent++;
                }
            }
            if(nRecipe == 0 && nCurrent == nIngredients)
            {
                nRecipe = nNth;
                break; // break out of the loop now that we have a recipe
            }
        }
    }

    // I'm not sure what the -10 is used for in the crafting so I left these
    // lines intact
    if (GetLocalInt(oOwner, "lss_"+sCurrent)==-10) nOkay=TRUE;
    else if (GetLastSpell()==GetLocalInt(oOwner, "lss_"+sCurrent)) nOkay=TRUE;
    else nOkay=FALSE;

    if(nOkay && (nRecipe > 0))
    {
        if (nGold>0)
        {
            nHasGold=GetGold(oOwner);
            DestroyObject(GetItemPossessedBy(oOwner, "NW_IT_GOLD001"));
            DelayCommand(0.2, CreateGold(oOwner, nHasGold-nGold));
        }
        sCurrent = GetLocalString(oOwner, "lsn"+IntToString(nRecipe));
        for(nNth = 1; nNth <= nIngredients; nNth++)
        {
            sNth = IntToString(nNth);
            sRequired = GetLocalString(oOwner, "lsi"+sNth+"_"+sCurrent);
            oItem = GetItemPossessedBy(oOwner, sRequired);
            if(wow_CheckBaseItemType(oItem)) nStack = GetNumStackedItems(oItem);

            if(GetIsObjectValid(oItem)) DestroyObject(oItem);
        }

        CreateItemOnObject(sCurrent, oOwner, nStack);
        int nVis=GetLocalInt(oOwner, "lsv_"+sCurrent);
        if (nVis!=-10) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVis), oOwner);
    }
}

