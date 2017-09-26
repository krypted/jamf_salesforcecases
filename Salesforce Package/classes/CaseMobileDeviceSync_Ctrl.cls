/*********************************************************
Initial Creation
**********************************************************/

public with sharing class CaseMobileDeviceSync_Ctrl {
    public Case objCase{get;set;}

    public CaseMobileDeviceSync_Ctrl(ApexPages.StandardController controller) {
        objCase = (Case)controller.getRecord();
    }
    
    public pagereference syncDate(){
        try{

            if(objCase.Serial_Number__c==null || objCase.Serial_Number__c==''){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Please update Serial Number and try again'));
                return null;
            }

            HttpRequest req = new HttpRequest();
            req.setEndpoint('callout:Krypted/JSSResource/mobiledevices/serialnumber/'+objCase.Serial_Number__c);
            req.setMethod('GET');
            req.setHeader('Accept', 'application/json');
            Http http = new Http();
            HTTPResponse res = http.send(req);
            System.debug(res.getBody());
    
            /*Map<String,String> mapFields = new Map<String,String>();
            for(KryptedMobileSyncFields__c objField:[select id,Name,Field_Api__c from KryptedMobileSyncFields__c]){
                mapFields.put(objField.Name.toLowerCase(),objField.Field_Api__c);
            }*/
            
            if(res.getStatusCode()==200){
                // Parse JSON response to get all the mobile device field values.
                JSONParser parser = JSON.createParser(res.getBody());
                parser.nextToken();
                parser.nextToken();
                parser.nextToken();
                parser.nextToken();
                parser.nextToken();
                while (parser.nextToken() != null) {
                    system.debug('parser.getText()' + parser.getText());
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='id'){// && 
                        parser.nextToken();
                        objCase.JSS_ID__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='device_name'){// && 
                            parser.nextToken();
                            objCase.Mobile_Device_Name__c = parser.getText();                        
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='asset_tag'){// && 
                        parser.nextToken();
                        objCase.Asset_Tag__c = parser.getText();                        
                    }
                     if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='last_inventory_update'){// && 
                        parser.nextToken();
                        objCase.Last_Inventory_Update__c = parser.getText();                        
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='available'){// && 
                        parser.nextToken();
                        objCase.Available_Space__c = parser.getText();                        
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='udid'){// && 
                        parser.nextToken();
                        objCase.Udid__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='ip_address'){// && 
                        parser.nextToken();
                        objCase.IP_Address__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='wifi_mac_address'){// && 
                        parser.nextToken();
                        objCase.Wi_Fi_MAC_Address__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='model'){// && 
                        parser.nextToken();
                        objCase.Model__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='model_identifier'){// && 
                        parser.nextToken();
                        objCase.Model_Identifier__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='name'){// && 
                        parser.nextToken();
                        objCase.Site__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='real_name'){// && 
                        parser.nextToken();
                        objCase.Full_Name__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='building'){// && 
                        parser.nextToken();
                        objCase.Building__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='warranty_expires'){// && 
                        parser.nextToken();
                        objCase.Warranty_Expiration__c = parser.getText();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='location'){// && 
                        parser.nextToken();
                        parser.nextToken();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='purchasing'){// && 
                        parser.nextToken();
                        parser.nextToken();
                    }
                    if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='site'){// && 
                        parser.nextToken();
                        parser.nextToken();                           
                    }
                    //Skip internal data
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT){
                        parser.skipChildren();                       
                    }
                }
                update objCase;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Sync is done successfully'));
                return null;
            }
            else {
                req = new HttpRequest();
                req.setEndpoint('callout:Krypted/JSSResource/computers/serialnumber/'+objCase.Serial_Number__c);
                req.setMethod('GET');
                req.setHeader('Accept', 'application/json');
                http = new Http();
                res = http.send(req);
                System.debug(res.getBody());

                if(res.getStatusCode()==200){
                    // Parse JSON response to get all the mobile device field values.
                    JSONParser parser = JSON.createParser(res.getBody());
                    parser.nextToken();
                    parser.nextToken();
                    parser.nextToken();
                    parser.nextToken();
                    parser.nextToken();
 					while (parser.nextToken() != null) {
                        system.debug('parser.getText()' + parser.getText());
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='id'){// && 
                            parser.nextToken();
                            objCase.JSS_ID__c = parser.getText();
                        }                        
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='ip_address'){// && 
                            parser.nextToken();
                            objCase.IP_Address__c = parser.getText();
                        } 
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='udid'){// && 
                            parser.nextToken();
                            objCase.Udid__c = parser.getText();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='asset_tag'){// && 
                            parser.nextToken();
                            objCase.Asset_Tag__c = parser.getText();                        
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='report_date'){// && 
                        parser.nextToken();
                        objCase.Last_Inventory_Update__c = parser.getText();                        
                    }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='name'){// && 
                            parser.nextToken();
                            objCase.Site__c = parser.getText();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='model'){// && 
                            parser.nextToken();
                            objCase.Model__c = parser.getText();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='model_identifier'){// && 
                            parser.nextToken();
                            objCase.Model_Identifier__c = parser.getText();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='real_name'){// && 
                            parser.nextToken();
                            objCase.Full_Name__c = parser.getText();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='building'){// && 
                            parser.nextToken();
                            objCase.Building__c = parser.getText();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='warranty_expires'){// && 
                            parser.nextToken();
                            objCase.Warranty_Expiration__c = parser.getText();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='hardware'){// && 
                            parser.nextToken();
                            parser.nextToken();
                        }
						if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='purchasing'){// && 
                            parser.nextToken();
                            parser.nextToken();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='location'){// && 
                            parser.nextToken();
                            parser.nextToken();
                        }
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText()=='site'){// && 
                            parser.nextToken();
                            parser.nextToken();                           
                        }
                        //Skip internal data
                        if (parser.getCurrentToken() == JSONToken.START_OBJECT){
                            parser.skipChildren();                           
                        }
                    }
                    update objCase;
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Sync is done successfully'));
                    return null;
                }
            }
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Mobile/Computer not found'));
            
        }
        catch(Exception e){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, e.getMessage()));
        }
        return null;
    }

}