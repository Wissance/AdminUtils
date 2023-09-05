# This script was developed by Wissance LLC (M. Ushakov)
# It must be running in Adminstarotor mode
# set execution policy that allows to download & install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# install graphic board design tools
choco install kicad -y
# tools that helps to draw schemes
choco install qet -y
# simulation tools
# located in C:\ProgramData\chocolatey\lib\simulide\tools\SimulIDE_0.3.10-SR2-Win32\bin
choco install simulide -y
# logic simulator
choco install logisim-evolution -y
# icarus verilog: simulator
choco install iverilog -y

