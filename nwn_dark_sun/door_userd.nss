//Closes door if it is open
void main()
{
int iEvent = GetUserDefinedEventNumber();
if(iEvent == 9006)
  {
      DelayCommand(1.5,ActionCloseDoor(OBJECT_SELF));

  }
}
