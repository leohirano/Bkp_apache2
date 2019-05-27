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

`${package.json.version}` 
  - Import a HTML file and watch it magically convert to Markdown
  - Drag and drop images (requires your Dropbox account be linked)



