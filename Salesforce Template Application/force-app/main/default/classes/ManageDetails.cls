/**
 * @File Name          : ManageDetails.cls
 * @Description        : Assignment 6: Define an Apex Class to manage the Customer Details and Assign the Values and Print the Values.
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
Public with sharing Class ManageDetails {
    
    public integer age;
    public string name;
    public string address;
    
   Public ManageDetails(integer a,string n, string ad)
    {
        this.age=a;
        this.name=n;
        this.address=ad;
    }
    
    public void displayCustomerDetails()
    {
        system.debug('Customer details:');
        system.debug('Name :'+this.name);
        system.debug('Age :'+this.age);
        system.debug('Address :'+this.address);
    }
    
}