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

Connect-PnPOnline –Url https://kieferconsultinginc.sharepoint.com/sites/SharePointSaturday20172

**Second - Create a list**

New-PnPList -Title "First Demo List" -Url "FirstDemoList" -Template Announcements

**Third - Add Navigation to Quick Launch**

Add-PnPNavigationNode -Title "First Demo List" -Url "https://kieferconsultinginc.sharepoint.com/sites/SharePointSaturday20172/FirstDemoList/" -Location "QuickLaunch"

**Fourth - Set the List Properties**

Set-PnPList -Identity "First Demo List" -EnableVersioning $true -MajorVersions 20

**Fifth - Add list item**

Add-PnPListItem -List "First Demo List" -ContentType "Item" -Values @{"Title" = "Test Title 1"; "Body" = "Here is content for the body"}

**Sixth - Add a View**

Add-PnPView -List "First Demo List" -Title "First Demo List Items" -Fields "Title","Body" -SetAsDefault

**Seventh - Add New Page**

Add-PnPClientSidePage -Name "NewPage"

**Last - Make New Page the homepage**

Set-PnPHomePage -RootFolderRelativeUrl SitePages/NewPage.aspx

**Other Section**

**Set Credentials**
$MyCredential = Get-Credential

.\addlist.ps1 -Credentials $MyCredential