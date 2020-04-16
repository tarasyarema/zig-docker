FROM alpine:latest

RUN apk add --no-cache wget tar curl grep

ENV ZIG_VERSION=zig-linux-x86_64-0.6.0

WORKDIR /usr/local/zig

RUN wget -qO - "https://ziglang.org/builds/${ZIG_VERSION}.tar.xz" | tar xJ

ENV PATH="/usr/local/zig/${ZIG_VERSION}:${PATH}"

WORKDIR /
