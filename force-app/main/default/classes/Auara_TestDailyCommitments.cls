@isTest
public class Auara_TestDailyCommitments {

    @TestSetup static void loadData(){
        Set <Id> idDaily = Auara_TestFactory.createDailyCommitments(1);
    }
   @isTest static void contructorsTest(){
       List <auara_DailyCommitment__c> idDailyComms = [SELECT Id FROM auara_DailyCommitment__c];
       Test.startTest();
       Auara_DailyCommitments domain = new Auara_DailyCommitments(idDailyComms);
       System.assertNotEquals(domain, null);
       Auara_DailyCommitmentsI domainInterface = Auara_DailyCommitments.newInstance(idDailyComms);
       System.assertNotEquals(domainInterface, null);
       fflib_SObjectDomain domainConstructor = new Auara_DailyCommitments.Constructor().construct(idDailyComms);
       System.assertNotEquals(domainConstructor, null);
       Test.stopTest();
   }
}