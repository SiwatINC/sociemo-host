FROM siwatinc/java-base-image
WORKDIR /config
RUN apt-get update && apt-get -y install mariadb-server screen openssh-server openssh-sftp-server && (echo "PermitRootLogin yes" >> /etc/ssh/sshd_config)
RUN timeout 30s mysqld_safe || :
EXPOSE 22
EXPOSE 8080
CMD (screen -d -m mysqld) && service ssh start && cd /config && (/config/initialize.sh || true) && (java -jar /config/sociemoapp.jar || true) && tail -f /dev/null
