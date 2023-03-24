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
Set-ItemProperty -Path 'HKCU:\Environment' -Name 'conda_script' -Value '%USERPROFILE%\anaconda3\Scripts'
Set-ItemProperty -Path 'HKCU:\Environment' -Name 'conda' -Value '%USERPROFILE%\anaconda3'
Set-ItemProperty -Path 'HKCU:\Environment' -Name 'conda_library' -Value '%USERPROFILE%\anaconda3\Library\bin'

Read-Host -Prompt "Press Enter to exit"
