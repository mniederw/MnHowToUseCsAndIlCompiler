#!/usr/bin/env pwsh

Param( [parameter(Mandatory=$false)] [String] $optionalParam = "");

Set-StrictMode -Version Latest; trap [Exception] { Write-Error $_; Read-Host "Press Enter to Exit"; break; } $ErrorActionPreference = "Stop";

$assemblies = (	"System" );
$source = @"
  public static class HelloWorld {
    public static void Main( System.String[] args ) { System.Console.WriteLine("Hello World!"); }
  }
"@

Add-Type -ReferencedAssemblies $assemblies -TypeDefinition $source -Language CSharp;
[HelloWorld]::Main($optionalParam);

Read-Host "Press Enter to exit.";
