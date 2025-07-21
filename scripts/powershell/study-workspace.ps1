# HELPER FUNCTIONS

function Get-ProgramRegistryKey {
    param (
        # Default value assigned to common locations to find registry keys with required executable locations
        [string[]] $RegistryPath = @(
                        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
                        'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall',
                        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\',
                        'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall'
                        ),
        # Can provide blank value to get the list of registry keys at given RegistryPath
        [string] $Name
    )

    foreach ($path in $RegistryPath) {
        if (test-path $path) {
            $regkeys = Get-ChildItem $path
            # Extract all properties of registry keys that contain the Name and store as registry key
            $regkeys | Where-Object {
                $values = (Get-ItemProperty $_.PSPath)
                # Check common registry values to store name of application
                $values.DisplayName -like "*$Name*" -or $values.'(default)' -like "*$Name*" }
        }
        else {Write-Host "Path: $path not found, skipping."}
    }
}

function Get-RegistryValue {
    # $(Get-ProgramRegistryKey -Name "Microsoft Visual Studio Code").Name gives full registry path, could possibly pass this here and link up both functions
    # Would need a path converter intermediate function to convert HKEY_LOCAL_MACHINE to HKLM: etc
    param (
        [String] $KeyString,
        [string] $Value
        )

        $registrykey = Get-Item $KeyString
        # Alternative to below:
        # $registrykey.PSPath | Get-ItemPropertyValue -Name $Value
        $(Get-ItemProperty $registrykey.PSPath).$Value
}

function Test-Command {
    param(
        [string] $Command
        )
    return [bool](Get-Command $Command -ErrorAction SilentlyContinue)
}

# FIREFOX
$firefoxpath = Get-RegistryValue -Key "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe" -Value '(default)'
start-process $firefoxpath -WindowStyle ([System.Diagnostics.ProcessWindowStyle]::Maximized)

# VSCODE
# Get registry paths for vscode installations
$vscodepath = Get-RegistryValue -Key "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{EA457B21-F73E-494C-ACAB-524FDE069978}_is1" -Value 'DisplayIcon'
start-process $vscodepath -WindowStyle ([System.Diagnostics.ProcessWindowStyle]::Maximized)

# WSL
# No decent registry values so have to resort to directly running wt command
if ((Test-Command -Command "ubuntu") -and (Test-Command -Command "wt")) {
    # Escape ; with backtick to allow wt to interpret backtick and powershell to skip
    # required for sequences of commands to run on same window created with initial command
    wt --maximized -p "Ubuntu" `; new-tab -p "Powershell" `; focus-tab -t 0
}
else {
    Write-Host "windows terminal or ubuntu not found, skipping."
}

# CHERRYTREE
# No displayicon path  in registry, possibly need to add path to shortcut created on start menu
# to registry as displayicon on each machine with cherrytree installed
# would work but not ideal as would probably have to check if shortcut exists before using...
# Maybe add key at install
# Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' |
#     ForEach-Object { Get-ItemProperty $_.PSPath } |
#     Where-Object { $_.Name -like '*cherrytree*' } |
#     Select-Object Name, InstallLocation, DisplayIcon

# $CurrentProcessID = [System.Diagnostics.Process]::GetCurrentProcess().ID
# stop-process $CurrentProcessID