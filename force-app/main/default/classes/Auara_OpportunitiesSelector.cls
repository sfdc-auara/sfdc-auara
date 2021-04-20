global with sharing class Auara_OpportunitiesSelector extends fflib_SObjectSelector implements Auara_OpportunitiesSelectorI {

    public static Auara_OpportunitiesSelectorI newInstance(){
        return (Auara_OpportunitiesSelectorI) Auara_Application.SELECTOR.newInstance(opportunity.SObjectType);
    }

    /**
      * Default constructor. Reads the fields from the getSObjectFieldList() method
      **/
    global Auara_OpportunitiesSelector(){
        super(false);
    }

    /**
      * Constructor that allows a parameter to use FieldSets if True
      **/
    public Auara_OpportunitiesSelector(Boolean includeFieldSetFields){
        super(includeFieldSetFields);
        this.setDefaultFieldSet(Auara_Application.DEFAULTFIELDSET);
    }

    /**
      * Constructor that allows a parameter to use the selected fieldsets
      **/
    public Auara_OpportunitiesSelector(List <String> fieldSetList){
        super(true);
        this.setFieldSetList(fieldSetList);
    }

    /**
      * Returns a default list of fields if FieldSets functionality is not used (No Dependency Injection Pattern here!)
      **/
    public override List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField> {
                   Opportunity.Id,
                   Opportunity.Name
        };
    }

    public override Schema.SObjectType getSObjectType(){
        return Opportunity.sObjectType;
    }

    global List<Opportunity> selectById(Set<ID> idSet){
        return (List<Opportunity>) selectSObjectsById(idSet);
    }

}
