docker run -d -v /var/www/html:/usr/local/apache2/htdocs --name amabri-httpd -p 80:80 lza/httpd
docker exec --rm -it amabri-httpd bash

