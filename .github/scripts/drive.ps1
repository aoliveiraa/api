param (
    [Parameter()]
    [string]$BasePath
)

$ErrorActionPreference = "Stop"

$move = Start-Job -ScriptBlock {  
    Move-Item -Path $using:BasePath\Selenium -Destination C:\
}

Receive-Job $move

Start-Sleep -Seconds 20
