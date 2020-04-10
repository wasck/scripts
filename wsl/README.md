# Script to prepare wsl

1. Install ubuntu from windows store
2. Open powershell
3. type:
    ```Bash
    ubuntu.exe
    ```
4. walk through wsl setup
5. Update ubuntu
    ```Bash
    sudo apt update && sudo apt upgrade -y && sudo apt install git -y
    ```
6. Get project
   ```Bash
   git clone https://github.com/wasck/scripts.git
   cd scripts/wsl
   chmod u+x ./prepareUbuntu.sh
   ./prepareUbuntu.sh
   ```