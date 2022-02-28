
/**
 * @File Name          : ContactSearch.js
 * @Description        : 
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 28/02/2022, 3:40:39 pm
 * @Modification Log   : 
 
**/



import { LightningElement,track,wire } from 'lwc';
import fetchCon from '@salesforce/apex/LwcContactSearch.fetchCon';
const Delay = 500;

export default class SearchContact extends LightningElement {
@track searchKey = '';
@wire(fetchCon,{conSearchKey:'$searchKey'})
contacts;

handleSearch(event){
window.clearTimeout(this.delayTimeout);
const searchKey = event.target.value;
this.delayTimeout = setTimeout(()=>{
try{
this.searchKey = searchKey;
}catch(e){
console.log(e);
}
},Delay);
}
}