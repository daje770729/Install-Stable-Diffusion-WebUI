$DestPath = "D:\"
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

Read-Host -Prompt "Press Enter to exit"
