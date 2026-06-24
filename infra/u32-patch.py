#!/usr/bin/env python3
# Patch u32 para o engine OTX (NewStyller) — roda no Docker build.
# Troca health/maxHealth/level/mana/maxMana de uint16 -> uint32 SO dentro de
# ProtocolGame::AddPlayerStats (NAO toca o getPlayerInfo(PLAYERINFO_LEVEL) do
# AddCreatureSpeak). Mantem o protocolo 8.x compativel com nosso cliente u32.
import re, sys

PG = sys.argv[1] if len(sys.argv) > 1 else "src/protocolgame.cpp"
src = open(PG, encoding="utf-8", errors="replace").read()

# isola o corpo de AddPlayerStats
m = re.search(r"(void\s+ProtocolGame::AddPlayerStats\s*\([^)]*\)\s*\{)(.*?)(\n\})", src, re.S)
if not m:
    print("[u32] ERRO: AddPlayerStats nao encontrado"); sys.exit(1)
head, body, tail = m.group(1), m.group(2), m.group(3)

repls = [
    ("msg->add<uint16_t>(player->getHealth());",
     "msg->add<uint32_t>(player->getHealth());"),
    ("msg->add<uint16_t>(player->getPlayerInfo(PLAYERINFO_MAXHEALTH));",
     "msg->add<uint32_t>(player->getPlayerInfo(PLAYERINFO_MAXHEALTH));"),
    ("msg->add<uint16_t>(player->getPlayerInfo(PLAYERINFO_LEVEL));",
     "msg->add<uint32_t>(player->getPlayerInfo(PLAYERINFO_LEVEL));"),
    ("msg->add<uint16_t>(player->getPlayerInfo(PLAYERINFO_MANA));",
     "msg->add<uint32_t>(player->getPlayerInfo(PLAYERINFO_MANA));"),
    ("msg->add<uint16_t>(player->getPlayerInfo(PLAYERINFO_MAXMANA));",
     "msg->add<uint32_t>(player->getPlayerInfo(PLAYERINFO_MAXMANA));"),
]
done = 0
for a, b in repls:
    if a in body:
        body = body.replace(a, b); done += 1
    else:
        print("[u32] AVISO: nao achou ->", a)

if done != len(repls):
    print(f"[u32] ERRO: aplicou {done}/{len(repls)} — abortando p/ nao gerar build inconsistente")
    sys.exit(1)

src = src[:m.start()] + head + body + tail + src[m.end():]
open(PG, "w", encoding="utf-8").write(src)
print(f"[u32] OK: {done}/{len(repls)} campos -> uint32 em AddPlayerStats")
