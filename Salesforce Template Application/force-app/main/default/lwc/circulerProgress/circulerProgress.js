/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-29-2021
 * @last modified by  : Yogesh.Bhosale
**/
import { LightningElement } from 'lwc';

export default class CirculerProgress extends LightningElement {
    
    progressPercetage = 80;

    connectedCallback(){
        const numb = document.querySelector(".numb");
        let counter = 0;
        setInterval(()=>{
          if(counter == 100){
            clearInterval();
          }else{
            counter+=1;
            numb.textContent = counter + "%";
          }
        }, 80);
    }
        
}