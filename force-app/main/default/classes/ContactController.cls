public with sharing class ContactController {

    public Contact con { get; set; }
    public List<Contact> conList {get;set;}
    
    public ContactController(){
        conList = new List<Contact>();
       Contact con1 = new Contact();
        con1.FirstName = '';
        con1.LastName = '';
        conList.add(con1);
    }
    
    public void saveRow()
    {
        system.debug('conList>>>'+conList);
        if(conList.size()>0){
           insert conList;
        }
       //Contact conObject = new Contact(FirstName = con.FirstName, LastName = con.LastName);
        //ListContact2.add(conObject);
       //insert ListContact2;
    }
    public void AddRow(){
        Contact con2 = new Contact();
        con2.FirstName = '';
        con2.LastName = '';
        conList.add(con2);
    }
    public void removeRow(){
        Contact con2 = new Contact();
        con2.FirstName = '';
        con2.LastName = '';
        conList.add(con2);
    }
}

 /*   public PageReference save() {
  * Contact con = new Contact();
       insert con;  
     samepage= [select id,FirstName,LastName,Email,Birthdate from Contact where id=:c.id];
      samepage= [select id,FirstName,LastName from Contact where id=:c.id];
        return null;
    }
*/