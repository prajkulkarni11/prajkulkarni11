/**
 * @File Name          : SearchCaseComp.js
 * @Description        : Lwc Assignment:-5) Custom Search to include line-item records:
•	Create custom lightning component which contains search box.

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 23/03/2022, 9:40:39 pm
 * @Modification Log   : 
 
**/


import { LightningElement ,track} from 'lwc';
import caselist from '@salesforce/apex/CaseSearchController.caselist';
export default class SearchCaseComp extends LightningElement {
    
    @track error;
    @track cases;
    @track searchKey;

    handleKeyChange(event)
    {
        this.searchKey=event.target.value;
    };

    handleSearch(){
        caselist({casesearchkey:this.searchKey})
        .then((result)=>{
            this.cases=result;
            this.error=undefined;
        })
        .catch((error)=>{
            this.error=error;
            this.cases=undefined;

        });

};
}