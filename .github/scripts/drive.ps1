param (
    [Parameter()]
    [string]$BasePath
)

$ErrorActionPreference = "Stop"

$Path = $env:TEMP; $Installer = "chrome_installer.exe"; Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; Remove-Item $Path\$Installer

Start-Sleep -Seconds 30

$move = Start-Job -ScriptBlock {  
    Move-Item -Path $using:BasePath\Selenium -Destination C:\Selenium
}

Receive-Job $move

Start-Sleep -Seconds 20
