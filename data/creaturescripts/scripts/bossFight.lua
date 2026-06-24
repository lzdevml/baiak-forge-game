local libcfg = _SETTING_TASK_SYSTEM_CONFIG
function onKill(cid, target, lastHit)
	print('EXECUTANDO')
	if isPlayer(target) or getCreatureMaster(target) then
		return true
	end
	local taskSto = getPlayerStorageValue(cid, libcfg.bossRoom.ctrl_storage)
	setPlayerStorageValue(cid, taskSto, 3)
	unregisterCreatureEvent(cid, "bossFight")
	setPlayerStorageValue(cid, libcfg.bossRoom.ctrl_storage, -1)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce matou o boss, meus parabens.")
return TRUE
end

