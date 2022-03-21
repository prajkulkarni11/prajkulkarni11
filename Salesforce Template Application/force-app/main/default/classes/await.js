/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-21 18:21:55
 * @ Modified by: Your name
 * @ Modified time: 2022-03-21 18:27:35
 * @ Description: 4.	write a java script code to implement async await with an exmaple.
 */

 async function sampleFunction() {
   	
    let promise = new Promise((resolve, reject) => {
          setTimeout(() => resolve("done!"), 3000)
        });
      
        let result = await promise; // wait until the promise resolves (*)
      
    console.log(result) // "done!"
      }
      
      sampleFunction();
 