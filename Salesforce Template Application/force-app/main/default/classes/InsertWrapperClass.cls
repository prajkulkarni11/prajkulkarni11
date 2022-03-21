/**
 * @File Name          : InsertWrapperClass.cls
 * @Description        :  Trigger Assignment 31.create a custom wrapper class and using that insert a data in account and contact object.
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 21-03-22, 2:30:39 pm
* @Modification Log   : 
 **/

public with sharing class InsertWrapperClass {  
    public List<Wrapper> Wrapperlist{get;set;}
    
    public InsertWrapperClass(){   
        Wrapperlist=new List<Wrapper>();
        for(Integer i=0; i<=1; i++){
            String  string1='Account Wrapper';
            String  string2='Contact Wrapper';
            
            Wrapperlist.add(new Wrapper(string1, string2 ));
            system.debug('WrapperlistWrapperlist'+Wrapperlist);
        }   
    }
    
    public void save(){
        system.debug('>>>>>'+Wrapperlist);
        
        for(Wrapper wr : Wrapperlist) {
            Account acc = new Account();
            acc.Name=wr.str1;
            insert acc;
            
            Contact con = new Contact();
            con.LastName = wr.str2;
            insert con;
            
        }       
    }
    
    public class wrapper{
        public  String str1{get;set;}
        public String str2{get;set;}
        
        public  wrapper(String string1,String string2){
            str1=string1;
            str2=string2;
        }
    }
}