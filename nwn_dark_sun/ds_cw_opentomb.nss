void main()
{
    DelayCommand(1.0, ActionCloseDoor(OBJECT_SELF));
    SetLocked(OBJECT_SELF, TRUE);
}
