# Estrutura de exemplo para criação de APIs

## Execução via docker:

1. Executar o seguinte comando dentro da pasta raiz do projeto:
```shell
docker-compose up -d
```

2. Obter o ID do container através do comando:
```shell
docker ps
```

3. Acessar o container através do comando:
```shell
docker exec -it <CONTAINERID> bash
```

4. Executar o comando desejado no terminal (rails s, rspec, etc);

## Execução sem docker:

1. Exportar variáveis de ambiente que estão no arquivo .env;
2. Executar o comando desejado no terminal (rails s, rspec, etc);

