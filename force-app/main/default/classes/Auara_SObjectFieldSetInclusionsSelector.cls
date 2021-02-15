@namespaceAccessible
public inherited sharing class Auara_SObjectFieldSetInclusionsSelector extends fflib_SObjectSelector implements Auara_SObjectFieldSetInclusionsSelectorI { //NOSONAR
	@namespaceAccessible
	public static Auara_SObjectFieldSetInclusionsSelectorI newInstance() {
		return (Auara_SObjectFieldSetInclusionsSelectorI) Auara_Application.SELECTOR.newInstance(auara_SObjectFieldSetInclusion__mdt.SObjectType);
	}

        /**
         * Default constructor. Reads the fields from the getSObjectFieldList() method
         **/
	@namespaceAccessible
	public Auara_SObjectFieldSetInclusionsSelector() {
		super(false);
	}

        /**
         * Returns a default list of fields if FieldSets functionality is not used (No Dependency Injection Pattern here!)
         **/
	public override List<Schema.SObjectField> getSObjectFieldList() {
		return new List<Schema.SObjectField> {
			       auara_SObjectFieldSetInclusion__mdt.Id,
			       auara_SObjectFieldSetInclusion__mdt.DeveloperName,
			       auara_SObjectFieldSetInclusion__mdt.auara_FieldSetFQDNName__c,
			       auara_SObjectFieldSetInclusion__mdt.auara_SObjectName__c
		};
	}

	public override Schema.SObjectType getSObjectType() {
		return auara_SObjectFieldSetInclusion__mdt.sObjectType;
	}

	@namespaceAccessible
	public List<auara_SObjectFieldSetInclusion__mdt> selectByDeveloperName(Set<String> stringSet) {
		fflib_QueryFactory fieldSetIncQF = newQueryFactory();
		return (List<auara_SObjectFieldSetInclusion__mdt>) Database.query (
			fieldSetIncQF.setCondition('DeveloperName in :stringSet').toSOQL());

	}

	@namespaceAccessible
	public List<auara_SObjectFieldSetInclusion__mdt> selectBySObjectName(Set<String> stringSet) {
		fflib_QueryFactory fieldSetIncQF = newQueryFactory();
		return (List<auara_SObjectFieldSetInclusion__mdt>) Database.query (
			fieldSetIncQF.setCondition('auara_SObjectName__c in :stringSet').toSOQL());
	}
}