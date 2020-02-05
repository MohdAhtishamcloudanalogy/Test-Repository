public with sharing class CreateCase 
{
 public static void createCase(List<Opportunity> opportunityList)
 {
 	system.debug(opportunityList);
 	List<Case> caseList = new List<Case>();
 	for(Opportunity opportunityObject : opportunityList)
 	{
 		if(opportunityObject.StageName == 'Closed Lost')
 		{
 			Case caseObject = new Case();
 			caseObject.AccountId = opportunityObject.AccountId;
 			caseObject.SuppliedEmail ='abc@gmail.com'; 
 			caseList.add(caseObject);
 		}
 	}
 	system.debug(caseList);
 	insert caseList;
 }    
}