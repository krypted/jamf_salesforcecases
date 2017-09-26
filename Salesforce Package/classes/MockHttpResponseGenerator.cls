/*********************************************************
*Class : MockHttpResponseGenerator
*Created Date : 07 September 2017
*Description : Mock response class For CaseMobileDeviceSync_Ctrl_Test
*Version : 1.0
**********************************************************/
@istest
Global class MockHttpResponseGenerator implements HttpCalloutMock{
   
	// Implement this interface method
    	global HTTPResponse respond(HTTPRequest req) {
    
    // Optionally, only send a mock response for a specific endpoint and method.
        //System.assertEquals('https://example.com/study/GA00806', req.getEndpoint());
    	//System.assertEquals('GET', req.getMethod());

    // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
            If(req.getEndpoint().Contains('mobiledevices')){
                res.setBody('{"mobiledevice":{"general": { "id": 2,"device_name": "test Device",  "ip_address": "71.234.42.43" ,"available": 0,"last_inventory_update": "12-10-2017", "wifi_mac_address": "1234","udid": "9ab4eff8ee0252770bb8d2b82287b45b53c6aee1","model": "iPad mini 4 (GSM)","model_identifier": "iPad5,2","real_name": "test sagar","building": "test2","asset_tag": "test","name": "test2","site": {}},"location": {},"warranty_expires": "2018-01-01","purchasing": {}}}');
         //res.setBody('{"study":{"moleculeDescription":"RONTALIZUMAB","protocolTitle":"IMM","protocolNumber":"GA00806","studyName":"Interferon alpha in SLE Phase II LCM Option","therapeuticArea":"INFLAMMATORY,AUTOIMMUNE&BONE","startDate":"2009-03-25","endDate":"2013-08-22"}}');
            res.setStatusCode(200);
            }
            
            else If(req.getEndpoint().Contains('computers')){
                 res.setBody('{"mobiledevice":{"general": { "id": 2,"device_name": "test Device", "ip_address": "71.234.42.43", "available": 0,"last_inventory_update": "12-10-2017", "wifi_mac_address": "1234","udid": "9ab4eff8ee0252770bb8d2b82287b45b53c6aee1","model": "iPad mini 4 (GSM)","model_identifier": "iPad5,2","real_name": "test sagar","building": "test2","asset_tag": "test", "name": "test2","site": {}},"location": {"building": "test2"},"warranty_expires": "2018-01-01","purchasing": {}}}');
         //res.setBody('{"study":{"moleculeDescription":"RONTALIZUMAB","protocolTitle":"IMM","protocolNumber":"GA00806","studyName":"Interferon alpha in SLE Phase II LCM Option","therapeuticArea":"INFLAMMATORY,AUTOIMMUNE&BONE","startDate":"2009-03-25","endDate":"2013-08-22"}}');
            res.setStatusCode(200);
            }
        return res;
    }

}