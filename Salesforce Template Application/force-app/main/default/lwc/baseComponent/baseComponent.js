/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-06-2022
 * @last modified by  : Yogesh.Bhosale
**/
import { LightningElement, track } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

//Lables
import applicationName from '@salesforce/label/c.ApplicationName';
import applicationNamespace from '@salesforce/label/c.ApplicationNamespace';


export default class BaseComponent extends LightningElement {
    
    @track componentName = 'BaseComponent';
    @track applicationNamespace;
    @track applicationName;
    sfdcBaseURL;
    
    constructor(){
        super();
        this.applicationNamespace = applicationNamespace ;
        this.applicationName = applicationName ;
    }
     
    /**
     * 
     * @returns Namespace shortform 
     */
    ns(){
        return this.applicationNamespace != null ? this.applicationNamespace+"__" :"";
    }
    /**
     * Log message with console.log 
     * @param {*} who name of the component by default it will take base Component but it should be
     *              configued with the <code> componetName </code> 
     * @param {*} what 
     */
    logMessage( what,who) {
        if( who == null || who == undefined )
            who = this.componentName;
            
        console.log( "[ " + who + " ] : "+ what);
    }

    /**
     * Show Error and Success Message as toast message
     * @param {*} message Message to be displayed 
     * @param {*} title title of the toast message 
     * @param {*} isError true if show sucessfull message 
     */
        showMessage( message , title , isError) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message ,
                variant: isError ? 'error' : 'success'
            })
        );

    }
    
    /**
     * populate base URL
     */
    renderedCallback() {
        this.sfdcBaseURL = window.location.origin;
    }

}