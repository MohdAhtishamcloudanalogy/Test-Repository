public with sharing class CreateProduct 
{
    public static void createProduct(List<Product2> productList)
    {
     List<Pricebook2> pricebookList = new List<Pricebook2>();
     pricebookList = [SELECT Id FROM Pricebook2 WHERE isStandard = true];

     List<PricebookEntry> pricebookEObject = new List<PricebookEntry>();     
     for(Product2 prodObject : productList)
     {
     	PricebookEntry pbEntryObject = new PricebookEntry(Product2Id = prodObject.Id, UnitPrice = 1, Pricebook2Id = pricebookList[0].Id, isActive = true );

     	if(pbEntryObject != null)
     	pricebookEObject.add(pbEntryObject);
     }
     
    	if(pricebookEObject != null)
     	insert pricebookEObject;
    }
}