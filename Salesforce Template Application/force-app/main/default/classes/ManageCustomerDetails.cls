/**

 * @File Name          : ManageCustomerDetails.cls
 * @Description        : Apex Assignment 06:Define an Apex Class to manage the Customer Details and Assign the Values and Print the Values.  
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 5:40:39 pm
* @Modification Log   : 

 **/

Public with sharing Class ManageCustomerDetails {

    public integer age;

    public string name;

    public string address;

   Public ManageCustomerDetails(integer a,string n, string ad)

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