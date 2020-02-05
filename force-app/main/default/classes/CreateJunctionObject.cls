// Answer 24

public with sharing class CreateJunctionObject 
{
    public static void createJunctionObject()
    {
    	List<Event__c> eventList = new List<Event__c>();
    	eventList = [SELECT Name,Id FROM Event__c WHERE Name = 'Lunch' LIMIT 1];
    	system.debug(eventList);
    	
    	List<Contact> contactList = new List<Contact>();
    	contactList = [SELECT Name,Id FROM Contact WHERE Name = 'Smith' LIMIT 1];
    	system.debug(contactList);
    	
    	List<Event_Participant__c> eventParticipantList = new List<Event_Participant__c>();
    	for( Integer i=0; i<10; i++)
    	{
    		Event_Participant__c eventPObject = new Event_Participant__c();
    		eventPObject.Name = 'event'+i;
    		eventPObject.Contact__c = contactList[0].id;
    		eventPObject.Event__c = eventList[0].id;
    		if(i<4)
    		{
    		 	eventPObject.Event_List__c = 'Attendee Contact';
    		}
    		if( i>3 && i<8 )
    		{
    		 	eventPObject.Event_List__c = 'Presenter Contact';
    		}
    		if( i>7 && i<10 )
    		{
    		 	eventPObject.Event_List__c = 'Organizer Contact';
    		}
    		
    		eventParticipantList.add(eventPObject);
    	}
    	insert eventParticipantList;
    	system.debug(eventParticipantList);
    }
}