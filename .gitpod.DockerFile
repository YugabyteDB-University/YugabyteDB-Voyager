FROM gitpod/workspace-mysql

ARG YB_VERSION=2.19.0.0
ARG YB_DOWNLOAD_URL=https://downloads.yugabyte.com/releases/2.19.0.0/yugabyte-2.19.0.0-b190-linux-x86_64.tar.gz
ARG YB_PATH=/home/gitpod/yugabyte
ARG YB_PATH_DATA=/home/gitpod/yugabyte-data

ARG ROLE=gitpod
USER root
RUN mkdir -p $YB_PATH 
RUN chown -R $ROLE:$ROLE $YB_PATH 

USER $ROLE
RUN curl -sSLo ./yugabyte.tar.gz $YB_DOWNLOAD_URL  \
  && tar -xvf yugabyte.tar.gz -C $YB_PATH --strip-components=1 \
  && chmod +x $YB_PATH/bin/* \
  && rm ./yugabyte.tar.gz
RUN $YB_PATH/bin/post_install.sh
RUN echo "\n# yugabytedb executable path" >> ~/.bashrc
RUN echo "export PATH=\$PATH:$YB_PATH/bin/" >> ~/.bashrc

USER $ROLE
RUN wget https://s3.us-west-2.amazonaws.com/downloads.yugabyte.com/repos/reporpms/yb-apt-repo_1.0.0_all.deb
RUN sudo apt-get install ./yb-apt-repo_1.0.0_all.deb
RUN sudo apt-get clean
RUN sudo apt-get update
RUN sudo apt-get install -y yb-voyager


ENV MYSQL_PORT=3306
ENV YSQL_PORT=5433
ENV YCQL_PORT=9042
ENV WEB_PORT=7000
ENV TSERVER_WEB_PORT=8200
ENV YCQL_API_PORT=12000
ENV YSQL_API_PORT=13000
ENV BETA_FAST_DATA_EXPORT=1

EXPOSE ${MYSQL_PORT} ${YSQL_PORT} ${YCQL_PORT} ${WEB_PORT} ${TSERVER_WEB_PORT} ${YSQL_API_PORT} ${YCQL_API_PORT} 