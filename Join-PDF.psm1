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
function Join-PDF
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                  SupportsShouldProcess=$true, 
                  PositionalBinding=$false,
                  HelpUri = 'http://www.microsoft.com/',
                  ConfirmImpact='Medium')]
    [Alias()]
    [OutputType([String])]
    Param
    (
        #Input folder
        [Parameter(Mandatory=$true)]
        [string]$Path,

        # Param3 help description
        [Parameter(Mandatory=$false)]
        [String]
        $Outputfile = (join-path $home ("$(Get-Date -Format 'yyyyMMddhhmmss')" + "joined.pdf"))
    )

    Begin
    {
      Write-Verbose 'Verifying if nuget package source is configured.'
      if (-not (Get-PackageSource nuget) ) {
        Write-Verbose 'NuGet is package source is not found, adding source.'
        Register-PackageSource -Name nuget -Trusted -ProviderName nuget -Location 'https://www.nuget.org/api/v2'
      }
      
      Write-Verbose 'Verifying if itextsharp package exists.'
      if (-not (Get-Package itextsharp) ) {
        Write-Verbose 'itextsharp not found, downloading NuGet package.'
        Install-Package -name 'iTextSharp'
      }

      $Pack = Get-Package -name 'itextsharp'
      $Pack = Split-Path $Pack.Source -Parent 
      $dll  = join-path $Pack 'lib\itextsharp.dll'
      
      try {  
        Add-Type -Path $dll
      } catch {
        throw 'Error loading dll'
      }
      
      $pdfs = Get-ChildItem $Path | Where-Object {-not $_.PSIsContainer -and $_.Extension -imatch "^\.pdf$"};

      #[void] [System.Reflection.Assembly]::LoadFrom(
      #    [System.IO.Path]::Combine($workingDirectory, 'itextsharp.dll')
      #);

      $output     = $Outputfile;
      $fileStream = New-Object System.IO.FileStream($output, [System.IO.FileMode]::OpenOrCreate);
      $document   = New-Object iTextSharp.text.Document;
      $pdfCopy    = New-Object iTextSharp.text.pdf.PdfCopy($document, $fileStream);
      $document.Open();
    }
    Process
    {
      if ($pscmdlet.ShouldProcess('Target', 'Operation'))
      {
        foreach ($pdf in $pdfs) {
            $reader = New-Object iTextSharp.text.pdf.PdfReader($pdf.FullName);
            $pdfCopy.AddDocument($reader);
            $reader.Dispose();  
        }
      }
    }
    End
    {
      $pdfCopy.Dispose();
      $document.Dispose();
      $fileStream.Dispose();   
      Start $Outputfile 
    }
}