$DestPath = "D:\"

# Navigate to the git directory
Set-Location -Path (Join-Path $DestPath "\stable-diffusion-webui")
# Start local webserver
.\webui-user.bat
# Wait for "Running on local URL:  http://127.0.0.1:7860" and open that URI.
