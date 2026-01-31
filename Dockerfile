FROM centos:7

LABEL maintainer="parttimewarrior34@gmail.com"

RUN yum -y update && \
    yum install -y httpd zip unzip && \
    yum clean all

WORKDIR /var/www/html

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip .

RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
