local positions = {
{texto = " 30% " , pos= {x = 481, y = 439, z = 9}},
{texto = " ~ 30% ~ " , pos = {x = 482, y = 439, z = 9}},
{texto = " ~ 30% ~ " , pos = {x = 483, y = 439, z = 9}},
{texto = " ~ 30% ~ " , pos = {x = 484, y = 439, z = 9}},
{texto = " ~ 30% ~ " , pos = {x = 485, y = 439, z = 9}},
{texto = " ~ 30% ~ " , pos = {x = 486, y = 439, z = 9}},
{texto = " ~ 30% ~ " , pos = {x = 487, y = 439, z = 9}}
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