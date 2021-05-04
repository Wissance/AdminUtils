# This script was developed by Wissance LLC (M. Ushakov)
# It must be running in Adminstarotor mode
# set execution policy that allows to download & install
$db_password = $args[0]
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# install development software: python, go, ruby
choco install golang -y
choco install python -y
choco install ruby -y
# install database server
choco install postgresql13 --params '/Password:$db_password' -y
choco install pgadmin4 -y
choco install mysql -y
choco install mysql.workbench -y
choco install sqlite -y
# install other tools
choco install nssm -y