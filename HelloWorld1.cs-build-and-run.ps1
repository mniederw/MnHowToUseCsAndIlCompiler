[CmdletBinding()] Param( [parameter(Mandatory=$false)] [String] $optionalParam = "")
$ErrorActionPreference = "Stop"; trap [Exception] { $Host.UI.WriteErrorLine($_); Read-Host; break; }
[String] $fn = ([System.IO.Path]::GetFileNameWithoutExtension($PSCommandPath) -split "\.")[0]; 
[String] $tar = Join-Path ([System.IO.Path]::GetTempPath()) ($fn + "." + [System.IO.Path]::GetRandomFileName().Replace(".","") + ".tmp.exe");
# REM alternatives: cversion: v2.0.50727, v3.5, v4.0.30319,  options: /target:winexe
& "$env:SystemRoot\Microsoft.NET\Framework\v4.0.30319\csc.exe" /nologo /warn:4 /warnaserror+ /target:exe "/out:$tar" "$fn.cs";
& $tar $optionalParam;
Remove-Item -LiteralPath $tar;
Read-Host "Press enter to exit";
