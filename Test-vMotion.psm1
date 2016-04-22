<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Test-vMotion
{
    [CmdletBinding()]
    [OutputType([system.array])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true,Position=0,ParameterSetName='Cluster')]
        [ValidateNotNullOrEmpty()]
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.ClusterImpl]$Cluster,

        # Param2 help description
        [Parameter(Mandatory=$false,ValueFromPipeline=$true,ParameterSetName='VM')]
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.VirtualMachineImpl]$VM,
        
        [Parameter()]
        [switch]$PrintErrors
    )

    Begin
    {
      $report = @()
      switch ($PsCmdlet.ParameterSetName) 
      { 
        'VM' { 
          $vmObjectList  = $VM
          $clusterObject = $vmObjectList | Get-Cluster
        } 
        'Cluster' { 
          $clusterObject  = $Cluster
          $vmObjectList = $clusterObject | Get-VM | Where-Object{$_.PowerState -eq 'PoweredON'}
        } 
      }
      $hostObjectList = $clusterObject | Get-VMHost | Where-Object{($_.ConnectionState -eq 'Connected') -and ($_.PowerState -eq 'PoweredOn')} 
    }
    
    Process
    {
      foreach($vmObject in $vmObjectList) {
          $verbmsg = 'Testing {0}' -f $vmObject.Name
          Write-Verbose $verbmsg
          
          $validTarget   = 0
          $warningTarget = 0

          foreach($hostObject in $hostObjectList) {
              $verbmsg = 'Test moving {0} from {1} to ' -f $vmObject.Name, $vmObject.VMHost.Name, $hostObject.Name
              Write-Verbose $verbmsg
              
              If ($vmObject.VMHost -ne $hostObject) {
                  $pool        = ($vmObject.ResourcePool).ExtensionData.MoRef
                  $vmMoRef     = $vmObject.ExtensionData.MoRef
                  $hostMoRef   = $hostObject.ExtensionData.MoRef
                    
                  $si          = Get-View ServiceInstance -Server $VC
                  $VmProvCheck = get-view $si.Content.VmProvisioningChecker -Server $VC

                  $result      = $VmProvCheck.CheckMigrate( $vmMoRef, $hostMoRef, $pool, $null, $null )
            
                  If($result[0].Error -ne $null)
                  {
                      $prefix = 'Error: '   
                  } 
                  ElseIf ($result[0].Warning -ne $null) 
                  {
                      $prefix = 'Warning: '   
                      $warningTarget
                  } 
                  Else 
                  {
                      $prefix = 'OK: '    
                      $validTarget++
                  }
                  $detail = '{0}: moving {1} to {2}. {3}' -f $prefix, $vmObject.Name, $hostObject.Name, $errorObject.LocalizedMessage
                  
                  if ($PrintErrors -and ($prefix -notmatch 'OK') )  {
                    Write-Warning $detail
                  }
                  
                  [system.array]$msg += '{0}: moving {1} to {2}. {3}' -f $prefix, $vmObject.Name, $hostObject.Name, $errorObject.LocalizedMessage
              }
          }
    
          $reportLine.validTarget   = $validTarget
          $reportLine.warningTarget = $warningTarget
    
          If ($validTarget -gt 0) {
              $canMigrate = 'OK'
          } ElseIf ($warningTarget -gt 0) {
              $canMigrate = 'Warning'
          } Else {
              $canMigrate = 'Error'
          }


          $Obj = New-Object PSObject -Property @{            
              VM            = $vmObject.Name                 
              sourceHost    = $vmObject.VMHost.Name
              canMigrate    = 'OK'
              validTarget   = $validTarget
              warningTarget = $warningTarget
              detail        = $msg  
          }     
          $report += $Obj 
      }
    }
    End
    {
      return $report
    }
}

Export-ModuleMember Test-*