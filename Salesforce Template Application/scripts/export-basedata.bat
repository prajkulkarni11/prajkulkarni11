@echo off
ECHO "Exporting the Base data"

ECHO Exporting the data in %1

REM Account and Contact Data 
sfdx force:data:tree:export -q "SELECT (SELECT FirstName , lastname FROM Contacts), Name, Industry FROM Account where name != 'Sample Account for Entitlements' " -u %1  -d data -p -x sales-cloud