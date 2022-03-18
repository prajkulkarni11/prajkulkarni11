/* *
 * @ClassName : ExceptionHandling
 * @Description : exception handling programs
 * @author : Girish
*/

public with sharing class ExceptionHandling {
    public static void blockNullPointer(){
        
        integer a;
        system.debug('Start of NullPointer');
        try{
        integer b= 5*a;
        }
        catch(NullPointerException ne){
            system.debug('This is Null Pointer exception : '+ne.getMessage());
        }
        system.debug('End of NullPointer');
    }
    
    public static void blockDMLException(){
        	system.debug('start of ListException');
       
       
        try{
	account acc = new account();
        insert acc;
        }
          catch(DMLException le){
            system.debug(' exception message '+le.getMessage());
        }

        system.debug('end of ListException');
        
    }
}