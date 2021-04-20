@isTest
public class Auara_TestAccounts {

    @TestSetup static void loadData(){
        Auara_TestFactory.createAccounts(1);
    }
   @isTest static void contructorsTest(){
       List <account> accountsList = [SELECT Id FROM account];
       Test.startTest();
       Auara_Accounts domain = new Auara_Accounts(accountsList);
       System.assertNotEquals(domain, null);
       Auara_AccountsI domainInterface = Auara_Accounts.newInstance(accountsList);
       System.assertNotEquals(domainInterface, null);
       fflib_SObjectDomain domainConstructor = new Auara_Accounts.Constructor().construct(accountsList);
       System.assertNotEquals(domainConstructor, null);
       Test.stopTest();
   }
}
