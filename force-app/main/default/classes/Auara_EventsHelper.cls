public with sharing class Auara_EventsHelper {
    public void applyDefaults(List <Event> records){

        // Get the List of Accounts  associated to the Events to process
        set<id> setLookup = new set<id>();
        for(Event myEvent : records) {
            if(myEvent.WhatId != null) {
                setLookup.add(myEvent.WhatId);
            }
        }

        // Get the Record details for each of the Account records by using the selector
        List <Account> accounts = new Auara_AccountsSelector(true).selectById(setlookup);

        // Construct a map with Id and record object of the Accounts, for reference later
        Map <Id, Account> mapAccounts = new Map<id, Account>();
        for(Account myAccount : accounts) {
            mapAccounts.put(myAccount.Id, myAccount);
        }

        // update each Event with its corresponding Account record values using the map
        for(event myEvent : records) {
            if(mapAccounts.containsKey(myEvent.WhatId)) {
                myEvent.auara_EstadoCuenta__c = mapAccounts.get(myEvent.WhatId).auara_Status__c;
            }
        }
    }
}