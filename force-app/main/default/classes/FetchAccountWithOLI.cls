// Answer 25

public with sharing class FetchAccountWithOLI 
{
    public static void fetchAccountWithOLI()
    {
    	List<OpportunityLineItem> OLIList = new List<OpportunityLineItem>();
        OLIList = [SELECT OpportunityId, PricebookEntryId, UnitPrice, Quantity From OpportunityLineItem WHERE OpportunityId != null AND Quantity > 100];	
        system.debug(OLIList);
        
        Set<Id> opportunityId = new Set<Id>();
        for(OpportunityLineItem oppObject : OLIList)
        {
        	opportunityId.add(oppObject.opportunityId);
        } 
        
        List<Opportunity> opportunityList = new List<Opportunity>();
        opportunityList = [SELECT Id, StageName, CloseDate, Name, Account.Name, AccountId FROM Opportunity WHERE Id IN : opportunityId AND StageName = 'Closed Won' AND AccountId != Null];
        system.debug(opportunityList);
        
        Set<Id> accountId = new Set<Id>();
        for(Opportunity opportunityObject : opportunityList)
        {
        	accountId.add(opportunityObject.accountId);
        }  
        
        List<Account> accountList = new List<Account>();
        accountList = [SELECT Id, Name FROM Account WHERE Id IN : accountId];
        system.debug(accountList);
    }
}