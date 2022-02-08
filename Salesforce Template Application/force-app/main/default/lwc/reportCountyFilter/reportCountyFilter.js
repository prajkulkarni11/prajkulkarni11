/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-08-2022
 * @last modified by  : Yogesh.Bhosale
**/
import { api, LightningElement, track } from 'lwc';

export default class ReportCountyFilter extends LightningElement {
    @track isExpanded;
    @track isAllSelected;


    @api title = "Sample";
    @api countries = [ {id :"001" , name:"India" ,isSelected:false} ,{ id :"002" , name:"China",isSelected:true  }];

    value = ["India"]; 

    onExpand(){
        this.isExpanded = true;
    }
    onCollapse(){
        this.isExpanded = false;
    }
    /**
     * 
     */
    onAllCountries(event){
        let isRegionChecked = event.target.checked;
        if(isRegionChecked){
            this.value = [];
            let i =0;
             for(i=0; i<this.countries.length; i++) {
                let country = this.countries[i];
                this.value.push(country.name);
        }

        }else {
           this.value = [];
        }
    }
    /**
     * 
     */
    get countyOptions() {
         return this.createCounriesOption();
    } 
 
    createCounriesOption(){
        let options = []; 
        let i = 0;
        for(i=0; i<this.countries.length; i++) {
                let country = this.countries[i];
                options.push({label: country.name, value: country.name });
        }
        
        return options;
    }

}