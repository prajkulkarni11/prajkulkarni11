/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-28-2022
 * @last modified by  : Yogesh.Bhosale
**/
import { LightningElement ,track} from 'lwc';

export default class DrillDown extends LightningElement {
 @track isExpanded;
    @track data ={ title :"Employer Contribution" , style:"pink container" , current:"12345" ,previous:"12345.98232", currencyCode:"USD",fractionDigits :"2" ,
                    children: [ {Id:1 ,title:"Social Security ", previous:123, current:898098.97 },
                                {Id:2 ,title:"Voliantry Progream"  , previous:123, current:898098.97 }
                
                    ]
                };

    handleExpandCollapse(){ this.isExpanded =!this.isExpanded;}
    
}