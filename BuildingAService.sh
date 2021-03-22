#Get Twisted, and Klein and Redis modules for Python.
sudo pip3 install twisted
sudo pip3 install klein
sudo pip3 install redis

#Install Redis and start up the server.
wget http://download.redis.io/releases/redis-2.8.7.tar.gz
tar xzf redis-2.8.7.tar.gz
cd redis-2.8.7
make
./src/redis-server &

#Start the web service.
twistd -noy hello.py &

#Test the web service with user id “37”:
curl localhost:7080/37

#Test the web service with user id “100”:
curl localhost:7080/100