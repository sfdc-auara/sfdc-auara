@isTest
public class Auara_TestDailyCommitmentsSelector {
    private static final Integer NUMBER_OF_RECORDS = 4;
    @TestSetup static void loadData(){
        Auara_TestFactory.createDailyCommitments(NUMBER_OF_RECORDS);
    }

    @isTest static void selectByIdTest() {
        List <auara_DailyCommitment__c> dailyCommList = [SELECT Id FROM auara_DailyCommitment__c];
        System.assertEquals(dailyCommList.size(), NUMBER_OF_RECORDS);
        Set <Id> dailyCommIds = Auara_TestFactory.convertSobjectToSetId(dailyCommList);
        Test.startTest();
        dailyCommList = Auara_DailyCommitmentsSelector.newInstance().selectById(dailyCommIds);
        System.assertEquals(dailyCommList.size(), NUMBER_OF_RECORDS);
        dailyCommList = new Auara_DailyCommitmentsSelector(true).selectById(dailyCommIds);
        System.assertEquals(dailyCommList.size(), NUMBER_OF_RECORDS);
        dailyCommList = new Auara_DailyCommitmentsSelector(new List <String>{'auara_Default'}).selectById(dailyCommIds);
        System.assertEquals(dailyCommList.size(), NUMBER_OF_RECORDS);
        dailyCommList = new Auara_DailyCommitmentsSelector(true).selectByDate(system.today());
        System.assertEquals(dailyCommList.size(), NUMBER_OF_RECORDS);
        Test.stopTest();
    }
}