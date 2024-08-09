# Используем базовый образ node:20.10.0-alpine
FROM node:20.10.0-alpine

# Устанавливаем необходимые пакеты
RUN apk add --no-cache \
    openssh \
    bash

# Создаем директорию для работы
WORKDIR /usr/src/app

# Открываем порт 22 для SSH
EXPOSE 22

# Настраиваем SSH
RUN mkdir /var/run/sshd && \
    ssh-keygen -A && \
    echo "root:Docker!" | chpasswd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Запускаем SSH демона
CMD ["/usr/sbin/sshd", "-D"]

# Remote-Containers: api-dev-crm
