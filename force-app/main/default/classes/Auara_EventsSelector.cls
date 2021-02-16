global with sharing class Auara_EventsSelector extends fflib_SObjectSelector implements Auara_EventsSelectorI {

    public static Auara_EventsSelectorI newInstance(){
        return (Auara_EventsSelectorI) Auara_Application.SELECTOR.newInstance(event.SObjectType);
    }

    /**
      * Default constructor. Reads the fields from the getSObjectFieldList() method
      **/
    global Auara_EventsSelector(){
        super(false);
    }

    /**
      * Constructor that allows a parameter to use FieldSets if True
      **/
    public Auara_EventsSelector(Boolean includeFieldSetFields){
        super(includeFieldSetFields);
        this.setDefaultFieldSet(Auara_Application.DEFAULTFIELDSET);
    }

    /**
      * Constructor that allows a parameter to use the selected fieldsets
      **/
    public Auara_EventsSelector(List <String> fieldSetList){
        super(true);
        this.setFieldSetList(fieldSetList);
    }

    /**
      * Returns a default list of fields if FieldSets functionality is not used (No Dependency Injection Pattern here!)
      **/
    public override List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField> {
                   event.Id,
                   event.Subject
        };
    }

    public override Schema.SObjectType getSObjectType(){
        return event.sObjectType;
    }

    global List<event> selectById(Set<ID> idSet){
        return (List<event>) selectSObjectsById(idSet);
    }

}
