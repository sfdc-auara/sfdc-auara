@isTest
public class Auara_TestEvents {

    @TestSetup static void loadData(){
        Set <Id> idAccounts = Auara_TestFactory.createAccounts(1);
        Set <Id> idEvents = Auara_TestFactory.createEventsWithAccounts(2,idAccounts);
    }
   @isTest static void contructorsTest(){
       List <Event> idEvents = [SELECT Id FROM Event];
       Test.startTest();
       Auara_Events domain = new Auara_Events(idEvents);
       System.assertNotEquals(domain, null);
       Auara_EventsI domainInterface = Auara_Events.newInstance(idEvents);
       System.assertNotEquals(domainInterface, null);
       fflib_SObjectDomain domainConstructor = new Auara_Events.Constructor().construct(idEvents);
       System.assertNotEquals(domainConstructor, null);
       Test.stopTest();
   }
}