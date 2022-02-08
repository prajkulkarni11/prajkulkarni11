@echo off
ECHO "Importing the Base data"

set SALESFORCEORG = %1

IF "%~1" == "" GOTO ENDIMPORT

ECHO Importing the data in %1

    sfdx force:data:tree:import  -u %1 -p .\data\sales-cloud-Account-Contact-plan.json
    goto endtrain
    
     :ENDIMPORT

  ECHO Can't Import as ORG not specified 

  goto end
     
  :end
   ECHO Finishing import. 