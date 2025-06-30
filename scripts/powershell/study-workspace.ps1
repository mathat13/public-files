
# FIREFOX
$firefoxpath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe\").'(default)'

start-process $firefoxpath


# VSCODE
# Assumes only one vscode installation on machine, there are 4 types though
$vscode = Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' |
    ForEach-Object { Get-ItemProperty $_.PSPath } |
    Where-Object { $_.DisplayName -like 'Microsoft Visual Studio Code' }

start-process $vscode.displayicon

# WSL
# works
function Test-App {
    param([string]$App)
    return [bool](Get-Command $App -ErrorAction SilentlyContinue)
}

if ((Test-App -App "ubuntu") -and (Test-App -App "wt")) {
    wt -- ubuntu
}
else {
    Write-Host "windows terminal or ubuntu not found, skipping."
}

# CHERRYTREE
# No displayicon path  in registry, possibly need to add path to shortcut created on start menu
# to registry as displayicon on each machine with cherrytree installed
# would work but not ideal as would probably have to check if shortcut exists before using...
# Maybe add key at install
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' |
    ForEach-Object { Get-ItemProperty $_.PSPath } |
    Where-Object { $_.DisplayName -like '*cherrytree*' } |
    Select-Object DisplayName, InstallLocation, DisplayIcon