FROM debian:bullseye

RUN apt-get update && apt-get install \
    -y mariadb-server systemctl vim

COPY  tools/script.sh /tmp/script.sh

CMD [ "bash", "./tmp/script.sh"]