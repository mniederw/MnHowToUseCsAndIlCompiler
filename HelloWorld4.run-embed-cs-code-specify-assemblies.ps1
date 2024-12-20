#!/usr/bin/env pwsh

Param( [parameter(Mandatory=$false)] [String[]] $args = @());

Set-StrictMode -Version Latest; trap [Exception] { Write-Error -ErrorAction Continue $_; Read-Host "Press Enter to Exit"; break; } $ErrorActionPreference = "Stop";



$assemblies = (	"System", "System.Linq", ([System.Console].Assembly.Location) );
$cSharpSourceCode = @"
  using System; using System.Linq;
  public static class HelloWorld {
    public static void Main( string[] args = null ) {
      Console.WriteLine("Hello, World! Args=" + string.Join(" ",(args ?? new string[0]).Select(item => "\""+item+"\"")) + ".");
    }
    public static void SayHello( string[] args = null ){
      Console.WriteLine("Hello, World! Args=" + string.Join(" ",(args ?? new string[0]).Select(item => "\""+item+"\"")) + ".");
    }
  }
"@
Add-Type -Language CSharp -ReferencedAssemblies $assemblies -TypeDefinition $cSharpSourceCode;
[HelloWorld]::Main();
[HelloWorld]::Main(@("hi","you"));
[HelloWorld]::Main($args);
[HelloWorld]::SayHello();
[HelloWorld]::SayHello(@("hi","you"));
[HelloWorld]::SayHello($args);



Read-Host "Press Enter to exit.";
