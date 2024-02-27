$dotnetPath = $Env:SystemDrive + "\'Program Files'\dotnet\"

Write-Host $dotnetPath
Set-ExecutionPolicy Bypass -Scope Process
Invoke-WebRequest -Uri https://dot.net/v1/dotnet-install.ps1 -OutFile "dotnet-install.ps1"
powershell ".\dotnet-install.ps1 -InstallDir $dotnetPath -Runtime dotnet -Version 6.0.27"