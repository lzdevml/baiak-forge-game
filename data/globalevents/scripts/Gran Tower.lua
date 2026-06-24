function onThink(interval, lastExecution, thinkInterval)
 for index, dates in ipairs(GRANTOWER.DATES) do
  if table.find(dates, os.date("%A")) then
   if table.find(dates, os.date("%H:%M")) then
    doPrepareGranTower()
   end
  end
 end
 return true
end