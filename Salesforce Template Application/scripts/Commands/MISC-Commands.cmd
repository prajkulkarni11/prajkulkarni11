
REM List Packages on Hub ORG  

Echo "Package 1 List of Packages List "
sfdx force:package:list

Echo "Package 1 List of Packages Version "
sfdx force:package:version:list


sfdx force:package:install --package 04txx000000069zAAA
