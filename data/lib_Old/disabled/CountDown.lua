-- CountDown Lib

function countDown(position, time, color) -- faz a contagem de tempo
	local msg = os.date("%M:%S", time) 
	if time > 0 then
		doSendAnimatedText(position, msg, color)
		addEvent(countDown, 1000, position, time - 1, color)
	end
return true
end