#!/usr/bin/env pwsh

Param( [parameter(Mandatory=$false)] [String[]] $args = @());

Set-StrictMode -Version Latest; trap [Exception] { Write-Error -ErrorAction Continue $_; Read-Host "Press Enter to Exit"; break; } $ErrorActionPreference = "Stop";



$cSharpSourceCode2 = @"
  using System; using System.Linq;
  public class HelloWorld{
    public static void Main( string[] args = null ){
      Console.WriteLine("Hello, World! Args=" + string.Join(" ",(args ?? new string[0]).Select(item => "\""+item+"\"")) + ".");
    }
  }
"@
Add-Type -Language CSharp -TypeDefinition $cSharpSourceCode2;
[HelloWorld]::Main();
[HelloWorld]::Main(@("hi","you"));
[HelloWorld]::Main($args);



Read-Host "Press Enter to exit.";
