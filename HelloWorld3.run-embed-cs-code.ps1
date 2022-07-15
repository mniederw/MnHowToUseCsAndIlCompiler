#!/usr/bin/env pwsh

[CmdletBinding()] Param( [parameter(Mandatory=$false)] [String] $optionalParam = "")
$ErrorActionPreference = "Stop"; trap [Exception] { $Host.UI.WriteErrorLine($_); Read-Host; break; }

$assemblies = (	"System" );
$source = @"
    public static class HelloWorld {
        public static void Main( System.String[] args ) {
            System.Console.WriteLine("Hello World!");
        }
    }
"@

Add-Type -ReferencedAssemblies $assemblies -TypeDefinition $source -Language CSharp;
[HelloWorld]::Main($optionalParam);

Read-Host "Press enter to exit";
