# Backup Automático APACHE 2 

[![N|Apache](https://logodownload.org/wp-content/uploads/2018/03/apache-logo.png)](https://www.apache.org/)


Esse script é uma ferramenta útil para criação e agendamento de backups de servidores Apache de servidores Linux Debian Like

  - Crie Backups
  - Agende Backups
  - Restore Backups
  
# Arquivos

Baixe os arquivos diretamente como ZIP ou realize um clone.
Dentro dele terá o README (esse texto :) para lhe dar intruções) um script principal de execução manual e um secundário. 

Esse secundário deve ser apontando quando a opção 5 Agendar Backup for escolhida. Pois esse script será responsável pelo Backup.

# Execução

**DETALHE : PARA EXECUÇÃO OBRIGATÓRIO TER PERMISSÕES DE ROOT**

Para execução execute o seguinte comando.

```sh
chmod 755
./Bkp_apache2/backupApache.sh
```
O primeiro é permitir permissão de execução ao arquivo. 

E o segundo comando aponta para o diretório e executa o script proriamente dito


## Menu Opções

O menu de opções permite a execução das seguintes atividades :

```sh
echo "Backup para Apache Debian e derivados "
		echo " "
		echo "Escolha uma opção "
		echo "Opcao 1 - Verificar pasta Backup"
		echo "Opcao 2 - Checar SO"
		echo "Opcao 3 - Realizar Backup"
		echo "Opcao 4 - Agendar Backup"
		echo "Opcao 5 - Restaurar Backup "
		echo "Opcao 6 - Sair"
```
  - 1- A primeira opção permite Verificar se o diretório de backups (/backup) já existe
  - 2- A segunda verifica se seu S.O é válido para execução 
  - 3- Realiza Backup
  - 4 - Agenda o Backup (com a necessidade de apontar o diretório)
  - 5 Restaura Backuo
  - 6 - Encerra a aplicação
  
##Restaurar Backup

Para restauração do backup é necessário somente inserir, data e hora. Exemplo : 

`26-04-19-22h33min` 

As demais informações são tratadas automaticamente, inserir outro caractere irá impedir a execução.

## Agendamento de Backup

Para realizar o agendamento de backup será realizado perguntas sobre que horário deve ser feito o backup.

Todos agendamentos são inseridos no cron que pode ser visualizado com o comando : 

```sh
crontab -l
```

E sua remoção é manual.


### Fim

É uma aplicação para uma avaliação de faculdade mas pode ajudar alguém algum dia .

:)
