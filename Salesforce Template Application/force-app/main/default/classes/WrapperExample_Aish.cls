/**
 * @ Author: Aishwarya S
 * @ Create Time: 2022-03-19 13:58:54
 * @ Modified by: Your name
 * @ Modified time: 2022-03-19 14:01:36
 * @ Description://1.create a custom wrapper class and using that insert a data in account and contact object

 */


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