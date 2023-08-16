public with sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {

    }
    public static void beforeInsert(List<Account> acctList){
        for(Account acc: acctList){
            System.debug('AccountTriggerHandler beforeInsert: '+acc);
            if(acc.NumberOfEmployees==null){
                acc.NumberOfEmployees = 1;
            }
            System.debug('AccountTriggerHandler beforeInsert: '+acc);
        }
    }
    public static void afterInsert(List<Account> acctList){
        List<Contact> conList = new List<Contact>();
        for(Account acc: acctList){
            if(acc.NumberOfEmployees!=null){
                for(Integer i=0; i<acc.NumberOfEmployees;i++){
                    System.debug('AccountTriggerHandler afterInsert: '+acc);
                    Contact con = new Contact();
                    con.AccountId = acc.Id;
                    con.FirstName = acc.Name+' Contact '+i; 
                    con.LastName = acc.Name+' Contact '+i; 
                    conList.add(con);
                }
            }
        }
        System.debug('AccountTriggerHandler afterInsert: '+acctList);
        if(conList.size()>0){
            insert conList;
        }
    }
}