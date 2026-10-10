#!/usr/bin/env pwsh

Param( [parameter(Mandatory=$false)] [Object[]] $args = @());

Set-StrictMode -Version Latest;
trap [Exception] { Write-Error -ErrorAction Continue $_; Read-Host "Press Enter to Exit"; break; }
$ErrorActionPreference = "Stop";

[String[]] $assemblies = (	"System", "System.Linq", ([System.Console].Assembly.Location) );
[String] $cSharpSourceCode = @"
  using System; using System.Linq;
  public static class HelloWorld4 {
    public static void Main( String[] args = null ) {
      Console.WriteLine("Hello, World 4! Args=" + String.Join(" ",(args ?? new String[0]).Select(item => "\""+item+"\"")) + ".");
    }
  }
"@;

Add-Type -Language CSharp -ReferencedAssemblies $assemblies -TypeDefinition $cSharpSourceCode;

[HelloWorld4]::Main();
[HelloWorld4]::Main(@("hi","you"));
[HelloWorld4]::Main($args);

Read-Host "Press Enter to exit.";
