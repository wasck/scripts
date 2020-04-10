# Script to prepare wsl

1. Install ubuntu from windows store
2. Open powershell
3. Open ubuntu from command line:
    ```Bash
    ubuntu.exe
    ```
4. Walk through wsl setup
5. Update ubuntu
    ```Bash
    sudo apt update && sudo apt upgrade -y && sudo apt install git -y
    ```
6. Get project
   ```Bash
   git clone https://github.com/wasck/scripts.git
   cd scripts/wsl
   ```
7. Execute script
   ```Bash
   chmod u+x ./prepareUbuntu.sh
   ./prepareUbuntu.sh
   ```