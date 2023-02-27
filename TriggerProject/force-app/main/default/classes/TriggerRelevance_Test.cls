@isTest
public with sharing class TriggerRelevance_Test {

    @isTest public static void isOrange(){
        Opportunity oppty1 = new Opportunity (Name='Opportunity1', Amount=9000, CloseDate=Date.newInstance(2023, 02, 10), StageName='Prospecting');
        Test.startTest();
        insert oppty1;
        Test.stopTest();
        Opportunity verifyOppty = [SELECT Relevance__c  FROM Opportunity WHERE Name='Opportunity1'];
        system.assertEquals('Orange', verifyOppty.Relevance__c);
    }

    @isTest public static void isGreen(){
        Opportunity oppty2 = new Opportunity (Name='Opportunity2', Amount=50000, CloseDate=Date.newInstance(2023, 02, 26), StageName='Prospecting');
        Test.startTest();
        insert oppty2;
        Test.stopTest();
        Opportunity verifyOppty = [SELECT Relevance__c FROM Opportunity WHERE Name='Opportunity2'];
        system.assertEquals('Green', verifyOppty.Relevance__c);
    }

    @isTest public static void isYellow(){
        Opportunity oppty3 = new Opportunity (Name='Opportunity3', Amount=20000, CloseDate=Date.newInstance(2023, 02, 26), StageName='Prospecting');
        Test.startTest();
        insert oppty3;
        Test.stopTest();
        Opportunity verifyOppty = [SELECT Relevance__c FROM Opportunity WHERE Name='Opportunity3'];
        system.assertEquals('Yellow', verifyOppty.Relevance__c);
    }

    @isTest public static void isRed(){
        Opportunity oppty4 = new Opportunity (Name='Opportunity4', Amount=9000, CloseDate=Date.newInstance(2023, 02, 26), StageName='Prospecting');
        Test.startTest();
        insert oppty4;
        Test.stopTest();
        Opportunity verifyOppty = [SELECT Relevance__c FROM Opportunity WHERE Name='Opportunity4'];
        system.assertEquals('Red', verifyOppty.Relevance__c);
    }

    /*@isTest public static void TriggerRelevance_Test() {
        List<Opportunity> opptys = new List<Opportunity>();
        //Crear 4 Oportunidades y rellenar el arreglo con las nuevas oportunidades.
        Opportunity oppty1 = new Opportunity (Name='Opportunity1', Amount=9000, CloseDate=Date.newInstance(2023, 02, 26), StageName='Prospecting');
        Opportunity oppty2 = new Opportunity (Name='Opportunity2', Amount=20000, CloseDate=Date.newInstance(2023, 2, 26), StageName='Prospecting');
        Opportunity oppty3 = new Opportunity (Name='Opportunity3', Amount=50000, CloseDate=Date.newInstance(2023, 2, 26), StageName='Prospecting');
        Opportunity oppty4 = new Opportunity (Name='Opportunity4', Amount=9000, CloseDate=Date.newInstance(2023, 02, 10), StageName='Prospecting');

        //Perform test
        Test.startTest();
        insert opptys;
        Test.stopTest();

        List<Opportunity> verifyOpptys = [SELECT Id, Amount, CloseDate, Relevance__c  FROM Opportunity WHERE CreatedDate=TODAY]; 
        for (Opportunity opps : verifyOpptys) {
            if (opps.CloseDate<Date.newInstance(2023, 02, 26)){
                system.assertEquals('Orange', opps.Relevance__c);
            }else{
                if (opps.Amount>30000){
                    system.assertEquals('Green', opps.Relevance__c);
                }else{
                    if (opps.Amount>10000){
                        system.assertEquals('Yellow', opps.Relevance__c);
                    }else{
                        system.assertEquals( 'Red', opps.Relevance__c);
                    }
                }   
            }
        }
    }*/
}