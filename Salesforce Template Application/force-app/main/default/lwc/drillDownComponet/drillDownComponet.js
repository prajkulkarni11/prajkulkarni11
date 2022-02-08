import { LightningElement, track } from 'lwc';
import getDetails from '@salesforce/apex/DrillDownManager.createDrillDown';

export default class DrillDownComponet extends LightningElement {
    @track isExpanded;

    /**
     * 
     */
    handleExpandCollapse(){ this.isExpanded =!this.isExpanded;}
    
 
    @track drillDownDetails;

    connectedCallback(){
        getDetails({ companyId :"test" , componetName:"gross"  }
            
        ).then(result => {
            if( result != null ){
            
                this.drillDownDetails = JSON.parse(result);
                this.logMessage("Got Result ");
            }
                    
        }).catch(error => {
            this.logMessage("Got error "+error);
        });
    }
    /**
     * 
     * @param {*} what 
     */
    logMessage(what){
        console.log("[DrillDownComponet] :" + what);
    }
}