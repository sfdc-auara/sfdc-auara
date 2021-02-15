global interface Auara_SObjectFieldSetInclusionsSelectorI extends fflib_ISObjectSelector{
    List<auara_SObjectFieldSetInclusion__mdt> selectByDeveloperName(Set<String> stringSet);
    List<auara_SObjectFieldSetInclusion__mdt> selectBySObjectName(Set<String> stringSet);
}