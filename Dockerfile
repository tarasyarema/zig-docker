FROM zig:latest

WORKDIR /app/src

COPY ./server.zig .

CMD zig run server.zig
