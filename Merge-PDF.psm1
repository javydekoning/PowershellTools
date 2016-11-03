function Merge-PDF
{
  <#
    .SYNOPSIS
    Module to merge PDF files.

    .DESCRIPTION
    Merge-PDF is a PowerShell module used to merge PDF files. Using itextsharp. 

    .PARAMETER Path
    Input folder containing PDF files.

    .PARAMETER Outputfile
    Filename for output file. If this is not supplied we will use the users homedir.

    .EXAMPLE
    Merge-PDF -Path Value -Outputfile Value

    .NOTES
    Author: Javy de Koning [www.javydekoning.com]

    .LINK
    https://github.com/javydekoning/Merge-PDF

  #>
  [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                SupportsShouldProcess=$true, 
                HelpUri = 'http://www.github.com/javydekoning/Merge-PDF',
                ConfirmImpact='Medium')]
  [Alias('Output')]
  [OutputType([String])]
  Param
  (
      #Input folder
      [Parameter(Mandatory=$true,HelpMessage='Input folder containing PDF files')]
      [string]$Path,

      [String]$Outputfile = (join-path -Path $home -ChildPath ("$(Get-Date -Format 'yyyyMMddhhmmss')" + 'joined.pdf'))
  )

  Begin
  {
    Write-Verbose -Message 'Verifying if nuget package source is configured.'
    if (-not (Get-PackageSource -Name nuget) ) {
      Write-Verbose -Message 'NuGet is package source is not found, adding source.'
      Register-PackageSource -Name nuget -Trusted -ProviderName nuget -Location 'https://www.nuget.org/api/v2'
    }
      
    Write-Verbose -Message 'Verifying if itextsharp package exists.'
    if (-not (Get-Package -Name itextsharp) ) {
      Write-Verbose -Message 'itextsharp not found, downloading NuGet package.'
      Install-Package -name 'iTextSharp'
    }

    $Pack = Get-Package -name 'itextsharp'
    $Pack = Split-Path -Path $Pack.Source -Parent 
    $dll  = join-path -Path $Pack -ChildPath 'lib\itextsharp.dll'
      
    try {  
      Add-Type -Path $dll
    } catch {
      throw 'Error loading dll'
    }
      
    $pdfs = Get-ChildItem -Path $Path | Where-Object {-not $_.PSIsContainer -and $_.Extension -imatch '^\.pdf$'};

    $fileStream = New-Object -TypeName System.IO.FileStream -ArgumentList ($Outputfile, [IO.FileMode]::OpenOrCreate);
    $document   = New-Object -TypeName iTextSharp.text.Document;
    $pdfCopy    = New-Object -TypeName iTextSharp.text.pdf.PdfCopy -ArgumentList ($document, $fileStream);
    $document.Open();
  }
  Process
  {
    foreach ($pdf in $pdfs) {
        $reader = New-Object -TypeName iTextSharp.text.pdf.PdfReader -ArgumentList ($pdf.FullName);
        $pdfCopy.AddDocument($reader);
        $reader.Dispose();  
    }
  }
  End
  {
    $pdfCopy.Dispose();
    $document.Dispose();
    $fileStream.Dispose(); 
    if (Test-Path -LiteralPath $Outputfile) {
      Start-Process -FilePath $Outputfile
    }
  }
}