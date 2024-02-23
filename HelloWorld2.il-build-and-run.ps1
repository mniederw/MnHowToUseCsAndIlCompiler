#!/usr/bin/env pwsh
[CmdletBinding()] Param( [parameter(Mandatory=$false)] [String] $optionalParam = "")
$ErrorActionPreference = "Stop"; trap [Exception] { $Host.UI.WriteErrorLine($_); Read-Host; break; }
[String] $fn = ([System.IO.Path]::GetFileNameWithoutExtension($PSCommandPath) -split "\.")[0];
[String] $tar = Join-Path ([System.IO.Path]::GetTempPath()) ($fn + "." + [System.IO.Path]::GetRandomFileName().Replace(".","") + ".tmp.exe");
# alternatives: version: v2.0.50727, v3.5, v4.0.30319,  options: /target:winexe
& "$env:SystemRoot\Microsoft.NET\Framework\v4.0.30319\ilasm.exe" /nologo /quiet /exe "/output:$tar" "$fn.il"; if( -not $? ){ throw [Exception] "Program failed."; }
& $tar $optionalParam; if( -not $? ){ throw [Exception] "Program failed."; }
Remove-Item -LiteralPath $tar;
Read-Host "Press Enter to exit.";
