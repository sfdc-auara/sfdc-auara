@isTest
public class Auara_TestOpportunitiesSelector {
    private static final Integer NUMBER_OF_RECORDS = 4;
    @TestSetup static void loadData(){
        Set <Id> idAccounts = Auara_TestFactory.createAccounts(1);
        Auara_TestFactory.createOppsWithAccounts(NUMBER_OF_RECORDS, idAccounts);
    }

    @isTest static void selectByIdTest() {
        List <Opportunity> oppsList = [SELECT Id FROM Opportunity];
        System.assertEquals(oppsList.size(), NUMBER_OF_RECORDS);
        Set <Id> oppIds = Auara_TestFactory.convertSobjectToSetId(oppsList);
        Test.startTest();
        oppsList = Auara_OpportunitiesSelector.newInstance().selectById(oppIds);
        System.assertEquals(oppsList.size(), NUMBER_OF_RECORDS);
        oppsList = new Auara_OpportunitiesSelector(true).selectById(oppIds);
        System.assertEquals(oppsList.size(), NUMBER_OF_RECORDS);
        oppsList = new Auara_OpportunitiesSelector(new List <String>{'auara_Default'}).selectById(oppIds);
        System.assertEquals(oppsList.size(), NUMBER_OF_RECORDS);
        Test.stopTest();
    }
}