/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 11-30-2021
 * @last modified by  : Yogesh.Bhosale
**/
import { subscribe, unsubscribe, onError } from "lightning/empApi";
import userId from "@salesforce/user/Id";
import locale from "@salesforce/i18n/locale";

 
//Base Componet 
import BaseComponent from "c/baseComponent";

export default class LogMonitor extends BaseComponent {

    constructor(){
        super();
    }
    label = {
        
        applicationName     : this.applicationName
    };
    subscription;
    isMuted = false;
    logs = {};

    logsAsTree = [];
    

    get logColumns(){
        let  columns = [
            {
                type: "number",
                fieldName: "index",
                label: "#",
                initialWidth: 10
            },
            {
                type: "text",
                fieldName: "context",
                label: "Context",
                initialWidth: 100
            },
            {
                type: "text",
                fieldName: "time",
                label: "Time",
                initialWidth: 100
            },
            {
                type: "text",
                fieldName: this.ns() + "LogLevel__c",
                label: "Log Level",
                initialWidth: 100
            },
            {
                type: "text",
                fieldName:this.ns() +  "ClassName__c",
                label: "Class",
                initialWidth: 150
            },
            {
                type: "text",
                fieldName: this.ns() +  "MethodName__c",
                label: "Method",
                initialWidth: 200
            },
            {
                type: "text",
                fieldName: this.ns() +  "LineNumber__c",
                label: "Line",
                initialWidth: 90
        
            },
            {
                type: "text",
                fieldName: this.ns() + "Message__c",
                label: "Message",
            },
        ];

        return columns;
    }
    /**
     * connected callback
     */
    connectedCallback() {
        this.subscribe();
    }

    /**
     * disconnected callback
     */
    disconnectedCallback() {
        this.unsubscribe();
    }

    /**
     * Clear All Logs 
     */
    clearAll() {
        this.logs = {};
        this.logsAsTree = [];
    }

    /**
     * Subscribe for 
     */
    async subscribe() {
        
        this.subscription = await subscribe("/event/LogMessageEvent__e", -1, (message) => this.receiveLog(message));
        onError(error => {
            this.showMessage(JSON.stringify(error) , "Error while Subscribe for Log " , true);
        });
    }

    /**
     * Unscribe 
     */
    unsubscribe() {
        unsubscribe(this.subscription, response => {});
    }

     /**
     * Receive Message 
     * @param {*} message 
     */
    receiveLog(message) {
        const log = message.data.payload;

        if(log[this.ns() +"UserId__c"] === userId) {
            const timeFormat = { hour: 'numeric', minute: 'numeric', second: 'numeric' };
            log.time = new Intl.DateTimeFormat(locale, timeFormat).format(new Date(log.CreatedDate));
      
            const context = log[this.ns()+"Context__c"] ;
            this.logs[context] = this.logs[context] || [];
            this.logs[context].push(log);

            this.renderTree();
        }
    
    }
    /**
     * Populate Tree grid with Log Content 
     */
    renderTree() {
        let index = 1;
        this.logsAsTree = [];

        for(const context in this.logs) {
            let log = this.logs[context][0];
            log.index = index;
            log.context = context.split("/")[1]; 

            if(this.logs[context].length > 1) {
                log._children = this.logs[context].slice(1);
            }

            this.logsAsTree.push(log);
            index++;
        }

        this.template
                .querySelector("lightning-tree-grid")
                .expandAll();
    }
  
    /**
     * Mute/unmute 
     * 
     */
    toggleMute() {
        this.isMuted = !this.isMuted;

        if(this.isMuted) {
            this.unsubscribe();
        }
        else {
            this.subscribe();
        }
    }

    /**
     * get mute Icon
     */
    get muteIcon() {
        return (this.isMuted) ? "utility:volume_off" : "utility:volume_high";
    }

    /**
     * Get Mute Label 
     */
    get muteLabel() {
        return (this.isMuted) ? "Unmute" : "Mute";
    }
}