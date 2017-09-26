/*********************************************************
*Class : CaseMobileDeviceSync_Ctrl_Test
*Created Date : 07 September 2017
*Description : Test class to cover CaseMobileDeviceSync_Ctrl
*Version : 1.0
**********************************************************/
@istest
public class CaseMobileDeviceSync_Ctrl_Test {
	
    public static testmethod Void ExecuteCaseMobileDeviceSyncCtrl(){
        
        //insert new case
         case objcase = new Case(Serial_Number__c = '12345', Status = 'New', Origin = 'Phone');
         
        //ApexPages.StandardController sc = new ApexPages.StandardController(objcase);
        CaseMobileDeviceSync_Ctrl objCaseMobileDeviceSyncCtrl = new CaseMobileDeviceSync_Ctrl(new ApexPages.StandardController(objcase));
        //Test.setMock(HttpCalloutMock.class, new MockHttpResonseGeneratorOne());
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        objCaseMobileDeviceSyncCtrl.syncDate();
        //Update objcase;
         
    }
    
    public static testmethod Void ExecuteCaseMobileDeviceSyncCtrlone(){
        
        //insert new case
        case objcase = new Case(Serial_Number__c = '12345', Status = 'New', Origin = 'Phone');
         
        //ApexPages.StandardController sc = new ApexPages.StandardController(objcase);
        CaseMobileDeviceSync_Ctrl objCaseMobileDeviceSyncCtrl = new CaseMobileDeviceSync_Ctrl(new ApexPages.StandardController(objcase));
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorOne());
        objCaseMobileDeviceSyncCtrl.syncDate();
        //update objcase;
         
    }
    
    public static testmethod Void ExecuteCaseMobileDeviceSyncCtrlTwo(){
        
        //insert new case
        case objcase = new Case(Serial_Number__c = '', Status = 'New', Origin = 'Phone');
        
        //ApexPages.StandardController sc = new ApexPages.StandardController(objcase);
        CaseMobileDeviceSync_Ctrl objCaseMobileDeviceSyncCtrl = new CaseMobileDeviceSync_Ctrl(new ApexPages.StandardController(objcase));
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorOne());
        objCaseMobileDeviceSyncCtrl.syncDate();
        //update objcase;
         
    }
        
}