public with sharing class OnOpportunityAlert
{
   public static void onOpportunityAlert1(List<Opportunity> opportunityList)
   {
   	for(Opportunity opportunityObject : opportunityList)
   	{
   		if(opportunityObject.StageName == 'Closed Won' && opportunityObject.HasOpportunityLineItem == false)
   		{
   			opportunityObject.addError('restricted to make oli..');
   		}
   	}
   }
   
   public static void onOpportunityAlert2(List<Opportunity> opportunityList)
   {
   	for(Opportunity opportunityObject : opportunityList)
   	{
   		if(opportunityObject.HasOpportunityLineItem == false &&  opportunityObject.StageName == 'Closed Won')
   		{
   			opportunityObject.addError('restricted to make oli..');
   		}
   	}
   }
}