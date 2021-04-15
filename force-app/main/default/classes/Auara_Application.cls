/**
  * This implements the different factories for the different domains
  **/

public with sharing class Auara_Application {
    // Configure and create the UnitOfWorkFactory
    public static final fflib_Application.UnitOfWorkFactory UNITOFWORK =
        new fflib_Application.UnitOfWorkFactory(
        new List<SObjectType> {
        account.SObjectType,
        auara_DailyCommitment__c.SObjectType,
        event.SObjectType
});

    // Configure and create the ServiceFactory for this Application
    public static final fflib_Application.ServiceFactory SERVICE =
        new fflib_Application.ServiceFactory(
        new Map<Type, Type> {
});

    // Configure and create the SelectorFactory for this Application
    public static final fflib_Application.SelectorFactory SELECTOR =
        new fflib_Application.SelectorFactory(
        new Map<SObjectType, Type> {
        account.SObjectType => Auara_AccountsSelector.class,
        auara_DailyCommitment__c.SObjectType => Auara_DailyCommitmentsSelector.class,
        event.SObjectType => Auara_EventsSelector.class
});

    // Configure and create the DomainFactory for this Application
    public static final fflib_Application.DomainFactory DOMAIN =
        new fflib_Application.DomainFactory(
        Auara_Application.SELECTOR,
        new Map<SObjectType, Type> {
        account.SObjectType => Auara_Accounts.constructr.class,
        auara_DailyCommitment__c.SObjectType => Auara_DailyCommitments.constructor.class,
        event.SObjectType => Auara_Events.constructr.class

});

    public static final String DEFAULTFIELDSET = 'auara_Default';
}