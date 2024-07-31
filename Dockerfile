FROM alpine:latest
RUN apk update && apk add dnscrypt-proxy dnscrypt-proxy-openrc
EXPOSE 53

RUN mkdir /home/user && chown -R 1000:1000 /home/user
WORKDIR /home/user
COPY dnscrypt-proxy.toml /home/user/dnscrypt-proxy.toml
COPY cloaking-rules.txt /home/user/cloaking-rules.txt
COPY forwarding-rules.txt /home/user/forwarding-rules.txt

USER 1000
ENTRYPOINT ["dnscrypt-proxy"]