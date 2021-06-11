param (
    [Parameter()]
    [string]$BasePath
)

$ErrorActionPreference = "Stop"

& New-Item -Path C:\temp\Selenium -ItemType Directory

$move = Start-Job -ScriptBlock {  
    Move-Item -Path $using:BasePath\Selenium -Destination C:\Selenium
}

Receive-Job $move

Start-Sleep -Seconds 20
