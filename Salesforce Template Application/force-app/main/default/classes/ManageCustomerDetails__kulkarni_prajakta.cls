public class ManageCustomerDetails 
{
    Public String name,address,contact;
    public ManageCustomerDetails(String a, String b, String c)
    {
        this.name=a;
        this.address=b;
        this.contact=c;
    }
    public void displayDetailsOfCustomer()
    {       
        system.debug('Customer Details:');
        system.debug('Customer Name:-' + name);
        system.debug('Customer Address:-' + address);
        system.debug('Customer Contact:-' + contact);
         
    }
}
//ManageCustomerDetails m= new ManageCustomerDetails('Anuja','Wakad','1245789632');
//m.displayDetailsOfCustomer();