/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-19-2021
 * @last modified by  : Yogesh.Bhosale
**/
import { LightningElement,api ,track} from 'lwc';
const TYPE_ERROR = "ERROR";
const TYPE_WARNING = "WARNING";
const TYPE_OFFLINE = "OFFLINE";
const TYPE_BASE = "BASE";

const CLASS_ERROR = "slds-alert_error";
const CLASS_WARNING = "slds-alert_warning";
const CLASS_OFFLINE = "slds-alert_offline";
const CLASS_BASE = "slds-notify_alert";

export default class ToastMessage extends LightningElement {

    @api message = " error message ";
    @api moreInformation ;
    @api type="Error";
    
    @track isDisplay = true;

    handleHide(event){
        this.isDisplay = false;
    }
    
    /**
     * manipulate icon name 
     */
    get iconName(){
        let localType = this.type ? this.type.toUpperCase() :TYPE_BASE;
        let icon = "utility:user";
        if( TYPE_ERROR  == localType){
            icon = "utility:error";
        }else if( TYPE_WARNING  == localType){
            icon = "utility:warning";
        }else if( TYPE_OFFLINE  == localType){
            icon = "utility:offline";
        }else if( TYPE_BASE  == localType){
            icon = "utility:user";
        }  
            return icon;
    }

    /**
     * manipulate class name /background
     */
    get className(){
        let localType = this.type ? this.type.toUpperCase() :TYPE_BASE;
        let className = CLASS_BASE;
        if( TYPE_ERROR  == localType){
            className = CLASS_ERROR;
        }else if( TYPE_WARNING  == localType){
            className = CLASS_WARNING;
        }else if( TYPE_OFFLINE  == localType){
            className = CLASS_OFFLINE;
        }else if( TYPE_BASE  == localType){
            className = CLASS_BASE;
        }  
            return className;
    }

}
    