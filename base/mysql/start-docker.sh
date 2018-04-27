echo "start mysql container!!!"
#docker run --name mysql -dit -p 3306:3306 -v /data/mysql:/var/lib/mysql  mariadb bash
docker run -v /data/mysql/data:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=centos --name mysql -d mariadb:latest
echo "into mariadb container!!!"
docker  exec -it mysql bash
