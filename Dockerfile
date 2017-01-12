FROM centos:7
USER root
RUN yum -y install httpd
RUN sed -i '/Listen 80/c\Listen 8080' /etc/httpd/conf/httpd.conf
RUN yum -y clean all
RUN chmod a+rwx /etc/httpd/logs /run/httpd
EXPOSE 8080
CMD /usr/sbin/httpd -DFOREGROUND
USER nobody
