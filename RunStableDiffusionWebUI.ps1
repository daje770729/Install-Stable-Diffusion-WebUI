$DestPath = "D:\Derek\"
Set-Location -Path $DestPath

#################
# [Git]
if (!(Test-Path -Path (Join-Path $DestPath "\stable-diffusion-webui")))
{
    # Git clone
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
}

#################
# [Conda]

# Navigate to the git directory
Set-Location -Path (Join-Path $DestPath "\stable-diffusion-webui")
# Create environment
conda create -n StableDiffusion python=3.10.6
# Activate environment
conda activate StableDiffusion
# Validate environment is selected
conda env list
# Start local webserver
webui-user.bat
# Wait for "Running on local URL:  http://127.0.0.1:7860" and open that URI.

Read-Host -Prompt "Press Enter to exit"