/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-19 14:21:47
 * @ Modified by: Your name
 * @ Modified time: 2022-03-19 14:26:25
 * @ Description: 2.	Write a function rotate that rotates the elements of an array.
 *  All elements should be moved one position to the left.
 *  The 0th element should be placed at the end of the array. The rotated array should be returned. 
 */


    function rotate(a){
        let myShift = a.shift();
        a.push(myShift);
        return a;
      }
      
      console.log(rotate(['a', 'b', 'c']));
    
      
  