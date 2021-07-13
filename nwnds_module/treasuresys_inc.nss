float TREASURE_RESPAWN_TIME = 2700.0;   //sets the time before treasure/container respawn
string sTreasureGenScript = "x0_o2_anylow";  //the name of the script generating treasure

void Empty_Container(object oContainer )
{
    object oItem = GetFirstItemInInventory( oContainer );
    while ( GetIsObjectValid( oItem ))
    {
        DestroyObject( oItem );
        oItem = GetNextItemInInventory( oContainer );
    }
}

void Create_Chest ( string template, string sTag, location lchest )
{
    effect eSpawn = EffectVisualEffect( VFX_FNF_SMOKE_PUFF );
    object chest = CreateObject( OBJECT_TYPE_PLACEABLE, template, lchest, TRUE, sTag );
    ApplyEffectAtLocation( DURATION_TYPE_INSTANT, eSpawn, lchest );
}

void Respawn_Chest ( object oContainer )
{
string sResRef = GetResRef( oContainer );
string sTag = GetTag( oContainer );
location lLoc = GetLocation( oContainer );

Empty_Container( oContainer );
DestroyObject( oContainer );
Create_Chest( sResRef, sTag, lLoc );

}

void Handle_Open ( object oContainer )
{
    if (GetLocalInt( oContainer, "NW_DO_ONCE" )) return;
    float respawnTime = TREASURE_RESPAWN_TIME;
    AssignCommand( GetArea(oContainer), DelayCommand( respawnTime, Respawn_Chest(oContainer) ));

}

//void main(){}
