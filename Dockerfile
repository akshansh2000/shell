FROM shell AS previous

WORKDIR /src

COPY CMakeLists.txt main.cpp ./

RUN cmake . && make

FROM ubuntu:bionic

COPY --from=previous /src/shell ./

CMD ["./shell"]
