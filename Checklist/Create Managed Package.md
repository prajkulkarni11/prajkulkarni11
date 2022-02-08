## Create managed Package 

Create Package and Deploy application is the task normally executed once Sprint is done and now QA or Production Team needs to get the package 

## Generate Unlocked Package 
* <b> Step 1 : </b> Connect With Github and get the Source Code of the branch.  
* <b> Step 2 : </b> Autorise Dev Hub ORg in case not authorised allrady.  
* <b> Step 3 : </b> Create Scratch ORG in case Scratch org is expired. 
* <b> Step 4 : </b> Push the code to Scratch ORG this will confirm Source code is deployable State  
* <b> Step 5 : </b> In Case Package not Created Execute Create Package Command 
  <pre> sfdx force:package:create --name "STA" -d "Salesforce Template Application" --path force-app --packagetype Unlocked
    - <b> STA </b> Name of the Package 
    - <b> Salesforce Template Application </b> The Package description 
    - <b> Unlocked </b> type of Package You can use managed to create managed package  
  </pre>   
* <b> Step 6 : </b> Above Steps will create the Package now We needs to push the content of the code in thepackage by creating Version. You can check if package is created by executing the Command 
  <pre> <code> sfdx force:package:version:list </code>  </pre>   
* <b> Step 7 : </b> Above Steps will create the Package now We needs to push the content of the code in thepackage by creating Version. You can check if package is created by executing the Command 
  <pre> <code> sfdx force:package:version:create -p "STA" -d "force-app" --wait 10 -x  </code> 
    * <b> STA </b> Name of the Package 
    * <b> force-app </b> The Package folder which code will be picked up for package creation 
  
  </pre>   

## Install Package on Another ORG 

## Upgrade ORG With New Package Version

## Generate Managed Package 


## Refrence 
* Youtube Video on Create Unlocked Packages https://www.youtube.com/watch?v=oY-dHAVJm34
* Salesforce Documentation on create package https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_force_package.htm#cli_reference_force_package_version_create_list
* 
