param (
    [Parameter()]
    [string]$BasePath
)

$ErrorActionPreference = "Stop"


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

#start test 
$test = Start-Job -ScriptBlock {
    opentest session create --template "Call API Template" --wait --out junit.xml
}

Start-Sleep -Seconds 15

Receive-Job $test

exit 0
