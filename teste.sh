#!/bin/bash
pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

echo "******************"
    echo ""
    echo "[DEBIAN] Éxecute os seguintes passos no terminal: "
    echo "1. nano ~/.bashrc"
    echo "2. No final do arquivo, adicione o seguinte código abaixo:"
    echo 'export PATH:"$PATH:$HOME/.config/composer/vendor/bin"'
    echo "3. source ~/.bashrc"