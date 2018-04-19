echo "start python container!!!"
docker run --name python -dit -p 80:80 -v /data/python2.7/app2:/app  lza/python
echo "into python container!!!"
docker  exec -it python bash
