Use o comando 'up.sh' ou 'run.sh' para baixar as imagens do docker e criar os containers necessários pra o PostgreSQL e PGAdmin(ambos na versão latest). Se executado do comando 'run.sh', será aberto o navegador Google Chrome na página do PGAdmin para a configuração inicial.
Será criado a pasta /home/docker/postgresql-data e /home/docker/pgadmin contendo os volumes dos containers do PostgreSQL e PGAdmin para manter as configurações e os bancos criados.

Na primeira conexão ao PGAdmin, deve ser alterado a configuração da conexão do servidor para(Guia 'Connection' de Add New Server):
    Hostname/address: postgresqlpgadminlatest_postgres-latest-compose_1
    Port: 5432
    Maintenance database: postgres
    Username: postgres
    Password: Postgres2020!
    Save password? SIM/marcar

Use o comando 'down.sh' para derrubar e remover os containers criados. As configurações e bancos criados serão persistidos por causa dos volumes criados em /home/docker.

Detalhes da criação dos containers e imagens do docker no arquivo 'docker-compose.yml'.
