function Get-EnumValue
{ 
  param (
    [type]$type,
    [switch]$object,
    [switch]$list
  )

  if ($object)
  {
    [enum]::getNames($type) | 
    Select-Object -Property @{
      name       = 'Name'
      expression = {
        $_
      }
    }, 
    @{
      name       = 'Value'
      expression = {
        $type::$_.value__
      }
    }, 
    @{
      name       = 'Binary'
      expression = {
        [Convert]::ToString($type::$_.value__, 2)
      }
    }, 
    @{
      name       = 'Hex'
      expression = {
        [Convert]::ToString($type::$_.value__, 16).ToUpper()
      }
    }
  }
  elseif ($list)
  {
    [enum]::getNames($type)
  }
  else
  {
    [enum]::getNames($type) |             
    Select-Object -Property @{
      name       = 'Name'
      expression = {
        $_
      }
    }, 
    @{
      name       = 'Value'
      expression = {
        $type::$_.value__
      }
    }, 
    @{
      name       = 'Binary'
      expression = {
        [Convert]::ToString($type::$_.value__, 2)
      }
    }, 
    @{
      name       = 'Hex'
      expression = {
        [Convert]::ToString($type::$_.value__, 16).ToUpper()
      }
    } | 
    Format-Table -AutoSize
  }
}




