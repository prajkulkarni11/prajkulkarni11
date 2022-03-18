/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-18 17:50:29
 * @ Modified by: Your name
 * @ Modified time: 2022-03-18 17:59:18
 * @ Description:create a custom wrapper class and using that insert a data in account and contact object
 */


//1.create a custom wrapper class and using that insert a data in account and contact object
public with sharing class WrapperTrial 
{
  public void CallWrapper()
  {
      List<WrapperExample> wlist=new List<WrapperExample>();
      
      for(Account a:[select id,name from account limit 2])
      {
          WrapperExample obj=new WrapperExample(a);
          wlist.add(obj);
          
      }
      system.debug('account list '+wlist);
      for(Contact c:[select id,firstName from Contact limit 2])
      {
           WrapperExample obj1=new WrapperExample(c);
          wlist.add(obj1);
      }
      system.debug('contact list '+wlist);
  }
}