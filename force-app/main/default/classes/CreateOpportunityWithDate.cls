public with sharing class CreateOpportunityWithDate 
{
    public static void createOpportunityWithDate(List<Opportunity> opportuityList)
    {
    	for(Opportunity opportunityObject : opportuityList)
    	{
    		if(opportunityObject.CloseDate < Date.today())
    		{
    		  opportunityObject.addError('Please Enter correct Date');
    		}
    	}
    }
}