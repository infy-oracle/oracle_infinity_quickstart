

# Getting DB

## SSH into instance
ssh -i YOURKEY_W_PATH opc@[INSTANCE_IP]

## Get DB username/password
docker exec opc_db_1 env

## SSH into docker container and grab stuf
docker exec -it opc_db_1 /bin/bash

## Dump DB
mysqldump -uMYSQL_USER -p'MYSQL_PASSWORD' MYSQL_DATABASE > db-backup.sql --no-tablespaces
exit

## Copy to instance
docker cp opc_db_1:db-backup.sql .


# Getting wp content

## SSH into docker container and grab stuff
docker exec -it opc_wordpress_1 /bin/bash

## Zip content
tar cvzf wp-content.tar.gz wp-content
exit

## Copy to instance
docker cp opc_wordpress_1:wp-content.tar.gz .

# Exit and copy to local machine
exit
scp -i YOURKEY_W_PATH opc@[INSTANCE_IP]:wp-content.tar.gz PATH_ON_LOCAL_MACHINE
scp -i YOURKEY_W_PATH opc@[INSTANCE_IP]:db-backup.sql PATH_ON_LOCAL_MACHINE

# DONE!

result=`echo "http://12345" | sed "s/http/abc/g"`
echo $result