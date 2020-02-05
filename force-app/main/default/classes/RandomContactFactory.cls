public with sharing class RandomContactFactory 
{
 public static List<Contact> generateRandomContacts(Integer firstParam , String secondParam)
 {
 	List<Contact> contactList = new List<Contact>();
 	for( Integer i=0; i<firstParam; i++ )
 	{
 	 Contact contactObject = new Contact(LastName = secondParam );
 	 contactObject.FirstName = 'Test '+i;
 	 contactList.add(contactObject);
 	}
 	system.debug(contactList);
 	return contactList;
 }    
}