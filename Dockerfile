# FROM centos

# CMD echo "now running..."

# RUN yum install -y httpd

# RUN yum install -y nginx

# ADD ./index.html /var/www/html

# EXPOSE 80

# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

FROM  nginx:latest

# author
MAINTAINER  abcdarts

ADD default.conf /etc/nginx/conf.d

RUN echo "now building..."