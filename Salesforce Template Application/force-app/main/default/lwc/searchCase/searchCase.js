/*
 * Filename: e:\LWC ass Pooja mam\DemoProject\force-app\main\default\lwc\searchCase\searchCase.js
 * Path: e:\LWC ass Pooja mam\DemoProject
 * Created Date: Wednesday, March 16th 2022, 12:19:41 pm
 * Author: snehal@vyomlabs.com
 * 
 * Copyright (c) 2022 Your Company
 */

import { LightningElement, track } from 'lwc';
import getcase from '@salesforce/apex/GetCaseHandler.getcaselist';
export default class SearchCase extends LightningElement {
    @track case_rec;
    @track error;
    @track searchKey = '';
    handleSearchKey(event) {
        this.searchKey = event.target.value;
    };
    handleSearch() {
        getcase({ caseSearchkey: this.searchKey })
            .then(
                result => {
                    this.case_rec = result;
                    console.log(result);
                }
            )
            .catch(
                (error) => {
                    this.error = error;
                }
            );
    }
}