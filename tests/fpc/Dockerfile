FROM kveroneau/fpc:3.0.4-arm32v7 AS builder

COPY hello.pas /root

RUN cd /root && fpc hello.pas

FROM alpine:latest

COPY --from=builder /root/hello /root/hello

ENTRYPOINT ["/root/hello"]
