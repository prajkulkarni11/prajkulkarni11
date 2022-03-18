public class BookController {
    public list<Book__c> bk{get;set;}
    public BookController()
    {
        bk= new list<Book__c>();
        bk= [select Id,Name,Price__c from Book__c];
        
    }

}