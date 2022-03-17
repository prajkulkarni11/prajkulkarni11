/* *
 * @ClassName : PriceDiscountHelper
 * @Description : Discount of 10% of given input
 * @author : Girish
*/
public with sharing class PriceDiscountHelper {
    public static void priceBlock(List<Book__c> blist){
        for(Book__c b : blist){
        b.Price__c = b.price__c - (b.price__c*10)/100 ;
    }
    }
}