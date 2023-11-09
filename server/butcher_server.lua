local QBCore = exports['qb-core']:GetCoreObject()
local InvType = Config.CoreSettings.Inventory.Type



--------------------------------------------< FRESH CHICKEN START >--------------------------------------

--give butcher knife
RegisterNetEvent('lusty94_butcher:server:GiveButcherKnife', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        Player.Functions.AddItem("butcherknife", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butcherknife"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:AddItem(src,"butcherknife", 1)
    end
end)
--give food packaging
RegisterNetEvent('lusty94_butcher:server:GiveFoodPackaging', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        Player.Functions.AddItem("foodpackaging", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:AddItem(src,"foodpackaging", amount)
    end
end)

--pick fresh chicken
RegisterNetEvent('lusty94_butcher:server:PickChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        Player.Functions.AddItem("freshchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["freshchicken"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:AddItem(src,"freshchicken", 1)
    end
end)

---------------------------------------------< FRESH CHICKEN END >---------------------------------------------

---------------------------------------------< PLUCKED CHICKEN START >--------------------------------------------

--fresh chicken callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:FreshChicken', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bird = Player.Functions.GetItemByName("freshchicken")
    if bird then
        cb(true)
    else
        cb(false)
    end
end)

--pluck chicken
RegisterNetEvent('lusty94_butcher:server:PluckChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        Player.Functions.RemoveItem("freshchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["freshchicken"], "remove")
        Player.Functions.AddItem("pluckedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pluckedchicken"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,"freshchicken", 1)
        exports.ox_inventory:AddItem(src,"pluckedchicken", 1)
    end  
end)

--------------------------------------------------< PLUCKED CHICKEN END >--------------------------------------------



-----------------------------------------------------< PROCESSED CHICKEN START >------------------------------------------

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

--pluck chicken
RegisterNetEvent('lusty94_butcher:server:ProcessChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
    Player.Functions.RemoveItem("pluckedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pluckedchicken"], "remove")        
        Player.Functions.AddItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,"pluckedchicken", 1)
        exports.ox_inventory:AddItem(src,"processedchicken", 1)
    end 
end)

--------------------------------------------------------< PROCESSED CHICKEN END >----------------------------------------------


-----------------------------------------------------< CHICKEN PARTS START >----------------------------------------------

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
        exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
        exports.ox_inventory:AddItem(src,"chickenbreast", 1)
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
        exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
        exports.ox_inventory:AddItem(src,"chickenthighs", 1)
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
        exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
        exports.ox_inventory:AddItem(src,"chickenwings", 1)
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
        exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
        exports.ox_inventory:AddItem(src,"chickendrumsticks", 1)
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
        exports.ox_inventory:RemoveItem(src,"processedchicken", 1)
        exports.ox_inventory:AddItem(src,"chickenlegs", 1)
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
        exports.ox_inventory:RemoveItem(src,"chickenbreast", 1)
        exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
        exports.ox_inventory:AddItem(src,"chickenbreastpack", 1)
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
        exports.ox_inventory:RemoveItem(src,"chickenthighs", 1)
        exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
        exports.ox_inventory:AddItem(src,"chickenthighspack", 1)
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
        exports.ox_inventory:RemoveItem(src,"chickenwings", 1)
        exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
        exports.ox_inventory:AddItem(src,"chickenwingspack", 1)
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
        exports.ox_inventory:RemoveItem(src,"chickendrumsticks", 1)
        exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
        exports.ox_inventory:AddItem(src,"chickendrumstickspack", 1)
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
        exports.ox_inventory:RemoveItem(src,"chickenlegs", 1)
        exports.ox_inventory:RemoveItem(src,"foodpackaging", 1)
        exports.ox_inventory:AddItem(src,"chickenlegspack", 1)
    end 
end)
------------------------------------------------------------< CHICKEN PARTS END >--------------------------------------------------


------------------------------------------------------------< SELLING START >--------------------------------------------------

--chicken breast pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenBreastPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickenbreastpack")
    if pack  then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken breast pack
RegisterNetEvent('lusty94_butcher:server:SellChickenBreastPack', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickenbreastpack"] 
    if InvType == 'qb' then
        Player.Functions.RemoveItem("chickenbreastpack", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreastpack"], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,"chickenbreastpack", amount)
    end
    if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
        if InvType == 'qb' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price * amount, "sold-butcher-items")
        elseif InvType == 'ox' then
            exports.ox_inventory:AddItem(src,"money", price * amount)
        end
    elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price * amount) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
    end
end)

--chicken thighs pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenThighsPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickenthighspack")
    if pack  then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken thighs pack
RegisterNetEvent('lusty94_butcher:server:SellChickenThighsPack', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickenthighspack"] 
    if InvType == 'qb' then
        Player.Functions.RemoveItem("chickenthighspack", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighspack"], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,"chickenthighspack", amount)
    end
    if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
        if InvType == 'qb' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price * amount, "sold-butcher-items")
        elseif InvType == 'ox' then
            exports.ox_inventory:AddItem(src,"money", price * amount)
        end
    elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price * amount) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
    end
end)

--chicken wings pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenWingsPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickenwingspack")
    if pack  then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken wings pack
RegisterNetEvent('lusty94_butcher:server:SellChickenWingsPack', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickenwingspack"] 
    if InvType == 'qb' then
        Player.Functions.RemoveItem("chickenwingspack", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwingspack"], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,"chickenwingspack", amount)
    end
    if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
        if InvType == 'qb' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price * amount, "sold-butcher-items")
        elseif InvType == 'ox' then
            exports.ox_inventory:AddItem(src,"money", price * amount)
        end
    elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price * amount) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
    end
end)

--chicken drumsticks pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenDrumSticksPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickendrumstickspack")
    if pack  then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken drumsticks pack
RegisterNetEvent('lusty94_butcher:server:SellChickenDrumSticksPack', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickendrumstickspack"] 
    if InvType == 'qb' then
        Player.Functions.RemoveItem("chickendrumstickspack", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumstickspack"], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,"chickendrumstickspack", amount)
    end
    if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
        if InvType == 'qb' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price * amount, "sold-butcher-items")
        elseif InvType == 'ox' then
            exports.ox_inventory:AddItem(src,"money", price * amount)
        end
    elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price * amount) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
    end
end)

--chicken legs pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenLegsPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickenlegspack")
    if pack  then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken legs pack
RegisterNetEvent('lusty94_butcher:server:SellChickenLegsPack', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickenlegspack"] 
    if InvType == 'qb' then
        Player.Functions.RemoveItem("chickenlegspack", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenlegspack"], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,"chickenlegspack", amount)
    end
    if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
        if InvType == 'qb' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price * amount, "sold-butcher-items")
        elseif InvType == 'ox' then
            exports.ox_inventory:AddItem(src,"money", price * amount)
        end
    elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price * amount) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
    end
end)





------------------------------------------------------------< SELLING END >--------------------------------------------------



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


--<!>-- SERVER PRINT --<!>--
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
        print('^5--<^3!^5>-- ^7Lusty94 ^5| ^5--<^3!^5>-- ^5Butcher V1.0.0 Started Successfully ^5--<^3!^5>--^7')
end)



