// Answer 32

public with sharing class GetToalQuantity 
{
    public static void getToalQuantity()
    {
    	List<Account> accountList = new List<Account>();
    	accountList = [SELECT Name, Id FROM Account Where Working_in__c INCLUDES('ASIA')];
   // 	system.debug(accountList);
    	
    	 Set<Id> accountId = new set<Id>();
       for(Account accObject : accountList)
       {
  	    accountId.add(accObject.Id);
       }
       
       List<Opportunity> opportunityList = new List<Opportunity>();
    	opportunityList = [SELECT Name, AccountId FROM Opportunity Where AccountId IN : accountId];
    	
    	
    	Set<Id> opportunityId = new Set<Id>();
    	for(Opportunity oppObject : opportunityList)
    	{
    		opportunityId.add(oppObject.Id);
    	}
    	//system.debug(opportunityId);
    	List<OpportunityLineItem> OLIList = new List<OpportunityLineItem>();
    	OLIList = [SELECT Quantity FROM OpportunityLineItem Where OpportunityId IN : opportunityId];
       system.debug(OLIList);
    }
}