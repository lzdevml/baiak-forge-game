-- ########################################################
-- #####       	  Name: Adriano Swatt'   	          #####
-- ##### 			  Version: 3.0                    #####
-- ########################################################
-- #####  		Developed by Adriano Swatt'			  #####
-- #####  	 Contact: adrianoswat@yahoo.com.br        #####
-- #####  	 PERSONALIZED TASK SYSTEM BY SWATT'    	  #####
-- ########################################################

local cfg = _MONSTERS_TASK_SYSTEM_CONFIG
function onSay(cid, words, param)
	str = ""
	get = checkPlayerIsInTask(cid)
	if #get > 0 then
		if str == "" then str = "Your Active Task List:" end
		for a = 1, #get do
			task = cfg[get[a]]
			tinfo = getInfoPlayerTask(cid, get[a])
			if not task.inDay then
				str = ""..str.."\n » ["..task.mlist[1]:upper().."] \n Killeds: "..getPlayerStorageValue(cid, task.countSto).."/"..task.count.." » Repeateds: "..tinfo[1].."/"..task.repeated..".\n Expiration Date: Never.\n"
			else
				str = ""..str.."\n » ["..task.mlist[1]:upper().."] \n Killeds: "..getPlayerStorageValue(cid, task.countSto).."/"..task.count.." » Repeateds: "..tinfo[1].."/"..task.repeated..".\n Expiration Date: "..os.date("%b %d, %Y at %X", tinfo[2])..".\n"
			end
		end
	else
		str = "You don't have any task active right now."
	end
	rept = checkPlayerRepetationTask(cid)
	if #rept > 0 then
		str = ""..str.."\nTask Already Done:"
		for a = 1, #rept do
			task = cfg[rept[a]]
			tinfo = getInfoPlayerTask(cid, rept[a])
			str = ""..str.."\n » ["..task.mlist[1]:upper().."] » Repeateds: "..tinfo[1].."/"..task.repeated.."."
		end
	end
	doShowTextDialog(cid, 6561, str)
return true
end

--[[
	<talkaction words="/taskinfo;!taskinfo" event="script" value="__taskinfo_TalkActions.lua"/>
]]--