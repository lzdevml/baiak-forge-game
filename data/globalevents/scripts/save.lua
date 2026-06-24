function onThink(interval, lastExecution)
	doSaveServer()
          doBroadcastMessage("Saving your character....")
	return TRUE
end