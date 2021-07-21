void main()
{
//BESIE Widget
if(GetTag(GetItemActivated()) == "BESIEWidget")
    {
    AssignCommand(GetItemActivator(), ActionStartConversation(GetItemActivator(), "re_widget", TRUE));
    }
}
