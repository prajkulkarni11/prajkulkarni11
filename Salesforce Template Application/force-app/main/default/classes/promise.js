/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-21 18:22:16
 * @ Modified by: Your name
 * @ Modified time: 2022-03-21 18:26:49
 * @ Description: 3.) create a promise in java script to display the and display the addition of two numbers

use promise with an exmple and show its resolved state and rejected state.

 */

 function addNum(a,b)
 {
     return new Promise((resolve,reject) =>{
         let sum= a+b;
         if(sum==5)
         {
             resolve("Success");
         }
         else{
             reject("Fail");
         }
     });
 }
 
 addNum(3,2).then(response=> {
 console.log("Success")
 })
 .catch(error=>{
 console.log("error")
 });