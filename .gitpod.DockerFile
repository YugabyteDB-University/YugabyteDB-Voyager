FROM gitpod/workspace-mysql

ARG YB_VERSION=2.19.2.0
ARG YB_DOWNLOAD_URL=https://downloads.yugabyte.com/releases/2.19.2.0/yugabyte-2.19.2.0-b121-linux-x86_64.tar.gz
# ARG YB_VERSION=2.20.0.0
# ARG YB_DOWNLOAD_URL=https://downloads.yugabyte.com/releases/2.20.0.0/yugabyte-2.20.0.0-b76-linux-x86_64.tar.gz
# ARG YB_VERSION=2.19.3.0
# ARG YB_DOWNLOAD_URL=https://downloads.yugabyte.com/releases/2.19.3.0/yugabyte-2.19.3.0-b140-linux-x86_64.tar.gz
ARG YB_PATH=/home/gitpod/yugabyte
ARG YUGABYTED_PATH=/home/gitpod/var
ARG YB_PATH_DATA=/home/gitpod/var

ARG ROLE=gitpod

USER root
RUN mkdir -p $YB_PATH  \
    && mkdir -p $YUGABYTED_PATH
RUN chown -R $ROLE:$ROLE $YB_PATH \
    && chown -R $ROLE:$ROLE $YUGABYTED_PATH

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
RUN sudo apt install ./yb-apt-repo_1.0.0_all.deb
RUN sudo apt clean
RUN sudo apt update
RUN sudo apt install -y yb-voyager


# change this per repo
ENV MY_GITPOD_REPO=YugabyteDB-Voyager
ENV N1=1
ENV N2=2
ENV N3=3
ENV BETA_FAST_DATA_EXPORT=1
ENV YB_PATH=/home/gitpod/yugabyte
ENV YB_PATH_DATA=/home/gitpod/var
ENV YUGABYTED_PATH=/home/gitpod/var
ENV MASTER_WEB_PORT=7000
ENV MYSQL_PORT=3306
ENV TSERVER_WEB_PORT=8200
ENV WEB_PORT=7000
ENV YCQL_API_PORT=12000
ENV YCQL_PORT=9042
ENV YSQL_API_PORT=13000
ENV YSQL_PORT=5433
ENV YUGABYTED_WEB_UI_PORT=15433


EXPOSE ${MASTER_WEB_PORT} ${MYSQL_PORT} ${TSERVER_WEB_PORT} ${WEB_PORT} ${YCQL_API_PORT} ${YCQL_PORT} ${YSQL_API_PORT} ${YSQL_PORT} ${YUGABYTED_WEB_UI_PORT}