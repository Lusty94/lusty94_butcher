local QBCore = exports['qb-core']:GetCoreObject()
local InvType = Config.CoreSettings.Inventory.Type
local NotifyType = Config.CoreSettings.Notify.Type


--notification function
local function SendNotify(src, msg, type, time, title)
    if not title then title = "Buthcer" end
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
    if bird and bird.amount >= 1  then
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
    if bird and bird.amount >= 1 and knife and knife.amount >= 1 then
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
    if breast and breast.amount >= 1 and packaging and packaging.amount >= 1 then
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
    if thigh and thigh.amount >= 1 and packaging and packaging.amount >= 1 then
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
    if drumsticks and drumsticks.amount >= 1 and packaging and packaging.amount >= 1 then
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
    if wings and wings.amount >= 1 and packaging and packaging.amount >= 1 then
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
    if legs and legs.amount >= 1 and packaging and packaging.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)



--------------------------------< EVENTS >-------------------------


--give items
RegisterNetEvent('lusty94_butcher:server:GiveItems', function(args, amount)
    local args = tonumber(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if args == 1 then
        if InvType == 'qb' then        
            exports['qb-inventory']:AddItem(src, 'butcherknife', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["butcherknife"], "add")
        elseif InvType == 'ox' then
            if exports.ox_inventory:CanCarryItem(src, "butcherknife", 1) then
                exports.ox_inventory:AddItem(src,"butcherknife", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    elseif args == 2 then
        if InvType == 'qb' then        
            exports['qb-inventory']:AddItem(src, 'foodpackaging', amount, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "add", amount)
        elseif InvType == 'ox' then
            if exports.ox_inventory:CanCarryItem(src, "foodpackaging", amount) then
                exports.ox_inventory:AddItem(src,"foodpackaging", amount)
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
        exports['qb-inventory']:AddItem(src, 'pluckedchicken', 1, false, false, nil)
        TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["pluckedchicken"], "add")
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
        if exports['qb-inventory']:RemoveItem(src, 'pluckedchicken', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["pluckedchicken"], "remove")        
            exports['qb-inventory']:AddItem(src, 'processedchicken', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "add")
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"pluckedchicken", 1) then
            if exports.ox_inventory:CanCarryItem(src, "processedchicken", 1) then
                exports.ox_inventory:AddItem(src,"processedchicken", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)


--chicken breast
RegisterNetEvent('lusty94_butcher:server:ProcessChickenBreast', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        if exports['qb-inventory']:RemoveItem(src, 'processedchicken', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")
            exports['qb-inventory']:AddItem(src, 'chickenbreast', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreast"], "add", 2)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"processedchicken", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickenbreast", 2) then
                exports.ox_inventory:AddItem(src,"chickenbreast", 2)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)

--chicken thighs
RegisterNetEvent('lusty94_butcher:server:ProcessChickenThighs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'processedchicken', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")        
            exports['qb-inventory']:AddItem(src, 'chickenthighs', 2, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighs"], "add", 2)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"processedchicken", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickenthighs", 2) then
                exports.ox_inventory:AddItem(src,"chickenthighs", 2)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)

--chicken wings
RegisterNetEvent('lusty94_butcher:server:ProcessChickenWings', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'processedchicken', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")        
            exports['qb-inventory']:AddItem(src, 'chickenwings', 2, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwings"], "add", 2)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"processedchicken", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickenwings", 2) then
                exports.ox_inventory:AddItem(src,"chickenwings", 2)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)

--chicken drumsticks
RegisterNetEvent('lusty94_butcher:server:ProcessChickenDrumSticks', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'processedchicken', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")          
            exports['qb-inventory']:AddItem(src, 'chickendrumsticks', 2, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumsticks"], "add", 2)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"processedchicken", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickendrumsticks", 2) then
                exports.ox_inventory:AddItem(src,"chickendrumsticks", 2)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)

--chicken legs
RegisterNetEvent('lusty94_butcher:server:ProcessChickenLegs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then 
        if exports['qb-inventory']:RemoveItem(src, 'processedchicken', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")         
            exports['qb-inventory']:AddItem(src, 'chickenlegs', 2, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenlegs"], "add", 2)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"processedchicken", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickenlegs", 2) then
                exports.ox_inventory:AddItem(src,"chickenlegs", 2)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)




--chicken breast pack
RegisterNetEvent('lusty94_butcher:server:PackChickenBreast', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then 
        if exports['qb-inventory']:RemoveItem(src, 'chickenbreast', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreast"], "remove")         
            exports['qb-inventory']:RemoveItem(src, 'foodpackaging', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")
            exports['qb-inventory']:AddItem(src, 'chickenbreastpack', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreastpack"], "add")
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"chickenbreast", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickenbreastpack", 1) then
                exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
                exports.ox_inventory:AddItem(src,"chickenbreastpack", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)

--chicken thighs pack
RegisterNetEvent('lusty94_butcher:server:PackChickenThighs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'chickenthighs', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighs"], "remove")         
            exports['qb-inventory']:RemoveItem(src, 'foodpackaging', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
            exports['qb-inventory']:AddItem(src, 'chickenthighspack', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighspack"], "add")
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"chickenthighs", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickenthighspack", 1) then
                exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
                exports.ox_inventory:AddItem(src,"chickenthighspack", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)

--chicken wings pack
RegisterNetEvent('lusty94_butcher:server:PackChickenWings', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'chickenwings', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwings"], "remove")         
            exports['qb-inventory']:RemoveItem(src, 'foodpackaging', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
            exports['qb-inventory']:AddItem(src, 'chickenwingspack', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwingspack"], "add")
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"chickenwings", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickenwingspack", 1) then
                exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
                exports.ox_inventory:AddItem(src,"chickenwingspack", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)

--chicken drumsticks pack
RegisterNetEvent('lusty94_butcher:server:PackChickenDrumSticks', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then 
        if exports['qb-inventory']:RemoveItem(src, 'chickendrumsticks', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumsticks"], "remove")         
            exports['qb-inventory']:RemoveItem(src, 'foodpackaging', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
            Player.Functions.AddItem("chickendrumstickspack", 1)
            exports['qb-inventory']:AddItem(src, 'chickendrumstickspack', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumstickspack"], "add")
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"chickendrumsticks", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickendrumstickspack", 1) then
                exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
                exports.ox_inventory:AddItem(src,"chickendrumstickspack", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end 
end)

--chicken legs pack
RegisterNetEvent('lusty94_butcher:server:PackChickenLegs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'chickenlegs', 1, false, false, nil) then
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenlegs"], "remove")         
            exports['qb-inventory']:RemoveItem(src, 'foodpackaging', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
            exports['qb-inventory']:AddItem(src, 'chickenlegspack', 1, false, false, nil)
            TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items["chickenlegspack"], "add")
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"chickenlegs", 1) then
            if exports.ox_inventory:CanCarryItem(src, "chickenlegspack", 1) then
                exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
                exports.ox_inventory:AddItem(src,"chickenlegspack", 1)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
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
        local itemName = Player.Functions.GetItemByName('chickenbreastpack')
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                if exports['qb-inventory']:RemoveItem(src, 'chickenbreastpack', itemCount, nil, nil, nil) then
                    TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items['chickenbreastpack'], "remove", itemCount)
                    Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
                end
            elseif InvType == 'ox' then
                if exports.ox_inventory:RemoveItem(src, 'chickenbreastpack', itemCount) then
                    exports.ox_inventory:AddItem(src, "money", price * itemCount)                   
                end
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    elseif args == 2 then --chicken thighs
        local price = Config.Selling.Items.ChickenThighs.Price
        local itemName = Player.Functions.GetItemByName('chickenthighspack')
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                if exports['qb-inventory']:RemoveItem(src, 'chickenthighspack', itemCount, nil, nil, nil) then
                    TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items['chickenthighspack'], "remove", itemCount)
                    Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
                end
            elseif InvType == 'ox' then
                if exports.ox_inventory:RemoveItem(src, 'chickenthighspack', itemCount) then
                    exports.ox_inventory:AddItem(src, "money", price * itemCount)                   
                end
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    elseif args == 3 then --chicken wings
        local price = Config.Selling.Items.ChickenWings.Price
        local itemName = Player.Functions.GetItemByName('chickenwingspack')
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                if exports['qb-inventory']:RemoveItem(src, 'chickenwingspack', itemCount, nil, nil, nil) then
                    TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items['chickenwingspack'], "remove", itemCount)
                    Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
                end
            elseif InvType == 'ox' then
                if exports.ox_inventory:RemoveItem(src, 'chickenwingspack', itemCount) then
                    exports.ox_inventory:AddItem(src, "money", price * itemCount)
                end
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    elseif args == 4 then --chicken drumsticks
        local price = Config.Selling.Items.ChickenDrumsticks.Price
        local itemName = Player.Functions.GetItemByName('chickendrumstickspack')
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                if exports['qb-inventory']:RemoveItem(src, 'chickendrumstickspack', itemCount, nil, nil, nil) then
                    TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items['chickendrumstickspack'], "remove", itemCount)
                    Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
                end
            elseif InvType == 'ox' then
                if exports.ox_inventory:RemoveItem(src, 'chickendrumstickspack', itemCount) then
                    exports.ox_inventory:AddItem(src, "money", price * itemCount)
                end
            end
        else
            SendNotify(src,"You Don\'t Have Anything To Sell!", 'error', 2000)
        end
    elseif args == 5 then --chicken legs
        local price = Config.Selling.Items.ChickenLegs.Price
        local itemName = Player.Functions.GetItemByName('chickenlegspack')
        if itemName then
            local itemCount = itemName.amount
            if InvType == 'qb' then
                if exports['qb-inventory']:RemoveItem(src, 'chickenlegspack', itemCount, nil, nil, nil) then
                    TriggerClientEvent("qb-inventory:client:ItemBox", src, QBCore.Shared.Items['chickenlegspack'], "remove", itemCount)
                    Player.Functions.AddMoney('cash', price * itemCount, "butcher-sales")
                end
            elseif InvType == 'ox' then
                if exports.ox_inventory:RemoveItem(src, 'chickenlegspack', itemCount) then
                    exports.ox_inventory:AddItem(src, "money", price * itemCount)
                end
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