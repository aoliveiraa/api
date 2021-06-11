param (
    [Parameter()]
    [string]$BasePath
)

$ErrorActionPreference = "Stop"

Move-Item -Path $using:BasePath\Selenium -Destination C:\

Start-Sleep -Seconds 20
