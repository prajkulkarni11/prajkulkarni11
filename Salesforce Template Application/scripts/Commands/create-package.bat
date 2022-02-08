@echo off 
REM
REM
REM
ECHO " Creating the Package Salesforce Template Application(STA) namespace : sftemplateapp "

sfdx force:package:create --name "STA" -d "Salesforce Template Application" --path force-app --packagetype Unlocked