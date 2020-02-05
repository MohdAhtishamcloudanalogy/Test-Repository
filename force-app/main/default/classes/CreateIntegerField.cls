public with sharing class CreateIntegerField
{
 public static void  createIntegerField(List<Opportunity> oppList)
 {
 	Set<Id> oppId = new Set<Id>();
 	for(Opportunity oppObject : oppList)
 	{
 		if(oppObject.StageName == 'Closed Won')
 		{
 		 oppId.add(oppObject.Id);
 		}
 	}
 	
 	List<OpportunityLineItem> OLIList = new List<OpportunityLineItem>();
 	OLIList = [SELECT Product2Id, OpportunityId, Quantity FROM OpportunityLineItem WHERE OpportunityId IN : oppId AND Quantity > 0];
 	
 	Set<Id> productId = new Set<Id>();
 	for(OpportunityLineItem OLIObject : OLIList)
 	{
 		productId.add(OLIObject.Product2Id);
 	}
 	
 	List<Product2> productList = new List<Product2>();
 	productList = [SELECT No_Of_Products_sold__c, Id FROM Product2 WHERE Id IN : productId];
 	
 	for(OpportunityLineItem OLIObject1: OLIList)
 	{
 		for(Product2 productObject1 : productList)
 		{
 			if(OLIObject1.Product2Id == productObject1.Id)
 			{
 				if(productObject1.No_Of_Products_sold__c == null)
 				{
 					productObject1.No_Of_Products_sold__c = 0;
 				}
 	            productObject1.No_Of_Products_sold__c = productObject1.No_Of_Products_sold__c + 1;
 			}
 		}
 	}
 	update productList ;
 }
}