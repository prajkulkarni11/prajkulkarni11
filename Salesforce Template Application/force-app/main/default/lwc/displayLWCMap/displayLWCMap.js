/**
 * @File Name          : DisplayLWCMap.js
 * @Description        : Collection Assignment 9-Create a LWC component to display current location on google map of account.

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 22/03/2022, 4:40:39 pm
 * @Modification Log   : 
 
**/

import { LightningElement , wire, track, api} from 'lwc';

import getOfficeLocations from '@salesforce/apex/DisplayMapController.getOfficeLocations';

export default class DisplayLWCMap extends LightningElement {

    @api accountNameParam; 
    accountNameParam = 'Text';
    @track error;   //this holds errors

    @track mapMarkers = [];
    @track markersTitle = 'Text';
    @track zoomLevel = 4;
    /* Load address information based on accountNameParam from Controller */
    @wire(getOfficeLocations, { accountNameInitial: '$accountNameParam'})
    wiredOfficeLocations({ error, data }) {
        if (data) {            
            data.forEach(dataItem => {
                this.mapMarkers = [...this.mapMarkers ,
                    {
                        location: {
                            City: dataItem.BillingCity,
                            Country: dataItem.BillingCountry,
                        },
        
                        icon: 'custom:custom26',
                        title: dataItem.Name,
                    }                                    
                ];
              });            
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

}