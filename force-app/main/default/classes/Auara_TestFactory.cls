public with sharing class Auara_TestFactory {
    @testVisible private static Set <Id> createAccounts(Integer numberOfRecords){
        fflib_ISObjectUnitOfWork uow = auara_Application.UNITOFWORK.newInstance();
        Set <Id> idSet = new Set <Id>();
        List <account> accountsToInsert = new List <account>();

        for(Integer i = 0; i < numberOfRecords; i++) {
            account acc = new account();
            acc.Name = 'Sample' + i;
            acc.auara_VolumenPotencial__c = Integer.valueof((Math.random() * 100));
            acc.auara_Status__c = 'active';
            acc.BillingCity = 'Macondo';
            acc.BillingPostalCode = '12345';
            acc.BillingCountry = 'Narnia';
            acc.BillingStreet = 'Calle Melancolia, 7';
            acc.BillingState = 'Narnia';
            uow.registerNew(acc);
            accountsToInsert.add(acc);
        }

        uow.commitWork();

        for(Integer i = 0; i < accountsToInsert.size(); i++) {
            idSet.add(accountsToInsert[i].Id);
        }

        return idSet;
    }

    @testVisible private static Set <Id> createOppsWithAccounts(Integer numberOfRecords, Set <Id> accountIds){
        fflib_ISObjectUnitOfWork uow = auara_Application.UNITOFWORK.newInstance();
        Set <Id> idSet = new Set <Id>();
        List <Id> accountsIdList = new List <Id>(accountIds);
        List <opportunity> oppsToInsert = new List <opportunity>();

        for(Integer i = 0; i < numberOfRecords; i++) {
            for(Integer j = 0; j < accountsIdList.size(); j++) {
                opportunity opp = new opportunity();
                opp.Name = 'Sample' + j + '-' + i;
                opp.StageName = 'Calificación';
                opp.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Especial').getRecordTypeId();
                opp.CloseDate = system.today() + 7;
                opp.AccountId = accountsIdList[j];
                oppsToInsert.add(opp);
                uow.registerNew(opp);
            }
        }

        uow.commitWork();

        for(Integer i = 0; i < oppsToInsert.size(); i++) {
            idSet.add(oppsToInsert[i].Id);
        }

        return idSet;
    }

    @testVisible private static Set <Id> createEventsWithAccounts(Integer numberOfRecords, Set <Id> accountIds){
        fflib_ISObjectUnitOfWork uow = auara_Application.UNITOFWORK.newInstance();
        Set <Id> idSet = new Set <Id>();
        List <Id> accountsIdList = new List <Id>(accountIds);
        List <event> eventsToInsert = new List <event>();

        for(Integer i = 0; i < numberOfRecords; i++) {
            for(Integer j = 0; j < accountsIdList.size(); j++) {
                event evt = new event();
                evt.WhatId = accountsIdList[j];
                evt.Subject = 'Sample Event ' + i + j;
                evt.DurationInMinutes = 60;
                evt.ActivityDateTime = System.now();

                eventsToInsert.add(evt);
                uow.registerNew(evt);
            }
        }

        uow.commitWork();

        for(Integer i = 0; i < eventsToInsert.size(); i++) {
            idSet.add(eventsToInsert[i].Id);
        }

        return idSet;
    }

    @testVisible private static Set <Id> createDailyCommitments(Integer numberOfRecords){
        fflib_ISObjectUnitOfWork uow = auara_Application.UNITOFWORK.newInstance();
        Set <Id> idSet = new Set <Id>();
        List <auara_DailyCommitment__c> dailyCommToInsert = new List <auara_DailyCommitment__c>();

        for(Integer i = 0; i < numberOfRecords; i++) {
            auara_DailyCommitment__c dailyComm = new auara_DailyCommitment__c();
            dailyComm.auara_CommitmentForVisits__c = Integer.valueof((Math.random() * 10));
            dailyComm.auara_CommitmentForBeefs__c = Integer.valueof((Math.random() * 10));
            dailyComm.auara_CommitmentForMeetings__c = Integer.valueof((Math.random() * 10));
            dailyComm.auara_CommitmentDate__c = system.today();
            uow.registerNew(dailyComm);
            dailyCommToInsert.add(dailyComm);
        }

        uow.commitWork();

        for(Integer i = 0; i < dailyCommToInsert.size(); i++) {
            idSet.add(dailyCommToInsert[i].Id);
        }

        return idSet;
    }

    @testVisible private static Set <Id> convertSobjectToSetId(List <SObject> sObjectList){
        Set <Id> idSet = new Set <Id>();

        for(Integer i = 0; i < sObjectList.size(); i++) {
            idSet.add((Id)sObjectList[i].get('Id'));
        }

        return idSet;
    }

}
