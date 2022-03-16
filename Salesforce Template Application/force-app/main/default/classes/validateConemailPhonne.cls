public class validateConemailPhonne {
public static void validate(list<Contact> conlist)
{
     for(Contact con:conlist){
                if(con.Email==null || con.Email=='')
                    con.Email.addError('Email Required');
                if(con.MobilePhone==null || con.MobilePhone=='')
                   con.MobilePhone.addError('Mobile Number is Required'); 
            }
        }
        
        
}