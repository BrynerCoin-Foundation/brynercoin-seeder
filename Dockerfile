FROM ubuntu:16.04

COPY . /brynercoin-seeder

WORKDIR /brynercoin-seeder

RUN apt-get update
RUN apt-get install -y apt-utils build-essential libboost-all-dev libssl-dev

RUN make -j3

EXPOSE 53/udp

# -m specifies dnsseed@bryner.tech

CMD [ \
    "/brynercoin-seeder/dnsseed",  \
    "-h", "dnsseed.bryner.tech",   \
    "-n", "bryseed.bryner.tech",   \
    "-m", "dnsseed.bryner.tech"    \
]
