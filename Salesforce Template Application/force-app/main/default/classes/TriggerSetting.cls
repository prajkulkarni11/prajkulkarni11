/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-11-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class TriggerSetting {

    /**
     * 
     */
    public static Boolean isTriggerActive( String triggerClassName ){
        Boolean isTriggerActive = true;
        TriggerSettings__mdt setting = TriggerSettings__mdt.getInstance(triggerClassName); 
        
            if( setting != null ){
                isTriggerActive = setting.isActive__c;
            }
            
        return isTriggerActive;
    }

}
