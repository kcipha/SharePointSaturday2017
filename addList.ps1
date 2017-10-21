#===================================================================================
#
# Project Upload
#
#===================================================================================

#===================================================================================
# Command Parameters
#===================================================================================
param(
    [Parameter(Mandatory = $false, HelpMessage = "Enter the URL of the target site, e.g. 'https://intranet.mydomain.com/sites/targetSite'")]
    [String]
    $targetSiteUrl,

    [Parameter(Mandatory = $false, HelpMessage = "Optional administration credentials")]
    [PSCredential]
    $Credentials
)

#===================================================================================
# Variables
#===================================================================================
$spUpdateSites = @(
    @{
        site = "https://kieferconsultinginc.sharepoint.com/sites/SharePoint-Saturday-2017/"
    }
    @{
        site = "https://kieferconsultinginc.sharepoint.com/sites/SharePoint-Saturday-2017/SampleA"
    }
    @{
        site = "https://kieferconsultinginc.sharepoint.com/sites/SharePoint-Saturday-2017/SampleB"
    }
)
$spAddLists = @(
    @{
        Title    = "Demo List"
        URL      = "DemoList"
        Template = "Announcements"
    }
    @{
        Title    = "Demo Contacts"
        URL      = "DemoContacts"
        Template = "Contacts"
    }
    @{
        Title    = "Demo Custom"
        URL      = "DemoCustom"
        Template = "GenericList"
    }
)
$spAddViews = @(
    @{ 
        ListTitle   = "Demo List"
        ViewTitle   = "New View"
        ViewFields  = "Title,Body"
        ViewQuery   = '<OrderBy><FieldRef Name="Title" /></OrderBy>' 
        DefaultView = "" 
    }
    @{ 
        ListTitle   = "Demo Contacts"
        ViewTitle   = "New View"
        ViewFields  = "Edit,LinkTitle,FirstName,JobTitle,CellPhone,WorkPhone,Email"
        ViewQuery   = '<OrderBy><FieldRef Name="Title" /></OrderBy>' 
        DefaultView = "yes" 
    }
    @{ 
        ListTitle   = "Demo Custom"
        ViewTitle   = "New View"
        ViewFields  = "Title"
        ViewQuery   = '<OrderBy><FieldRef Name="Title" /></OrderBy>' 
        DefaultView = "yes" 
    }
)
$spListSettingsUpdate = @(
    @{ 
        ListTitle     = "Demo List"
        MajorVersions = 30
    }
    @{ 
        ListTitle     = "Demo Contacts"
        MajorVersions = 20
    }
    @{ 
        ListTitle     = "Demo Custom"
        MajorVersions = 10
    }
)
$spNewHomePage = @(
    @{ 
        pageName     = "New-Home-Page"
    }
)

#===================================================================================
# Verify Credentials
#===================================================================================
if ($Credentials -eq $null) {
    $Credentials = Get-Credential -Message "Enter Admin Credentials"
}


#===================================================================================
# Add Lists
#===================================================================================

foreach ($spSite in $spUpdateSites) {
    Connect-PnPOnline $spSite.site -Credentials $Credentials

    Write-Host ""
    Write-Host -ForegroundColor Green "Connected to:" -nonewline;
    Write-Host -ForegroundColor White $spSite.site -nonewline;
    Write-Host ""

    
    #===================================================================================
    # Add Lists
    #===================================================================================

    # foreach ($spList in $spAddLists) {

    #     $listTitle = $spList.Title
    #     $listUrl = $spList.Url
    #     $listTemplate = $spList.Template
    
    #     $newList = New-PnPList -Title "$listTitle" -Url "$listUrl" -Template $listTemplate -EnableVersioning -OnQuickLaunch
    
    #     Write-Host -ForegroundColor White "LIST: " -nonewline; 
    #     Write-Host -ForegroundColor Green $listTitle -nonewline; 
    #     Write-Host -ForegroundColor White " - ADDED"
    
    # }
        
    #===================================================================================
    # Add List View
    #===================================================================================

    # foreach ($spViewsAdd in $spAddViews) {

    #     $listTitle = $spViewsAdd.ListTitle
    #     $viewTitle = $spViewsAdd.ViewTitle
    #     $viewFields = $spViewsAdd.ViewFields -split (',')
    #     $viewQuery = $spViewsAdd.ViewQuery
    #     $viewDefaultView = $spViewsAdd.DefaultView

    #     Remove-PnPView -List "$listTitle" -Identity "$viewTitle" -Force

    #     If ( $viewDefaultView -eq 'yes') {

    #         Add-PnPView -List $listTitle -Title "$viewTitle" -Fields $viewFields -Query "$viewQuery" -SetAsDefault

    #     }
    #     else {
                                
    #         Add-PnPView -List $listTitle -Title "$viewTitle" -Fields $viewFields -Query "$viewQuery"

    #     }
                            
    #     Write-Host -ForegroundColor White "LIST: " -nonewline; 
    #     Write-Host -ForegroundColor Green $listTitle -nonewline; 
    #     Write-Host -ForegroundColor White " - VIEW ADDED: " -nonewline; 
    #     Write-Host -ForegroundColor Green $viewTitle

    # }

    #===================================================================================
    # Update Lists Settings
    #===================================================================================

    # foreach ($spListSettings in $spListSettingsUpdate) {

    #     $listTitle = $spListSettings.ListTitle
    #     $listMajorVersions = $spListSettings.MajorVersions
    
    #     Set-PnPList -Identity $listTitle -EnableVersioning $true -MajorVersions $listMajorVersions
    
    #     Write-Host -ForegroundColor White "LIST SETTINGS: " -nonewline; 
    #     Write-Host -ForegroundColor Green $listTitle -nonewline; 
    #     Write-Host -ForegroundColor White " - UPDATED"
    
    # }

    #===================================================================================
    # Add Home Page
    #===================================================================================

    # foreach ($spNewHomePageItem in $spNewHomePage) {

    #     $homePageName = $spNewHomePageItem.pageName
    
    #     Add-PnPClientSidePage -Name $homePageName

    #     Set-PnPHomePage -RootFolderRelativeUrl SitePages/$homePageName.aspx
    
    #     Write-Host -ForegroundColor White "HOME PAGE: " -nonewline; 
    #     Write-Host -ForegroundColor Green $homePageName -nonewline; 
    #     Write-Host -ForegroundColor White " - ADDED"
    
    # }
}