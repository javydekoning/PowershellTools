function Test-vMotion
{
    [CmdletBinding()]
    [OutputType([system.array])]
    Param
    (
        #Param to test an entire cluster
        [Parameter(Mandatory=$true,ParameterSetName='Cluster')]
        [ValidateNotNullOrEmpty()]
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.ClusterImpl]$Cluster,

        #Param to test a VM
        [Parameter(Mandatory=$true,ParameterSetName='virtualmachine')]
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.VirtualMachineImpl]$VM,

        #Param to test VM's an a ESXi host
        [Parameter(Mandatory=$true,ParameterSetName='vmhost')]
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.VMHostImpl]$vmhost,
        
        #Pipeline parameter to accept pipeline input
        [Parameter(Mandatory=$true,ValueFromPipeline=$true,ParameterSetName='pipeline',Position=0)]
        $pipeline,
        
        [Parameter(Mandatory=$false)]
        [ValidateSet('warnings','warningsanderrors','errors','all')]
        [string]$Print
    )

    Process
    {
      $connected = $defaultVIServer | ? {$_.isconnected} 
      
      if (!$connected) {
        Write-Warning 'Not connected to vCenter, aborting'
        break
      }
      
      $report = @()
      switch ($PsCmdlet.ParameterSetName) 
      { 
        'virtualmachine' { 
          Write-Verbose 'setname virtualmachine'
          $vmObjectList  = $VM
          Write-Verbose $vmObjectList
          $clusterObject = $vmObjectList | Get-Cluster
          Write-Verbose $clusterObject
        } 
        'Cluster' { 
          Write-Verbose 'setname cluster'
          $clusterObject = $Cluster
          $vmObjectList  = $clusterObject | Get-VM | Where-Object{$_.PowerState -eq 'PoweredON'}
        } 
        'vmhost' { 
          Write-Verbose 'setname vmhost'
          $clusterObject = $vmhost | Get-Cluster
          $vmObjectList  = $vmhost | Get-VM | Where-Object{$_.PowerState -eq 'PoweredON'}
        } 
        'pipeline' { 
          Write-Verbose 'setname pipeline'
          switch ((,$pipeline)[0].gettype().fullname) {
            'VMware.VimAutomation.ViCore.Impl.V1.Inventory.VMHostImpl' {
              $clusterObject = $pipeline | Get-Cluster
              $vmObjectList  = $pipeline | Get-VM | Where-Object{$_.PowerState -eq 'PoweredON'}           
            }
            'VMware.VimAutomation.ViCore.Impl.V1.Inventory.ClusterImpl' {
              $clusterObject = $pipeline 
              $vmObjectList  = $pipeline | Get-VM | Where-Object{$_.PowerState -eq 'PoweredON'}
            }
            'VMware.VimAutomation.ViCore.Impl.V1.Inventory.VirtualMachineImpl' { 
              $clusterObject = $pipeline | Get-Cluster
              $vmObjectList  = $pipeline
            } 
            default {
                Write-Warning "Input object type was $((,$pipeline)[0].gettype().fullname), this function requires VMHostImpl,ClusterImpl or VirtualMachineImpl" 
                break; 
            }
          }
        } 
      }
      $hostObjectList = $clusterObject | Get-VMHost | Where-Object{($_.ConnectionState -eq 'Connected') -and ($_.PowerState -eq 'PoweredOn')} 
      
      $si             = Get-View ServiceInstance
      
      foreach($vmObject in $vmObjectList) {
          $VC = $vmObject.uid.tostring() -replace '.*(@)(.*)(:).*', '$2'

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
                    
                  if ($si.length -gt 1) {
                    $VmProvCheck = Get-View $si.Content.VmProvisioningChecker
                  } else {
                    $VmProvCheck = Get-View $si.Content.VmProvisioningChecker -Server $VC
                  }
                  

                  $result      = $VmProvCheck.CheckMigrate( $vmMoRef, $hostMoRef, $pool, $null, $null )
            
                  If($result[0].Error -ne $null)
                  {
                      $prefix = 'Error'   
                  } 
                  ElseIf ($result[0].Warning -ne $null) 
                  {
                      $prefix = 'Warning'   
                      $warningTarget
                  } 
                  Else 
                  {
                      $prefix = 'OK'    
                      $validTarget++
                  }
                  $detail = '{0}: moving {1} to {2}. {3}' -f $prefix, $vmObject.Name, $hostObject.Name, $errorObject.LocalizedMessage
                  
                  switch ($print) {
                    'warnings' {
                      if ($prefix -match 'Warning') {Write-Warning $detail} 
                    } 
                    'errors' {
                      if ($prefix -match 'Error') {Write-Warning $detail} 
                    }
                    'warningsanderrors' {
                      if ($prefix -match '(Warning|Error)') {Write-Warning $detail} 
                    }
                    'all' {
                      if ($prefix -match '(Warning|Error)') {Write-Warning $detail} 
                      else {Write-Host -ForegroundColor Green $detail}  
                    }
                    default {}
                  }
                  
                  [system.array]$msg += '{0}: moving {1} to {2}. {3}' -f $prefix, $vmObject.Name, $hostObject.Name, $errorObject.LocalizedMessage
              }
          }
     
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
