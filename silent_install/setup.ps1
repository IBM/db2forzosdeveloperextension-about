# PowerShell Script to Install Visual Studio Code

### Custom variables

# InstallerPath - location of the installation files
$InstallerPath = "C:\Users\Administrator\Downloads"
# VSCodeInstallerName - file name of the VSCode Installer
$VSCodeInstallerName = "VSCodeUserSetup-x64-1.95.3.exe"
# VSCodeExtensionName - file name of the Developer Extension artifact
$VSCodeExtensionName = "db2forzosdeveloperextension-2.2.0.vsix"
# JccLicenseName - file name of the Db2z JCC driver license
$JccLicenseName = "db2jcc_license_cisuz.jar"
# VSCodeSettingsName - file name of the predefined VSCode settings
$VSCodeSettingsName = "settings.json"
# DevExtConnectionsName - file name of the predefined Developer Extension connections
$DevExtConnectionsName = "connections.json"
# DevExtTuningName - file name of the predefined Developer Extension tuning servers
$DevExtTuningName = "tuning_services_servers.json"
# DevExtTuningAssociationName - file name of the predefined Developer Extension tuning server associations
$DevExtTuningAssociationName = "tuning_associations.json"

# JccLicensePath - location to place the Db2z JCC driver license.
#                  Should match the location defined in settings for
#                    db2forzosdeveloperextension.db2sqlservice.dependencies
$JccLicensePath = "C:\Users\Administrator\Documents\lib"

### Script settings for logs

# LogLevel determines the level of logging for the script
$LogLevel = [LogLevel]::trace
# LogVerbose determines if the logs contain log level prefix
$LogVerbose = $true

### These variables shouldn't need to be changed

# Visual Studio Code storage location
$VSCodeStoragePath = [IO.Path]::Combine("$HOME", "AppData", "Roaming", "Code", "User")
$DevExtStoragePath = [IO.Path]::Combine($VSCodeStoragePath, "globalStorage", "ibm.db2forzosdeveloperextension")

enum LogLevel {
    none  = -1
    error = 0
    warn  = 1
    info  = 2
    debug = 3
    trace = 4
}

# Function to handle logging
function Log {
    param (
        [string[]] $Message = "",
        [LogLevel] $Level = [LogLevel]::info,
        [string] $Color = $null,
        [switch] $NoNullOrEmpty
    )

    $logblank = -not ($PSBoundParameters.ContainsKey('NoNullOrEmpty'))

    if ($Level -le $LogLevel -and ($Message -or $logblank)) {
        $prefix = ""
        $fcolor = "White"
        if ($LogVerbose) {
            switch ($Level) {
                ([LogLevel]::error) {
                    $prefix = "[ERROR] "
                    $fcolor = "Red"
                }
                ([LogLevel]::warn) {
                    $prefix = "[WARN] "
                    $fcolor = "Yellow"
                }
                ([LogLevel]::info) {
                    $prefix = "[INFO] "
                    $fcolor = "Green"
                }
                ([LogLevel]::debug) {
                    $prefix = "[DEBUG] "
                    $fcolor = "Gray"
                }
                ([LogLevel]::trace) {
                    $prefix = "[TRACE] "
                    $fcolor = "Cyan"
                }
            }
        }
        if ($Color) {
            $fcolor = $Color
        }
        Write-Host "$prefix$($Message -join "`n")" -ForegroundColor $fcolor
    }
}

# Function to refresh system PATH
function Refresh-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    Log -Level debug "System PATH refreshed."
}

# Function to get VS Code path
function Get-VSCodePath {
    $vscodePath = "C:\Program Files\Microsoft VS Code"
    $vscodeUserPath = "$HOME\AppData\Local\Programs\Microsoft VS Code"

    if (Test-Path $vscodePath) {
        return $vscodePath
    } elseif (Test-Path $vscodeUserPath) {
        return $vscodeUserPath
    } else {
        return $null
    }
}

# Function to install VS Code
function Install-VSCode {
    param (
        [Parameter(Mandatory)]
        [string] $InstallPath
    )

    if (Test-Path $InstallPath) {
        # Install VS Code silently
        Start-Process -FilePath $InstallPath -ArgumentList /SILENT,/MERGETASKS=!runcode -Wait -PassThru

        # VERYSILENT can remove the wizard from popping up
        # ref: https://jrsoftware.org/ishelp/index.php?topic=setupcmdline&anchor=VERYSILENT
        # Start-Process -FilePath $InstallPath -ArgumentList /VERYSILENT,/MERGETASKS=!runcode -Wait -PassThru

        Refresh-Path
    } else {
        Log -Level error "Could not find installer at '$InstallPath'."
        return $null
    }

    return Get-VSCodePath
}

# Function to check if VS Code is already installed
function Check-VSCodeExtensionInstalled {
    param (
        [Parameter(Mandatory)]
        [string] $ExtensionName
    )

    if (& "code" "--list-extensions" | Select-String $ExtensionName) {
        return $true
    } else {
        return $false
    }
}

# Function to install VS Code extension
function Install-VSCodeExtension {
    param (
        [Parameter(Mandatory)]
        [string] $InstallPath
    )

    if (Test-Path $InstallPath) {
        # Install the extension and mute any output or error
        Command "code" "--install-extension",$InstallPath > $null 2>&1
    } else {
        Log -Level error "Could not find extension at '$InstallPath'."
    }
}

# Function to log and run command
function Command {
    param (
        [Parameter(Mandatory, Position = 0)]
        [string] $Command,
        [Parameter(Mandatory, Position = 1)]
        [string[]] $ArgumentList
    )

    Log -Level none "> $Command $ArgumentList"
    try {
        $output = & $Command $ArgumentList
        if ($?) {
            Log -Level none -Color "Gray" $output -NoNullOrEmpty
            return $output
        } else {
            Log -Level none -Color "Red" $output -NoNullOrEmpty
            return $null
        }
    } catch {
        Log -Level none -Color "Red" $_ -NoNullOrEmpty
        return $null
    }
}

# Function to check path type
function Test-PathType {
    param (
        [Parameter(Mandatory)]
        [string] $Path
    )

    if ($Path.EndsWith("\")) {
        return "Directory"
    } elseif ([System.IO.Path]::HasExtension($path)) {
        return "File"
    } else {
        return "Unknown"
    }
}

# Function to copy file from source to destination
function Copy-File {
    param (
        [Parameter(Mandatory, Position = 0)]
        [string] $SourcePath,
        [Parameter(Mandatory, Position = 1)]
        [string] $DestinationPath,
        [switch] $MakeDir
    )

    $md = $PSBoundParameters.ContainsKey('MakeDir')

    if (-not (Test-Path $SourcePath)) {
        Log -Level error "ItemNotFoundException: Cannot find path '$SourcePath' because it does not exist."
        return $false
    }

    if ($md) {
        $parent = $DestinationPath
        if ((Test-PathType $parent) -eq "File") {
            $parent = Split-Path -Path $parent -Parent
        }
        if (-not (Test-Path $parent)) {
            New-Item -ItemType Directory -Path $parent -Force | Out-Null
        }
    }

    # Copy the source to the destination
    try {
        Copy-Item -Path $SourcePath -Destination $DestinationPath -Recurse -Force
        return $true
    } catch {
        Log -Level error "$($_.Exception.getType().FullName): $($_.Exception.Message)"
        return $false
    }
}

### Main script execution

if (Get-VSCodePath) {
    Log -Level warn "Visual Studio Code is already installed."
}

if ($VSCodeInstallerName) {
    $path = Join-Path -Path $InstallerPath -ChildPath $VSCodeInstallerName
    Log -Level trace "Installing Visual Studio Code from '$path'..."
    if (-not (Install-VSCode $path)) {
        Log -Level error "Failed to install Visual Studio Code."
        exit
    }
    Log "Installation of Visual Studio Code completed successfully."
    Log -Level debug "Installed at $(Get-VSCodePath)"
}

if (-not (Command "code" "--version")) {
    Log -Level error "Visual Studio Code 'code' command failed."
    exit
}

if (Check-VSCodeExtensionInstalled "ibm.db2forzosdeveloperextension") {
    Log -Level warn "VSCode Extension 'ibm.db2forzosdeveloperextension' is already installed."
}

$path = Join-Path -Path $InstallerPath -ChildPath $VSCodeExtensionName
Log -Level trace "Installing Db2z Developer Extension from '$path'..."
Install-VSCodeExtension $path
Log "Installation of Db2z Developer extension completed successfully."

if ($JccLicenseName) {
    $path = Join-Path -Path $InstallerPath -ChildPath $JccLicenseName
    Log -Level trace "Adding license from '$path' to '$JccLicensePath'..."
    if (Copy-File $path $JccLicensePath -MakeDir) {
        Log "Added license from '$path' to '$JccLicensePath'."
    } else {
        Log -Level error "Failed to copy license from '$path' to '$JccLicensePath'."
    }
}

if ($VSCodeSettingsName) {
    $sourcepath = Join-Path -Path $InstallerPath -ChildPath $VSCodeSettingsName
    $targetpath = Join-Path -Path $VSCodeStoragePath -ChildPath "settings.json"
    Log -Level trace "Adding settings to Visual Studio Code from '$sourcepath'..."
    if (Copy-File $sourcepath $targetpath) {
        Log "Added settings from '$sourcepath' to '$targetpath'."
    } else {
        Log -Level error "Failed to add settings from '$sourcepath' to '$targetpath'."
    }
}

if ($DevExtConnectionsName) {
    $sourcepath = Join-Path -Path $InstallerPath -ChildPath $DevExtConnectionsName
    $targetpath = Join-Path -Path $DevExtStoragePath -ChildPath "connections.json"
    Log -Level trace "Adding connections to Developer Extension from '$sourcepath'..."
    if (Copy-File $sourcepath $targetpath -MakeDir) {
        Log "Added connections from '$sourcepath' to '$targetpath'."
    } else {
        Log -Level error "Failed to add connections from '$sourcepath' to '$targetpath'."
    }
}

if ($DevExtTuningName) {
    $sourcepath = Join-Path -Path $InstallerPath -ChildPath $DevExtTuningName
    $targetpath = [IO.Path]::Combine($DevExtStoragePath, "tuning_services", "tuning_services_servers.json")
    Log -Level trace "Adding tuning servers to Developer Extension from '$sourcepath'..."
    if (Copy-File $sourcepath $targetpath -MakeDir) {
        Log "Added tuning servers from '$sourcepath' to '$targetpath'."
    } else {
        Log -Level error "Failed to add tuning servers from '$sourcepath' to '$targetpath'."
    }
}

if ($DevExtTuningAssociationName) {
    $sourcepath = Join-Path -Path $InstallerPath -ChildPath $DevExtTuningAssociationName
    $targetpath = [IO.Path]::Combine($DevExtStoragePath, "tuning_services", "tuning_associations.json")
    Log -Level trace "Adding tuning associations to Developer Extension from '$sourcepath'..."
    if (Copy-File $sourcepath $targetpath -MakeDir) {
        Log "Added tuning associations from '$sourcepath' to '$targetpath'."
    } else {
        Log -Level error "Failed to add tuning associations from '$sourcepath' to '$targetpath'."
    }
}
