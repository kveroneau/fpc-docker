FROM kveroneau/lazarus:2.0.6-amd64 AS builder

COPY . /root

RUN cd /root && lazbuild testproj.lpr

FROM alpine:latest

COPY --from=builder /root/testproj /root/testproj

ENTRYPOINT ["/root/testproj"]
