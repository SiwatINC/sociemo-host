FROM siwatinc/java-base-image
WORKDIR /config
RUN apt-get update && apt-get -y install mariadb-server screen
RUN timeout 30s mysqld_safe || :
CMD (screen -d -m mysqld) && cd /config && (java -jar /config/sociemoapp.jar $database || true) && tail -f /dev/null
