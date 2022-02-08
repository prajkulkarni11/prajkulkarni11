import { api, LightningElement } from 'lwc';
const fileList  = {
    noRecordFound :"no-record-found",
    noRecordFoundParty :"no-record-found-party",
}
import templateOne from './noRecordFound.html';
import templateParty from './nothingTodoParty.html';
import defaultTemplate  from './norecordsComponent.html';

export default class NorecordsComponent extends LightningElement {

    @api fileName;
    @api heading;
    @api subHeading;

    render() {
        let template = defaultTemplate;
        if(this.fileName === fileList.noRecordFound ){
            template = templateOne;
        } else if(this.fileName === fileList.noRecordFound ){
            template = templateParty ;
        }
        return template;
    }
}