/**

 * @File Name          : BookDiscount.cls
 * @Description        :  Trigger Assignment 04:Create the object called “Books” and create field “Price”(data type is Currency) under this object
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 15-03-22, 2:40:39 pm
* @Modification Log   : 

 **/

public with sharing class BookDiscount {
    
    public static void getDiscount(List<Book__c> books) {
        for (Book__c b :books){
            b.Price__c *= 0.9;
        }
    }

}