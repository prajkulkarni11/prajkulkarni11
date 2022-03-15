/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-15 14:17:17
 * @ Modified by: Your name
 * @ Modified time: 2022-03-15 14:31:12
 * @ Description://Basic salary is 10000 DA=20% of basic salary , HRA= 30% of BS find Net salary (NS=BS+DA+HRA)

 */

//Basic salary is 10000 DA=20% of basic salary , HRA= 30% of BS find Net salary (NS=BS+DA+HRA)

public with sharing  class Salarycalculator {
    public static void print(){
        
integer salary=10000;
   integer DA=200;
        integer HRA=600;
     integer netsalary;
        
        netsalary=salary+HRA+DA;
        
        system.debug(netsalary);
    }
     
        
}