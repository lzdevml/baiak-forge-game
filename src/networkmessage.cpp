////////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
////////////////////////////////////////////////////////////////////////
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
////////////////////////////////////////////////////////////////////////

#include "otpch.h"
#include <iostream>

#include "networkmessage.h"

#include "container.h"
#include "creature.h"
#include "position.h"
#include "item.h"
#include "player.h"

 /*ESPELHAMENTO*/	
 #include "game.h"

 extern Game g_game;

std::string NetworkMessage::getString(uint16_t stringLen/* = 0*/)
{
	if (stringLen == 0) {
		stringLen = get<uint16_t>();
	}

	if (!canRead(stringLen)) {
		return std::string();
	}

	char* v = reinterpret_cast<char*>(buffer) + position; //does not break strict aliasing
	position += stringLen;
	return std::string(v, stringLen);
}

Position NetworkMessage::getPosition()
{
	Position pos;
	pos.x = get<uint16_t>();
	pos.y = get<uint16_t>();
	pos.z = getByte();
	return pos;
}

void NetworkMessage::addString(const std::string& value)
{
	size_t stringLen = value.length();
	if (!canAdd(stringLen + 2) || stringLen > 8192) {
		return;
	}

	add<uint16_t>(stringLen);
	memcpy(buffer + position, value.c_str(), stringLen);
	position += stringLen;
	length += stringLen;
}

void NetworkMessage::addDouble(double value, uint8_t precision/* = 2*/)
{
	addByte(precision);
	add<uint32_t>((value * std::pow(static_cast<float>(10), precision)) + std::numeric_limits<int32_t>::max());
}

void NetworkMessage::addBytes(const char* bytes, size_t size)
{
	if (!canAdd(size) || size > 8192) {
		return;
	}

	memcpy(buffer + position, bytes, size);
	position += size;
	length += size;
}

void NetworkMessage::addPaddingBytes(size_t n)
{
	if (!canAdd(n)) {
		return;
	}

	memset(buffer + position, 0x33, n);
	length += n;
}

void NetworkMessage::addPosition(const Position& pos)
{
	add<uint16_t>(pos.x);
	add<uint16_t>(pos.y);
	add<char>(pos.z);
}
/*ESPELHAMENTO DAQUI*/
void NetworkMessage::addItem(uint16_t id, uint8_t count, Player* player)
{
	uint32_t version = player->getClientVersion();
	uint16_t newId = (version == 860) ? g_game.getNewItem(id) : id;
	
	const ItemType &it = Item::items[newId];
	add<uint16_t>(it.clientId);
	if(it.stackable)
		add<char>(count);
	else if(it.isSplash() || it.isFluidContainer())
		add<char>(fluidMap[count % 8]);
}

void NetworkMessage::addItem(const Item* item, Player* player)
{
	uint32_t version = player->getClientVersion();
	uint16_t id = item->getID();
	uint16_t newId = (version == 860) ? g_game.getNewItem(id) : id;

	const ItemType& it = Item::items[newId];
	add<uint16_t>(it.clientId);
	if(it.stackable)
		add<char>(item->getSubType());
	else if(it.isSplash() || it.isFluidContainer())
		add<char>(fluidMap[item->getSubType() % 8]);
}

void NetworkMessage::addItemId(const Item* item, Player* player)
{
	uint32_t version = player->getClientVersion();
	uint16_t id = item->getID();
	uint16_t newId = (version == 860) ? g_game.getNewItem(id) : id;

	const ItemType& it = Item::items[newId];
	add<uint16_t>(it.clientId);
}

void NetworkMessage::addItemId(uint16_t itemId, Player* player)
{
	uint32_t version = player->getClientVersion();
	uint16_t newId = (version == 860) ? g_game.getNewItem(itemId) : itemId;

	const ItemType& it = Item::items[newId];
	add<uint16_t>(it.clientId);
}
/*ESPELHAMENTO ATE AQUI*/