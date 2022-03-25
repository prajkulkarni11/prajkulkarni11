/**
 * @File Name          : App.js
 * @Description        : Lwc Assignment:-5) 5.	Reset button will reset the screen to the initial form.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 24/03/2022, 10:09:39 pm
 * @Modification Log   : 
 
**/

import { LightningElement } from "lwc";

export default class App extends LightningElement {
  handleResetAll(){
    this.template.querySelectorAll('lightning-input').forEach(element => {
      if(element.type === 'checkbox' || element.type === 'checkbox-button'){
        element.checked = false;
      }else{
        element.value = null;
      }      
    });
  }
  handleResetCityField(){
    this.template.querySelector('lightning-input[data-name="city"]').value = null;    
  }
  handleResetUsingDataId(event){
    this.template.querySelectorAll('lightning-input[data-id="reset"]').forEach(element => {
      element.value = null;
    });
  }
  handleResetCheckbox(){
    this.template.querySelector('lightning-input[data-name="active"]').checked = false; 
  }
}