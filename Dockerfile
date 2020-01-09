# Build Geth in a stock Go builder container
FROM golang:1.13-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers git

ADD . /go-ethereum
RUN cd /go-ethereum && make geth

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
RUN apk --no-cache add curl
COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/
#COPY --from=builder /go-ethereum/estachain-start.sh /
#COPY --from=builder /go-ethereum/Estachain/genesis.json /Estachain/genesis.json
#COPY --from=builder /go-ethereum/keystore/ /
COPY --from=builder /go-ethereum /

EXPOSE 8545 8546 8547 30303 30303/udp
ENTRYPOINT ["/estachain-start.sh"]
