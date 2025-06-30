# Sync required files with the Network Directory.
Function Push-Files {
    Param(
        [string] $RemoteServerIP = "192.168.1.53",
        [string] $CSVPath,
        [switch] $NetworkTest
    )

    Begin {
        if ($NetworkTest) {
            # Test if computer is able to connect to remote server, maybe can be expanded if multiple servers are pushed to
            $testConnection = Test-NetConnection $RemoteServerIP -WarningAction SilentlyContinue

            If ($testConnection.pingSucceeded) {
                Write-Host "Remote server ($RemoteServerIP) found."
            }

            Else{
                Write-Host "Remote server ($RemoteServerIP) not reachable by host, ending execution."
                return
            }
        }

        # If a path to a CSV is defined
        if ($CSVPath) {
            if (Test-Path $CSVPath) {
                $Files = Import-CSV -Path $CSVPath
            }

            else {
                Write-Warning "CSV file not found: $CSVPath, falling back to built-in push files."
                $Files = @(
                [PSCustomObject] @{ Local = "$env:USERPROFILE\Documents\cherrytree\cherrytree.ctb"; Remote = "\\$RemoteServerIP\synced_files\cherrytree\cherrytree.ctb"},
                [PSCustomObject] @{ Local = "$env:USERPROFILE\Documents\keepass\Database.kdbx"; Remote = "\\$RemoteServerIP\synced_files\keepass\Database.kbdx"},
                [PSCustomObject] @{ Local = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"; Remote = "\\$RemoteServerIP\synced_files\powershell\Microsoft.PowerShell_profile.ps1"}
                )
            }
        }

        else {
            $Files = @(
                [PSCustomObject] @{ Local = "$env:USERPROFILE\Documents\cherrytree\cherrytree.ctb"; Remote = "\\$RemoteServerIP\synced_files\cherrytree\cherrytree.ctb"},
                [PSCustomObject] @{ Local = "$env:USERPROFILE\Documents\keepass\Database.kdbx"; Remote = "\\$RemoteServerIP\synced_files\keepass\Database.kbdx"},
                [PSCustomObject] @{ Local = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"; Remote = "\\$RemoteServerIP\synced_files\powershell\Microsoft.PowerShell_profile.ps1"}
            )
        }
    }

    Process {
        ForEach ($File in $Files) {
            # Check if files exist locally and on server
            if (Test-Path $File.Local) {
                $localPath = Get-Item $File.Local
            }
            
            else {
                Write-Warning "Local file not found: $($File.Local), skipping."
                continue
            }

            if (Test-Path $File.Remote) {
                $remotePath = Get-Item $File.Remote
            }

            else {
                Write-Warning "Remote file not found or inaccessible: $($File.Remote), skipping."
                continue
            }

            # Find last write time of each file
            $localTime = $localPath.LastWriteTime
            $remoteTime = $RemotePath.LastWriteTime
            
            # Compare modify times and push local file if it has been modified more recently than the server file
            if ($localTime -gt $remoteTime) {
                Copy-Item -Path $localPath -Destination $remotePath
                Write-Host "Pushed $($localPath.Name) to server."
            }

            else {
                Write-Host "Skipped $($localPath.Name), version on server is more recent."
            }
        }
    }

    End {
        Write-Host "Push execution completed successfully!"
    }
}

#TODO:
# Add WhatIf functionality
# Integrate Pull-Files
# Refactor
#





    }
    Copy-Item $env:USERPROFILE\Documents\cherrytree\cherrytree.ctb \\192.168.1.53\synced_files\cherrytree\cherrytree.ctb
    Write-Host "Synced cherrytree.ctb"
    Copy-Item $env:USERPROFILE\Documents\keepass\Database.kdbx \\192.168.1.53\synced_files\keepass\Database.kbdx
    Write-Host "Synced Keepass database."
    Copy-Item $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 \\192.168.1.53\synced_files\powershell\Microsoft.PowerShell_profile.ps1
    Write-Host "Synced powershell profile."
}

Function Pull-Files {
    Param()
    Copy-Item \\192.168.1.53\synced_files\cherrytree\cherrytree.ctb $env:USERPROFILE\Documents\cherrytree\cherrytree.ctb
    Write-Host "Synced cherrytree.ctb"
    Copy-Item \\192.168.1.53\synced_files\keepass\Database.kbdx $env:USERPROFILE\Documents\keepass\Database.kdbx
    Write-Host "Synced Keepass database."
    Copy-Item \\192.168.1.53\synced_files\powershell\Microsoft.PowerShell_profile.ps1 $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
    Write-Host "Synced powershell profile."
}