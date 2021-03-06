function Get-ExtensionMethod
{
    <#
    .Synopsis
        Gets loaded extension methods
    .Description
        Gets the currently loaded extension methods
    .Example
        Get-ExtensionMethod
    .Link
        Get-Type
    #>
    param()
    [AppDomain]::CurrentDomain.GetAssemblies() |
        ForEach-Object {
            $_.GetTypes()
        } | 
        Where-Object {
            $_.IsPublic -and $_.IsAbstract -and $_.IsSealed -and (-not $_.GetConstructors())
        } |
        ForEach-Object {
            $_.GetMethods("Public, Static")
        } |
        Where-Object {
            $_.GetParameters().Count -ge 1
        }
        
}
