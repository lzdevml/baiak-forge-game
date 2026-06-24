# =============================================================
# Baiak Forge — engine OTX 2.x (NewStyller) compilado no Linux
# Multi-stage: build (compila) -> runtime (binario + datapack).
# Protocolo 8.60. Patch u32 aplicado no AddPlayerStats.
# =============================================================

# ---- build ----
FROM ubuntu:22.04 AS build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
      g++ make python3 ca-certificates \
      liblua5.1-0-dev libxml2-dev \
      libboost-system-dev libboost-thread-dev libboost-filesystem-dev libboost-regex-dev \
      libgmp-dev libmysqlclient-dev libssl-dev libsqlite3-dev libgoogle-perftools-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /engine
COPY src/ ./src/
COPY infra/ ./infra/
# Patch u32 (AddPlayerStats -> uint32) antes de compilar
RUN python3 infra/u32-patch.py src/protocolgame.cpp
# Ajustes de build: criar objects/, tirar -march=native (portabilidade),
# expor APIs OpenSSL 1.1 p/ codigo OTX antigo (OpenSSL 3.0 no ubuntu 22.04).
RUN cd src && mkdir -p objects && \
    sed -i 's/-march=native[[:space:]]*-mtune=native/-O2/' Makefile && \
    sed -i 's/-D__ROOT_PERMISSION__/-D__ROOT_PERMISSION__ -DOPENSSL_API_COMPAT=0x10100000L -Wno-deprecated-declarations/' Makefile && \
    make -j"$(nproc)" 2>&1 | tail -80 && test -f theotxserver

# ---- runtime ----
FROM ubuntu:22.04 AS runtime
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
      liblua5.1-0 libxml2 libmysqlclient21 \
      libboost-system1.74.0 libboost-thread1.74.0 libboost-filesystem1.74.0 libboost-regex1.74.0 \
      libgmp10 libssl3 libsqlite3-0 libgoogle-perftools4 \
      mariadb-client netcat-openbsd ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv
# datapack + config + binario
COPY data/ ./data/
COPY mods/ ./mods/
COPY config.lua ./config.lua
COPY styller.sql ./styller.sql
COPY --from=build /engine/src/theotxserver ./theotxserver
COPY infra/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ./theotxserver && mkdir -p logs

EXPOSE 7171 7172
ENTRYPOINT ["/entrypoint.sh"]
