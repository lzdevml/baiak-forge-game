local msg = {

		
-- CASTLE
	['20:50'] = {text = '[Styller Castle]: Muito Sangue será derramado, Organize sua GUILD e VemPraGuerra!', type = 21},
	['20:54'] = {text = '[Styller Castle]: Se você conhece o inimigo e conhece a si mesmo, não precisa temer o resultado de cem batalhas... Junte toda sua guild e VemPraGuerra!', type = 21},
	['20:56'] = {text = '[Styller Castle]: Só os mortos conhecem o fim da guerra. Falta Apenas 4 Minutos para a Abertura dos portões, Junte toda sua guild e VemPraGuerra!', type = 21},
	['20:56'] = {text = '[Styller Castle]: A partir das 21:00 as portas do Styller Castle sera aberta para invasões.Organize sua GUILD e VemPraGuerra!', type = 21},
	['20:58'] = {text = '[Styller Castle]: Ao dominar o Styller Castle, Sua guild recebe acesso ao castle por 15Horas.', type = 21},
	['21:00'] = {text = '[Styller Castle]: O homem nasceu para lutar e a sua vida é uma eterna batalha. BOA SORTE A TODAS AS GUILDS', type = 21},
	['21:02'] = {text = '[Styller Castle]: As portas para a invasão ja está liberada, Traga sua guild e VemPraGuerra!.', type = 21},
	['21:05'] = {text = '[Styller Castle]: As portas para a invasão ja está liberada.', type = 21},
	['21:30'] = {text = '[ATENÇÃO] O Styller Castle termina em 30 minutos.', type = 21},
	['21:45'] = {text = '[ATENÇÃO] O Styller Castle termina em 15 minutos.', type = 21},
	['21:55'] = {text = '[ATENÇÃO] O Styller Castle termina em 5 minutos.', type = 21},
	['21:58'] = {text = '[ATENÇÃO] O Styller Castle termina em 2 minutos.', type = 21},
	['21:59'] = {text = '[ATENÇÃO] O Styller Castle termina em 1 minutos.', type = 21},


}

function onThink(interval, lastExecution)
	local h = msg[os.date('%X'):sub(1, 5)]
	return h and doBroadcastMessage(h.text, h.type) or true
end