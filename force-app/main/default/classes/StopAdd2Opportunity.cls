public with sharing class StopAdd2Opportunity 
{
     public static void stopAdd2Opportunity(List<OpportunityLineItem> OLIList)
     {
     	system.debug('hello '+OLIList);
     	Set<Id> OLiId = new Set<Id>();
     	for(OpportunityLineItem OLIObject : OLIList)
     	{
     		OLiId.add(OLIObject.OpportunityId);
     	}
     	system.debug('hello===>>> '+OLiId);
     	List<Opportunity> opportunityList= [SELECT Id, Name FROM Opportunity WHERE Id IN : OLiId];
     	system.debug('opportunityList '+opportunityList);
     	
     	Integer count = 0;
     	for(Opportunity opp:opportunityList)
     	{
     		for(OpportunityLineItem oli:OLIList)
     		{
     			if(opp.Id == oli.OpportunityId)
     			{
     				count++;
     				if(count > 2)
     				{
     					opp.addError('You Can not add more than two line items');
     				}
     			}
     		}
     	}
     }
}