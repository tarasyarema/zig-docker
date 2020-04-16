FROM ubuntu:bionic

RUN apt-get update && apt-get install -y wget tar xz-utils

ENV ZIG_VERSION=zig-linux-x86_64-0.6.0

WORKDIR /usr/local/zig

RUN wget -nv "https://ziglang.org/builds/${ZIG_VERSION}.tar.xz" 

RUN tar xf "${ZIG_VERSION}.tar.xz"

ENV PATH="/usr/local/zig/${ZIG_VERSION}:${PATH}"
