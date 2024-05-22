#Using debian buster as base image
FROM debian:bullseye

# Install nginx
RUN apt-get update && apt-get install -y nginx && apt install openssl -y
RUN openssl req -x509 -nodes \  
    -out /etc/ssl/certs/inception.crt \
    -keyout /etc/ssl/certs/inception.key \
    -subj "/C=MO/L=BG/O=1337/OU=student/CN=otitebah"

COPY conf/nginx.conf /etc/nginx/conf.d/

# Start the service
CMD [ "nginx", "-g", "daemon off;"]