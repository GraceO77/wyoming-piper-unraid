FROM python:3.12-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG APP_VERSION=1.0.0
ARG WYOMING_PIPER_VERSION=2.4.2

LABEL org.opencontainers.image.source="https://github.com/GraceO77/wyoming-piper-unraid"
LABEL org.opencontainers.image.description="Wyoming Piper text-to-speech server for Home Assistant on Unraid"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.version="${APP_VERSION}"
LABEL net.unraid.docker.version="${APP_VERSION}"

ENV APP_VERSION=${APP_VERSION} \
    PIPER_URI=tcp://0.0.0.0:10200 \
    PIPER_VOICE=en_US-lessac-medium \
    PIPER_DATA_DIR=/data \
    PIPER_DOWNLOAD_DIR=/data

RUN apt-get update && \
    apt-get install -y --no-install-recommends libsndfile1 && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir "wyoming-piper==${WYOMING_PIPER_VERSION}"

WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

VOLUME ["/data"]
EXPOSE 10200

ENTRYPOINT ["/app/entrypoint.sh"]
