@isTest
public with sharing class TriggerRelevance_Test {
    
    @isTest public static void isOrange(){
        Account acct1 = new Account(Name='Acct1', AnnualIncomeDate__c=Date.newInstance(2023, 12, 10), AnnualRevenue=25000);
        Test.startTest();
        insert acct1;
        Test.stopTest();
        Opportunity verifyOppty1 = [SELECT Name, Relevance__c  FROM Opportunity WHERE Relevance__c='Orange'];
        system.assertEquals('OpportunityOrange', verifyOppty1.Name);
    }

    @isTest public static void isRed(){
        Account acct2 = new Account(Name='Acct2', AnnualIncomeDate__c=Date.today(), AnnualRevenue=9000);
        Test.startTest();
        insert acct2;
        Test.stopTest();
        Opportunity verifyOppty2 = [SELECT Name, Relevance__c  FROM Opportunity WHERE Relevance__c='Red'];
        system.debug(verifyOppty2);
        system.assertEquals('OpportunityRed', verifyOppty2.Name);
    }

    @isTest public static void isYellow(){
        Account acct3 = new Account(Name='Acct3', AnnualIncomeDate__c=Date.today(), AnnualRevenue=15000);
        Test.startTest();
        insert acct3;
        Test.stopTest();
        Opportunity verifyOppty3 = [SELECT Name, Relevance__c  FROM Opportunity WHERE Relevance__c='Yellow'];
        system.assertEquals('OpportunityYellow', verifyOppty3.Name);
    }

    @isTest public static void isGreen(){
        Account acct4 = new Account(Name='Acct4', AnnualIncomeDate__c=Date.today(), AnnualRevenue=50000);
        Test.startTest();
        insert acct4;
        Test.stopTest();
        Opportunity verifyOppty4 = [SELECT Name, Relevance__c  FROM Opportunity WHERE Relevance__c='Green'];
        system.assertEquals('OpportunityGreen', verifyOppty4.Name);
    }
    
}