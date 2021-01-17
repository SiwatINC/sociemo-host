FROM siwatinc/java-base-image
RUN apt-get update && apt-get -y install mariadb-server screen
RUN timeout 30s mysqld_safe || :
CMD (screen -d -m mysqld) && (java -jar /config/sociemoapp.jar $database || true) && tail -f /dev/null
