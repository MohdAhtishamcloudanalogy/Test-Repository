public with sharing class CreateDefaultContactOpportunity 
{
 public static void createDefaultContactOpportunity(List<Account> accountList)
 {
 	List<Contact> contactList = new List<Contact>();
 	List<Opportunity> opportunityList = new List<Opportunity>();
 	
 	Integer i=1;
 	for(Account accountObject : accountList)
 	{
 		if(accountObject.NumberOfEmployees > 100)
 		{
 			Contact contactObject = new Contact(AccountId = accountObject.Id, LastName = 'contact'+i);
 			contactList.add(contactObject);
 			Opportunity oppObject = new Opportunity(AccountId = accountObject.Id, StageName = 'Prospecting', CloseDate = Date.today(), Name = 'opport'+i);
 			opportunityList.add(oppObject);
 			i++;
 		}
 	}
 	insert contactList;
 	insert opportunityList;
 	
 	List<Case> caseList = new List<Case>();
 	List<OpportunityContactRole> OCRList = new List<OpportunityContactRole>();

 	for(Integer j=0; j<contactList.size(); j++)
 	{
 		Case caseObject = new Case(AccountId = accountList[j].Id, SuppliedEmail = 'saim@cloudanalogy.com');
 		caseList.add(caseObject);
 		OpportunityContactRole OCRObject = new OpportunityContactRole(OpportunityId = opportunityList[j].Id, ContactId = contactList[j].Id, isPrimary = true);
 		OCRList.add(OCRObject);
 	}
 	insert caseList;
 	insert OCRList;
 }
}