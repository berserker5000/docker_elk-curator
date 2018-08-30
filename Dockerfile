FROM alpine

RUN apk add py2-pip && \
    pip install --upgrade pip && \
    pip install elasticsearch-curator && \
    mkdir -p /usr/local/bin/curator/config && mkdir -p /usr/local/bin/curator/action

COPY entrypoint.sh ./entrypoint
COPY curator.sh ./curator

CMD ./entrypoint