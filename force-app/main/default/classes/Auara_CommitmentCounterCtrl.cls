public inherited sharing class Auara_CommitmentCounterCtrl {
    @AuraEnabled
    public static auara_DailyCommitment__c getDailyCommitment(Datetime selectedDate){
        auara_DailyCommitment__c resultado;
        List<auara_DailyCommitment__c> listCommitment = new Auara_DailyCommitmentsSelector(true).SelectByDate(selectedDate.date());
        if(listCommitment != null && !listCommitment.isEmpty()) {
            resultado = listCommitment[0];
        }
        return resultado;
    }

    @AuraEnabled
    public static auara_DailyCommitment__c setDailyCommitment(auara_DailyCommitment__c myCommitment){
        auara_DailyCommitment__c resultado;
        Date dateValue = date.newinstance(myCommitment.auara_CommitmentDate__c.year(), myCommitment.auara_CommitmentDate__c.month(), myCommitment.auara_CommitmentDate__c.day());
        myCommitment.auara_RecordKey__c = dateValue + UserInfo.getUserId();
        List<auara_DailyCommitment__c> listCommitment = new Auara_DailyCommitments(new List<auara_DailyCommitment__c> {myCommitment}).upsertCommitment();
        if(listCommitment != null && !listCommitment.isEmpty()) {
            resultado = listCommitment[0];
        }
        return resultado;
    }
}
