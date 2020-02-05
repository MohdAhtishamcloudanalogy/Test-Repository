// Answer 31

public with sharing class CreateLeadsAndProducts 
{
    public static void createLeadsAndProducts()
    {
    	List<Lead> leadList = new List<Lead>();
    	for( Integer i=1; i<=3; i++ )
    	{
    		Lead leadObject = new Lead();
    		leadObject.LastName = 'test '+i;
    		leadObject.Company = 'cloud analogy';
    	//	leadObject.Status = 'Working - Contacted';
    		leadList.add(leadObject);
    	}
    	insert leadList;
    	system.debug(leadList);
    	
    	List<Product2> productList = new List<Product2>();
    	for( Integer j=0; j<3; j++ )
    	{
    		for( Integer k=1; k<=5; k++ )
    		{
    			Product2 productObject = new Product2( Name = 'product '+k, Lead__c = leadList[j].Id );
    			productList.add(productObject);
    		}
    	}
    	insert productList;
    	system.debug(productList);
    	
    }
}