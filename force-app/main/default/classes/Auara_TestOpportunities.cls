@isTest
public class Auara_TestOpportunities {

    @TestSetup static void loadData(){
        Set <Id> idAccounts = Auara_TestFactory.createAccounts(1);
        Set <Id> idOpportunities = Auara_TestFactory.createOppsWithAccounts(2,idAccounts);
    }
   @isTest static void contructorsTest(){
       List <opportunity> idOpportunities = [SELECT Id FROM Opportunity];
       Test.startTest();
       Auara_Opportunities domain = new Auara_Opportunities(idOpportunities);
       System.assertNotEquals(domain, null);
       Auara_OpportunitiesI domainInterface = Auara_Opportunities.newInstance(idOpportunities);
       System.assertNotEquals(domainInterface, null);
       fflib_SObjectDomain domainConstructor = new Auara_Opportunities.Constructor().construct(idOpportunities);
       System.assertNotEquals(domainConstructor, null);
       Test.stopTest();
   }
}
