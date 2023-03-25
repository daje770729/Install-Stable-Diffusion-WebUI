# Ensure to execute with administrator privileges
$currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator
$isAdmin = $currentUser.IsInRole($adminRole)
if (-not $isAdmin) {
    Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs
    exit
}

#################
# [Prerequisites]

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Install git
choco install git -y
# Install conda
choco install anaconda3 -y
# Add Anaconda3 to user enviment varible "Path"
$anacondaScriptsPath = "C:\tools\anaconda3\Scripts"
$anacondaHomePath = "C:\tools\anaconda3"
$anacondaLibraryBinPath = "C:\tools\anaconda3\Library\bin"
$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$newPath = "$currentPath;$anacondaScriptsPath;$anacondaHomePath;$anacondaLibraryBinPath"
[Environment]::SetEnvironmentVariable('Path', $newPath, 'User')

Read-Host -Prompt "Press Enter to exit"
