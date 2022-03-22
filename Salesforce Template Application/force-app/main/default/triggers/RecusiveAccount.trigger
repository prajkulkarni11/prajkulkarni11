trigger RecusiveAccount on Account (After insert) {
    If(RecursionHandler.Firstrec== true)
    {
    Account Ac = new Account();
    ac.Name='Recursion Demo';
    insert ac;
       RecursionHandler.Firstrec = false; 
    }
}