$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path C:\output.txt -Append
choco feature enable -n=allowGlobalConfirmation
choco upgrade all
Stop-Transcript