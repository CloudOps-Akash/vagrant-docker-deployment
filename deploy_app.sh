sudo docker load -i web-app.tar
hname=$(hostname)
sudo docker run -d --hostname $hname -p 5555:80 web-app