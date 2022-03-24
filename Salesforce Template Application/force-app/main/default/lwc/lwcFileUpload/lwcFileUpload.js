/**
 * @File Name          : LightningFileUpload.js
 * @Description        : Lwc Assignment:-2 create a custom multiple file upload lightning component
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 23/03/2022, 8:40:39 pm
 * @Modification Log   : 
 
**/

import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class LightningFileUpload extends LightningElement {

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