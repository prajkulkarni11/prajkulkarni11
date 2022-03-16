
/**

 * @File Name          : NoOfContactCreatee.cls
 * @Description        :  Trigger Assignment 05:Create Custom field called “Number of Contacts” on the Account Object (Data Type=Number)
The trigger creates the number of contacts which are equal to the number which we will enter in the Number of Contacts field on the Account Object

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 15-03-22, 5:40:39 pm
* @Modification Log   : 

 **/


trigger NoOfContactCreatee on Account (after insert) {
    
    list<contact> listContact = new list<contact>();
    map<id,decimal> mapAcc=new map<id,decimal>();
    for(Account acc:trigger.new){
        mapAcc.put(acc.id,acc.Number_of_Contacts__c);
    }
    if(mapAcc.size()>0 && mapAcc!=null){
        for(Id accId:mapAcc.keyset()){
            for(integer i=0;i<mapAcc.get(accId);i++){
                contact newContact=new contact();
                newContact.accountid=accId;
                newContact.lastname='contact'+i;
                listContact.add(newContact);
            }
        }
    }
    if(listContact.size()>0 && listContact!=null)
        insert listContact;
}