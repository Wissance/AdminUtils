# set execution policy that allows to download & install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# install common packages
choco install chocolateygui -y
choco install 7zip -y
choco install adobereader -y
choco install foxitreader -y
choco install libreoffice-fresh -y
choco install firefox -y
choco install googlechrome -y --ignore-checksums
# install text editor
choco install notepadplusplus -y
# install graphical tools
choco install paint.net -y
choco install gimp -y
# admin tools
choco install putty.install -y
choco install winscp.install -y
choco install procexp -y
choco install procmon -y
choco install rufus -y