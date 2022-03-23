
/**
 * @File Name          : CustomEventLiecense.js
 * @Description        : Collection Assignment 7) Create lightning component to achieve below requirement (License Application)

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 22/03/2022, 7:40:39 pm
 * @Modification Log   : 
 
**/


import { LightningElement ,track, wire, api} from 'lwc';
import createCaseNew from '@salesforce/apex/CreateCase.createCaseNew';
import CASE_OBJECT from '@salesforce/schema/Case';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';


export default class CustomEventLiecense extends LightningElement {

    caseObject=CASE_OBJECT;
    caseSubject=SUBJECT_FIELD;
    caseOrigin=ORIGIN_FIELD;
    @track nametype;
    @track lastname;
    @track fullname;
   
   
    
    handleSubmit(event){
        
        this.nametype=event.target.value;
        this.lastname=event.target.value;
        this.fullname=this.nametype + this.lastname;

        getOppList({fname:this.searchKey})
    .then()
    .catch((error))
        
    }

    handleSuccess(event){
        console.log('id of record is'+event.detail.id);
        
        const showToastEventMassage = new ShowToastEvent({
        title:'Success!',
        message:'New case Record is created! Please check ASAP.'+event.detail.id,
        variant:'success'
        });
        this.dispatchEvent(showToastEventMassage);
       
        }


        @api recordId;
    get acceptedFormats() {
        return ['.png', '.PNG', '.jpg', '.JPG','.docx','.pdf'];
    }

    handleUploadFinished(event) {
        const uploadedFiles = event.detail.files;
        this.showNotification(uploadedFiles.length + ' files are Uploaded Successfully', 'success');
    }

    showNotification(message, variant) {
        const evt = new ShowToastEvent({
            'message': message,
            'variant': variant
        });
        this.dispatchEvent(evt);
    }

}