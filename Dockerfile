# i am using ubuntu latestttttt
FROM ubuntu:latest

# installing our ssh services and updating our apt's
RUN apt update 
RUN apt install openssh-server -y
RUN service ssh start


# Exposing  the SSH port here.
EXPOSE 22

# here i can set the  environment variables for username and password
ENV SSH_USERNAME=default_user
ENV SSH_PASSWORD=default_password


CMD useradd -m -s /bin/bash $SSH_USERNAME && \
    echo "$SSH_USERNAME:$SSH_PASSWORD" | chpasswd && \
    /usr/sbin/sshd -D


