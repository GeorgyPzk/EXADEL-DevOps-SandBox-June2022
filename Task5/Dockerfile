FROM georgypzk/lemp-stak-task5:v1
COPY webservice-install.sh wrkdir/
RUN ["chmod", "+x", "wrkdir/webservice-install.sh"]
RUN wrkdir/webservice-install.sh

CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
EXPOSE 80