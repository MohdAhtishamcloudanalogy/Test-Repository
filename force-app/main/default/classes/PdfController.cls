public class PdfController 
{
    public Account accList {get;set;}
    public PdfController()
    {
        Id currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        accList = [SELECT Master_Policy_Number__c, Client_Policy_Number__c, Insured__c, ABN_ACN__c, Situation__c, Interested_Party__c, From__c, To__c, Business__c, Description_of_Equipment__c, Equipment_Serial_No_VIN_No_ID_No__c, Annual_Period_1__c, Annual_Period_2__c, Annual_Period_3__c, Annual_Period_4__c, Annual_Period_5__c, Secondary_Mechanical_Damage__c, Expediting_Costs__c, Additional_Costs__c, Extra_Costs_of_Reinstatement__c, Recovery_Costs_No_Damage__c, Recovery_Costs_Damage__c, Employee_s_Property_Damage__c, Emergency_Services_Charges__c, Tools_of_Trade__c, Locks_and_Keys__c, Excess__c, Premium__c, Dated__c  FROM Account where id =: currentRecordId];
        system.debug('accList-->'+accList);
    }
}