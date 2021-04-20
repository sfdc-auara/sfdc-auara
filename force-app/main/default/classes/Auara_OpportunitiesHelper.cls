public with sharing class Auara_OpportunitiesHelper {
  public void applyDefaults(List <opportunity> records){

    // Get the List of Accounts  associated to the Opportunitys to process
    set<id> setLookup = new set<id>();
    for(opportunity myOpp : records) {
        if(myOpp.AccountId != null) {
            setLookup.add(myOpp.AccountId);
        }
    }

    // Get the Record details for each of the Account records by using the selector
    List <Account> accounts = new Auara_AccountsSelector(true).selectById(setlookup);

    // Construct a map with Id and record object of the Accounts, for reference later
    Map <Id, Account> mapAccounts = new Map<id, Account>();
    for(Account myAccount : accounts) {
        mapAccounts.put(myAccount.Id, myAccount);
    }

    // update each Opportunity with its corresponding Account record values using the map
    for(opportunity myOpp : records) {
        if(mapAccounts.containsKey(myOpp.AccountId)) {
            myOpp.auara_BillingCity__c = mapAccounts.get(myOpp.AccountId).BillingCity;
            myOpp.auara_BillingCountry__c = mapAccounts.get(myOpp.AccountId).BillingCountry;
            myOpp.auara_BillingStateProvince__c = mapAccounts.get(myOpp.AccountId).BillingState;
            myOpp.auara_BillingStreet__c = mapAccounts.get(myOpp.AccountId).BillingStreet;
            myOpp.auara_BillingZipPostalCode__c = mapAccounts.get(myOpp.AccountId).BillingPostalCode;
        }
    }
}
}
