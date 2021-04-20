
@isTest
public class Auara_TestAccountsSelector {
    private static final Integer NUMBER_OF_RECORDS = 4;
    @TestSetup static void loadData(){
        Auara_TestFactory.createAccounts(NUMBER_OF_RECORDS);
    }

    @isTest static void selectByIdTest() {
        List <account> accountsList = [SELECT Id FROM account];
        System.assertEquals(accountsList.size(), NUMBER_OF_RECORDS);
        Set <Id> accountIds = Auara_TestFactory.convertSobjectToSetId(accountsList);
        Test.startTest();
        accountsList = Auara_AccountsSelector.newInstance().selectById(accountIds);
        System.assertEquals(accountsList.size(), NUMBER_OF_RECORDS);
        accountsList = new Auara_AccountsSelector(true).selectById(accountIds);
        System.assertEquals(accountsList.size(), NUMBER_OF_RECORDS);
        accountsList = new Auara_AccountsSelector(new List <String>{'auara_Default'}).selectById(accountIds);
        System.assertEquals(accountsList.size(), NUMBER_OF_RECORDS);
        Test.stopTest();
    }
}