#requires -Version 3
<#
    .Synopsis
    TicketSwapBot
    .DESCRIPTION
    TicketSwap bot to grab tickets from TicketSwap asap when demand is high. 
    .PARAMETER url
    The ticketswap URL
    .PARAMETER interval
    The interval in milliseconds, defaults to 1000 (1 second). Change this if the script gets identified as a bot.
    .EXAMPLE
    Get-Ticket -url 'https://www.ticketswap.nl/event/luminosity-beach-festival-2017/luminosity-beach-festival-2017-saturday-ticket/084c6130-fd1a-4f23-bbd2-512011682273/39009' -interval 2000
    .EXAMPLE
    Get-Ticket -url 'https://www.ticketswap.nl/event/luminosity-beach-festival-2017/luminosity-beach-festival-2017-saturday-ticket/084c6130-fd1a-4f23-bbd2-512011682273/39009' -verbose
#>
Function Get-Ticket 
{
  [CmdletBinding()]
  Param
  (
    #The ticketswap URL
    [Parameter(Mandatory,Position = 0, ValueFromPipeline)]
    [string]$url,

    #The interval in seconds, defaults to 2 seconds to prevent getting identified as a bot.     
    [Parameter(Position = 1)]
    [int]$interval = 1000,

    #The interval in seconds, defaults to 2 seconds to prevent getting identified as a bot.     
    [Parameter(Position = 1)]
    [int]$maxprice = $null
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
      #For verbose logging
      $iteration = ($count).ToString('000000')
      $time      = [string](get-date).ToString('HH:mm:ss')
      
      Start-Sleep -Milliseconds $interval
      $webr = Invoke-WebRequest -Uri $url
      if ($webr.content -notmatch 'Robot') 
      {
        if (($webr.content -notmatch 'Nog geen e-tickets aangeboden|Geen tickets aangeboden op dit moment')) 
        {
          $price = ($webr.ParsedHtml.body.getElementsByTagName('div') | Where {$_.getAttributeNode('class').Value -eq 'listings-item--price'} | ? {$_.textContent -match '�'} | select -expand textContent -First 1 textContent) -replace '.*?(\d+).*','$1'

          if ($null -eq $maxprice -or $price -le $maxprice) {
            Write-Verbose "Current price is $price, which is lower than the configured maxprice of $maxprice, trying to buy ticket"

            $link = $webr.Links |
            Where-Object -FilterScript {
              $_.itemprop -match 'offerurl'
            } |
            Select-Object -First 1
            Write-Warning -Message "Found ticket @ $($link.href)"
          
            [console]::beep(1000,500)
            Start-Process $('https://www.ticketswap.nl'+$link.href)
          
            break          
          } else {
            Write-Verbose "$iteration - $time - Current price is $price, which is higher than the configured maxprice of $maxprice, looping"
          }

        }
        else
        {
          $iteration = ($count).ToString('000000')
          $time      = [string](get-date).ToString('hh:mm:ss')
          Write-Verbose "$iteration - $time - No tickets available."
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

Get-Ticket -url https://www.ticketswap.nl/event/a-state-of-trance-festival-utrecht/regular-ticket/65f49eac-dfe3-4322-89e9-d54f41b3edd8/417247 -Verbose -maxprice 40