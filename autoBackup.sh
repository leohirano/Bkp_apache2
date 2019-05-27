#!/bin/bash
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
#criar pasta backup
sudo mkdir /backup
#Para compactar diretorio salvo
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