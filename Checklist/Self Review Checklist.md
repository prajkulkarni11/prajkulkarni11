# Self Code Review Checklist

This Review checklist to be used by every developer while checking in the code in the repository.
Developer needs to understand why this checklist is added and needs to honer every line item In case not followed the Pull Request will be Rejected.

* There should be header specifying the Copywrite notice at the Top of the each file

* Description should be mentioned for each file 
 
* Apex Class should be with sharing , classes without sharing needs to created specific purpose only

* Method should not be more than 100 lines 

* Each method should have header describing the purpose of method and parameters described well 

* String litrals numbers used in the class should be defined as the constants  

* Every Name of the Class should be starting with Capital letter like String , Person 

* class Name should be start with noun and should not start with verb. ( e.g Animal , Dog , human )

* Method names should be starting with verb  (e.g eat , sleep  )

* methods which returns Boolean should be start with is , can 

* Proper comments should be available in case complicated statements

* If Multiple lines of code is repeated in the class it should be encapsulated in the function/method

* Unit Test is must and it should show more than 80% Unit test code coverage for each class 

* Pull Request should be with proper description with mentioed JIRA Issue number.
  
* Impact Testing should sbe mentioned in the Pull Request so that Reviewer will able to understand it 

* Every line of Code should be Readable 

* Use of proper variable names is must line lineNumber , contactSobject or contactSo , accountList
  
* Do not use varibles like i,j,k, acc , con

* Do not execute Queries inside Loop

## Refrence 
 * Please Refer https://www.apexhours.com/code-review-checklist for more details.
 * Also more on namming conventions https://amitsalesforce.blogspot.com/2020/06/salesforce-naming-conventions-best.html
 * https://developer.salesforce.com/docs/atlas.en-us.224.0.apexcode.meta/apexcode/apex_code_coverage_best_pract.htm
