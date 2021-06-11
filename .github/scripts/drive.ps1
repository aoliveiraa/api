param (
    [Parameter()]
    [string]$BasePath
)

$ErrorActionPreference = "Stop"

& npm install chrome-browser

Start-Sleep -Seconds 30

$move = Start-Job -ScriptBlock {  
    Move-Item -Path $using:BasePath\Selenium -Destination C:\Selenium
}

Receive-Job $move

Start-Sleep -Seconds 20
