/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-22 16:21:07
 * @ Modified by: Your name
 * @ Modified time: 2022-03-22 16:27:14
 * @ Description: //7.create a visual force page of action poller for timer based application ActionPollarVF

 */


public with sharing class ActionPollarVF 
{
    Integer cnt = 0;
            
    public PageReference incrementCounter() {
        cnt++;
        return null;
    }
            
    public Integer getCount() {
        return cnt;
    }
}