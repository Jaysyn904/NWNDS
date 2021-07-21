void main()
{
    DelayCommand(500.0,ActionCloseDoor(OBJECT_SELF));
    SetLocked(OBJECT_SELF,1);
}
