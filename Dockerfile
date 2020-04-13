FROM ubuntu:latest

WORKDIR /usr/local

RUN apt-get update

RUN apt-get install -y wget git gcc g++ cmake gnupg software-properties-common

RUN apt-get upgrade -y

COPY ./install.sh .

COPY ./dep .

RUN bash install.sh

WORKDIR /usr/local/lld-10.0.0.src/build

RUN cmake .. -DMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_PREFIX_PATH=/usr/local \
			-DCMAKE_BUILD_TYPE=Release -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="AVR" \
			-DLLVM_ENABLE_LIBXML2=OFF

RUN make install

WORKDIR /usr/local/clang-10.0.0.src/build

RUN cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_PREFIX_PATH=/usr/local \
			-DCMAKE_BUILD_TYPE=Release

RUN make install

WORKDIR /usr/bin

RUN git clone https://github.com/ziglang/zig.git

WORKDIR /usr/bin/zig/build

RUN cmake -DCMAKE_PREFIX_PATH=/usr/local ..

RUN make install