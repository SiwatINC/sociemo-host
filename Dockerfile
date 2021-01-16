FROM siwatinc/java-base-image
RUN apt-get update && apt-get -y install mariadb screen
CMD (screen -d -m mysqld) && java -jar /config/sociemoapp.jar $database
