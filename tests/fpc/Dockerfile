FROM kveroneau/fpc:3.2.0-amd64 AS builder

COPY hello.pas /root

RUN cd /root && fpc hello.pas

FROM alpine:latest

COPY --from=builder /root/hello /root/hello

ENTRYPOINT ["/root/hello"]
