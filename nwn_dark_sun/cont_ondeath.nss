#include "treasuresys_inc"

void main()
{
    string sTemplate = GetResRef(OBJECT_SELF);
    string sTag = GetTag(OBJECT_SELF);
    location lChest = GetLocation(OBJECT_SELF);

    if ( !GetLocalInt( OBJECT_SELF, "NW_DO_ONCE" ))
    {
        ExecuteScript( sTreasureGenScript, OBJECT_SELF );
    }
    float fSeconds = TREASURE_RESPAWN_TIME;
    AssignCommand ( GetArea(OBJECT_SELF),DelayCommand(fSeconds, Create_Chest( sTemplate, sTag, lChest ) ) );
}

