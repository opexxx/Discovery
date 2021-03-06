@{
    AllowDownload = $true
    DomainSchematics = @{
        'Discovery.Start-Automating.com | Discovery.StartAutomating.com' = 'Default'
    }        



    Technet = @{
        Category="Operating System"
        Subcategory="COM and DCOM"
        OperatingSystem="Windows 7", "Windows Server 2008", "Windows Server 2008 R2", "Windows Vista", "Windows XP", "Windows Server 2012", "Windows 8"
        Tag='Start-Automating', 'PowerShell Tools'
        MSLPL=$true
        Summary="
Discovery is a module to help you probe the inner workings of the operating system.  It lets you search COM, WMI, and .NET type information, and interact with hard to automate COM types.
"
        Url = 'http://gallery.technet.microsoft.com/Discovery-b7ff67a9'
    }    


    GitHub = @{
        Owner = "StartAutomating"
        Project = "Discovery"
        Url = "https://github.com/StartAutomating/Discovery"
    }
} 
