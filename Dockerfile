# =============================================================
# Baiak Forge — engine OTX 2.x (NewStyller), RUNTIME-ONLY.
# O binario e compilado FORA do VPS (GitHub Actions, off-VPS) e commitado
# em bin/theotxserver. Aqui so copiamos -> deploy rapido, ZERO compile no VPS.
# (Compilar no VPS de producao causou OOM/queda — nunca mais.)
# =============================================================
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
      liblua5.1-0 libxml2 libmysqlclient21 \
      libboost-system1.74.0 libboost-thread1.74.0 libboost-filesystem1.74.0 libboost-regex1.74.0 \
      libgmp10 libssl3 libsqlite3-0 libgoogle-perftools4 \
      mariadb-client netcat-openbsd ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv
COPY data/ ./data/
COPY mods/ ./mods/
COPY config.lua ./config.lua
COPY gesior860.sql ./gesior860.sql
COPY bin/theotxserver ./theotxserver
COPY infra/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ./theotxserver && mkdir -p logs

EXPOSE 7181 7182
ENTRYPOINT ["/entrypoint.sh"]
