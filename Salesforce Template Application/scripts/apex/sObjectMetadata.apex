//Get the All Objects 
String namespace ;
String objectName = 'LogMessageEvent__e';

String sObjectName = (namespace!= null ? namespace + '__' : '' ) +  objectName;

Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
//Object Name here is non Case Sensitive
Schema.SObjectType sobjectType = schemaMap.get(sObjectName);

if( sobjectType != null ){
    LogUtility.logMessage( 'SObject Found : '+sobjectType);
     Schema.DescribeSObjectResult objectDescription  = sobjectType.getDescribe();

} else {
    LogUtility.logMessage( 'sobject Type '+objectName +' does not Exist  ');
}
