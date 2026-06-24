local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) 
    npcHandler:onCreatureAppear(cid) 
end 

function onCreatureDisappear(cid) 
    npcHandler:onCreatureDisappear(cid) 
end 

function onCreatureSay(cid, type, msg) 
    npcHandler:onCreatureSay(cid, type, msg) 
end 

function onThink() 
    npcHandler:onThink() 
end 

function creatureSayCallback(cid, type, msg) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    local talkUser = cid
    local shopWindow = {}
    local moeda = getPlayerMoney(cid)

    local items = {
        [13456] = {price = 100},
        [1983] = {price = 100},
        [1984] = {price = 100},
        [1985] = {price = 100},
        [7440] = {price = 100},
        [5468] = {price = 100},
        [12396] = {price = 100},
        [12575] = {price = 100},
        [12505] = {price = 100}
    }
local charges = 1000
    local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
        local totalPrice = items[item].price * amount
        if (getPlayerMoney(cid) >= totalPrice) then
						doPlayerRemoveMoney(cid, totalPrice) 
            local newItem = doCreateItemEx(item, amount)
            doItemSetAttribute(newItem, "charges", charges) -- Aqui você define o atributo de carga para o item
		selfSay("Aqui estão seus itens, obrigado e volte sempre.", cid)
        else
            selfSay("Você não tem dinheiro suficiente.", cid)
        end
        return true
    end

    if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE')) then
        for item, data in pairs(items) do
            table.insert(shopWindow, {id = item, subType = 0, buy = data.price, sell = 0, name = getItemNameById(item)})
        end
        openShopWindow(cid, shopWindow, onBuy, onSell)
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
