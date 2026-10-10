#!/usr/bin/env pwsh

Param( [parameter(Mandatory=$false)] [Object[]] $args = @());

Set-StrictMode -Version Latest; 
trap [Exception] { Write-Error -ErrorAction Continue $_; Read-Host "Press Enter to Exit"; break; }
$ErrorActionPreference = "Stop";

[String] $cSharpSourceCode2 = @"
  using System; using System.Linq;
  public class HelloWorld3{
    public static void Main( String[] args = null ){
      Console.WriteLine("Hello World 3! Args=" + String.Join(" ",(args ?? new String[0]).Select(item => "\""+item+"\"")) + ".");
    }
  }
"@;

Add-Type -Language CSharp -TypeDefinition $cSharpSourceCode2;

[HelloWorld3]::Main();
[HelloWorld3]::Main(@("hi","you"));
[HelloWorld3]::Main($args);

Read-Host "Press Enter to exit.";
