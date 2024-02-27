# AdminUtils

![Admin utils: automate your administration routines](/img/cover.png)

`AdminUtils` is a set of ***command line*** utils that helps to automate some routine operations in servers and workstations management.

## 1. Linux Utilities
This set of tools is located in the `linux` directory, we have following sub directories:
* `raspberrypi` - utilities for `Raspberry Pi` micro PC (directory `/linux/raspberrypi`);
* `ubuntu` - utilities for `Ubuntu` machines (directory `/linux/ubuntu`).

### 1.1 Ubuntu
We have the following utilities:
* `/linux/ubuntu/infra_4_java_monolitic_app.sh` tools that prepare pure VM for deploy `Java`
  monolitic application that contains (**MUST** be run with `sudo`):
    - `JDK` (`18`)
    - `Nodejs` (`16`) and `npm`
    - `Postgresql`
    - `Keycloak` (`19.0.3`)
    - `Elasticsearch`
  Just run and wait. `Keycloak` is installing in directory that passed as `$1`, or used 
  default - `/usr/local/sbin/keycloak`.

  If we would like to install `keycloak` in directory `/opt/apps`: 
  `sudo ./infra_4_java_monolitic_app.sh /opt/apps`
  
### 1.2 RaspberryPi
Currently we have one script but it insignificant (work on it will be continued)

## 2. Windows Utilities
### 2.1 Utilities to build Choco packages
For Create NEW Chocolatey package depends on .Net Framework we have to install it in `chocolateyinstall.ps1`, for this purpose we create following scripts:
* `/windows/net6_installer.ps1` install `net6` runtime on target machine

### 2.2 Utilities based on Choco packages
This set of tool is located in the `windows` directory 
Here we have the following tools for fast pure system initialization:
* `/windows/install_common_tools.ps1` contains **common (daily) software**:
   - `chocolateygui`
   - `7zip`
   - `adobereader`
   - `foxitreader`
   - `libreoffice-fresh`
   - `firefox`
   - `googlechrome`
   - `notepadplusplus`
   - `paint.net`
   - `gimp`
   - `putty`
   - `winscp`
   - `procexp`
   - `procmon`
   - `rufus`
* `/windows/install_development_tools.ps1` contains **development tools for windows** machine:
   - `golang`
   - `python`
   - `ruby`
   - `postgresql13`
   - `pgadmin4`
   - `mysql`
   - `mysql.workbench`
   - `sqlite`
   - `nssm`
   This script has one parameter (`$1`) that specify `Postgresql` password
   to set PostgreSql postgre user password to `123` run: `./install_development_tools.ps1 123` 
* `/windows/install_engineering_tools.ps1` contains **development tools for elecric engineer (`pcb`, `simulation`, `logic`, `fpga`):
   - `kicad` - PCB design
   - `QElectroTech 0.90.7758` - tool that helps to draw schematics
   - `SimulIDE` simulate electrical circuits work
   - `Logisim Evolution 3.8.0` - digital logic simulator
   - `Icarus Verilog 11.0` - verilog simulator
**Before use utils we should enable powershell script execution**:
```ps1
set-executionpolicy unrestricted
```

## CONCLUSION
See Youtube Video with installation process here: https://youtu.be/UDZ8ag1f0Kg

