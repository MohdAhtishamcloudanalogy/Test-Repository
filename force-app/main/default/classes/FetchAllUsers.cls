// Answer 33

public with sharing class FetchAllUsers 
{
    public static void fetchAllUsers()
    {
    	Integer count = 0;
    	List<User> userList = new List<User>();
    	userList = [SELECT Name, Id FROM User];
    	
    	List<Lead> leadList = new List<Lead>();
    	leadList = [SELECT Name,OwnerId FROM Lead WHERE CreatedDate = Today];
    	system.debug(leadList);
    	
    	List<String> name = new List<String>();
    	
    	for(Integer i=0;i<userList.size(); i++)
    	{
    		for(Integer j=0;j<leadList.size();j++)
    		{
    			if(userList[i].Id == leadList[i].OwnerId)
    			{
    				count++;
    				if(count > 20)
    				{
    					name.add(userList[i].Name);
    					count = 0;
    				}
    			}
    		}
    	}
    	system.debug(name);
    }
}