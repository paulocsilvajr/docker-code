# Docker-compose para configurar um conteiner Nextcloud configurado com o banco de dados MariaDB, com volume em arquivo formatado como BTRFS e gerenciado via serviço do Systemd.

Este repositório cria um conteiner Docker do [NextCloud](https://nextcloud.com/), baseado nos modelos apresentados no [Docker Hub do NextCloud](https://hub.docker.com/_/nextcloud), e um conteiner MariaDB para o banco de dados. Para isolar o armazenamento, foi criado um arquivo formatado como BTRFS, com armazenamento de 20GiB. Esse arquivo é montado, por padrão, na pasta 'data' do diretório atual. Com o formato BTRFS do volume é possivel criar snapshots dos subvolumes 'db' e 'nextcloud'.

Nextcloud disponível em **https:\\localhost:8083** após sua montagem via docker-compose. Foi configurado o redirecionamento via Proxy Reverso do Nginx para disponibilizar o Nextcloud via HTTPS.

Para a primeira inicialização, deve-se criar o volume 'volume.img' com o script *create_volume_btrfs.sh*. Também deve-se criar os certificados(auto assinados) via script 'generate_certificate.sh'.

Deve-se usar os scripts *up.sh* e *down.sh* para inicializar e parar os serviços, porque estes montam e desmontam o volume virtual da imagem BTRFS em pasta *data*.

Foi criado scripts para usar esses conteineres como serviços do Systemd. Pare os conteineres com o script *down.sh* e use o script *generate_service.sh* para criar o serviço do sistema. Use o comando *systemctl*(start|status|stop) para gerenciar o servico **nextcloud-btrfs.service**.


## Arquivos
```
create_volume_btrfs.sh: Cria uma imagem com 20GiB de tamanho e formatado como BTRFS. Pode-se alterar o tamanho da imagem em variável TAMANHO deste script. Esse script deve ser executado antes de iniciar os serviços via docker-compose.

docker-compose.yml: docker-compose com a configuração dos serviços nextcloud-btrfs-db(define a configuração do banco de dados, com variável de ambiente para definir o usuário, senha e nome do banco), nextcloud-btrfs-app(define o conteiner para o Nextcloud, possui variáveis para comunicação com o BD) e nextcloud-btrfs-proxy(define o Reverse Proxy via Nginx e disponibiliza a aplicação na rota "https://localhost:8083")

up.sh: Inicia os serviços do banco de dados MariaDB e do NextCloud integrados. Também monta o volume BTRFS em pasta 'data'.

down.sh: Desmonta o volume BTRFS e finaliza os serviços citados acima.

mount_volume.sh e umount_volume.sh: Monta e desmonta o volume BTRFS de pasta 'data'. Scripts usados internamente pelos scripts up.sh e down.sh.

reconfigure_config.php.sh: Altera o arquivo de configuração './data/nextcloud/config/config.php' adicionando os atributos('overwritehost' e 'overwriteprotocol') que habilitam o redirecionamento
HTTPS via Nginx.

ps.sh: Lista os serviços associados ao docker-compose.yml, exibindo seu estado.

generate_service.sh: Script para gerar o serviço 'nextcloud-btrfs.service' para usar os conteineres
como um serviço do Systemd. Gera os arquivo 'nextcloud-btrfs_up.sh', 'nextcloud-btrfs_down.sh' e 'nextcloud-btrfs.service'.

remove_service.sh: Para e remove o serviço 'nextcloud-btrfs.service' do Systemd.

generate_certificate.sh: Gera os certificados para a conexão HTTPS na pasta 'conf.d'.

log_mariadb.sh, log_nextcloud.sh e log_proxy.sh: Exibe o log(últimas 30 linhas) dos serviços do NextCloud, MariaDB e Proxy do Nginx.

conf.d: Pasta com os arquivo de configuração do Nginx e os certificados usados no proxy reverso HTTPS.

data: Pasta usada como ponto de montagem da aplicação para o Nextcloud(nextcloud) e MariaDB(db). Somente existe enquanto os conteineres estão em execução. Ao pará-los com o script 'down.sh', o volume(./volume.img) é desmontado e é removido esta pasta.

nextcloud-btrfs_up.sh e nextcloud-btrfs_down.sh: Scripts criados via script 'generate_service.sh' e usados para iniciar e parar os serviços do docker via o serviço do Systemd associado ao arquivo 'nextcloud-btrfs.service'.

.gitignore: arquivo com as excessões para o git.

fontes.txt: links associados a esse projeto. Links com projetos base para esse projeto.
```
