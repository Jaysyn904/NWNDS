void main()
{
    DelayCommand(60.0,ActionCloseDoor(OBJECT_SELF));
    SetLocked(OBJECT_SELF,1);
}
