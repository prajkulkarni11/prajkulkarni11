/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-19 14:14:53
 * @ Modified by: Your name
 * @ Modified time: 2022-03-19 14:16:47
 * @ Description: 1.	write a java script code to apply following operations on string string.js
I.find occurance of substring II. find length of string III.concatenate two string.

 */

console.log("1)find occurance of substring 2)find length of string 3) concatenate two string ");
var ch= process.argv[2];
switch(ch)
{
    case "1":
        function countOccurences(string, word) {
            var n= string.split(word).length - 1;
            console.log('string occurs'+n+'times.');
         }
         var text="Hello world"; 
         var count=countOccurences(text,"p");
    case "2":
        var str1 = "I am happy";
        var len = str1.length;
        console.log('Length of the string is'+len);

    case "3":
        var str2 = "Hello ";
        var str3 = "world!";
        var res = str2.concat(str3);
        console.log('after concatination string is '+res);

    
    default:
            text = "sorry! Please enter right choice...";
}
