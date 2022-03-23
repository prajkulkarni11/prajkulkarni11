/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\lwc\Assignment_lwc_2\Assignment_lwc_2.js
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Wednesday, March 23rd 2022, 9:48:46 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

import { LightningElement,api } from 'lwc';

export default class Assignment_lwc_2 extends LightningElement {
    @api
    myRecordId;

    get acceptedFormats() {
        return ['.pdf', '.png'];
    }

    handleUploadFinished(event) {
        // Get the list of uploaded files
        const uploadedFiles = event.detail.files;
        alert('No. of files uploaded : ' + uploadedFiles.length);
    }
}