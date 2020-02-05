public with sharing class UpdateOnCreateContact 
{
    public static void updateOnCreateContact(List<Contact> contactList)
    {
    	Account accountObject = new Account();
    	accountObject = [SELECT Id, Name FROM Account WHERE Id =: contactList[0].AccountId];
    	for(Contact contactObject : contactList)
   	    {
   	    	String s1=contactObject.LastName; 
            String s2=accountObject.Name; 
            accountObject.Name=s2.replace(s1, '');
   	    }
   	    update accountObject;
    }
}