/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-10-2022
 * @last modified by  : Yogesh.Bhosale
**/
import { LightningElement, track, wire } from 'lwc';
 
import getAllRegions from '@salesforce/apex/ReportHelper.getRegionsAvailable';
import grossPayDetail from './grossPayDetails.html';
import defaultTemplate from './reportContainer.html';

export default class ReportContainer extends LightningElement {
    @track regions;
    @track displayMode = 0;

    @track grossPay = {
                currency : "USD",
                total : " 77,000",
                label :"Gross Pay",
                labels :'["January", "February", "March", "April", "May", "June", "July"]',
                detail : "[1000, 3000, 4600, 5000, 8000, 5000, 9000]",
                isTendUp:true,
            };

    @track employerContribution = {
                total : "$ 77,000",
                label :"Employer Contribution",
                labels :'["January", "February", "March", "April", "May", "June", "July"]',
                detail : "[1000, 3000, 4600, 5000, 8000, 5000, 9000]",
                isTendUp:true,
            };

    /**
     * 
     */
    onGrossPayDetail(event){
        event.preventDefault();
       this. displayMode = 1 ;
    }
    onBack(event){
        
       this. displayMode = 0 ;
    }       
    /**
     * Get All the Regions
     */        
    connectedCallback(){
            getAllRegions({  }
            ).then(result => {
                    this.regions = JSON.parse(result);
                    if( this.regions){
                        this.asiaPac= this.regions[0].countries;
                    }
            }).catch(error => {
                
            }); 
    }

    /**
     * Display Selected Value
     * @returns 
     */
    render() {
        let template = defaultTemplate;
        if(this.displayMode === 1 ){
            template = grossPayDetail;
        } else if(this.displayMode === 2 ){
            template = templateParty ;
        }
        return template;
    }
}