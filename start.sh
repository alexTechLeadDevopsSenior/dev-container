# docker-compose restart
# ssh-copy-id -p 2222 root@localhost
docker-compose down
docker system prune -f
docker-compose up -d
# docker-compose up --build


# ssh -o StrictHostKeyChecking=no root@localhost -p 2222