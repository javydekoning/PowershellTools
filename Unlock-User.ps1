<#
    .Synopsis
    Function to unlock user that does not depend on PoSH AD module nor ADWS being available. 
    .DESCRIPTION
    Function to unlock user that does not depend on PoSH AD module nor ADWS being available. 
    .EXAMPLE
    Unlock-User jdekoning
#>
function Unlock-User
{
  [CmdletBinding()]
  Param
  (
    #Username
    [Parameter(Mandatory=$true,Position=0)]
    $samaccountname
  )
  $User = [adsi]([adsisearcher]"samaccountname=$samaccountname").findone().path;
  if ($user) {
    $User.psbase.InvokeSet('IsAccountLocked',$false)
    $User.SetInfo()  
  } else {
    Write-Warning "$samaccountname not found."
  }
}
