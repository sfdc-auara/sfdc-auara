@isTest
public class Auara_TestRatingEventCtrl {

    @TestSetup static void loadData(){
        Set <Id> idAccounts = Auara_TestFactory.createAccounts(1);
        Set <Id> idEvents = Auara_TestFactory.createEventsWithAccounts(2,idAccounts);
    }
   @isTest static void testRatingEvent(){
       List <Event> idEvents = [SELECT Id FROM Event];
       Test.startTest();
       event myEvent1 = Auara_RatingEventCtrl.setRating(idEvents[0].Id, '2');
       System.assertEquals(myEvent1.auara_InteresComplicidad__c, '2');
       event myEvent2 = Auara_RatingEventCtrl.getRating(idEvents[0].Id);
       System.assertEquals(myEvent2.auara_InteresComplicidad__c, '2');
       Test.stopTest();
   }
}