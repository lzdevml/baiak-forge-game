function onSay(cid, words, param, channel)
        local clean = string.explode(param, "=")
        local posX = string.explode(clean[2], ",")[1]
        local posY = string.explode(clean[3], ",")[1]
        local posZ = string.explode(string.explode(clean[4], ",")[1], "}")[1]
        local posFinal = {x=posX, y=posY, z=posZ}

        doTeleportThing(cid, posFinal, true)
	return true
end