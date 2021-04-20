@isTest
public class Auara_TestEventsSelector {
    private static final Integer NUMBER_OF_RECORDS = 4;
    @TestSetup static void loadData(){
        Set <Id> idAccounts = Auara_TestFactory.createAccounts(1);
        Auara_TestFactory.createEventsWithAccounts(NUMBER_OF_RECORDS, idAccounts);
    }

    @isTest static void selectByIdTest() {
        List <event> eventsList = [SELECT Id FROM event];
        System.assertEquals(eventsList.size(), NUMBER_OF_RECORDS);
        Set <Id> eventIds = Auara_TestFactory.convertSobjectToSetId(eventsList);
        Test.startTest();
        eventsList = Auara_EventsSelector.newInstance().selectById(eventIds);
        System.assertEquals(eventsList.size(), NUMBER_OF_RECORDS);
        eventsList = new Auara_EventsSelector(true).selectById(eventIds);
        System.assertEquals(eventsList.size(), NUMBER_OF_RECORDS);
        eventsList = new Auara_EventsSelector(new List <String>{'auara_Default'}).selectById(eventIds);
        System.assertEquals(eventsList.size(), NUMBER_OF_RECORDS);
        Test.stopTest();
    }
}