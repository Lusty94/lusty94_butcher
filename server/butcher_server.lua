local QBCore = exports['qb-core']:GetCoreObject()
local InvType = Config.CoreSettings.Inventory.Type
local NotifyType = Config.CoreSettings.Notify.Type


--notification function
function SendNotify(src, msg, type, time, title)
    if not title then title = "Notification" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message") return end
    if NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, msg, type, time)
    elseif NotifyType == 'okok' then
        TriggerClientEvent('okokNotify:Alert', src, title, msg, time, type, Config.CoreSettings.Notify.Sound)
    elseif NotifyType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msg, style = { ['background-color'] = '#00FF00', ['color'] = '#FFFFFF' } })
    elseif NotifyType == 'boii'  then
        TriggerClientEvent('boii_ui:notify', src, title, msg, type, time)
    elseif NotifyType == 'ox' then 
        TriggerClientEvent('ox_lib:notify', src, ({ title = title, description = msg, length = time, type = type, style = 'default'}))
    end
end





-------------------------------< CALLBACKS >---------------------



--plucked chicken callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:PluckedChicken', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bird = Player.Functions.GetItemByName("pluckedchicken")
    if bird  then
        cb(true)
    else
        cb(false)
    end
end)


--processed chicken callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ProcessedChicken', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bird = Player.Functions.GetItemByName("processedchicken")
    local knife = Player.Functions.GetItemByName("butcherknife")
    if bird  and knife  then
        cb(true)
    else
        cb(false)
    end
end)


--chicken breast & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenBreast', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local breast = Player.Functions.GetItemByName("chickenbreast")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if breast  and packaging  then
        cb(true)
    else
        cb(false)
    end
end)


--chicken thighs & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenThighs', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local thigh = Player.Functions.GetItemByName("chickenthighs")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if thigh  and packaging  then
        cb(true)
    else
        cb(false)
    end
end)


--chicken drumsticks & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenDrumsticks', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local drumsticks = Player.Functions.GetItemByName("chickendrumsticks")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if drumsticks  and packaging  then
        cb(true)
    else
        cb(false)
    end
end)


--chicken wings & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenWings', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local wings = Player.Functions.GetItemByName("chickenwings")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if wings  and packaging  then
        cb(true)
    else
        cb(false)
    end
end)


--chicken legs & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenLegs', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local legs = Player.Functions.GetItemByName("chickenlegs")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if legs  and packaging  then
        cb(true)
    else
        cb(false)
    end
end)


--selling items callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:SellingItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Selling.Items.ChickenBreast.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Selling.Items.ChickenThighs.RequiredItemName)
    local item3 = Player.Functions.GetItemByName(Config.Selling.Items.ChickenWings.RequiredItemName)
    local item4 = Player.Functions.GetItemByName(Config.Selling.Items.ChickenDrumsticks.RequiredItemName)
    local item5 = Player.Functions.GetItemByName(Config.Selling.Items.ChickenLegs.RequiredItemName)
    if item1 or item2 or item3 or item4 or item5 then
        cb(true)
    else
        cb(false)
    end
end)




--------------------------------< EVENTS >-------------------------


--give items
RegisterNetEvent('lusty94_butcher:server:GiveItems', function(args)
    local args = tonumber(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if args == 1 then
        if InvType == 'qb' then        
            Player.Functions.AddItem("butcherknife", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butcherknife"], "add")
        elseif InvType == 'ox' then
            if exports.ox_inventory:CanCarryItem(src, "butcherknife", 1) then
                exports.ox_inventory:AddItem(src,"butcherknife", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    elseif args == 2 then
        if InvType == 'qb' then        
            Player.Functions.AddItem("foodpackaging", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "add")
        elseif InvType == 'ox' then
            if exports.ox_inventory:CanCarryItem(src, "foodpackaging", 1) then
                exports.ox_inventory:AddItem(src,"foodpackaging", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end
end)

--pluck chicken
RegisterNetEvent('lusty94_butcher:server:PluckChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        Player.Functions.AddItem("pluckedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pluckedchicken"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "pluckedchicken", 1) then
            exports.ox_inventory:AddItem(src,"pluckedchicken", 1)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end  
end)



--process chicken
RegisterNetEvent('lusty94_butcher:server:ProcessChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
    Player.Functions.RemoveItem("pluckedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pluckedchicken"], "remove")        
        Player.Functions.AddItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "processedchicken", 1) then
            exports.ox_inventory:RemoveItem(src,"pluckedchicken", 1)
            exports.ox_inventory:AddItem(src,"processedchicken", 1)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)


--chicken breast
RegisterNetEvent('lusty94_butcher:server:ProcessChickenBreast', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")
        Player.Functions.AddItem("chickenbreast", 2)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreast"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickenbreast", 2) then
            exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
            exports.ox_inventory:AddItem(src,"chickenbreast", 2)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)

--chicken thighs
RegisterNetEvent('lusty94_butcher:server:ProcessChickenThighs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")        
        Player.Functions.AddItem("chickenthighs", 2)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighs"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickenthighs", 2) then
            exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
            exports.ox_inventory:AddItem(src,"chickenthighs", 2)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)

--chicken wings
RegisterNetEvent('lusty94_butcher:server:ProcessChickenWings', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")        
        Player.Functions.AddItem("chickenwings", 2)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwings"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickenwings", 2) then
            exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
            exports.ox_inventory:AddItem(src,"chickenwings", 2)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)

--chicken drumsticks
RegisterNetEvent('lusty94_butcher:server:ProcessChickenDrumSticks', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")          
        Player.Functions.AddItem("chickendrumsticks", 2)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumsticks"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickendrumsticks", 2) then
            exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
            exports.ox_inventory:AddItem(src,"chickendrumsticks", 2)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)

--chicken legs
RegisterNetEvent('lusty94_butcher:server:ProcessChickenLegs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then 
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")         
        Player.Functions.AddItem("chickenlegs", 2)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenlegs"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickenlegs", 2) then
            exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
            exports.ox_inventory:AddItem(src,"chickenlegs", 2)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)






--chicken breast pack
RegisterNetEvent('lusty94_butcher:server:PackChickenBreast', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then 
        Player.Functions.RemoveItem("chickenbreast", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreast"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickenbreastpack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreastpack"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickenbreastpack", 1) then
            exports.ox_inventory:RemoveItem(src,"chickenbreast", 1)
            exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
            exports.ox_inventory:AddItem(src,"chickenbreastpack", 1)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)





--chicken thighs pack
RegisterNetEvent('lusty94_butcher:server:PackChickenThighs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    if InvType == 'qb' then
        Player.Functions.RemoveItem("chickenthighs", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighs"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickenthighspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighspack"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickenthighspack", 1) then
            exports.ox_inventory:RemoveItem(src,"chickenthighs", 1)
            exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
            exports.ox_inventory:AddItem(src,"chickenthighspack", 1)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)




--chicken wings pack
RegisterNetEvent('lusty94_butcher:server:PackChickenWings', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    if InvType == 'qb' then
        Player.Functions.RemoveItem("chickenwings", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwings"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickenwingspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwingspack"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickenwingspack", 1) then
            exports.ox_inventory:RemoveItem(src,"chickenwings", 1)
            exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
            exports.ox_inventory:AddItem(src,"chickenwingspack", 1)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)





--chicken drumsticks pack
RegisterNetEvent('lusty94_butcher:server:PackChickenDrumSticks', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then 
        Player.Functions.RemoveItem("chickendrumsticks", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumsticks"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickendrumstickspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumstickspack"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickendrumstickspack", 1) then
            exports.ox_inventory:RemoveItem(src,"chickendrumsticks", 1)
            exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
            exports.ox_inventory:AddItem(src,"chickendrumstickspack", 1)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)




--chicken legs pack
RegisterNetEvent('lusty94_butcher:server:PackChickenLegs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    if InvType == 'qb' then
        Player.Functions.RemoveItem("chickenlegs", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenlegs"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickenlegspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenlegspack"], "add")
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "chickenlegspack", 1) then
            exports.ox_inventory:RemoveItem(src,"chickenlegs", 1)
            exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
            exports.ox_inventory:AddItem(src,"chickenlegspack", 1)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end 
end)



---------------------------< SELLING >-------------------



--Sell chicken
RegisterNetEvent('lusty94_butcher:server:SellItems', function(args)
    local args = tonumber(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if args == 1 then --chicken breast
        local price = Config.Selling.Items.ChickenBreast.Price
        local itemName = Player.Functions.GetItemByName(Config.Selling.Items.ChickenBreast.RequiredItemName)
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                Player.Functions.RemoveItem(itemName, itemCount)
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "remove")
                Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
            elseif InvType == 'ox' then
                exports.ox_inventory:RemoveItem(src, itemName, itemCount)
                exports.ox_inventory:AddItem(src, "money", price * itemCount)                   
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    elseif args == 2 then --chicken thighs
        local price = Config.Selling.Items.ChickenThighs.Price
        local itemName = Player.Functions.GetItemByName(Config.Selling.Items.ChickenThighs.RequiredItemName)
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                Player.Functions.RemoveItem(itemName, itemCount)
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "remove")
                Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
            elseif InvType == 'ox' then
                exports.ox_inventory:RemoveItem(src, itemName, itemCount)
                exports.ox_inventory:AddItem(src, "money", price * itemCount)                   
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    elseif args == 3 then --chicken wings
        local price = Config.Selling.Items.ChickenWings.Price
        local itemName = Player.Functions.GetItemByName(Config.Selling.Items.ChickenWings.RequiredItemName)
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                Player.Functions.RemoveItem(itemName, itemCount)
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "remove")
                Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
            elseif InvType == 'ox' then
                exports.ox_inventory:RemoveItem(src, itemName, itemCount)
                exports.ox_inventory:AddItem(src, "money", price * itemCount)                   
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    elseif args == 4 then --chicken drumsticks
        local price = Config.Selling.Items.ChickenDrumsticks.Price
        local itemName = Player.Functions.GetItemByName(Config.Selling.Items.ChickenDrumsticks.RequiredItemName)
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                Player.Functions.RemoveItem(itemName, itemCount)
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "remove")
                Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
            elseif InvType == 'ox' then
                exports.ox_inventory:RemoveItem(src, itemName, itemCount)
                exports.ox_inventory:AddItem(src, "money", price * itemCount)                   
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    elseif args == 5 then --chicken legs
        local price = Config.Selling.Items.ChickenLegs.Price
        local itemName = Player.Functions.GetItemByName(Config.Selling.Items.ChickenLegs.RequiredItemName)
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                Player.Functions.RemoveItem(itemName, itemCount)
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "remove")
                Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
            elseif InvType == 'ox' then
                exports.ox_inventory:RemoveItem(src, itemName, itemCount)
                exports.ox_inventory:AddItem(src, "money", price * itemCount)                   
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    end
end)








local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Butcher/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion.." "..advice) end
		--print(advice)
	end)
end
CheckVersion()




