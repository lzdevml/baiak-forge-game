card = {
   name = "card system";
   author = "Mock";
   version = "1.0.0.0";
   query="ALTER TABLE `accounts` ADD `card_time` INTEGER";
   query2="ALTER TABLE `accounts` ADD `card_time` INT(15) NOT NULL"
}

function card.setTable()
   dofile('config.lua')
   if sqlType == "sqlite" then
        db.executeQuery(card.query)
   else
        db.executeQuery(card.query2)
   end
end

function card.getcard(cid)
         assert(tonumber(cid),'Parameter must be a number') 
         if isPlayer(cid) == FALSE then error('Player don\'t find') end; 
         ae =  db.getResult("SELECT `card_time` FROM `accounts` WHERE `name` = '"..getPlayerAccount(cid).."';")
         if ae:getID() == -1 then
            return 0
         end

local retee = ae:getDataInt("card_time") or 0
ae:free()
         return retee
end

function card.getcardByAcc(acc)
         assert(acc,'Account is nil')
         local a = db.getResult("SELECT `card_time` FROM `accounts` WHERE `name` = '"..acc.."';")
         if a:getID() ~= -1 then
             return a:getDataInt("card_time") or 0, a:free()
         else
             error('Account don\'t find.')
         end
end

function card.setcard(cid,time)
         dofile("config.lua")
         assert(tonumber(cid),'Parameter must be a number')
         assert(tonumber(time),'Parameter must be a number')
         if isPlayer(cid) == FALSE then error('Player don\'t find') end; 
         db.executeQuery("UPDATE `"..sqlDatabase.."`.`accounts` SET `card_time` = '"..(os.time()+time).."' WHERE `accounts`.`name` ='".. getPlayerAccount(cid).."';")
end

function card.getcardByAccount(acc)
         assert(acc,'Account is nil')
         return db.getResult("SELECT `card_time` FROM `accounts` WHERE `name` = '"..acc.."';"):getDataInt("card_time") or 0
end                                      

function card.hascard(cid)
         assert(tonumber(cid),'Parameter must be a number')
         if isPlayer(cid) == FALSE then return end;
         local t = card.getcard(cid) or 0
         if os.time(day) < t then
            return TRUE
         else
            return FALSE
         end
end

function card.hascards(cid)
         assert(tonumber(cid),'Parameter must be a number')
         if isPlayer(cid) == FALSE then return end;
         local t = card.getcard(cid)
         if os.time(day) < t then
            return TRUE
         else
            return FALSE
         end
end

function card.accountHascard(acc)
         assert(acc,'Account is nil')
         if os.time() < card.getcardByAccount(acc) then
            return TRUE
         else
            return FALSE
         end
end
function card.getDays(days)
   return (3600 * 24 * days)
end

function card.addcardByAccount(acc,time)
   assert(acc,'Account is nil')
   assert(tonumber(time),'Parameter must be a number')
   local a = card.getcardByAcc(acc)
   a = os.difftime(a,os.time())
   if a < 0 then a = 0 end;
   a = a+time
   return card.setcardByAccount(acc,a)
end

function card.setcardByAccount(acc,time)
         dofile("config.lua")
         assert(acc,'Account is nil')
         assert(tonumber(time),'Parameter must be a number')
         db.executeQuery("UPDATE `accounts` SET `card_time` = '"..(os.time()+time).."' WHERE `accounts`.`name` ='"..acc.."';")
         return TRUE
end

function card.returncardString(cid)
   assert(tonumber(cid),'Parameter must be a number')
   if isPlayer(cid) == TRUE then
      return os.date("%d %B %Y %X ", card.getcard(cid))
   end
end