### Description
    This is a set of useful tools for administering Windows and Linux PC's & Servers
    All scripts were designed on our own taste therefore you could easily configure them on your own
 
### Windows Administrating Tools
    Before use utils we should enable powershell script execution:
    ```
    set-executionpolicy unrestricted
    ```

    This project have following utils:
    * install_common_tools.ps1 - powershell script for install bunch of commonly using (daily) sowfware
      See Youtube Video with installation process here: https://youtu.be/UDZ8ag1f0Kg
    * install_development_tools.ps1 - tools that commonly used for software develop (this script has one param - db password for postgres)
      and shoul be invoked like ./install_development_tools.ps1 123
