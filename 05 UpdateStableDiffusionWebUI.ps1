$DestPath = "D:\"

# Navigate to the git directory
Set-Location -Path (Join-Path $DestPath "\stable-diffusion-webui")
# Update Stable Diffusion
git pull

Read-Host -Prompt "Press Enter to exit"