public class CustomerProjectHandler {
public static void updateopp(list<Cutomer_Project__c> cplist)
{
    List<Opportunity> opps=new List<Opportunity>();
 for(Cutomer_Project__c cp:cplist){
 if(cp.Status__c=='Active'){
 Opportunity opp= new Opportunity(id=cp.Opportunity__c);
 opp.Active_Customer_Project__c = True;
 opps.add(opp);
 }
 }
 update opps;
}
}