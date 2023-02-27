trigger triggerRelevance on Opportunity (before insert, before update) {
    for(Opportunity opp : Trigger.new){
        if(opp.Amount != null){
            String relevance;
            if(opp.CloseDate > Date.today() || opp.CloseDate < Date.today()){
                relevance = 'Orange';
            }else if(opp.Amount < 10000){
                relevance = 'Red';
            }else if(opp.Amount >= 10000 && opp.Amount < 30000){
                relevance = 'Yellow';
            }else{
                relevance = 'Green';
            }
            opp.Relevance__c = relevance;
        }
    }
}