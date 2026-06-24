#!/bin/sh
# Baiak Forge — entrypoint do engine OTX (NewStyller).
# Injeta DB/ip no config.lua via env, espera o DB, importa styller.sql se vazio, sobe.
set -e

DB_HOST="${DB_HOST:-mariadb}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-baiakforge}"
DB_USER="${DB_USER:-root}"
DB_PASS="${DB_PASS:-}"
SRV_IP="${SERVER_IP:-127.0.0.1}"
SRV_NAME="${SERVER_NAME:-Baiak Forge}"
CFG=/srv/config.lua

echo "[forge-otx] Configurando config.lua (db=${DB_HOST}/${DB_NAME}, ip=${SRV_IP})..."
sed -i "s|^[[:space:]]*sqlHost = .*|	sqlHost = \"${DB_HOST}\"|"       "$CFG"
sed -i "s|^[[:space:]]*sqlPort = .*|	sqlPort = ${DB_PORT}|"           "$CFG"
sed -i "s|^[[:space:]]*sqlUser = .*|	sqlUser = \"${DB_USER}\"|"       "$CFG"
sed -i "s|^[[:space:]]*sqlPass = .*|	sqlPass = \"${DB_PASS}\"|"       "$CFG"
sed -i "s|^[[:space:]]*sqlDatabase = .*|	sqlDatabase = \"${DB_NAME}\"|" "$CFG"
sed -i "s|^[[:space:]]*ip = .*|	ip = \"${SRV_IP}\"|"                  "$CFG"
sed -i "s|^[[:space:]]*serverName = .*|	serverName = \"${SRV_NAME}\"|"  "$CFG"

echo "[forge-otx] Aguardando MariaDB ${DB_HOST}:${DB_PORT}..."
i=0
while [ $i -lt 40 ]; do
  if mysqladmin ping --skip-ssl -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" 2>/dev/null | grep -q alive; then
    echo "[forge-otx] DB up."; break
  fi
  i=$((i+1)); [ $((i%5)) -eq 0 ] && echo "[forge-otx] db nao pronto ($i/40)..."; sleep 2
done

# cria DB + importa schema se a tabela 'players' nao existir
HASTBL=$(mysql --skip-ssl -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -N -e \
  "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='${DB_NAME}' AND table_name='players';" 2>/dev/null || echo 0)
if [ "${HASTBL:-0}" = "0" ]; then
  echo "[forge-otx] Importando styller.sql (DB novo)..."
  mysql --skip-ssl -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" 2>/dev/null || true
  mysql --skip-ssl -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "${DB_NAME}" < /srv/styller.sql \
    && echo "[forge-otx] schema importado." || echo "[forge-otx] AVISO: import falhou (segue)."
else
  echo "[forge-otx] DB ja tem players (pula import)."
fi

echo "[forge-otx] Subindo OTX..."
cd /srv
exec ./theotxserver
