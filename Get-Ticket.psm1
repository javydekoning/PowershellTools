#requires -Version 3
<#
    .Synopsis
    TicketSwapBot
    .DESCRIPTION
    TicketSwap bot to grab tickets from TicketSwap asap when demand is high. 
    .EXAMPLE
    Get-Ticket -url 'https://www.ticketswap.nl/event/de-tijdmachine-de-koning-te-rijk/0ad69c30-a93b-4bc3-8f48-92cc5c8c0093'
#>
Function Get-Ticket 
{
  [CmdletBinding()]
  Param
  (
    # Param1 help description
    [Parameter(Mandatory = $true,ValueFromPipelineByPropertyName = $true,Position = 0)]
    [string]$url    
  )    

  Begin
  {
    $start = Get-Date
    $count = 1
  }
  Process
  {
    while (1) 
    {
      $webr = Invoke-WebRequest -Uri $url
      if ($webr.content -notmatch 'Robot') 
      {
        if (($webr.content -notmatch 'Nog geen e-tickets aangeboden') -and ($webr.content -notmatch 'Aangeboden.*.small.0.tickets.small.')) 
        {
          $link = $webr.Links |
          Where-Object -FilterScript {
            $_.itemprop -match 'offerurl'
          } |
          Select-Object -First 1
          Write-Warning -Message "Found ticket @ $($link.href)"
          
          [console]::beep(1000,500)
          Start-Process $('https://www.ticketswap.nl'+$link.href)
          
          break
        }
      }
      else 
      {
        Write-Warning -Message 'Robot got Caught'
        $timespan = (New-TimeSpan -Start $start -End (Get-Date)).TotalSeconds 
        Write-Warning -Message "Caught after $timespan and $count tries"
        Start-Process $url
        break 
      }
      $count ++ 
    }    
  }
  End
  {
  }
}
Export-ModuleMember Get-Ticket