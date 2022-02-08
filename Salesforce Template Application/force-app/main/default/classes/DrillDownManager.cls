/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-29-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DrillDownManager {
     /**
     * Create Drill down Table 
     */
    @AuraEnabled
    
    public Static String createDrillDown(string companyId , String componetName , String filter ){
        DrillDownResponce  parent = null;
    
        try {
            //Filter appledFilters =  (Filter)JSON.deserialize(filter, Filter.class);
             parent = new DrillDownResponce('Gross Pay' , '1000' , '200' );
            DrillDownResponce child1 = new DrillDownResponce('Basic' , '100' , '20' );
            DrillDownResponce child2 = new DrillDownResponce('Bonus' , '300' , '40' );
            
            parent.addChild(child1);
            parent.addChild(child2);
            
            DrillDownResponce bonus = new DrillDownResponce('yearly Bonus' , '1000' , '200');
            DrillDownResponce bonusChild1 = new DrillDownResponce('Quarterly Bonus' , '1000' , '200');
            DrillDownResponce bonusChild2 = new DrillDownResponce('HRA' , '400' , '100' );

            bonus.addChild(bonusChild1);
            bonus.addChild(bonusChild2);
            parent.addChild(bonus);
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    
        return JSON.serialize(parent);
    }
    
    /**
     * 
     */
    public class DrillDownResponce {
        public String title;
        public String previous;
        public String current;
        public String style;
        public DrillDownResponce(String title, String previous, String current){
            this.title = title;
            this.previous = previous;
            this.current = current ;
            this.style = 'pink';
        }
        List<DrillDownResponce> childrens = new List<DrillDownResponce>();

        /**
         * add Child 
         */
        public void addChild(DrillDownResponce child){ if( child != null ){ childrens.add( child);} }
    }
    /**
     * Class Filter 
     */
    public class Filter{
        public String timeFilter;
        public List<String> paygroupFilter;
        public String country;

    }
}
