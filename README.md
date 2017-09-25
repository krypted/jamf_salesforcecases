# jamf_salesforcecases
Salesforce Cases Plug-in To Look Devices Up In Jamf Pro

The following are instructions for installing the integration package. The integration is delivered as a managed package.
 
# Install and Configure package
 
Please follow below steps to install and configure package:

1. Install Latest Package. If you already have installed version of the package the upgrade option will be available
2. For adding name credential for User  Go to My Setting -> Personal -> Authentication Setting for External System -> click on “New”
3. Select user as your user 
4. Choose Authentication Protocol as Password Authentication
5. Enter username and password for your Jamf Pro instance respectively
6. Go to case Layouts.

..*    a.     Add ’Sync Device' button on the page.

..*    b.   Add below fields on case page layout.
  
..     i Column :

..*    1.   JSS ID

..*    2.  UDID

..*    3.  Model

..*    4.  Model Identifier

..*    5.  Available Space

..*    6.  Last Inventory Update

..*    7.  Date/Time Opened

..*    8.  Product

..*    9.  Potential Liability

..*    10.  Subject

..*    11.  Description

..*    12.  Custom Links

 
..ii. Available Columns.
..*    1.Mobile Device Name

..*    2.Full Name

..*    3. Warranty Expiration

..*    4.Wi-Fi MAC Address

..*    4. IP Address     	

..*    5. Site

..*    6. Asset

..*    7. Building

..*    8. Date/Time Closed

..*    9. Engineering Req Number

..*    10. SLA Violation



# Package Contents (Dev Package)
Name
Parent Object
Type
Asset Tag
Case
Custom Field
Available Space
Case
Case
Building
Case
Custom Field
CaseMobileDeviceSync
 
| Name  | Parent Object | Type |
| ------------- | ------------- | ------------- |
| Asset Tag  | Case  | Custom Field  |
| Available Space  | Case  | Case  |
| Building  | Case  | Custom Field  |
| CaseMobileDeviceSync  |   | Apex Class  |
| CaseMobileDeviceSync_Ctrl|   | Apex Class  |
| Full Name | Case  | Custom Field  |
| IP Address | Case | Custom Field |
| Last Inventory Update | Case | Custom Field |
| Mobile Device Name | Case | Custom Field |
| Model | Case | Custom Field |
| Model Identifier | Case | Custom Field |
| Serial Number | Case | Custom Field |
| Site | Case | Custom Field |
| UDID | Case | Custom Field |
| Warranty Expiration | Case | Custom Field |
| WiFi MAC Address | Case | Custom Field |
| Sync Device | Case | Button or Link (to pull information from the Jamf Pro Instance) |


Updated: September 25, 2017
