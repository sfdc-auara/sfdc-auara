trigger Auara_OpportunityTrigger on Opportunity (
  after delete, after insert, after update, after undelete, before delete, before insert, before update){
    // Creates Domain class instance and calls appropriate methods
    fflib_SObjectDomain.triggerHandler(Auara_Opportunities.Constructor.class);

}