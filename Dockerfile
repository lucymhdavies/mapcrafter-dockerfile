FROM centos:7

RUN yum install -y git \
        boost-devel libjpeg-devel libpng-devel gcc-c++ make cmake \
        wget ImageMagick

VOLUME ["/mapcrafter"]

RUN mkdir /mapcrafter

WORKDIR /

# Clone the 1.13 branch for now
RUN git clone -b world113 https://github.com/mapcrafter/mapcrafter.git

WORKDIR   /mapcrafter

# Textures
# Thanks, https://mcversions.net/ :)
RUN wget https://launcher.mojang.com/v1/objects/8de235e5ec3a7fce168056ea395d21cbdec18d7c/client.jar && \
    ./src/tools/mapcrafter_textures.py client.jar src/data/textures/ && \
    rm client.jar

RUN cmake .
RUN make install

RUN echo "/usr/local/lib"   >> /etc/ld.so.conf.d/usrlocal.conf && \
    echo "/usr/local/lib64" >> /etc/ld.so.conf.d/usrlocal.conf

RUN ldconfig -v

WORKDIR   /

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
