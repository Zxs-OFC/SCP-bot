FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    unzip \
    git \
    ca-certificates \
    build-essential \
    lua5.4 \
    luarocks && \
    rm -rf /var/lib/apt/lists/*

# Instala Luau
RUN curl -L https://github.com/luau-lang/luau/releases/latest/download/luau-ubuntu.zip -o /tmp/luau.zip && \
    unzip /tmp/luau.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/luau && \
    rm /tmp/luau.zip

# Instala Lune
RUN curl -L https://github.com/lune-org/lune/releases/latest/download/lune-linux-x86_64.zip -o /tmp/lune.zip && \
    unzip /tmp/lune.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/lune && \
    rm /tmp/lune.zip

WORKDIR /app

COPY . .

CMD ["bash"]