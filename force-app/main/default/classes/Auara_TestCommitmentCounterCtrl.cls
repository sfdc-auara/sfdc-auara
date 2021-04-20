@isTest
public class Auara_TestCommitmentCounterCtrl {

    @TestSetup static void loadData(){
        Set <Id> idDaily = Auara_TestFactory.createDailyCommitments(1);
    }
   @isTest static void testCommitmentCounter(){
    List <auara_DailyCommitment__c> idDailyComms = [SELECT Id, auara_CommitmentDate__c FROM auara_DailyCommitment__c];
       Test.startTest();
       auara_DailyCommitment__c myDailyComm1 = Auara_CommitmentCounterCtrl.setDailyCommitment(idDailyComms[0]);
       System.assertEquals(myDailyComm1.Id, idDailyComms[0].Id);
       auara_DailyCommitment__c myDailyComm2 = Auara_CommitmentCounterCtrl.getDailyCommitment(System.now());
       System.assertEquals(myDailyComm2.Id, idDailyComms[0].Id);
       Test.stopTest();
   }
}