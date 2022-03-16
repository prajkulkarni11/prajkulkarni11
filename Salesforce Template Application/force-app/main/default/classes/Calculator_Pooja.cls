/*
    Description : class is designed to calculate passed parameters data


 * Filename: f:\GitWorkspace\Salesforce Template Application\force-app\main\default\classes\Calculator_Pooja.cls
 * Path: f:\GitWorkspace\Salesforce Template Application
 * Created Date: Wednesday, March 9th 2022, 5:47:29 pm
 * Author: Pooja Kudale
 * 
 * Copyright (c) 2022 Your Company
 */


public with sharing class Calculator_Pooja
 {
     //method performing addition of two numbers
   public void add(integer num1, integer num2)
   {
       integer sum = num1 + num2;
       system.debug('addition of two number : '+sum);
   }
}
