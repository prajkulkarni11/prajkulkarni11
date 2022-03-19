/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-18 17:50:29
 * @ Modified by: Your name
 * @ Modified time: 2022-03-18 17:58:44
 * @ Description:create a custom wrapper class and using that insert a data in account and contact object
 */


//1.create a custom wrapper class and using that insert a data in account and contact object
public with sharing class WrapperExample {

    public string name;
    public WrapperExample(Account x1)
    {
        name=x1.name;
        
    }
    public WrapperExample(Contact X1)
    {
        name=x1.firstName;
    }
}