Storage = {
   EruaranGreeting = 99800,
   
}

function translate(cid, text)
	if getPlayerStorageValue(cid, 321471) == "pt" then
		return text[1]
	else
		return text[2]
	end
end