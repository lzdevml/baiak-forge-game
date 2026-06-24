#include "otpch.h"
#include "mounts.h"
#include "tools.h"
#include <libxml/xmlmemory.h>
#include <libxml/parser.h>
#include <iostream>

bool Mounts::reload()
{
	mounts.clear();
	return loadFromXml(m_datadir);
}

bool Mounts::loadFromXml(const std::string& datadir) {
    m_datadir = datadir;

	xmlDocPtr doc = xmlParseFile(m_datadir.c_str());
	if(doc){
		xmlNodePtr root, p;
		root = xmlDocGetRootElement(doc);

		if(xmlStrcmp(root->name,(const xmlChar*)"mounts") != 0){
			xmlFreeDoc(doc);
			std::cout << "Warning: mounts.xml not found, using defaults." << std::endl;
			return true;
		}

		p = root->children;

		while(p){
			if(xmlStrcmp(p->name, (const xmlChar*)"mount") == 0){
				int32_t id, clientid, speed, premium;
				std::string name;
				if(readXMLInteger(p, "id", id)){
					if(!readXMLInteger(p, "premium", premium)){
						// error
                        std::cout << "Error: missing premium field from mount id " << id << std::endl;
                        return false;
					}

                    if(!readXMLInteger(p, "clientid", clientid)){
						// error
                        std::cout << "Error: missing clientid field from mount id " << id << std::endl;
                        return false;
					}

                    if(!readXMLInteger(p, "speed", speed)){
						// error
                        std::cout << "Error: missing speed field from mount id " << id << std::endl;
                        return false;
					}

					if(!readXMLString(p, "name", name)){
						// error
                        std::cout << "Error: missing name field from mount id " << id << std::endl;
                        return false;
					}

                    // loaded
                    mounts.emplace_back(
             			static_cast<uint8_t>(id),
             			clientid,
             			name,
             			speed,
             			static_cast<bool>(premium)
             		);
				}
				else{
					std::cout << "Missing outfit id." << std::endl;
				}
			}
			p = p->next;
		}
		xmlFreeDoc(doc);
	}
	return true;   
}

// bool Mounts::loadFromXml()
// {
// 	pugi::xml_document doc;
// 	pugi::xml_parse_result result = doc.load_file("data/XML/mounts.xml");
// 	if (!result) {
// 		printXMLError("Error - Mounts::loadFromXml", "data/XML/mounts.xml", result);
// 		return false;
// 	}

// 	for (auto mountNode : doc.child("mounts").children()) {
// 		mounts.emplace_back(
// 			static_cast<uint8_t>(pugi::cast<uint16_t>(mountNode.attribute("id").value())),
// 			pugi::cast<uint16_t>(mountNode.attribute("clientid").value()),
// 			mountNode.attribute("name").as_string(),
// 			pugi::cast<int32_t>(mountNode.attribute("speed").value()),
// 			mountNode.attribute("premium").as_bool()
// 		);
// 	}
// 	mounts.shrink_to_fit();
// 	return true;
// }

Mount* Mounts::getMountByID(uint8_t id)
{
	auto it = std::find_if(mounts.begin(), mounts.end(), [id](const Mount& mount) {
		return mount.id == id;
	});

	return it != mounts.end() ? &*it : nullptr;
}

Mount* Mounts::getMountByName(const std::string& name) {
	auto mountName = name.c_str();
	for (auto& it : mounts) {
		if (strcasecmp(mountName, it.name.c_str()) == 0) {
			return &it;
		}
	}

	return nullptr;
}

Mount* Mounts::getMountByClientID(uint16_t clientId)
{
	auto it = std::find_if(mounts.begin(), mounts.end(), [clientId](const Mount& mount) {
		return mount.clientId == clientId;
	});

	return it != mounts.end() ? &*it : nullptr;
}