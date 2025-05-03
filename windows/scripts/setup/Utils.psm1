function Get-Intent {
    $confirmation = Read-Host "Are you sure you want to run this script? It could mess up your system (y or n)"
    
    if ($confirmation -ne 'y') {
        Write-Host "Script will close without running... `n" -ForegroundColor Red
        exit
    }
}

# Check if the shell has Admin privileges
function Confirm-AdminPrivileges {  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    return (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}

# Restart as admin if shell isn't already
function Grant-AdminPrivileges {
    Write-Host "Ensuring shell has admin privileges..."
    if (!(Confirm-AdminPrivileges)) {
        Write-Host "Admin privileges are not enabled for this shell. Please launch the script from an admin window. `n" -ForegroundColor Yellow
        exit
        
        # Relaunch script in elevated shell
        Write-Host "Admin privileges were not found. Attempting to re-launch script in admin shell..." -ForegroundColor Yellow
        $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
        $newProcess.Arguments = $myInvocation.MyCommand.Definition;
        $newProcess.Verb = "runas";
        [System.Diagnostics.Process]::Start($newProcess);
        
        exit
    }
}

function Test-InternetConnection {
    return Test-Connection www.google.com -Quiet
}

function Restart-PowerShell {
    if ((Get-PSHostProcessInfo).ProcessName.Contains('powershell_ise')) {
        Start-Process 'powershell_ise.exe'
    }
    else {
        Start-Process 'powershell.exe'
    }
    exit
}

function Find-Directory {
    param(
        [Parameter(Mandatory)]
        [string]$Path,
        
        [Parameter(Mandatory)]
        [string]$Regex
    )

    return Get-ChildItem -Path $Path -Directory | Where-Object { $_.Name -match $Regex } | ForEach-Object { $_.FullName } 
}
