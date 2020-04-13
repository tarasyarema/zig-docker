# Zig Lang Dockerfile

I had some issues tunning Zig in my Windows machine, so I decided to create a Docker image with the latest build from Zig git.
You can find more information about it [here](https://ziglang.org/).

1. The zig version is `0.5.0+b702964ae`.
1. The image is based on `ubuntu:bionic`, so you can use it as it. 

It has the zig binary compiled and added to `PATH` so you can just run `zig` globally.

## Build 

If you want to build it locally, you can clone this repo and then run the build command:

- `docker build -t zig -f Dockerfile.zig .`

If you prefer to use the latest generated image from Dcoer Hub (is generated based on the `Dockerfile.zig`) in this repo:

- `docker pull tarasyarema/zig:latest`


## Usage

Imagine you have a `example.zig` file with the following contents

```zig
const warn = @import("std").debug.warn;

pub fn main() void {
   warn("Hey from a container :3\n", .{});
}
```

You could create a container (i.e. a `Dcokerfile`) to run this file inside it:

```Dockerfile
FROM zig:latest

WORKDIR /src

COPY ./example.zig .

RUN zig build-exe example.zig

CMD ./example
```

Then you could run

```bash
$ docker build -t zig-example -f Dockerfile .
...
$ docker run zig-test
Hey from a container :3
```

You can find this example in the [examples](./examples) folder.

## Todo

- [ ] Make tagged builds, so you can just pull the version you want from Docker Hub.

