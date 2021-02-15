public interface Auara_DailyCommitmentsSelectorI extends fflib_ISObjectSelector{
    List<auara_DailyCommitment__c> selectById(Set<ID> idSet);
    List<auara_DailyCommitment__c> selectByDate(Date selectedDate);
}
