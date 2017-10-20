# Share Point Staturday 2017
## SharePoint PnP PowerShell and what it can do for my SharePoint Environment

**Check what is installed**

Get-Command -Module *PnP*

**SharePoint PowerShell PnP**

**Make sure you have the correct version ofSharePoint PowerShell PnP installed**

SharePoint Online
* Install-Module SharePointPnPPowerShellOnline
* Uninstall-Module SharePointPnPPowerShellOnline

SharePoint 2016
* Install-Module SharePointPnPPowerShell2016
* Uninstall-Module SharePointPnPPowerShell2016

SharePoint 2013
* Install-Module SharePointPnPPowerShell2013
* Uninstall-Module SharePointPnPPowerShell2013


**FIRST - Connect to SharePoint Site**

Connect-PnPOnline –Url https://kieferconsultinginc.sharepoint.com/sites/SharePointSaturday2017/

**Second - Create a list**

New-PnPList -Title "First Demo List" -Url "DemoList" -Template Announcements

**Third - Set the List Properties**

Set-PnPList -Identity "First Demo List" -EnableVersioning $true -MajorVersions 20

**Fourth - Add list item**

Add-PnPListItem -List "First Demo List" -ContentType "Item" -Values @{"Title" = "Test Title 1"; "Body" = "Here is content for the body"}

**Fifth - Add Navigation to Quick Launch**

Add-PnPNavigationNode -Title "First Demo List" -Url "https://kieferconsultinginc.sharepoint.com/sites/nicktest/sitetemplatetest/DemoList/" -Location "QuickLaunch"

**Last - Add a View**

Add-PnPView -List "Demo List" -Title "First Demo List Items" -Fields "Title","Body"

**Other Section**

**Set Credentials**
$MyCredential = Get-Credential

.\addlist.ps1 -Credentials $MyCredential

**Connect with credentials**

Connect-PnPOnline –Url https://kieferconsultinginc.sharepoint.com/sites/SharePointSaturday2017/ -Credentials $MyCredential

Add-PnPField -List "Demo list" -DisplayName "Item Location" -InternalName "SPSLocation" -Type Choice -Group "Demo Group" -AddToDefaultView -Choices "Stockholm","Helsinki","Oslo"

Remove-PnPView -List "Demo List" -Identity "Demo List Items"

Add-PnPView -List "Demo List" -Title "Demo List Items" -Fields "Title","Body","Location"