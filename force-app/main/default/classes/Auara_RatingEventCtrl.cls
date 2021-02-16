public inherited sharing class Auara_RatingEventCtrl {
    @AuraEnabled
    public static event getRating(Id recordId){
        event resultado;

        List<event> listEvents = new Auara_EventsSelector(true).SelectById(new Set<Id> {recordId});
        if(listEvents != null && !listEvents.isEmpty()) {
            resultado = listEvents[0];
        }
        return resultado;
    }

    @AuraEnabled
    public static event setRating(Id recordId, string rating){
        event resultado;

        List<event> listEvents = new Auara_EventsSelector(true).SelectById(new Set<Id> {recordId});
        List<event> listEventsUpdated = new Auara_Events(listEvents).rateEvents(rating);
        if(listEvents != null && !listEvents.isEmpty()) {
            resultado = listEvents[0];
        }
        return resultado;
    }
}
