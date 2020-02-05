public with sharing class OnCampaignCloseAllOpportunity 
{
 public static void onCampaignCloseAllOpportunity(List<Campaign> campaignList)
 {
 	System.debug('campaign List'+campaignList);
 	Set<Id> campId = new Set<Id>();
 	for(Campaign campObject : campaignList)
 	{
 		if(campObject.Status == 'Completed')
 		{
 			campId.add(campObject.Id);
 		}
 	}
 	System.debug('campaign id  '+campId);
 	
 	List<Opportunity> opportunityList = new List<Opportunity>();
 	opportunityList = [SELECT Id, Name, CloseDate, StageName, HasOpportunityLineItem, OwnerId FROM Opportunity WHERE CampaignId IN : campId];
 	
 	for(Opportunity oppObject : opportunityList)
 	{
 		if(oppObject.HasOpportunityLineItem)
 		{
 			oppObject.StageName = 'Closed Won';
 		}
 		else
 		{
 			oppObject.StageName = 'Closed Lost';
 		}
 	}
 	update opportunityList;
 	system.debug(opportunityList);
 	
 	Set<Id> ownerId = new Set<Id>();
 	for(Opportunity oppObject1 : opportunityList)
 	{
 		ownerId.add(oppObject1.OwnerId);
 	}
 	
 	List<User> userList = new List<User>();
 	userList = [Select Id, Email FROM User WHERE Id IN : ownerId];
 	
 	List<Messaging.SingleEmailMessage> messageList = new List<Messaging.SingleEmailMessage>();
 	
 	String message ='';
 	for(User userObject : userList)
 	{
 		String userMail = userObject.Email;
 		for(Opportunity opportunityObject : opportunityList)
 		{
 			Messaging.SingleEmailMessage messageObject = new Messaging.SingleEmailMessage();
 			
            List<String> sendTo = new List<String>();
            sendTo.add(usermail);
            
            messageObject.setToAddresses(sendTo);
            message = 'Name: '+opportunityObject.Name+'StageName: '+opportunityObject.StageName+'CloseDate: '+opportunityObject.CloseDate; 
            messageObject.setHtmlBody(message);
            messageList.add(messageObject);
 		}
 	}
 }
}