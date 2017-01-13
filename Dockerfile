FROM openshift/base-centos7
MAINTAINER Stig Fjellskaalnes <stig.fjellskaalnes@basefarm.com>
EXPOSE 8080
USER root
RUN yum -y install httpd && yum -y clean all
RUN sed -i '/Listen 80/c\Listen 8080' /etc/httpd/conf/httpd.conf
RUN echo 'Dette er en test' >/var/www/html/index.html
RUN chmod a+rwx /etc/httpd/logs /run/httpd /var/www/html
COPY ./s2i/ $STI_SCRIPTS_PATH

USER 1001
CMD /usr/sbin/httpd -DFOREGROUND

