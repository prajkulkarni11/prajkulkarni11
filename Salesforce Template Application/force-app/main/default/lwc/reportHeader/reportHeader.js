/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-10-2022
 * @last modified by  : Yogesh.Bhosale
**/
import { api, LightningElement, track } from 'lwc';

export default class ReportHeader extends LightningElement {

    @api isDetails ;

    months = [ "Jan" ,"Feb" ,"March" ,"April" ,"May" ,"May" ,"Jun" ,"Jully" ];

    @track currentMonth = 0;
    @track  isCustom = false;
    onNextMonth(event){
        this.currentMonth++;
    }
    onPreviousMonth(event) {
        this.currentMonth--;
    }
    onCustom(event){
        this.isCustom = true;
    }

    onMonthly(){
        this.isCustom = false;
    }
    onQuarterly(){
        this.isCustom = false;
    }
    onYearly(){
        this.isCustom = false;
    }

    onBackHandle() {
        this.dispatchEvent(new CustomEvent('back'));
    }

    get month(){
        return this.months[this.currentMonth];
    }
}