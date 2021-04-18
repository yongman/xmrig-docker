FROM ubuntu:18.04 as builder

RUN apt-get -y update && \
    apt-get -y install build-essential cmake libuv1-dev libssl-dev libhwloc-dev

ADD xmrig.tar.gz /
WORKDIR /xmrig
RUN mkdir build && cd build && cmake .. && make

FROM ubuntu:18.04
RUN apt-get -y update && apt-get -y install libuv1-dev libssl-dev libhwloc-dev
COPY --from=builder xmrig/build/xmrig /
ENTRYPOINT ["/xmrig"]
