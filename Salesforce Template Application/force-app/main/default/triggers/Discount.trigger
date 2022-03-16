
/**

 * @File Name          : Discount.cls
 * @Description        :  Trigger Assignment 04:Create the object called “Books” and create field “Price”(data type is Currency) under this object
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 15-03-22, 2:40:39 pm
* @Modification Log   : 

 **/

trigger Discount on Book__c (before insert, before update) {
    
    List<Book__c> books = Trigger.new;
    BookDiscount.getDiscount(books);
}