global with sharing class Auara_DailyCommitmentsSelector extends fflib_SObjectSelector implements Auara_DailyCommitmentsSelectorI {

    public static Auara_DailyCommitmentsSelectorI newInstance(){
        return (Auara_DailyCommitmentsSelectorI) Auara_Application.SELECTOR.newInstance(auara_DailyCommitment__c.SObjectType);
    }

    /**
      * Default constructor. Reads the fields from the getSObjectFieldList() method
      **/
    global Auara_DailyCommitmentsSelector(){
        super(false);
    }

    /**
      * Constructor that allows a parameter to use FieldSets if True
      **/
    public Auara_DailyCommitmentsSelector(Boolean includeFieldSetFields){
        super(includeFieldSetFields);
        this.setDefaultFieldSet(Auara_Application.DEFAULTFIELDSET);
    }

    /**
      * Constructor that allows a parameter to use the selected fieldsets
      **/
    public Auara_DailyCommitmentsSelector(List <String> fieldSetList){
        super(true);
        this.setFieldSetList(fieldSetList);
    }

    /**
      * Returns a default list of fields if FieldSets functionality is not used (No Dependency Injection Pattern here!)
      **/
    public override List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField> {
                   auara_DailyCommitment__c.Id,
                   auara_DailyCommitment__c.Name
        };
    }

    public override Schema.SObjectType getSObjectType(){
        return auara_DailyCommitment__c.sObjectType;
    }

    global List<auara_DailyCommitment__c> selectById(Set<ID> idSet){
        return (List<auara_DailyCommitment__c>) selectSObjectsById(idSet);
    }

    global List<auara_DailyCommitment__c> selectByDate(Date selectedDate){
        fflib_QueryFactory commitmentsQF = newQueryFactory();
        return (List<auara_DailyCommitment__c>) Database.query(
      commitmentsQF.setCondition('auara_CommitmentDate__c = :selectedDate').toSOQL());

    }

}
