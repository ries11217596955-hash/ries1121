
Param(
  [Parameter(Mandatory=$true)][string]$Source,
  [Parameter(Mandatory=$true)][string]$OutDir
)
$ErrorActionPreference='Stop'
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$docs = Get-ChildItem -Path $Source -Directory
foreach($d in $docs){
  # Ожидаем файлы: core.docx, sample.docx, quick_start.docx, README.txt, LICENSE.txt
  $files = @("core.docx","sample.docx","quick_start.docx","README.txt","LICENSE.txt")
  $missing = @()
  foreach($f in $files){ if(!(Test-Path (Join-Path $d.FullName $f))){ $missing += $f } }
  if($missing.Count -gt 0){ Write-Host "WARN: $($d.Name) пропущен: нет файлов: $($missing -join ', ')"; continue }
  $zip = Join-Path $OutDir ("{0}_BUYER_ONLY.zip" -f $d.Name)
  if(Test-Path $zip){ Remove-Item $zip -Force }
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $tmp = New-Item -ItemType Directory -Force -Path (Join-Path $env:TEMP ([System.Guid]::NewGuid().ToString()))
  try{
    foreach($f in $files){
      Copy-Item (Join-Path $d.FullName $f) -Destination (Join-Path $tmp $f) -Force
    }
    [System.IO.Compression.ZipFile]::CreateFromDirectory($tmp, $zip)
    Write-Host "OK: $zip"
  } finally {
    Remove-Item $tmp -Recurse -Force
  }
}
