FROM debian:stable

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
  && curl -fsSL https://liquidsoap.info/ffmpeg-static-build/key.asc \
    | gpg --dearmor -o /etc/apt/trusted.gpg.d/liquidsoap-ffmpeg.gpg \
  && echo "deb https://liquidsoap.info/ffmpeg-static-build stable main" \
    > /etc/apt/sources.list.d/liquidsoap-ffmpeg.list \
  && apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg-liquidsoap \
    ffmpeg-liquidsoap-tools \
  && rm -rf /var/lib/apt/lists/*
