git add --all
git commit -m "$(date +%F)"
git pull dockers master
git push dockers master
#git push origin master
