/* *
 * @ClassName : WrapperExample
 * @Description : Wrapper class example
 *  * @author : Girish
*/
public with sharing class WrapperExample {
		String name;
    	Integer num;
    
    	 wrapper2  obj2;
    public Wrapper1(String name, Integer num,String name2, Integer num2){
        this.name = name;
        this.num = num;
       obj2 = new wrapper2(name2, num2);
    }
    Class wrapper2{
        String name2;
        Integer num2;
        
        Public wrapper2(String name2, Integer num2){
            this.name2 = name2;
            this.num2 = num2;
        }
    } 
    
}