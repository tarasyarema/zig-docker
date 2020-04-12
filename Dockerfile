FROM ubuntu:latest

WORKDIR /usr/local

RUN apt-get update

RUN apt-get install -y wget git gcc g++ cmake gnupg software-properties-common

RUN apt-get upgrade -y

COPY ./install.sh .

COPY ./dep .

RUN bash install.sh

WORKDIR /usr/bin

RUN git clone https://github.com/ziglang/zig.git

WORKDIR /usr/bin/zig/build

RUN cmake -DCMAKE_PREFIX_PATH=/usr/local ..

RUN make install