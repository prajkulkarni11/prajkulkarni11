
/**
 * @File Name          : InsertLead.cls
 * @Description        : Collection Assignment-Write an apex program, to insert 250 Lead Records inside the object.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 03/03/2022, 4:40:39 pm
 * @Modification Log   : 
 
**/


public with sharing class InsertLead {
   
        public static void m1()
        {
            List<Lead> l = new List<Lead>();
            Lead objTest;
            for(Integer i=0;i<=250;i++)
            {
                objTest=new Lead(LastName='THA'+string.valueof(i), Company='vyom'+string.valueof(i),
                                 Email='swappp@gmail.com'+string.valueof(i));
                l.add(objTest);
            }
            insert l;
        }
}