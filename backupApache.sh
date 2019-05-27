#!/bin/bash
#
#Programa para Realizar Backup em Ubuntu
#
#Pastas de Origem do Apache 2
dirServer=("/var/log/apache2" "/var/www")
#Copiar arquivos
dirConf=("/etc/apache2/apache2.conf" "/etc/apache2/conf-available" "/etc/apache2/conf-enabled")
#Array para trazer os arquivos e logs
fullPath=(${dirServer[@]} ${dirConf[@]})
#Pasta destino para salvar arquivo de backup
dirBkp="/backup"
#data e Hora para ser inserido no backup
data=$(date '+%d-%m-%y-%Hh%Mmin')
#Nomeação do backup
nameBkp="backup-$data.tar.gz"
#Controle da função Main
control=0
#
clear
#
#Script Main
Main(){
	if [ $control -eq 0 ]; then
		echo "Backup para Apache Debian e derivados "
		echo " "
		echo "Escolha uma opção "
		echo "Opcao 1 - Verificar pasta Backup"
		echo "Opcao 2 - Checar SO"
		echo "Opcao 3 - Realizar Backup"
		echo "Opcao 4 - Agendar Backup"
		echo "Opcao 5 - Restaurar Backup "
		echo "Opcao 6 - Sair"
		echo "Opção: "
		read opcao
	elif [ $control -eq 1 ]; then
		Main
	else 
		echo "Backup realizado com sucesso!"
		echo " "
		echo "Log inserido dentro da pasta /backup/ dentro da pasta home"
	fi
	case $opcao in
	1)CheckDirBkp; Main ;;
	2)checkDistro; Main ;;
	3)Backup; Main ;;
	4)Schedule; Main ;;
	5)Restore; Main ;;
	6)echo "Saindo..."; exit ;;
	*)echo "Opção Desconhecida"; Main ;;
	esac
}
checkDistro(){
	test -f /etc/lsb-release
	if [ $? != 0 ]; then
		echo "Sistema operacional Valido"
		sleep 1
		 Main
	else
		echo "Sistema Operacional Invalido"
		 Main
	fi
}
Backup(){
	echo "backup salvo com o nome $dirBkp/$nameBkp | caminho do backup disponível na raiz em /backup "
	sudo tar -czvf $dirBkp/$nameBkp ${fullPath[@]}
if [ $? -eq 0 ] ; then
 	echo "-----------------------------------"
 	echo "Backup Finalizado"
 	touch /backup/log-backup-$data.txt
 	echo "Backup FInalizado com excito" > /backup/log-backup-$data.txt
 	echo "Criado pelo usuario: $USER" > /backup/log-backup-$data.txt
 	echo "Backup realizado dia : $data" > /backup/log-backup-$data.txt
 	echo " "
 	echo "Arquivo de log do procimento gerado com nome final log-backup-$data.txt"
else
 	echo"Erro backup"
 	echo "Backup concluido com falhas " > /backup/log-backup-$data.txt
 	echo "Criado pelo usuario: $USER" > /backup/log-backup-$data.txt
 	echo "Backup realizado dia : $data" > /backup/log-backup-$data.txt
 	echo "arquivo com falhas de backup gerado com nome final de log-backup-$data.txt"
fi

}
Restore(){
	if [ -e "/backup" ]; then
		Backup
		ls /backup
        echo "Foi realizado um backup com dados atuais"
		echo "Backups atuais. Escolha um para recuperar inserindo data e hora"
		read bkpRestore
		/bin/tar -xpzf /backup/backup-$bkpRestore.tar.gz -C / 
	else
		echo "Nao ha backups"
	fi
}

#Verificação pasta Backup
CheckDirBkp(){
	if [ -e "/backup" ]; then
		echo "Diretorio existe"
	else
		echo "Criando diretorio Backup"
		mkdir /backup
	fi
}
Schedule(){
#Funcao para automatizar o Script de backup
	echo " "
    	echo "Agendamento do Backup Apache"
	echo " "
	read -p "Opcao a hora (0 a 23): " HORA
    	read -p "Opcao a minuto - 0 a 59: " MINUTO
    	read -p "Opcao a Dia do Mês - 1 a 31: " DIA
    	read -p "Opcao a Mês - 1 a 12: " MES
    	read -p "Opcao a Dia da Semana - 0 a 6 (0 é Domingo): " SEMANA
    	read -p "Opcao a Caminho do Script de Backup Automatico: " DIRETORIO
    	echo " "
	echo "$MINUTO $HORA $DIA $MES $SEMANA $DIRETORIO" >> /var/spool/cron/crontabs/root
}
Main
