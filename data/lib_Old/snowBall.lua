-- POSIÇÕES IMPORTANTES
SBW_AREA = {{x=1925, y=76, z=7}, {x=1966, y=118, z=7}}-- AREA DO EVENTO | Canto superior esquerdo / inferior direito
SBW_WAITROOM = {{x=1943, y=94, z=6}, {x=1949, y=100, z=6}} -- AREA DE ESPERA | Canto superior esquerdo / inferior direito
SBW_TP = {x=151, y=43, z=7} -- local onde teleport sera criado (entrada de jogadores)
SBW_TPGO = {x=1946, y=95, z=6} -- local onde teleport vai levar (saida de jogadores)
SBW_TPEND = {x=160, y=51, z=7} -- local onde serao teleport ao final do evento
SBW_GERADOR = {x=1946, y=98, z=7} -- local onde gerador vai ficar

-- CONFIGURAÇÕES DO EVENTO
SBW_DAYS = {1, 2, 3, 4, 5, 6, 7} -- dias de semana que vai abrir
SBW_DURATION = 15 -- duração do evento em minutos
SBW_POINTSKILL = 1 -- pontos de jogo por morte
SBW_AMMOBUY = 10 -- quantia de munições compradas por cada ponto
SBW_MINAMMO = 50 -- munição inicial dos jogadores
SBW_TIMEWAIT = 5 -- tempo na sala de espera em minutos
SBW_AMMOINFI = false
SBW_LOSTSCORE = true
SBW_RANDOMIZE = true
SBW_RESETAMMO = true
SBW_STARTAUTO = true

--PREMIO DO EVENTO
SBW_ADDREWARD = true
SBW_REWARDS = {{8981, 5}, {6527, 75}}

-- // Não mexa daqui para baixo
SBW_TFS = "0.4" 

-- STORAGES
SBW_INEVENT = 35078 
SBW_SCORE = 35079
SBW_AMMO = 35080

SBW_WALLSID = {
	5324, 7003, 7021, 6712, 7023, 7002, 6713, 6714, 6869, 6822, 6823, 6824, 6825, 6826, 6827, 6828, 6829, 6830,
	6831, 6832, 6833, 6707, 6708, 6709, 6710, 6711, 2698, 2697, 7020, 6719, 6720, 6721, 6722, 6723, 6724, 6725,
	6726, 6727, 6761, 6762, 6768, 6769, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619,
	4620, 4621, 4622, 4623, 4624, 4625, 4664, 4665, 4666, 7008, 7009, 7010, 7011, 8239, 7004, 7005, 7006, 7007,
	6627, 6628, 6629, 6630, 6631, 6632, 6633, 6634, 6635, 6636, 6637, 6638, 7022
}

SBW_BALLSPEED = 170
SBW_SHOOTEXAUSTHED = 1000
SBW_SHOOTDIR = 0                             
SBW_STATUS = 'on' 

-- MENSAGENS
SBW_MSGWARNING = "[SNOWBALL WAR] Abriu o teleport para entrada no evento. Para participar, se dirija até a sala de Eventos."
SBW_MSGSTART = "[SNOWBALL WAR] O teleport foi removido e o evento foi iniciado. Boa sorte a todos os participantes!"