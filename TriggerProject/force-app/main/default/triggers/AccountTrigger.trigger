trigger AccountTrigger on Account (after insert,after update) {
    List<Opportunity> opptys = new List<Opportunity>();
    
    for(Account acc : Trigger.new){
        
        if(acc.AnnualIncomeDate__c != null){
            
            if(acc.AnnualIncomeDate__c > Date.today() || acc.AnnualIncomeDate__c < Date.today()){
                Opportunity oppCase1 = new Opportunity(Name='Opportunity1',CloseDate=Date.today(),StageName='Prospecting',Relevance__c='Orange');
                opptys.add(oppCase1);
              
            }else if(acc.AnnualRevenue < 10000){
                Opportunity oppCase2 = new Opportunity(Name='Opportunity2',CloseDate=Date.today(),StageName='Prospecting',Relevance__c='Red');
                opptys.add(oppCase2);
                
            }else if(acc.AnnualRevenue >= 10000 && acc.AnnualRevenue < 30000){
                Opportunity oppCase3 = new Opportunity(Name='Opportunity3',CloseDate=Date.today(),StageName='Prospecting',Relevance__c='Yellow');
                opptys.add(oppCase3);
                
            }else{
                Opportunity oppCase4 = new Opportunity(Name='Opportunity4',CloseDate=Date.today(),StageName='Prospecting',Relevance__c='Green');
                opptys.add(oppCase4);
            }
           
        }
    }
    insert opptys;
    

}