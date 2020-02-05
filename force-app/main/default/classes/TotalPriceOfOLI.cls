// Answer 29

public with sharing class TotalPriceOfOLI 
{
    public static void totalPriceOfOLI()
    {
    	Double sum = 0;
    	List<Product2> productList = new List<Product2>();
    	productList = [SELECT Name, Id FROM Product2 WHERE Name = 'Gandhiji Chasma'];
    	
    	Set<Id> productId = new Set<Id>();
    	for(Product2 proObject : productList)
    	{
    		productId.add(proObject.Id);
    	}
    	
    	List<OpportunityLineItem> OLIList = new List<OpportunityLineItem>();
    	OLIList = [SELECT Name, TotalPrice, Product2Id FROM OpportunityLineItem WHERE Product2Id IN : productId ];
        system.debug(OLIList);
        
        for(OpportunityLineItem OLIObject : OLIList)
        {
        	sum = sum + OLIObject.TotalPrice;
        }
        system.debug('Toatal sum of Product will be: '+sum);
    }
}