FROM alpine:latest

RUN apk add py2-pip && \
    pip install --upgrade pip && \
    pip install elasticsearch-curator && \
    mkdir -p /usr/local/bin/curator/config && mkdir -p /usr/local/bin/curator/action

COPY entrypoint.sh ./entrypoint
COPY curator.sh /usr/local/bin/curator

RUN chmod -R 777 /usr/local/bin/curator && chmod -R +x /usr/local/bin/curator

CMD ./entrypoint