local QBCore = exports['qb-core']:GetCoreObject()


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



--------------------------------------------< FRESH CHICKEN START >--------------------------------------

--pick fresh chicken
RegisterNetEvent('lusty94_butcher:server:PickChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.AddItem("freshchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["freshchicken"], "add")
end)

---------------------------------------------< FRESH CHICKEN END >---------------------------------------------

---------------------------------------------< PLUCKED CHICKEN START >--------------------------------------------

--fresh chicken callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:FreshChicken', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bird = Player.Functions.GetItemByName("freshchicken")
    if bird ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--pluck chicken
RegisterNetEvent('lusty94_butcher:server:PluckChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.AddItem("pluckedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pluckedchicken"], "add")
end)

--------------------------------------------------< PLUCKED CHICKEN END >--------------------------------------------



-----------------------------------------------------< PROCESSED CHICKEN START >------------------------------------------

--plucked chicken callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:PluckedChicken', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bird = Player.Functions.GetItemByName("pluckedchicken")
    if bird ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--pluck chicken
RegisterNetEvent('lusty94_butcher:server:ProcessChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.AddItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "add")
end)

--------------------------------------------------------< PROCESSED CHICKEN END >----------------------------------------------


-----------------------------------------------------< CHICKEN PARTS START >----------------------------------------------

--processed chicken callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ProcessedChicken', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bird = Player.Functions.GetItemByName("processedchicken")
    local knife = Player.Functions.GetItemByName("butcherknife")
    if bird ~= nil and knife ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


--chicken breast
RegisterNetEvent('lusty94_butcher:server:ChickenBreast', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")
        Player.Functions.AddItem("chickenbreast", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreast"], "add")
end)

--chicken thighs
RegisterNetEvent('lusty94_butcher:server:ChickenThighs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")        
        Player.Functions.AddItem("chickenthighs", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighs"], "add")
end)

--chicken wings
RegisterNetEvent('lusty94_butcher:server:ChickenWings', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")        
        Player.Functions.AddItem("chickenwings", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwings"], "add")
end)

--chicken drumsticks
RegisterNetEvent('lusty94_butcher:server:ChickenDrumsticks', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")          
        Player.Functions.AddItem("chickendrumsticks", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumsticks"], "add")
end)

--chicken legs
RegisterNetEvent('lusty94_butcher:server:ChickenLegs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
        Player.Functions.RemoveItem("processedchicken", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["processedchicken"], "remove")         
        Player.Functions.AddItem("chickenlegs", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenlegs"], "add")
end)



--chicken breast & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenBreast', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local breast = Player.Functions.GetItemByName("chickenbreast")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if breast ~= nil and packaging ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


--chicken breast pack
RegisterNetEvent('lusty94_butcher:server:ChickenBreastPack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
        Player.Functions.RemoveItem("chickenbreast", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreast"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickenbreastpack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreastpack"], "add")
end)



--chicken thighs & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenThighs', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local thigh = Player.Functions.GetItemByName("chickenthighs")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if thigh ~= nil and packaging ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


--chicken thighs pack
RegisterNetEvent('lusty94_butcher:server:ChickenThighsPack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
        Player.Functions.RemoveItem("chickenthighs", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighs"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickenthighspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighspack"], "add")
end)


--chicken wings & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenWings', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local thigh = Player.Functions.GetItemByName("chickenwings")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if thigh ~= nil and packaging ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


--chicken wings pack
RegisterNetEvent('lusty94_butcher:server:ChickenWingsPack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
        Player.Functions.RemoveItem("chickenwings", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwings"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickenwingspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwingspack"], "add")
end)


--chicken drumsticks & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenDrumsticks', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local thigh = Player.Functions.GetItemByName("chickendrumsticks")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if thigh ~= nil and packaging ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


--chicken drumsticks pack
RegisterNetEvent('lusty94_butcher:server:ChickenDrumsticksPack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
        Player.Functions.RemoveItem("chickendrumsticks", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumsticks"], "remove")         
        Player.Functions.RemoveItem("foodpackaging", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["foodpackaging"], "remove")         
        Player.Functions.AddItem("chickendrumstickspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumstickspack"], "add")
end)
------------------------------------------------------------< CHICKEN PARTS END >--------------------------------------------------


------------------------------------------------------------< SELLING START >--------------------------------------------------

--chicken breast pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenBreastPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickenbreastpack")
    if pack ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken breast pack
RegisterNetEvent('lusty94_butcher:server:SellChickenBreastPack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickenbreastpack"] 

        Player.Functions.AddItem("chickenbreastpack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenbreastpack"], "remove")

        if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price, "sold-butcher-items")
        elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
        end
end)

--chicken thighs pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenThighsPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickenthighspack")
    if pack ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken thighs pack
RegisterNetEvent('lusty94_butcher:server:SellChickenThighsPack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickenthighspack"] 

        Player.Functions.AddItem("chickenthighspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenthighspack"], "remove")

        if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price, "sold-butcher-items")
        elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
        end
end)

--chicken wings pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenWingsPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickenwingspack")
    if pack ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken wings pack
RegisterNetEvent('lusty94_butcher:server:SellChickenwWingsPack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickenwingspack"] 

        Player.Functions.AddItem("chickenwingspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickenwingspack"], "remove")

        if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price, "sold-butcher-items")
        elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
        end
end)

--chicken drumsticks pack callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenDrumsticksPack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pack = Player.Functions.GetItemByName("chickendrumstickspack")
    if pack ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--sell chicken drumsticks pack
RegisterNetEvent('lusty94_butcher:server:SellChickenwDrumsticksPack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.ItemPrices.SellItems["chickendrumstickspack"] 

        Player.Functions.AddItem("chickendrumstickspack", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chickendrumstickspack"], "remove")

        if Config.ItemPrices.PaymentAccounts.PaymentType == 'personal' then
            Player.Functions.AddMoney(Config.ItemPrices.PaymentAccounts.AccountUsedToSell, price, "sold-butcher-items")
        elseif Config.ItemPrices.PaymentAccounts.PaymentType == 'society' then
            exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, price) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
        end
end)





------------------------------------------------------------< SELLING END >--------------------------------------------------



