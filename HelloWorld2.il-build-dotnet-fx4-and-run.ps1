#!/usr/bin/env pwsh

Param();

Set-StrictMode -Version Latest; trap [Exception] { Write-Error -ErrorAction Continue $_; Read-Host "Press Enter to Exit"; break; } $ErrorActionPreference = "Stop";

[String] $fn = ([System.IO.Path]::GetFileNameWithoutExtension($PSCommandPath) -split "\.")[0];
[String] $src = Join-Path $PSScriptRoot "$fn.il";
[String] $tar = Join-Path ([System.IO.Path]::GetTempPath()) ($fn + "." + [System.IO.Path]::GetRandomFileName().Replace(".","") + ".tmp.exe");

# alternatives: version: v2.0.50727, v3.5, v4.0.30319,  options: /target:winexe
& "$env:SystemRoot\Microsoft.NET\Framework\v4.0.30319\ilasm.exe" /nologo /quiet /exe "/output:$tar" $src;
  if( -not $? ){ throw [Exception] "Build failed for `"$src`" "; }
& $tar;
  if( -not $? ){ throw [Exception] "Run failed for `"$tar`" "; }

Remove-Item -LiteralPath $tar;

Read-Host "Press Enter to exit";
