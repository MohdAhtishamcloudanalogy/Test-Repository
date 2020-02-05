// Answer 27

public with sharing class GetTotalNoOfEmployee 
{
    public static void getTotalNoOfEmployee()
    {
    	Integer sum = 0;
    	List<Account> accountList = new List<Account>();
    	accountList = [SELECT Id, Name, NumberOfEmployees FROM Account WHERE Working_in__c INCLUDES('NA','ASIA')];
    	system.debug(accountList);
    	for(Account accountObject : accountList)
    	{
    		sum = sum + accountObject.NumberOfEmployees;
    	}
    	system.debug('The number of Employee will be: '+sum);
    }
}