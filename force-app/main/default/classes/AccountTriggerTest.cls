@isTest
public with sharing class AccountTriggerTest {
    public AccountTriggerTest() {

    }
    @isTest
    public static void accInsTest(){
        Account acc = new Account();
        acc.Name='My Test';
        Test.startTest();
        insert acc;
        Test.stopTest();

        //asserts
        Account acc = [Select Id, NumberofEmployees 
        from Account where id =: acc.id];
        System.assertEquals(1, acc.NumberOfEmployees);

        List<Contact> conList = [Select Id, Name
        from Contact where AccountId =:acc.Id];
        System.assert(conList.size()>0);
    }
}