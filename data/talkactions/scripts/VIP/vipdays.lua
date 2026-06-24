function onSay(cid, words, param)
         if pacc.haspacc(cid) == TRUE then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your pacc end in "..os.date("%d %B %Y %X ",pacc.getpacc(cid)))
         else
             if pacc.getpacc(cid) ~= 0 then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You're not a pacc player. Your pacc has finished in "..os.date("%d %B %Y %X ", pacc.getpacc(cid)).." and now is "..os.date("%d %B %Y %X ", os.time()))
             else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You're not a pacc player. You naver has a pacc.")
             end
         end
         return TRUE
end