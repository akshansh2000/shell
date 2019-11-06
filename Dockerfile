FROM shell AS previous

WORKDIR /src

COPY CMakeLists.txt main.c ./

RUN apt install -y libtool build-essential pkg-config autoconf

RUN cmake . && make

FROM ubuntu:bionic

COPY --from=previous /src/shell ./

CMD ["./shell"]
