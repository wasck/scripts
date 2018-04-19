# Windows setup script
# run as administrator

# Set your PowerShell execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force

# Install Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Install Chocolatey packages
choco install git.install -y
choco install conemu -y

# Permanently add C:\Program Files\Git\usr\bin to machine Path variable
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Git\usr\bin", "Machine")

# Creates profile if doesn't exist then edits it
if ( ! ( Test-Path -Path $PROFILE ) ) {
  New-Item -Path $PROFILE -ItemType File
}

Write-Output "`n`nSet-Alias ls Get-ChildItem-Color -option AllScope -Force" | Out-File $PROFILE -Append -encoding ASCII
Write-Output "Set-Alias ls Get-ChildItem-Color -option AllScope -Force" | Out-File $PROFILE -Append -encoding ASCII
Write-Output "Set-Alias dir Get-ChildItem-Color -option AllScope -Force" | Out-File $PROFILE -Append -encoding ASCII

Import-Module -Name posh-git
Start-SshAgent

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
