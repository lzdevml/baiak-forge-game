-- Sistema multi linguagem desenvolvido por Vítor e Felipe

-- Storage que checa a língua
language = 823000


-- Funçao que controla os broadcasts
-- function doBroadcastMessage(pt, en, typ)
	-- if not en then en = pt end
	-- if not typ then typ = MESSAGE_STATUS_WARNING end
	-- for _, pid in pairs(getPlayersOnline()) do
		-- if getPlayerStorageValue(pid, language) == "pt" then
			-- doPlayerSendTextMessage(pid, typ, pt)
		-- elseif getPlayerStorageValue(pid, language) == "en" then
			-- doPlayerSendTextMessage(pid, typ, en)
		-- end
	-- end
-- end



-- Ativa/Desativa o sistema
language_activated = true

-- Cria a tabela de configuração
language_NPC = {}

-- Cria uma tabela para cada NPC
language_NPC["A Wandering Soul"] = {pt = {}, en = {}}
language_NPC["Player Hunter"] = {pt = {}, en = {}}
language_NPC["Witch"] = {pt = {}, en = {}}
language_NPC["Mr Kiro"] = {pt = {}, en = {}}
language_NPC["Hefesto"] = {pt = {}, en = {}}
language_NPC["Event Seller"] = {pt = {}, en = {}}
language_NPC["Instance Ancient"] = {pt = {}, en = {}}
language_NPC["Task Man"] = {pt = {}, en = {}}
language_NPC.Cassino = {pt = {}, en = {}}
language_NPC.Dice = {pt = {}, en = {}}
language_NPC["PvP Task"] = {pt = {}, en = {}}
language_NPC["Healing Monk"] = {pt = {}, en = {}}
language_NPC.Lire = {pt = {}, en = {}}

-- Define as mensagens nas línguas para cada NPC

-- A Wandering Soul
language_NPC["A Wandering Soul"]["pt"][1] = "Eu cobro 50kk para te teleportar. Você quer ir?"
language_NPC["A Wandering Soul"]["en"][1] = "It costs 50kk for me to teleport you. Do you want to go?"

language_NPC["A Wandering Soul"]["pt"][2] = "Você é knight e já completou a quest, por isso tenho que cobrar 200kk para te levar. Você quer ir?"
language_NPC["A Wandering Soul"]["en"][2] = "You are a knight and has already completed the quest, so I'll have to charge 200kk to take you. Do you want to go?"

language_NPC["A Wandering Soul"]["pt"][3] = "Você já completou a quest, então eu tenho que cobrar 100kk para te levar. Você quer ir?"
language_NPC["A Wandering Soul"]["en"][3] = "You have already completed the quest, so I'll have to charge 100kk to take you. Do you want to go?"

language_NPC["A Wandering Soul"]["pt"][4] = "Somente jogadores donate podem fazer a quest."
language_NPC["A Wandering Soul"]["en"][4] = "Only donate players can enter on this quest."

language_NPC["A Wandering Soul"]["pt"][5] = "Boa sorte."
language_NPC["A Wandering Soul"]["en"][5] = "Good luck."

language_NPC["A Wandering Soul"]["pt"][6] = "Você não tem"
language_NPC["A Wandering Soul"]["en"][6] = "You do not have"

language_NPC["A Wandering Soul"]["pt"][7] = "Somente jogadores com level 600 ou mais são permitidos."
language_NPC["A Wandering Soul"]["en"][7] = "Only players with level 600 or higher are allowed."

-- Player Hunter
language_NPC["Player Hunter"]["pt"][1] = "Sim, eu sou o líder da Guild dos Assassinos. Você quer dar {hunted} em alguém, ver os players {mais procurados} ou quer {informações} sobre o sistema?"
language_NPC["Player Hunter"]["en"][1] = "Yes, I am the leader of the Assassin Guild. Do you want make a player {hunted}, to see the {most wanted} players} or want {information} about the system?"

language_NPC["Player Hunter"]["pt"][2] = "Muito bem... Me diga o {nome} do jogador que você quer dar hunted."
language_NPC["Player Hunter"]["en"][2] = "Very well... Tell me the {name} of the player that you want to be hunt."

language_NPC["Player Hunter"]["pt"][3] = "É muito simples: você me diz o nome e me dá o dinheiro que eu coloco um prêmio pela cabeça desse jogador e quem matar ele recebe o dinheiro. Você pode conferir nestes quadros ao meu lado quem são os caçadores de recompensa ativos e quais jogadores estão hunted."
language_NPC["Player Hunter"]["en"][3] = "It is very simple: you tell me the name and give me the money and I will place a reward for this player's head and who kills him first will receive the money. You can check who are the active bounty hunters and which players are being hunt on these boards next to me."

language_NPC["Player Hunter"]["pt"][4] = "Ninguém está hunted neste momento."
language_NPC["Player Hunter"]["en"][4] = "Nobody is being hunt right now."

language_NPC["Player Hunter"]["pt"][5] = "Este jogador não existe! Me diga um nome certo!"
language_NPC["Player Hunter"]["en"][5] = "This player does not exist! Tell me the right name!"

language_NPC["Player Hunter"]["pt"][6] = "Você não pode dar hunted em si mesmo, está louco?!"
language_NPC["Player Hunter"]["en"][6] = "You cannot place a bounty on yourself, are you insane?!"

language_NPC["Player Hunter"]["pt"][7] = "Muito bem, o valor mínimo para um hunted é de"
language_NPC["Player Hunter"]["en"][7] = "Very well, the minimum value for a bounty is"

language_NPC["Player Hunter"]["pt"][8] = "e eu cobro uma taxa de"
language_NPC["Player Hunter"]["en"][8] = "and I charge a"

language_NPC["Player Hunter"]["pt"][9] = "pelo serviço. Quanto de dinheiro você quer oferecer pela cabeça deste jogador?"
language_NPC["Player Hunter"]["en"][9] = "fee for the service. How much money do you wish to offer for this player's head?"

language_NPC["Player Hunter"]["pt"][10] = "Você deu hunted no jogador"
language_NPC["Player Hunter"]["en"][10] = "You have placed a price on"

language_NPC["Player Hunter"]["pt"][11] = "com sucesso."
language_NPC["Player Hunter"]["en"][11] = "'s head."

language_NPC["Player Hunter"]["pt"][12] = "Você gostaria de algo mais? Como dar {hunted} em outra pessoa, checar os jogadores {mais procurados} ou algumas {informações} sobre o sistema?"
language_NPC["Player Hunter"]["en"][12] = "Would you like something else? Like making another player {hunted}, cheking the {most wanted} players or some {information} about the system?"

language_NPC["Player Hunter"]["pt"][13] = "Você não pode me enganar! Se você não tem dinheiro, nada de hunted!"
language_NPC["Player Hunter"]["en"][13] = "You cannot fool me! If you do not have money, I cannot do anything!"

language_NPC["Player Hunter"]["pt"][14] = "Você precisa me dar um valor de verdade meu amigo... E precisa ser maior que"
language_NPC["Player Hunter"]["en"][14] = "You must place a real ammount of money, my friend... And it must be higher than"

-- Old Witch
language_NPC["Witch"]["pt"][1] = "Existe uma ilha ao longe do norte onde vivia uma antiga bruxa que possuia o {magic book}, dizem que criaturas inimaginaevis vivem por lá."
language_NPC["Witch"]["en"][1] = " "

language_NPC["Witch"]["pt"][2] = "Para conseguir o antigo livros de magias você precisa matar a antiga bruxa da ilha, e um caminho sem volta. o que acontece depois só depende de você! diga {sim}"
language_NPC["Witch"]["en"][2] = ""

language_NPC["Witch"]["pt"][3] = "Parabéns, agora você possui a Uber Spell."
language_NPC["Witch"]["en"][3] = "."

language_NPC["Witch"]["pt"][4] = "Você precisa de 10 Power Soul e 15 Warrior's Sweat e principalemte o antigo livro de magias, Magic Book."
language_NPC["Witch"]["en"][4] = "."

language_NPC["Witch"]["pt"][5] = "Você ja possui este fentiço"
language_NPC["Witch"]["en"][5] = ""

language_NPC["Witch"]["pt"][6] = "Tudo bem, esta é uma escolha sua."
language_NPC["Witch"]["en"][6] = "Ok, this is your choice to make."

language_NPC["Witch"]["pt"][7] = "Boa Sorte."
language_NPC["Witch"]["en"][7] = ""

-- Event Seller
language_NPC["Event Seller"]["pt"][1] = "Got some rare things on sale, stranger."
language_NPC["Event Seller"]["en"][1] = "Got some rare things on sale, stranger."

language_NPC["Event Seller"]["pt"][2] = ". Lembre-se que você pode comprar em quantidades maiores, exemplo: {2 event coins}."
language_NPC["Event Seller"]["en"][2] = ". Remember that you can buy in large ammounts, example: {2 event coins}."

language_NPC["Event Seller"]["pt"][3] = "Eu troco"
language_NPC["Event Seller"]["en"][3] = "I trade"

language_NPC["Event Seller"]["pt"][4] = "Aqui esta sua"
language_NPC["Event Seller"]["en"][4] = "Here you are"

language_NPC["Event Seller"]["pt"][5] = "Você não tem item suficiente."
language_NPC["Event Seller"]["en"][5] = "You don't have enough items."

language_NPC["Event Seller"]["pt"][6] = "Você quer uma"
language_NPC["Event Seller"]["en"][6] = "Do you want"

language_NPC["Event Seller"]["pt"][7] = "O quê?"
language_NPC["Event Seller"]["en"][7] = "What?"

language_NPC["Event Seller"]["pt"][8] = "{DC} São crystais coins, quando você junta 100kk deles, se transformam em DC."
language_NPC["Event Seller"]["en"][8] = "{DC} They are gold ingot, when you join 100 kk they are transformed."

language_NPC["Event Seller"]["pt"][9] = "{titan ek helmet} Arm:15, club fighting +1, sword fighting +1, axe fighting +1, shielding +2, protection all +2%, faster regeneration"
language_NPC["Event Seller"]["en"][9] = "{titan ek helmet} Arm:15, club fighting +1, sword fighting +1, axe fighting +1, shielding +2, protection all +2%, faster regeneration"

language_NPC["Event Seller"]["pt"][10] = "{titan ek armor} arm:20, club fighting +3, sword fighting +3, axe fighting +3, protection all +4%, faster regeneration"
language_NPC["Event Seller"]["en"][10] = "{titan ek armor} arm:20, club fighting +3, sword fighting +3, axe fighting +3, protection all +4%, faster regeneration"

language_NPC["Event Seller"]["pt"][11] = "{titan ek legs} arm:14, club fighting +3, sword fighting +3, axe fighting +3, faster regeneration"
language_NPC["Event Seller"]["en"][11] = "{titan ek legs} arm:14, club fighting +3, sword fighting +3, axe fighting +3, faster regeneration"

language_NPC["Event Seller"]["pt"][12] = "{titan ek boots} speed +40, faster regeneration"
language_NPC["Event Seller"]["en"][12] = "{titan ek boots} speed +40, faster regeneration"

language_NPC["Event Seller"]["pt"][13] = "{titan ek shield} def:50, club fighting +3, sword fighting +3, axe fighting +3, shielding +3, protection all +4%"
language_NPC["Event Seller"]["en"][13] = "{titan ek shield} def:50, club fighting +3, sword fighting +3, axe fighting +3, shielding +3, protection all +4%"

language_NPC["Event Seller"]["pt"][14] = "{titan ek ring} club fighting +3, sword fighting +3, axe fighting +3, protection all +3%, faster regeneration"
language_NPC["Event Seller"]["en"][14] = "{god ek ring} club fighting +1, sword fighting +1, axe fighting +1, protection all +2%, faster regeneration"

language_NPC["Event Seller"]["pt"][15] = "{titan hammer} atk:60, def:50 +3, club fighting +3"
language_NPC["Event Seller"]["en"][15] = "{god hammer} atk:53, def:35 +1, club fighting +1"

language_NPC["Event Seller"]["pt"][16] = "{titan axe} atk:60, def:50 +3, axe fighting +3"
language_NPC["Event Seller"]["en"][16] = "{god axe} atk:53, def:35 +1, axe fighting +1"

language_NPC["Event Seller"]["pt"][17] = "{titan sword} atk:60, def:50 +3, sword fighting +3"
language_NPC["Event Seller"]["en"][17] = "{god sword} atk:53, def:35 +1, sword fighting +1"

language_NPC["Event Seller"]["pt"][18] = "{titan rp helmet} arm:13, distance fighting +2, protection all +2%, faster regeneration"
language_NPC["Event Seller"]["en"][18] = "{god rp helmet} arm:9, distance fighting +2, protection all +2%, faster regeneration"

language_NPC["Event Seller"]["pt"][19] = "{titan rp armor} arm:18, distance fighting +3, protection all +4%, faster regeneration"
language_NPC["Event Seller"]["en"][19] = "{god rp armor} arm:15, distance fighting +2, protection physical +3%, death +3%, faster regeneration"

language_NPC["Event Seller"]["pt"][20] = "{titan rp legs} arm:12, distance fighting +3, faster regeneration"
language_NPC["Event Seller"]["en"][20] = "{titan rp legs} arm:12, distance fighting +3, faster regeneration"

language_NPC["Event Seller"]["pt"][21] = "{titan rp boots} speed +40, faster regeneration"
language_NPC["Event Seller"]["en"][21] = "{titan rp boots} speed +40, faster regeneration"

language_NPC["Event Seller"]["pt"][22] = "{titan rp shield} distance fighting +3, protection all +3%, faster regeneration"
language_NPC["Event Seller"]["en"][22] = "{titan rp shield} distance fighting +3, protection all +3%, faster regeneration"

language_NPC["Event Seller"]["pt"][23] = "{titan rp ring} atk:74, distance fighting +1"
language_NPC["Event Seller"]["en"][23] = "{titan rp ring} atk:74, distance fighting +1"

language_NPC["Event Seller"]["pt"][24] = "{titan brabo cross} atk:74, distance fighting +1"
language_NPC["Event Seller"]["en"][24] = "{titan brabo cross} atk:74, distance fighting +1"

language_NPC["Event Seller"]["pt"][25] = "{titan mage robe} arm:12, magic level +3, protection all +4%, faster regeneration"
language_NPC["Event Seller"]["en"][25] = "{titan mage robe} arm:12, magic level +3, protection all +4%, faster regeneration"

language_NPC["Event Seller"]["pt"][26] = "{titan mage hat} arm:10, magic level +1, protection all +2%, faster regeneration"
language_NPC["Event Seller"]["en"][26] = "{titan mage hat} arm:10, magic level +1, protection all +2%, faster regeneration"

language_NPC["Event Seller"]["pt"][27] = "{titan mage legs} arm:12, magic level +3, faster regeneration"
language_NPC["Event Seller"]["en"][27] = "{titan mage legs} arm:12, magic level +3, faster regeneration"

language_NPC["Event Seller"]["pt"][28] = "{titan mage boots} speed +40, faster regeneration"
language_NPC["Event Seller"]["en"][28] = "{titan mage boots} speed +40, faster regeneration"

language_NPC["Event Seller"]["pt"][29] = "{titan mage shield} def:36, magic level +4, protection all +4%"
language_NPC["Event Seller"]["en"][29] = "{titan mage shield} def:36, magic level +4, protection all +4%"

language_NPC["Event Seller"]["pt"][30] = "{titan mage wand} properly by druids and sorcerers of level 130"
language_NPC["Event Seller"]["en"][30] = "{titan mage wand} properly by druids and sorcerers of level 130"

language_NPC["Event Seller"]["pt"][31] = "{titan mage ring} magic level +3, protection all +3%, faster regeneration"
language_NPC["Event Seller"]["en"][31] = "{titan mage ring} magic level +3, protection all +3%, faster regeneration"


--- Hefesto
language_NPC["Hefesto"]["pt"][1] = "Got some rare things on sale, stranger."
language_NPC["Hefesto"]["en"][1] = "Got some rare things on sale, stranger."

language_NPC["Hefesto"]["pt"][2] = ". Lembre-se que você pode comprar em quantidades maiores, exemplo: {2 mage ring}."
language_NPC["Hefesto"]["en"][2] = ". Remember that you can buy in large ammounts, example: {2 mage ring}."

language_NPC["Hefesto"]["pt"][3] = "Eu troco"
language_NPC["Hefesto"]["en"][3] = "I trade"

language_NPC["Hefesto"]["pt"][4] = "Aqui esta sua"
language_NPC["Hefesto"]["en"][4] = "Here you are"

language_NPC["Hefesto"]["pt"][5] = "Você não tem item suficiente."
language_NPC["Hefesto"]["en"][5] = "You don't have enough items."

language_NPC["Hefesto"]["pt"][6] = "Você quer uma"
language_NPC["Hefesto"]["en"][6] = "Do you want"

language_NPC["Hefesto"]["pt"][7] = "O quê?"
language_NPC["Hefesto"]["en"][7] = "What?"

language_NPC["Hefesto"]["pt"][8] = "{DC} São crystais coins, quando você junta 100kk deles, se transformam em DC."
language_NPC["Hefesto"]["en"][8] = "{DC} They are gold ingot, when you join 100 kk they are transformed."

language_NPC["Hefesto"]["pt"][9] = "{god ek helmet} arm:10, club fighting +1, sword fighting +1, axe fighting +1, shielding +2, protection all +2%, faster regeneration"
language_NPC["Hefesto"]["en"][9] = "{god ek helmet} arm:10, club fighting +1, sword fighting +1, axe fighting +1, shielding +2, protection all +2%, faster regeneration"

language_NPC["Hefesto"]["pt"][10] = "{god ek armor} arm:16, club fighting +1, sword fighting +1, axe fighting +1, protection physical +3%, death +3%, faster regeneration"
language_NPC["Hefesto"]["en"][10] = "{god ek armor} arm:16, club fighting +1, sword fighting +1, axe fighting +1, protection physical +3%, death +3%, faster regeneration"

language_NPC["Hefesto"]["pt"][11] = "{god ek legs} arm:10, magic level +2, faster regeneration"
language_NPC["Hefesto"]["en"][11] = "{god ek legs} arm:10, magic level +2, faster regeneration"

language_NPC["Hefesto"]["pt"][12] = "{god ek boots} speed +25, faster regeneration"
language_NPC["Hefesto"]["en"][12] = "{god ek boots} speed +25, faster regeneration"

language_NPC["Hefesto"]["pt"][13] = "{vip ek shield} def:38, club fighting +1, sword fighting +1, axe fighting +1, shielding +3, protection all +2%"
language_NPC["Hefesto"]["en"][13] = "{vip ek shield} def:38, club fighting +1, sword fighting +1, axe fighting +1, shielding +3, protection all +2%"

language_NPC["Hefesto"]["pt"][14] = "{god ek ring} club fighting +1, sword fighting +1, axe fighting +1, protection all +2%, faster regeneration"
language_NPC["Hefesto"]["en"][14] = "{god ek ring} club fighting +1, sword fighting +1, axe fighting +1, protection all +2%, faster regeneration"

language_NPC["Hefesto"]["pt"][15] = "{god hammer} atk:53, def:35 +1, club fighting +1"
language_NPC["Hefesto"]["en"][15] = "{god hammer} atk:53, def:35 +1, club fighting +1"

language_NPC["Hefesto"]["pt"][16] = "{god axe} atk:53, def:35 +1, axe fighting +1"
language_NPC["Hefesto"]["en"][16] = "{god axe} atk:53, def:35 +1, axe fighting +1"

language_NPC["Hefesto"]["pt"][17] = "{god sword} atk:53, def:35 +1, sword fighting +1"
language_NPC["Hefesto"]["en"][17] = "{god sword} atk:53, def:35 +1, sword fighting +1"

language_NPC["Hefesto"]["pt"][18] = "{god rp helmet} arm:9, distance fighting +2, protection all +2%, faster regeneration"
language_NPC["Hefesto"]["en"][18] = "{god rp helmet} arm:9, distance fighting +2, protection all +2%, faster regeneration"

language_NPC["Hefesto"]["pt"][19] = "{god rp armor} arm:15, distance fighting +2, protection physical +3%, death +3%, faster regeneration"
language_NPC["Hefesto"]["en"][19] = "{god rp armor} arm:15, distance fighting +2, protection physical +3%, death +3%, faster regeneration"

language_NPC["Hefesto"]["pt"][20] = "{god rp legs} arm:10, distance fighting +1, faster regeneration"

language_NPC["Hefesto"]["pt"][21] = "{god rp boots} speed +25, faster regeneration"

language_NPC["Hefesto"]["pt"][22] = "{vip rp shield} def:36, distance fighting +1, protection all +2%"

language_NPC["Hefesto"]["pt"][23] = "{gold rp ring} distance fighting +1, protection all +1%, faster regeneration"

language_NPC["Hefesto"]["pt"][24] = "{god infernal cross} atk:67, distance fighting +1"

language_NPC["Hefesto"]["pt"][25] = "{god mage robe} arm:12, magic level +2, protection physical +7%, death +8%, faster regeneration"

language_NPC["Hefesto"]["pt"][26] = "{god mage hat} arm:12, magic level +1, protection all +2%, faster regeneration"

language_NPC["Hefesto"]["pt"][27] = "{god mage legs} arm:10, magic level +2, faster regeneration"

language_NPC["Hefesto"]["pt"][28] = "{god mage boots} speed +25, faster regeneration"

language_NPC["Hefesto"]["pt"][29] = "{god mage shield} def:36, magic level +3, protection all +2%"

language_NPC["Hefesto"]["pt"][30] = "{god mage wand} magic level +1"


--- Hefesto

language_NPC["Mr Kiro"]["pt"][1] = "Receba Raid Tokens participando das invasões diarias."
language_NPC["Mr Kiro"]["en"][1] = "Receive Tokens by participating invasion!"

language_NPC["Mr Kiro"]["pt"][2] = "por Raid Tokens. Lembre-se que você pode comprar em quantidades maiores, exemplo: {2 super box}."
language_NPC["Mr Kiro"]["en"][2] = "for Raid Tokens. Remember that you can buy in large ammounts, example: {2 super box}."

language_NPC["Mr Kiro"]["pt"][3] = "Eu troco"
language_NPC["Mr Kiro"]["en"][3] = "I trade"

language_NPC["Mr Kiro"]["pt"][4] = "Aqui esta sua"
language_NPC["Mr Kiro"]["en"][4] = "Here you are"

language_NPC["Mr Kiro"]["pt"][5] = "Você não tem item suficiente."
language_NPC["Mr Kiro"]["en"][5] = "You don't have enough items."

language_NPC["Mr Kiro"]["pt"][6] = "Você quer uma"
language_NPC["Mr Kiro"]["en"][6] = "Do you want"

language_NPC["Mr Kiro"]["pt"][7] = "O quê?"
language_NPC["Mr Kiro"]["en"][7] = "What?"

-- Instance Ancient
language_NPC["Instance Ancient"]["pt"][1] = "Você pode fazer a instance uma vez por dia. Para entra entrar nela, você precisa pagar 500kk e pode caçar 20 minutos lá dentro."
language_NPC["Instance Ancient"]["en"][1] = "You can make the instance once a day. To enter it you must pay 500kk and you can hunt in there for 20 minutes."

language_NPC["Instance Ancient"]["pt"][2] = "Para entrar, você deve me pagar 500kk agora. Quer entrar?"
language_NPC["Instance Ancient"]["en"][2] = "To enter, you must pay me 500kk now. Do you want in?"

language_NPC["Instance Ancient"]["pt"][3] = "Somente jogadores level 2000+ podem entrar."
language_NPC["Instance Ancient"]["en"][3] = "Only players of level 2000 or above can enter."

language_NPC["Instance Ancient"]["pt"][4] = "Aproveite seus 20 minutos de instance!"
language_NPC["Instance Ancient"]["en"][4] = "Enjoy your 20 minutes of instance!"

language_NPC["Instance Ancient"]["pt"][5] = "Você não tem dinheiro suficiente."
language_NPC["Instance Ancient"]["en"][5] = "You do not have enough money."

language_NPC["Instance Ancient"]["pt"][6] = "Você só pode fazer a instance a cada 24 horas. Volte daqui"
language_NPC["Instance Ancient"]["en"][6] = "You can only make the instance once each 24 hours. Com back in"

language_NPC["Instance Ancient"]["pt"][7] = "Tudo bem, esta é uma escolha sua."
language_NPC["Instance Ancient"]["en"][7] = "That is fine, it is your choice to make."

-- Task Man
language_NPC["Task Man"]["pt"][1] = "Uau! Você já completou todas as tasks do servidor e pode pegar o seu {prêmio especial}, meus parabéns!"
language_NPC["Task Man"]["en"][1] = "Wow! You have completed all tasks of the server and can now get your {special reward}, congratilations!"

language_NPC["Task Man"]["pt"][2] = "Olá"
language_NPC["Task Man"]["en"][2] = "Hello"

language_NPC["Task Man"]["pt"][3] = "parece que eu já não tenho mais missões para você, mas é possível que novas tasks sejam adicionadas ao servidor então fique esperto!"
language_NPC["Task Man"]["en"][3] = "it seems like I don't have any more tasks for you, but it is possible that new tasks are added to the server, so keep an eye on it!"

language_NPC["Task Man"]["pt"][4] = "você já completou"
language_NPC["Task Man"]["en"][4] = "you have already completed"

language_NPC["Task Man"]["pt"][5] = "das tasks do servidor, continue completando para ganhar um prêmio especial! Se você completou alguma task e quer receber o prêmio dela, basta me dizer o nome dela (você pode ver o nome usando !task). Use a página Task System do nosso site para mais informações!"
language_NPC["Task Man"]["en"][5] = "of the server's tasks, keep on completing to win a special reward! If you have completed a task and wants to receive the reward from it, just tell me it's name (you can see the task names using !task). Use the Task System page on our website for more information!"

language_NPC["Task Man"]["pt"][6] = "Eu posso recompensá-lo por terminar tasks, basta dizer o nome de alguma! Para saber o nome das tasks e seu progresso em cada uma, diga !task. Para ver quais monstros contam para cada task e os prêmios delas, consulte nosso site na página Task System."
language_NPC["Task Man"]["en"][6] = "I can reward you for completing tasks, just tell me the name of one! To know the task names and your progress on each one, say !task. To see which mounsters count and the rewards, consult the Task System page on our website."

language_NPC["Task Man"]["pt"][7] = "Até mais"
language_NPC["Task Man"]["en"][7] = "See you later"

language_NPC["Task Man"]["pt"][8] = "Estou te dando o Warmaster outfit full como recompensa pelo seu ótimo trabalho, aproveite!"
language_NPC["Task Man"]["en"][8] = "I am giving you the full Warmaster outfit as a reward for your great job, enjoy!"

language_NPC["Task Man"]["pt"][9] = "Eu já te entreguei o Warmaster outfit e não tenho mais nada para você..."
language_NPC["Task Man"]["en"][9] = "I have already given you the Warmaster outfit and have nothing else for you..."

language_NPC["Task Man"]["pt"][10] = "Você conseguiu completar a task de"
language_NPC["Task Man"]["en"][10] = "You have completed the task of"

language_NPC["Task Man"]["pt"][11] = "parabéns! Eu vou te dar"
language_NPC["Task Man"]["en"][11] = "congratulations! I will give you"

language_NPC["Task Man"]["pt"][12] = "alguns itens como recompensa."
language_NPC["Task Man"]["en"][12] = "some items as reward."

language_NPC["Task Man"]["pt"][13] = "Desculpe, mas você ainda não matou todos os"
language_NPC["Task Man"]["en"][13] = "I am sorry, but you have not killed all the"

language_NPC["Task Man"]["pt"][14] = "Voce só matou"
language_NPC["Task Man"]["en"][14] = "You have only killed"

language_NPC["Task Man"]["pt"][15] = "Você só pode receber uma vez o prêmio de cada task."
language_NPC["Task Man"]["en"][15] = "You can only receive each task's reward once."

language_NPC["Task Man"]["pt"][16] = "Essa task não existe! Para ver os nomes das tasks use !task"
language_NPC["Task Man"]["en"][16] = "This task does not exist! To see the task names use !task"

language_NPC["Task Man"]["pt"][17] = "Adeus"
language_NPC["Task Man"]["en"][17] = "Farewell"

-- Cassino
language_NPC.Cassino["pt"][1] = "Muito bem, você ganhou! Aqui estão seus"
language_NPC.Cassino["en"][1] = "Very well, you won! Here you are"

language_NPC.Cassino["pt"][2] = "parabéns!"
language_NPC.Cassino["en"][2] = "congratulations!"

language_NPC.Cassino["pt"][3] = "Que pena, você perdeu! Mais sorte na próxima hehehe!"
language_NPC.Cassino["en"][3] = "What a shame, you lost! Better luck next time hehehe!"

language_NPC.Cassino["pt"][4] = "O valor máximo da aposta é de 50kk!"
language_NPC.Cassino["en"][4] = "The maximum allowed ammount is 50kk!"

language_NPC.Cassino["pt"][5] = "Você precisa colocar aqui no meio o dinheiro que quer apostar! Lembre-se que o mínimo é 1kk (nugget coin) e o máximo 50kk!"
language_NPC.Cassino["en"][5] = "You must place the money in the middle of the depots! Remember that the minimum allowed ammount is 1kk (nugget coin) and the maximum is 50kk!"

language_NPC.Cassino["pt"][6] = "Olá"
language_NPC.Cassino["en"][6] = "Hello"

language_NPC.Cassino["pt"][7] = "Para jogar diga H ou L (L = 1,2,3 e H = 4,5,6)"
language_NPC.Cassino["en"][7] = "To play say H or L (L = 1,2,3 and H = 4,5,6)"

language_NPC.Cassino["pt"][8] = "Você ficou muito tempo ocupando o cassino e foi teleportado!"
language_NPC.Cassino["en"][8] = "You ocupied the cassino for too long and were teleported!"

language_NPC.Cassino["pt"][9] = "Venha tentar a sua sorte! Diga L para apostar entre 1 e 3 ou H para apostar entre 4 e 6, se ganhar você recebe o DOBRO do que apostou!"
language_NPC.Cassino["en"][9] = "Come try your luck! Say L to bet between 1 and 3 or H to bet between 4 and 6, if you win you will get TWICE "


-- Dice Event
language_NPC.Dice["pt"][1] = "Ganheeeeei <3"
language_NPC.Dice["en"][1] = "I woooooon <3"

language_NPC.Dice["pt"][2] = "Perdi!!! :@"
language_NPC.Dice["en"][2] = "I lost!!! :@"

language_NPC.Dice["pt"][3] = "Diga um número de 1 a 6,"
language_NPC.Dice["en"][3] = "Say a number between 1 and 6,"


-- PvP Task
language_NPC["PvP Task"]["pt"][1] = "Para conseguir a spell, você precisa matar 50 players. Você aceita? PS: Matar players com o mesmo IP que você ou mais de 100 leveis abaixo do seu não conta."
language_NPC["PvP Task"]["en"][1] = "To get the spell, you must kill 50 player. Do you accept it? PS: Killing players with the same IP as you or with more than 100 levels beneath yours will not count."

language_NPC["PvP Task"]["pt"][2] = "Muito bem, você completou a task! A sua nova magia é"
language_NPC["PvP Task"]["en"][2] = "Very well, you have completed the task! Your new spell is"

language_NPC["PvP Task"]["pt"][3] = "Você matou"
language_NPC["PvP Task"]["en"][3] = "You killed"

language_NPC["PvP Task"]["pt"][4] = "Continue com o bom trabalho!"
language_NPC["PvP Task"]["en"][4] = "Continue the good job!"

language_NPC["PvP Task"]["pt"][5] = "Você já tem sua magia"
language_NPC["PvP Task"]["en"][5] = "You already have your spell"

language_NPC["PvP Task"]["pt"][6] = "Certo, boa sorte! Volte aqui quando tiver matado todos."
language_NPC["PvP Task"]["en"][6] = "Right, good luck! Come back here when you have killed them all."

-- Monk
language_NPC["Healing Monk"]["pt"][1] = "Em nome de Deus, eu te curo nobre guerreiro!"
language_NPC["Healing Monk"]["en"][1] = "By the name of god, I heal you noble warrior!"

language_NPC["Healing Monk"]["pt"][2] = "Me parece que você está em bom estado..."
language_NPC["Healing Monk"]["en"][2] = "It seems to me like you are in good health..."

-- Lire
language_NPC.Lire["pt"][1] = "Olá"
language_NPC.Lire["en"][1] = "Hello"

language_NPC.Lire["pt"][2] = "eu sou a responsável pelas caçadas no SharkOT. Você quer {iniciar} uma caçada ou quer que eu te explique {como funciona}? Você também pode {comprar} uma nova caçada se já tiver feito uma hoje."
language_NPC.Lire["en"][2] = "I am the responsible for the chases on SharkOT. Do you want to {start} a race or would you like me to explain {how it works}? You can also {buy} a new chase if have alredy done one today"

language_NPC.Lire["pt"][3] = "Muito bem! Então por favor escolha o nível de caçada que deseja fazer, os níveis são: {gold}, {platinum}, {crystal}, {nugget} e {ingot}."
language_NPC.Lire["en"][3] = "Very well! So please choose the level of the chase you wish to do, the levels are: {gold}, {platinum}, {crystal}, {nugget} and {ingot}."

language_NPC.Lire["pt"][4] = "Você já fez uma caçada hoje... Volte depois do server save para fazer outra. Você também pode {comprar} uma caçada para poder fazer outra."
language_NPC.Lire["en"][4] = "You have already done a chase today... Come back after the server save so you can do another one. You can also {buy} a chase so you can do another one."

language_NPC.Lire["pt"][5] = "Eu cobro 7 Tokens para você poder fazer outra caçada. Você aceita pagar este valor?"
language_NPC.Lire["en"][5] = "I charge 7 Tokens so you can do another chase. Do you accept to pay this value?"

language_NPC.Lire["pt"][6] = "Muito bem! Agora você já pode fazer uma nova caçada, qual nível você deseja fazer: {gold}, {platinum}, {crystal}, {nugget} ou {ingot}?"
language_NPC.Lire["en"][6] = "Very well!! Now you can do another hunt, which level do you desire to do: {gold}, {platinum}, {crystal}, {nugget} or {ingot}?"

language_NPC.Lire["pt"][7] = "Sinto muito, mas você não tem 7 Tokens."
language_NPC.Lire["en"][7] = "I am sorry but you do not have 7 Tokens."

language_NPC.Lire["pt"][8] = "Tudo bem então, volte aqui caso deseje algo mais."
language_NPC.Lire["en"][8] = "Very well then, come back here in case you desire anything else."

language_NPC.Lire["pt"][9] = "Certo, esta caçada está livre para você, boa sorte!"
language_NPC.Lire["en"][9] = "Ok, this chase is free for you, good luck!"

language_NPC.Lire["pt"][10] = "Já tem alguém fazendo esta caçada no momento... Ela vai terminar em"
language_NPC.Lire["en"][10] = "Someone is already doing this chase right now... I will end in"

language_NPC.Lire["pt"][11] = "Aguarde para iniciar ou escolha outro nível."
language_NPC.Lire["en"][11] = "Wait to start it or choose another level."

language_NPC.Lire["pt"][12] = "Sinto muito, mas somente jogadores com level"
language_NPC.Lire["en"][12] = "I am sorry, but only players with level"

language_NPC.Lire["pt"][13] = "ou mais podem fazer este nível de caçada."
language_NPC.Lire["en"][13] = "or above can do this chase level."

language_NPC.Lire["pt"][14] = "O sistema é muito simples: Existem 5 níveis de caçada, sendo cada um mais difícil e com melhores recompensas. As caçadas têm duração de 10 minutos e, ao entrar na caçada, monstros vão começar a spawnar sem parar. Seu objetivo é matar todos eles antes que o tempo acabe. Se você conseguir, você recebe uma boa quantia de exp e dinheiro como recompensa. Que tal {iniciar} uma caçada agora mesmo?"
language_NPC.Lire["en"][14] = "This is a very simple system: There are 5 chase levels, each one harder and with better rewards. The chases last 10 minutes and, when you enter the chase, monsters will start to spawn with no stop. Your goal is to kill all of them before the time runs out. If you manage to do so, you will receive a good ammount of exp and money as reward. What about {start} a chase right now?"




function getMessage(cid, npcName, message)
	local lang = getPlayerStorageValue(cid, language)
	if type(lang) == "string" then
		if language_NPC[npcName][lang] and language_NPC[npcName][lang][message] then
			return language_NPC[npcName][lang][message]
		else
			return language_NPC[npcName]["en"][message]
		end
	else
		return language_NPC[npcName]["pt"][message]
	end
end

gm = getMessage
