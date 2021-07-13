void main()
{

  DelayCommand(15.0,ActionCloseDoor(GetObjectByTag("ToFoyer")));
  DelayCommand(15.0,SetLocked(GetObjectByTag("ToFoyer"),TRUE));
}
