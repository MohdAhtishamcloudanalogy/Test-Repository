public with sharing class OnContactCreate 
{
   public static void onContactCreate(List<Contact> contactList)
   {
   	Account accountObject = new Account();
   	accountObject = [SELECT Id,Name FROM Account WHERE Id =: contactList[0].AccountId];
   	for(Contact contactObject : contactList)
   	{
   		accountObject.Name = accountObject.Name + contactObject.LastName ;
   	}
   	update accountObject;
   }
}