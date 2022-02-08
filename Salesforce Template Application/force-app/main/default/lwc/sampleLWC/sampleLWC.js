/**
 * @description       : 
 *  Sample LWC Component 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 11-24-2021
 * @last modified by  : Yogesh.Bhosale
**/
import { api, LightningElement, track } from 'lwc';
import BaseComponent from 'c/baseComponent';


export default class SampleLWC extends BaseComponent {

    @api subHeading ="subheading";
    @track isLoading;

   // Expose the labels to use in the template.
   label = {
       title : "title", //From Custom Label
       primaryAction : "Primary Action", // Hard codded in component
       secondaryActon : "Secondary Action",
       loading : "Load"
       
   };

   /**
    * Constructor
    */
   constructor(){
       super();
   }
   /**
    * Event handling for Load Button
    * 
    */
   onHandleLoad(event) {
       this.isLoading = !this.isLoading; 
   }
}