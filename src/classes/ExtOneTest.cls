@isTest
public with sharing class ExtOneTest {
    
	@isTest static void greeting1(){
		System.assertEquals('Gayathri',ExtOne.greeting('Gayathri'));
    }
    
    @isTest static void insertTest(){
        Account applicantNew = new Account(Name = 'Meghala2');
    
    	Test.startTest();
    	insert applicantNew;
    	Test.stopTest();
        
        Account newVar = [SELECT Name FROM Account WHERE Id =: applicantNew.id];
        System.assertEquals('Meghala', newVar.Name,'success');
    }
    
    
}