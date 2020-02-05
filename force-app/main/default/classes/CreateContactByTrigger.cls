public with sharing class CreateContactByTrigger 
{
	public static void createContactByTrigger(List<Account> accountList)
	{
		List<Contact> contactList = new List<Contact>();
		for(Account accountObject : accountList) 
		{
         for( Integer i=1; i<=accountObject.NumberOfEmployees; i++) 
         {
        	Contact contactObj = new Contact();
    		contactObj.LastName	= 'ContactCreate'+i;
            contactObj.AccountId = accountObject.Id;
    		contactList.add(contactObj);    
         }
        }
    
    if(contactList.size()>0)
    	insert contactList;
	}
}