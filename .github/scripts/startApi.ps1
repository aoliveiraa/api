param (
    [Parameter()]
    [string]$BasePath
)

$ErrorActionPreference = "Stop"

& npm install selenium

Start-Sleep -Seconds 20

& npm install install chromedriver

Start-Sleep -Seconds 20

& npm install selenium-chromedriver

Start-Sleep -Seconds 20

#start dotnet application
$dotnet = Start-Job -ScriptBlock {
    Get-ChildItem $using:BasePath\publish\*.exe | ForEach { & $_.FullName }
}

Start-Sleep -Seconds 10

Receive-Job $dotnet

#start server 
$server = Start-Job -ScriptBlock {
    cd $using:BasePath\opentest\server
    opentest server
}

Start-Sleep -Seconds 15

Receive-Job $server

#start actor 
$actor = Start-Job -ScriptBlock {
    cd $using:BasePath\opentest\actor-web
    opentest actor
}

Start-Sleep -Seconds 15

Receive-Job $actor

New-Item "$BasePath\test-results" -ItemType Directory
& opentest session create --template "Call API Template" --wait --out $BasePath\test-results\junit.xml

exit 0
