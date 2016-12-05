source alias.sh
node 2
docker build -t myapp:1.1 .
manager
docker build -t myapp:1.1 .
docker service create --name myapp -p 80:80 myapp:1.1