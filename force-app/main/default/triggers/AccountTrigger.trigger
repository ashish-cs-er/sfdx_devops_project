trigger AccountTrigger on Account (before insert, after insert) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        AccountTriggerHandler.beforeInsert(Trigger.new);
    }

    if(Trigger.isInsert && Trigger.isAfter){
        AccountTriggerHandler.afterInsert(Trigger.new);
    }
}