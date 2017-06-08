FROM centos:7

RUN yum install -y git \
        boost-devel libjpeg-devel libpng-devel gcc-c++ make cmake \
        wget ImageMagick

RUN mkdir /mapcrafter

WORKDIR /

RUN git clone -b beta https://github.com/lucymhdavies/mapcrafter.git

WORKDIR   /mapcrafter

RUN cmake .

# Thanks, https://mcversions.net/ :)
RUN wget https://launcher.mojang.com/mc/game/1.12/client/909823f9c467f9934687f136bc95a667a0d19d7f/client.jar

RUN ./src/tools/mapcrafter_textures.py client.jar src/data/textures/

RUN make install

RUN echo "/usr/local/lib"   >> /etc/ld.so.conf.d/usrlocal.conf && \
    echo "/usr/local/lib64" >> /etc/ld.so.conf.d/usrlocal.conf

RUN ldconfig -v

RUN mkdir /tmp/workdir
WORKDIR   /tmp/workdir

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
