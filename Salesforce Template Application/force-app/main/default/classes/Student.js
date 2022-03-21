/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-21 18:21:06
 * @ Modified by: Your name
 * @ Modified time: 2022-03-21 18:25:06
 * @ Description: 1.	Write a JavaScript program which compute, result of student and display grade (grades:
distinction,first class,second class, pass class fail.

 */



 let marks=[69, 65, 84, 98, 78, 65];
 let max_marks = marks.length * 100;
 let total = 0;
 
         let grade = 'F';
         for (let i = 0; i < marks.length; i++) {
             total += marks[i];
         }
         
         let percentage= ((total) / max_marks) * 100;
         if (percentage >= 90) {
             grade = 'Distinction';
         }
         else {
             if (percentage >= 80 && percentage <= 89) {
                 grade = 'First Class';
             }
             else {
                 if (percentage >= 60 && percentage <= 79) {
                     grade = 'Second Class';
                 }
                 else {
                     if (percentage >= 33 && percentage <= 59) {
                         grade = 'Pass Class';
                     }
                     else {
                         grade = 'Fail';
                     }
                 }
             }
         }
         console.log(percentage);
         console.log(grade);
 
 