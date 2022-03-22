/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-22 16:21:07
 * @ Modified by: Your name
 * @ Modified time: 2022-03-22 16:24:07
 * @ Description: //6.create a visual force page on click of the button increment the values and 
//get the status of the request IncrementVF
 */


public with sharing class IncrementClass
{
 public Integer numb{get;set;}
	
	public  IncrementClass(){
		numb = 100;
	}
    public void display(){
		numb = numb + 1;
    }
}