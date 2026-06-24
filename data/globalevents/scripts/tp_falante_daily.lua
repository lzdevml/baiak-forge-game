local positions = {
{texto = " 3% " , pos= {x = 499, y = 439, z = 9}},
{texto = " ~ 35% ~ " , pos = {x = 501, y = 439, z = 9}},
{texto = " ~ 30% ~ " , pos = {x = 497, y = 439, z = 9}},
{texto = " ~ 100% ~ " , pos = {x = 500, y = 439, z = 9}},
{texto = " ~ 35% ~ " , pos = {x = 496, y = 439, z = 9}},
{texto = " ~ 40% ~ " , pos = {x = 502, y = 439, z = 9}},
{texto = " ~ 22% ~ " , pos = {x = 498, y = 439, z = 9}}
}

local colors = {
TEXTCOLOR_RED,
TEXTCOLOR_BLUE,
TEXTCOLOR_PINK,
TEXTCOLOR_GREEN,
TEXTCOLOR_ORANGE,
TEXTCOLOR_YELLOW
}

local effects = {
CONST_ME_FIREWORK_YELLOW,
CONST_ME_FIREWORK_RED,
CONST_ME_FIREWORK_BLUE
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
   local t = getSpectators(pid.pos, 7, 5, false)
            if t then
                for _, cid in ipairs(t) do
                    if isPlayer(cid) then
                       -- doCreatureSay(pid.pos, pid.texto, TALKTYPE_ORANGE_1, false, cid, pid.pos) -- IN ORANGE
						doSendAnimatedText(pid.pos, pid.texto, colors[math.random(1, #colors)])
					 -- doSendMagicEffect(cid, effects[math.random(1, #effects)]) -- EFEITOS
                    end
                end
            end
   end
 return true
end