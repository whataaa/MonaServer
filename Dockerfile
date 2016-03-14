FROM debian

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim nano curl wget zip build-essential git libssl-dev
RUN apt-get clean

RUN wget http://luajit.org/download/LuaJIT-2.0.4.tar.gz
RUN tar -xzf LuaJIT-2.0.4.tar.gz && rm LuaJIT-2.0.4.tar.gz && cd LuaJIT-2.0.4 && make && make install
RUN wget https://github.com/MonaSolutions/MonaServer/archive/master.zip
run unzip master.zip && cd MonaServer && make && cd MonaServer && mkdir www && mkdir www/myapp


EXPOSE 1935 1936

ENTRYPOINT ["MonaServer/MonaServer/MonaServer"]
