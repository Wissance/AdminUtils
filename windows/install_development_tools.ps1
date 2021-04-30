# set execution policy that allows to download & install
db_password = 
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# install development software: python, go, ruby
choco install golang -y
choco install python -y
choco install ruby -y
# install database server
choco install postgresql13 --params '/Password:123' -y
choco install pgadmin4 -y
# install other tools
choco install nssm -y