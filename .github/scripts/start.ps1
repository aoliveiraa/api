param (
    [Parameter()]
    [string]$BasePath
)

$ErrorActionPreference = "Stop"

#start dotnet application
$dotnet = Start-Job -ScriptBlock {
    dotnet run $using:BasePath/src/ApiReservas
}

Start-Sleep -Seconds 10

Receive-Job $dotnet
