function Get-ProgID {
    <#                       
    .Synopsis            
       Gets all of the ProgIDs registered on a system            
    .Description            
       Gets all ProgIDs registered on the system.  The ProgIDs returned can be used with New-Object -comObject            
    .Example            
       Get-ProgID            
    .Example
        Get-ProgID *Image*
    #>
    param(
    [String]$ProgId = "*"
    )            
    $paths = @("REGISTRY::HKEY_CLASSES_ROOT\CLSID")            
    if ($env:Processor_Architecture -eq "amd64") {            
        $paths+="REGISTRY::HKEY_CLASSES_ROOT\Wow6432Node\CLSID"            
    }             
    Get-ChildItem $paths -include VersionIndependentPROGID -recurse |
    Where-Object { $_.GetValue("") -like $ProgId } |
    Select-Object @{            
        Name='ProgID'            
        Expression={$_.GetValue("")}                    
    }, @{
        Name='Library'
        Expression={
            $inProcServer = Get-ItemProperty "$($_.PSParentPath)\InProcServer32" | Select-Object -ExpandProperty '(default)'                
            if ($inProcServer) { $inProcServer } else {
                Get-ItemProperty "$($_.PSParentPath)\LocalServer32" | Select-Object -ExpandProperty '(default)'                
            }
        }
    },@{            
        Name='32Bit'            
        Expression={            
            if ($env:Processor_Architecture -eq "amd64") {            
                $_.PSPath.Contains("Wow6432Node")                
            } else {            
                $true            
            }                        
        }            
    }            
} 
