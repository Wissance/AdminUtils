# set execution policy that allows to download & install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# install common packages
choco install chocolateygui -y
choco install 7zip -y
choco install adobereader -y
choco install firefox -y
choco install googlechrome -y --ignore-checksums
# install development software: python, go, ruby
choco install golang -y
choco install python -y
choco install ruby -y
# install database server
choco install postgresql13 --params '/Password:123' -y
choco install pgadmin4 -y
# install other tools
choco install nssm -y