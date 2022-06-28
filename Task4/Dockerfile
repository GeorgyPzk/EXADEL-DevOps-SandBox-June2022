FROM ubuntu:16.04
ENV DEVOPS = "George"
COPY webservice-install.sh wrkdir/
RUN ["chmod", "+x", "wrkdir/webservice-install.sh"]
RUN wrkdir/webservice-install.sh
EXPOSE 81 
CMD ["nginx", "-g", "daemon off;"]