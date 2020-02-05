public class TranslationWorkbenchDemoController {
    public static Contact contactObj { get; set; }
    public static List<Product__c> productList { get; set; }
    public TranslationWorkbenchDemoController(){
        List<String> productName = new List<String>();
        List<Decimal> productprice = new List<Decimal>();
        List<Decimal> productQuantity = new List<Decimal>();
        List<Decimal> productCount = new List<Decimal>();
        contactObj = [SELECT Id, Name, LeadSource, Email, MobilePhone FROM Contact WHERE Name = 'Mohd Ahtisham' LIMIT 1];
        system.debug('contactObj---->'+contactObj);
        productList = [SELECT Name, price__c, Quantity__c, count__c FROM Product__c LIMIT 10];
        system.debug('productList---->'+productList);
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, Label.Product_Name ));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, Label.Product_Price ));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, Label.Product_Quantity ));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, Label.Count ));
    }
}