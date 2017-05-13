Function Test-ms17-010 
{
  $regex = [regex] '(?i)kb(KB4012212|KB4012213|KB4012214|KB4012215|KB4012216|KB4012217|KB4012598|KB4012606|KB4013198|KB4013429)'
  $os    = (Get-WmiObject -Class win32_operatingsystem).caption
  if ($os -match '2003') 
  {
    if (Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Updates -Recurse | Where-Object -FilterScript {
        $_.name -match $regex
    }) 
    {
      return 'patched'
    }
    else 
    {
      return 'NOT patched'
    }
  } else 
  {
    if (Get-HotFix | Where-Object -FilterScript {
        $_.HotFixID -match $regex
    }) 
    {
      'patched'
    }
    else 
    {
      return 'NOT patched'
    }
  }
}
