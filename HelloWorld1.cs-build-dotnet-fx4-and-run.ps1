#!/usr/bin/env pwsh

Param( [parameter(Mandatory=$false)] [String[]] $args = @());

Set-StrictMode -Version Latest; trap [Exception] { Write-Error -ErrorAction Continue $_; Read-Host "Press Enter to Exit"; break; } $ErrorActionPreference = "Stop";

[String] $fn = ([System.IO.Path]::GetFileNameWithoutExtension($PSCommandPath) -split "\.")[0];
[String] $src = Join-Path $PSScriptRoot "$fn.cs";
[String] $tar = Join-Path ([System.IO.Path]::GetTempPath()) ($fn + "." + [System.IO.Path]::GetRandomFileName().Replace(".","") + ".tmp.exe");

# REM alternatives: cversion: v2.0.50727, v3.5, v4.0.30319,  options: /target:winexe
& "$env:SystemRoot\Microsoft.NET\Framework\v4.0.30319\csc.exe" /nologo /warn:4 /warnaserror+ /target:exe "/out:$tar" $src;
  if( -not $? ){ throw [Exception] "Build failed for `"$src`" "; }
& $tar $args;
  if( -not $? ){ throw [Exception] "Run failed for `"$tar`" "; }
Remove-Item -LiteralPath $tar;

Read-Host "Press Enter to exit";
