@isTest
public with sharing class CalClassTest {
    public CalClassTest() {

    }
    @isTest
    private static void addTest(){
        Test.startTest();
        System.assertEquals(7, CalClass.add());
        Test.stopTest();
    }

    @isTest
    private static void subTest(){
        Test.startTest();
        System.assertEquals(-1, CalClass.sub());
        Test.stopTest();
    }

}