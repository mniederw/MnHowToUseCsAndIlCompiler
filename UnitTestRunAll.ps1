#!/usr/bin/env pwsh

. "$PSScriptRoot/HelloWorld1.cs-build-dotnet-fx4-and-run.ps1";
. "$PSScriptRoot/HelloWorld2.il-build-dotnet-fx4-and-run.ps1";
. "$PSScriptRoot/HelloWorld3.run-embed-cs-code.ps1";
. "$PSScriptRoot/HelloWorld4.run-embed-cs-code-specify-assemblies.ps1";

Read-Host "Press Enter to exit";
