#!/bin/bash

cls=clear


pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

menu()
{ 
    echo "  ####        ####        #######       ####################"
    echo "  ####        ####      ##########      ####################"
    echo "  ####        ####     ####    ####             ####"
    echo "  ####        ####    ####      ####            ####"
    echo "  ################   ################           ####"
    echo "  ################   ################           ####"
    echo "  ####        ####   ####        ####           ####"
    echo "  ####        ####   ####        ####           ####"
    echo "  ####        ####   ####        ####           ####"
    echo "  ####        ####   ####        ####           ####"
    echo "  ####        ####   ####        ####           ####"
    echo ""
    echo "############################################################"
    echo "#######################  SORTING HAT  ######################"
    echo "############################################################"
    echo "------------------- Software Install Dev -------------------"
    echo "############################################################"
    echo "################# V0.1  Install for Debian #################"
    echo "************************************************************"

    echo ".:::::::::::: MENU ::::::::::::."
    echo "********************************"
    echo "help"
    echo "about"
    echo "exit"
    echo ">> Type the Command or Packager:" 
}

about()
{
    echo "11111111111111111111111111111111"
    echo "00000000000000000000000000000000"
    echo "1111 Dev Euclides Freire 1111111"
    echo "00000000000000000000000000000000"
    echo "11 euclidesfreiresa@gmail.com 11"
    echo "00000000000000000000000000000000"
    echo "1111 github @euclidesfreire 1111"
    echo "00000000000000000000000000000000"

    echo "--------------------------------"
    echo "Version 0.1 - Install for Debian"
    echo "--------------------------------"
    echo "Software para automatização de "
    echo "tarefas, focado em DevOps."
    echo "-------------------------------0"

    pause
}

help()
{
    echo ".:: Execution Command ::."
    echo "*************************"
    echo "[option]"
    echo "help              Option & Packages"
    echo "about             About Sorting Hat"
    echo "exit              exit Sorting Hat"
    echo "-------------------------"
    echo "install [Package]"
    echo "Composer          Package Composer"
    echo "Curl              Package command Curl"
    echo "driverWireless    Command for Install Driver Wireless"
    echo "Docker            Package Docker"
    echo "Git               Package Git"
    echo "GitFlow           Package Git-Flow"
    echo "Laravel           Package Laravel"
    echo "PHP               Package PHP"

    pause

}

#return "1" installed
verifyPackageInstalled()
{
    package=$1
    bool=0

    verify=$(dpkg --get-selections | grep "$package" )

    if [ -n "$verify" ];then 
         bool=1        
    fi

    return $[ $bool ]

}

installPhp()
{
    sudo apt-get install php

    #Dependências para phpmyadmin
    sudo apt-get install php-curl php-gd php-bz2 php-tcpdf
    sudo apt -t buster-backports install php-twig
    
    sudo apt-get install phpmyadmin
}

installComposer()
{
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e5325b19b381bfd88ce90a5ddb7823406b2a38cff6bb704b0acc289a09c8128d4a8ce2bbafcd1fcbdc38666422fe2806') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php --filename=composer

    #Transferir Composer para bin do user para executar pelo $PATH
    mv composer /usr/bin
    mv composer-setup.php /usr/bin
}

installDockerCompose()
{
    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

}

InstallCurl()
{
    sudo apt-get install curl
}

installDocker()
{
    #Install HTTPS
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common

    #Add Docker’s official GPG key
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

    #INSTALL DOCKER ENGINE
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
}

installDriverWireless()
{
    echo "Saber qual é a sua placa de rede: "
    echo "Para placas internas: lspci"
    echo "Para placas externas: lsusb"
    echo "Command para instalar: sudo apt install 'name firmware'"
    echo "Names firmware: firmware-ralink firmware-atheros firmware-realtek firmware-iwlwifi firmware-b43-installer firmware-b43legacy-installer atmel-firmware  firmware-brcm80211 firmware-ipw2x00 firmware-libertas libertas-firmware zd1211-firmware"
    pause
}

installLaravel()
{
    composer global require laravel/installer

    echo "******************"
    echo ""
    echo "[DEBIAN] Éxecute os seguintes passos no terminal: "
    echo "1. nano ~/.bashrc"
    echo "2. No final do arquivo, adicione o seguinte código abaixo:"
    echo 'export PATH:"$PATH:$HOME/.config/composer/vendor/bin"'
    echo "3. source ~/.bashrc"

    pause
}

installGit()
{
    #Updtade 
    sudo apt-get update

    #install git
    sudo apt-get install git

    #verify install
    git --version

    pause

    #configure
    echo "Type the first user.name git:"
    read firstName
    echo "Type the last user.name git:"
    read lastName
    git config --global user.name "$firstName $lastName" 
    echo "Type the user.email git:"
    read email
    git config --global user.name "$email" 
    
}

installGitFlow()
{
    sudo apt-get install git-flow
}

installWordpress()
{   
     echo teste
}

verifyCommandsMain()
{
    #Command
    comm=$1

    bool=0

    commandsMainArray=( "install" )

    for i in "${commandsMainArray[@]}"; do 
    
        if [ "$i" == "$comm" ]; then
            bool=1
        fi
    
    done

    return $[ $bool ]
}

verifyCommandsSecond()
{
    #Command
    comm=$1

    bool=0

    commandsSecondArray=( "php" "composer" "curl" "docker" "dockerCompose" "driverWireless" "laravel" "git" "gitFlow" "wordpress")

    for i in "${commandsSecondArray[@]}"; do 
    
        if [ "$i" == "$comm" ]; then
            bool=1
            break
        fi
    
    done

    return $[ $bool ]
}

runCommand()
{
    commandMain=$1
    commandSecond=$2

    #Verify if Package is installed 
    #verifyPackageInstalled $commandSecond

     #if [ "$?" -eq "0" ]; then

        #apt update & upgrade
        sudo apt update
        sudo apt upgrade

        #montar código para commando com mesmo nome da função
        command=${commandSecond:0:1}
        command=$commandMain${command^^}${commandSecond:1}

        $command

        echo "$commandSecond Successfully installed!"

        pause

        #else

            #echo "Package is already Installed"

            #pause

    #fi


}

#FUNCTION MAIN COMMAND
commands()
{          

    #ARRAY STRING
    commandsString=( $1 $2 )

    #Call Function verifyCommandsMain
    verifyCommandsMain ${commandsString[0]}

    #verify main command
    if [ "$?" -eq "1" ]; then
        verifyCommandsSecond ${commandsString[1]}

        #verify second command 
        if [ "$?" -eq "1" ]; then

            #Rum command 
            runCommand ${commandsString[0]} ${commandsString[1]}

            else
                echo Not Command ${commandsString[1]}
                pause
        fi

        else
             echo Not Command ${commandsString[0]}
             pause
    fi
}

main()
{
    input="op"

    while [ "$input" != "exit" ]
    do
        $cls
        menu 
        read input

        case $input in
            "help")
                help
                ;;
            "exit")
                input="exit"
                ;;
            "about")
                about
                ;;
            *)
                commands $input
                ;;
        esac

    done
}

#Rum Main
main