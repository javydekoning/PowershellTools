function Get-VMDiskUsage {
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
        $pipeline
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
          $vmObjectList  = $VM | ? {(-not $_.Config.Template) -and ($_.ExtensionData.Guest.ToolsRunningStatus -match ‘guestToolsRunning’) }
        } 
        'Cluster' { 
          Write-Verbose 'setname cluster'
          $vmObjectList  = $Cluster | Get-VM | ? {(-not $_.Config.Template) -and ($_.ExtensionData.Guest.ToolsRunningStatus -match ‘guestToolsRunning’) }
        } 
        'vmhost' { 
          Write-Verbose 'setname vmhost'
          $vmObjectList  = $vmhost | Get-VM | ? {(-not $_.Config.Template) -and ($_.ExtensionData.Guest.ToolsRunningStatus -match ‘guestToolsRunning’) }
        } 
        'pipeline' { 
          Write-Verbose 'setname pipeline'
          switch ((,$pipeline)[0].gettype().fullname) {
            'VMware.VimAutomation.ViCore.Impl.V1.Inventory.VMHostImpl' {
              $vmObjectList  = $pipeline | Get-VM | ? {(-not $_.Config.Template) -and ($_.ExtensionData.Guest.ToolsRunningStatus -match ‘guestToolsRunning’) }
            }
            'VMware.VimAutomation.ViCore.Impl.V1.Inventory.ClusterImpl' {
              $vmObjectList  = $pipeline | Get-VM | ? {(-not $_.Config.Template) -and ($_.ExtensionData.Guest.ToolsRunningStatus -match ‘guestToolsRunning’) }
            }
            'VMware.VimAutomation.ViCore.Impl.V1.Inventory.VirtualMachineImpl' { 
              $vmObjectList  = $pipeline | ? {(-not $_.Config.Template) -and ($_.ExtensionData.Guest.ToolsRunningStatus -match ‘guestToolsRunning’) }
            } 
            default {
                Write-Warning "Input object type was $((,$pipeline)[0].gettype().fullname), this function requires VMHostImpl,ClusterImpl or VirtualMachineImpl" 
                break; 
            }
          }
        } 
      }
        
      foreach($vmObject in $vmObjectList) {
        foreach($d in $vmObject.Guest.Disks) {
          
          $diff = ($vmObject.harddisks | Select CapacityKB, Filename, @{n='Diff';e={$val = ($_.CapacityKB*1024)-$d.capacity; if ($val -lt 0) {$val=$val * -1}; $val}} | sort diff | select -first 1).FileName 
          $Obj = New-Object PSObject -Property @{   
            Date          = Get-Date -Format 'yyyyMMdd'         
            VM            = $vmObject.Name                 
            sourceHost    = $vmObject.Guest.HostName
            Disk          = $d.Path 
            FreeSpace     = $d.FreeSpace
            UsedSpace     = ($d.capacity - $d.FreeSpace)
            Capacity      = $d.capacity
            BestGuessFileName = $diff
          }     
          $report += $Obj 
        }
      }
    }
    End
    {
      return $report
    }
} 