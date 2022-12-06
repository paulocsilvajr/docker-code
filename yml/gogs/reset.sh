read -p 'Este script apagará todos os dados dos repositórios da pasta data. Continuar[y/N]: ' confirmacao

case $confirmacao in
    y | yes | Y | YES | s | sim | S | SIM)
        docker-compose -p gogs down &&
            rm -vrf data
        ;;
    *)
        exit 0
        ;;
esac    
