global with sharing class Auara_AccountsSelector extends fflib_SObjectSelector implements Auara_AccountsSelectorI {

    public static Auara_AccountsSelectorI newInstance(){
        return (Auara_AccountsSelectorI) Auara_Application.SELECTOR.newInstance(event.SObjectType);
    }

    /**
      * Default constructor. Reads the fields from the getSObjectFieldList() method
      **/
    global Auara_AccountsSelector(){
        super(false);
    }

    /**
      * Constructor that allows a parameter to use FieldSets if True
      **/
    public Auara_AccountsSelector(Boolean includeFieldSetFields){
        super(includeFieldSetFields);
        this.setDefaultFieldSet(Auara_Application.DEFAULTFIELDSET);
    }

    /**
      * Constructor that allows a parameter to use the selected fieldsets
      **/
    public Auara_AccountsSelector(List <String> fieldSetList){
        super(true);
        this.setFieldSetList(fieldSetList);
    }

    /**
      * Returns a default list of fields if FieldSets functionality is not used (No Dependency Injection Pattern here!)
      **/
    public override List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField> {
                   Account.Id,
                   Account.Name
        };
    }

    public override Schema.SObjectType getSObjectType(){
        return Account.sObjectType;
    }

    global List<Account> selectById(Set<ID> idSet){
        return (List<Account>) selectSObjectsById(idSet);
    }

}
