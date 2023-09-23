# i am using ubuntu latestttttt
FROM kitty6xt5/newmain1

# installing our ssh services and updating our apt's
RUN apt update && apt install openssh-server -y


# Exposing  the SSH port here.
EXPOSE 22

# here i can set the  environment variables for username and password
ENV SSH_USERNAME=default_user
ENV SSH_PASSWORD=default_password


CMD useradd -m -s /bin/bash $SSH_USERNAME && \
    echo "$SSH_USERNAME:$SSH_PASSWORD" | chpasswd && \
    /usr/sbin/sshd -D


