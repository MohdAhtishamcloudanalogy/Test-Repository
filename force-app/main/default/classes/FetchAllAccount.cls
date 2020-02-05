// Answer 26

public with sharing class FetchAllAccount 
{
    public static void fetchAllAccount()
    {
    	Integer count = 0;
    	List<OpportunityLineItem> OLIList = new List<OpportunityLineItem>();
    	OLIList = [SELECT OpportunityId, PricebookEntryId, UnitPrice, Quantity FROM OpportunityLineItem WHERE OpportunityId != NULL];
    	
    	Set<Id> oppoId = new Set<Id>();
    	
    	for( Integer i=0; i<OLIList.size();i++)
    	{
    		for( Integer j=i+1; j<OLIList.size();j++)
    		{
    			if(OLIList[i].OpportunityId == OLIList[j].OpportunityId)
    			{
    			 count++;
    			 if(count > 2)
    			 {
    			 oppoId.add(OLIList[i].OpportunityId);
    			 count = 0;
    			 }
    			}
    		}
    	}
    	
    	List<Opportunity> opportunityList = new List<Opportunity>();
    	opportunityList = [SELECT Id, Name,AccountId, StageName, CloseDate FROM Opportunity WHERE Id IN : oppoId AND AccountId != NULL];
    	
    	Set<Id> accountId = new Set<Id>();
    	
    	for(Opportunity oppObject : opportunityList)
    	{
    		accountId.add(oppObject.AccountId);
    	}
    	system.debug(accountId);
    	
    	List<Account> accountList = new List<Account>();
    	accountList = [SELECT Id, Name FROM Account WHERE Id IN : accountId ];
    	system.debug(accountList);
    }
}