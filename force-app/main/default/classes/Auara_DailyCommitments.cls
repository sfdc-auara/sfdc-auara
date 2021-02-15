/**
 * This is a basic selector for Daily Commitments
 **/

public with sharing class Auara_DailyCommitments extends fflib_SObjectDomain implements Auara_DailyCommitmentsI {

    Auara_DailyCommitmentsHelper helper = new Auara_DailyCommitmentsHelper();
public static Auara_DailyCommitmentsI newInstance(List<auara_DailyCommitment__c> sObjectList) {
    return (Auara_DailyCommitmentsI) Auara_Application.DOMAIN.newInstance(sObjectList);
}

public Auara_DailyCommitments(List<auara_DailyCommitment__c> sObjectList) {
    super(sObjectList);
}

public List<auara_DailyCommitment__c> upsertCommitment () {
    Set<auara_DailyCommitment__c> setOfCommitments = new Set<auara_DailyCommitment__c>();
    fflib_ISObjectUnitOfWork uow = Auara_Application.UNITOFWORK.newInstance();
    Auara_UOWUpsertCommitment upsertWork = new Auara_UOWUpsertCommitment();

    for(auara_DailyCommitment__c myCommitment : (List<auara_DailyCommitment__c>) Records) {
        uow.registerWork(upsertWork);
        upsertWork.registerCommitmentUpsert(myCommitment);
        setOfCommitments.add(myCommitment);
    }

    uow.commitWork();
    return new List<auara_DailyCommitment__c>(setOfCommitments);
}
    /* DOMAIN MODEL PATTERN - Triggers
     * The Constructor inner class allows the base class method SObjectDomain.triggerHandler used in Apex triggers
     * to create a new instance of the domain class passing in the sObject list (for example, Trigger.new).
     * This is a workaround to the present lack of full reflection in Apex.
     */
public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
        return new Auara_DailyCommitments(sObjectList);
    }
}

    /* DOMAIN MODEL PATTERN - Defaulting Logic
     * This function provides a place for field defaulting logic, the base class exposes the onApplyDefaults method.
     * This method is called by trigger handlers (handleBeforeInsert, etc.) base class method during a trigger invocation.
     * Placing logic here ensures that defaulting occurs consistently across the application when records are added.
     * You can also call it explicitly, if needed, from a service that helps present default record values to a user
     * accessing a custom UI via a Visualforce page or Lightning component, for example.

    public override void onApplyDefaults() {
    }
    */

    /* DOMAIN MODEL PATTERN - Validation Logic
     * Although you can override any of the trigger methods to implement validation logic, it’s platform best practice to do this
     * only in the after phase of the Apex trigger invocation. By overriding one of the two onValidate methods,
     * you can implement this logic in a clearly defined place.

     * public override void onValidate() {}
     */

    /* DOMAIN MODEL PATTERN - Validation Logic
     * The above validate method is called from the base class when records are inserted on the object.
     * If you require validation logic that is sensitive to data changing during record updates, you can override the following variant.

     * public override void onValidate(Map<Id,SObject> existingRecords) {}
     */
}
