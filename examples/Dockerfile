FROM tarasyarema/zig:latest

WORKDIR /src

COPY ./example.zig .

RUN zig build-exe example.zig

CMD ./example
