trigger TriggerAccount on Account (after insert,after update) {
    List<Opportunity> opptys = new List<Opportunity>();
    
    for(Account acc : Trigger.new){
        
        if(acc.AnnualIncomeDate__c != null){
            
            if(acc.AnnualIncomeDate__c > Date.today()){
                Opportunity oppCase1 = new Opportunity();
                	oppCase1.AccountId=acc.id;
                    oppCase1.Name='OpportunityOrange';
                    oppCase1.CloseDate=Date.today();
                    oppCase1.StageName='Prospecting';
                    oppCase1.Relevance__c='Orange';
                	opptys.add(oppCase1);
              
            }else if(acc.AnnualRevenue < 10000){
                Opportunity oppCase2 = new Opportunity();
                	oppCase2.AccountId=acc.id;
                    oppCase2.Name='OpportunityRed';
                    oppCase2.CloseDate=Date.today();
                    oppCase2.StageName='Prospecting';
                    oppCase2.Relevance__c='Red';
                	opptys.add(oppCase2);
                
            }else if(acc.AnnualRevenue >= 10000 && acc.AnnualRevenue < 30000){
                Opportunity oppCase3 = new Opportunity();
                	oppCase3.AccountId=acc.id;
                    oppCase3.Name='OpportunityYellow';
                    oppCase3.CloseDate=Date.today();
                    oppCase3.StageName='Prospecting';
                    oppCase3.Relevance__c='Yellow';
                	opptys.add(oppCase3);
                
            }else{
                Opportunity oppCase4 = new Opportunity();
                	oppCase4.AccountId=acc.id;
                    oppCase4.Name='OpportunityGreen';
                    oppCase4.CloseDate=Date.today();
                    oppCase4.StageName='Prospecting';
                    oppCase4.Relevance__c='Green';
                    opptys.add(oppCase4);
            }
           
        }
    }
    
    insert opptys;
    

}