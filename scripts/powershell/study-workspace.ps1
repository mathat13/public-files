
# FIREFOX
$firefoxpath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe\").'(default)'

start-process $firefoxpath

# VSCODE
# Get registry paths for vscode installations
$vscode = Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' |
    ForEach-Object { Get-ItemProperty $_.PSPath } |
    Where-Object { $_.DisplayName -like 'Microsoft Visual Studio Code' }

# Executes if only one installation present on machine, skips otherwise.
if ( $vscode -isnot [Array] ) {
    start-process $vscode.displayicon
}
else {
    write-host "Multiple VSCode installations present on machine, skipping."
}

# WSL
# works
function Test-Command {
    param([string]$Command)
    return [bool](Get-Command $Command -ErrorAction SilentlyContinue)
}

if ((Test-Command -Command "ubuntu") -and (Test-Command -Command "wt")) {
    wt --maximized -- ubuntu
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