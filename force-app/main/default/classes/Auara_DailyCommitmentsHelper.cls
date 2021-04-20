public with sharing class Auara_DailyCommitmentsHelper {
    public List<auara_DailyCommitment__c> upsertCommitment(List<auara_DailyCommitment__c> records){
        Set<auara_DailyCommitment__c> setOfCommitments = new Set<auara_DailyCommitment__c>();
        fflib_ISObjectUnitOfWork uow = Auara_Application.UNITOFWORK.newInstance();
        Auara_UOWUpsertCommitment upsertWork = new Auara_UOWUpsertCommitment();

        for(auara_DailyCommitment__c myCommitment : Records) {
            uow.registerWork(upsertWork);
            upsertWork.registerCommitmentUpsert(myCommitment);
            setOfCommitments.add(myCommitment);
        }

        uow.commitWork();
        return new List<auara_DailyCommitment__c>(setOfCommitments);
    }
}
