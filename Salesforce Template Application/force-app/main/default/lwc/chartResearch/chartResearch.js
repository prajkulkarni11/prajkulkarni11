/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-27-2022
 * @last modified by  : Yogesh.Bhosale
**/
import { LightningElement } from 'lwc';

export default class ChartResearch extends LightningElement {

    dataSet = '["India", "Germany", "Pune",  "USA"]';

    datasets = [
		{ label: "Last Gross Pay", detail: [ 10, 30, 46, 2, 18, 50, 0 ], backgroundcolor:"rgb(167,211,167)"  , stack:"2" ,bordercolor: "rgba(119, 185, 242, 1)" },
		{ label: "Last ER", detail: [ 15, 25, 49, 24, 5, 15, 20 ], backgroundcolor:"rgb(211,167,191)",  stack:"2" ,bordercolor: "rgba(225, 96, 50, 1)" },
        { label: "Current Gross Pay", detail: [ 10, 30, 46, 2, 18, 50, 0 ],backgroundcolor:"rgb(123,189,153)", stack:"1", bordercolor: "rgba(119, 185, 242, 1)" },
		{ label: "Current ER", detail: [ 15, 25, 49, 24, 5, 15, 20 ],backgroundcolor:"rgb(189,123,159)",  stack:"1",bordercolor: "rgba(225, 96, 50, 1)" }
	];

    handleDrillDown(event){
        let label = event.detail.label ; 
        let dataset = event.detail.dataset ;
        console.log("Drilling down with --> "+label + " and in Dataset : "+dataset );
    }
}