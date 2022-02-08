/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-27-2022
 * @last modified by  : Yogesh.Bhosale
**/
import { api, LightningElement } from 'lwc';

export default class DrillDownChart extends LightningElement {

    _chart;
    @api title;
    @api chartType;
    @api lables;
    @api chartDataSets;

    /**
     * 
     * @returns To dtore Chart properties 
     */
    renderedCallback() {
		if ( this._init )
			return;
		this._chart = this.template.querySelector( 'c-chart' );
	}

    /**
     * handle Event click on Chart used to Drill down 
     * @param {*} evt 
     */
    handleCallbackClick = ( evt ) => {
		const elementsAtEvent = this._chart.getElementAtEventChart( evt );
		if ( elementsAtEvent.length > 0 ) {
			const datasetIndex = elementsAtEvent[ 0 ]._datasetIndex;
			const labelIndex = elementsAtEvent[ 0 ]._index;
            let localLables = JSON.parse(this.lables);

            console.log( 'Label  : '+localLables[labelIndex] );
            console.log( 'DataSet Name : '+this.chartDataSets[datasetIndex].label );
            //Send Event 
            this.sendEvent("drilldown" , {  label : localLables[labelIndex] , 
                                            dataset : this.chartDataSets[datasetIndex].label} );
		} else {

			console.log( 'Not clicked on a chart detail point');
		}
	}
    /**
     * Handle Display values on the axis 
     * @param {*} value 
     * @returns 
     */
    handleTicksCallback(value) {
        let displayNumber = Number(value).toLocaleString(); 
        if(value > 10000 && value/10000 > 100  ){
            displayNumber = value/10000 +" K";
        }else if(value > 10000000 && value/10000000 > 100){
            displayNumber = value/10000 +" M";
        }else if(value > 10000000000 && value/10000000000 > 100){
            displayNumber = value/10000000000 +" B";
        }
        return displayNumber;
      }
   
     /**
     * Common function to Send Event to Parent 
     * @param {*} eventName name of Event 
     * @param {*} eventDetails Details Event
     */
      sendEvent(eventName ,eventDetails){
        if( eventDetails == null)
            eventDetails = {};
        eventDetails.currentPeriod = this.currentSelectedPeriod;
        eventDetails.currentDate = this.currentMonth;
        
        const newEvent = new CustomEvent( eventName , {detail:eventDetails});

        this.dispatchEvent(newEvent);
    }
}