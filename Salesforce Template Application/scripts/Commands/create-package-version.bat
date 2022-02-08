@Echo off
ECHO "Creating Package with new Code"

 
sfdx force:package:version:create -p "STA" -d "force-app" --wait 10 -x 