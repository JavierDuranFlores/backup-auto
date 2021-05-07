# Hace Backup de DB, poniendo como nombre la fecha y hora del dia en que se ejecuta 
export FECHA=`date +%d-%m-%Y_%H:%M:%S`
export NAME=backup_${FECHA}.dump
export DIR=/opt/backup
USER_DB=postgres
NAME_DB=ejerciosbd
cd $DIR
> ${NAME}
export PGPASSWORD=Duran2001
chmod 777 ${NAME}
echo "procesando la copia de la base de datos"
pg_dump -h localhost -p 5432 -U $USER_DB -F c -b -v -f ${NAME} $NAME_DB
echo "backup terminado"
 
#Elimina archivos mayor a un dia
find /opt/backup/*.dump -mtime +1 -exec rm {} \;
