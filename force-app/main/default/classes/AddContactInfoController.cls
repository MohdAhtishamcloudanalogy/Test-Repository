public class AddContactInfoController {
//Variable to hold all accounts added/edited
public List<Contact> allContactList = new List<Contact>();
    public Integer serailNumber = 1;

//Variable to hold add contacts to be deleted
public List<Contact> deleteContactList = new List<Contact>();

//Variable to hold the Contact record
public Account accountRec {get;set;}
    
    

//Called when the page loads initially from the "action" method on the apex:page. Populates the Account record and the releated contact list
/* public void onloadmethod(){
String aid =System.currentPageReference().getParameters().get('id');
accountRec = [Select Id,OwnerId,Name,Type,Phone,Website from Account where Id=:aid]; 
allContactList = [Select Id,FirstName,LastName,Email from Contact where AccountId=:accountRec.Id];
}*/
//Send the list of contacts to the visualforce page
public List<Contact> getContacts(){
return allContactList;
}

//Add a temporary contact to the table. Not saved to the database
public void addContact(){
Contact c = new Contact();
allContactList.add(c);
    serailNumber = serailNumber+1;
}

//Remove a contact from the table.
public void removeContact(){
Integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index'));
//If the contact is an existing contact then add it to the list to delete from the databse
if(allContactList[indexVal - 1].Id != null)
deleteContactList.add(allContactList[indexVal - 1]);
//Remove the contact from the table 
allContactList.remove(indexVal - 1); 
} 
public void saveChanges(){
//update existing contacts and insert new ones
upsert allContactList;
//delete the contacts that were removed
if(deleteContactList.size() > 0)
delete deleteContactList;
} 

}