void main()
{
  DelayCommand(5.0,ActionCloseDoor(GetObjectByTag("ToFoyer")));
  DelayCommand(5.0,SetLocked(GetObjectByTag("ToFoyer"),TRUE));
}
