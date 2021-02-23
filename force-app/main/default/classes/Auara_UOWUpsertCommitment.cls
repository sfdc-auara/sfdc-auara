public with sharing class Auara_UOWUpsertCommitment implements fflib_SObjectUnitOfWork.IDoWork {

    public Database.UpsertResult[] results {
        get;
        private set;
    }

    private List<auara_DailyCommitment__c> mRecords;

    public Auara_UOWUpsertCommitment(){
        mRecords = new List<auara_DailyCommitment__c>();
    }

    public void registerCommitmentUpsert(auara_DailyCommitment__c record){
        mRecords.add(record);
    }

    public void doWork(){
        Schema.SObjectField keyField = auara_DailyCommitment__c.Fields.auara_id__c;
        results = Database.upsert(mRecords, keyField, false);
    }

}