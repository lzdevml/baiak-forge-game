local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({"elementos"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Para usar o sistema de elementos você precisa obter a benção do Bk Elements Book que você pode obter no WebShop ou concluindo todas as tasks no npc Bk Tasks, você pode manipular elementos em armas Bk ou Magias!"})
keywordHandler:addKeyword({"magias"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você pode trocar o elemento da sua magia especial usando um element stone na fonte de energia que deseja, lembre-se que o nome da magia irá mudar!"})
keywordHandler:addKeyword({"bk staff"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Se você possue a bença do Bk Elements Book você pode trocar o elemento da sua Bk Staff +1 até +6 a qualquer momento usando ela na fonte de energia que deseja, lembre-se que somente a Staff estando +6 pode trocar de elemento."})
keywordHandler:addKeyword({"bk sword"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Se você possue a bença do Bk Elements Book você pode colocar 10 de attack de sua Bk Sword no elemento que desejar, basta usar sua sword na fonte de energia que deseja, lembre-se que não será adicionado ataque, somente será 10 pelo elemento e você so pode fazer isso uma vez então escolha bem seu elemento."})
keywordHandler:addKeyword({"bk axe"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Se você possue a bença do Bk Elements Book você pode colocar 10 de attack de sua Bk Axe no elemento que desejar, basta usar sua sword na fonte de energia que deseja, lembre-se que não será adicionado ataque, somente será substituido 10 pelo elemento e você so pode fazer isso uma vez então escolha bem seu elemento."})
keywordHandler:addKeyword({"bk club"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Se você possue a bença do Bk Elements Book você pode colocar 10 de attack de sua Bk Club no elemento que desejar, basta usar sua sword na fonte de energia que deseja, lembre-se que não será adicionado ataque, somente será substituido 10 pelo elemento e você so pode fazer isso uma vez então escolha bem seu elemento."})
keywordHandler:addKeyword({"bk slingshot"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Se você possue a bença do Bk Elements Book você pode colocar 10 de attack de sua Bk Slingshot no elemento que desejar, basta usar sua sword na fonte de energia que deseja, lembre-se que não será adicionado ataque, somente será substituido 10 pelo elemento e você so pode fazer isso uma vez então escolha bem seu elemento."})

npcHandler:addModule(FocusModule:new())