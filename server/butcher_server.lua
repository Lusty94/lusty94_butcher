local QBCore = exports['qb-core']:GetCoreObject()
local InvType = Config.CoreSettings.Inventory.Type
local NotifyType = Config.CoreSettings.Notify.Type


--notification function
local function SendNotify(src, msg, type, time, title)
    if NotifyType == nil then print("Lusty94_Butcher: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
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
    elseif NotifyType == 'ox' then 
        TriggerClientEvent('ox_lib:notify', src, ({ title = title, description = msg, length = time, type = type, style = 'default'}))
    end
end


--remove items
local function removeItem(src, item, amount)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, item, amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
        end
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, item, amount)
    end
end

--add items
local function addItem(src, item, amount)
    if InvType == 'qb' then
        if exports['qb-inventory']:AddItem(src, item, amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, item, amount) then
            exports.ox_inventory:AddItem(src, item, amount)
        else
            SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 5000)
        end
    end
end

--add money
local function addMoney(src, account, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if InvType == 'qb' then
            Player.Functions.AddMoney(account, amount)
        elseif InvType == 'ox' then
            if exports.ox_inventory:CanCarryItem(src, account, amount) then
                exports.ox_inventory:AddItem(src, account, amount)
            else
                SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 5000)
            end
        end
    end
end

--Gets the amount of a specific item in the player's inventory -- dont touch this its used to display data in the processing menus
QBCore.Functions.CreateCallback('lusty94_butcher:getPlayerItemAmount', function(source, cb, requiredItems)
    local Player = QBCore.Functions.GetPlayer(source)
    local hasAllItems = true
    local amounts = {}
    if Player then
        for _, item in pairs(requiredItems) do
            local playerItem = Player.Functions.GetItemByName(item)
            if not playerItem or playerItem.amount < 1 then
                hasAllItems = false
                break
            else
                table.insert(amounts, playerItem.amount)
            end
        end
    else
        hasAllItems = false
    end    
    if hasAllItems then
        cb(amounts) -- Returns table of item amounts
    else
        cb(false)
    end
end)


--plucked chicken callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:PluckedChicken', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bird = Player.Functions.GetItemByName("pluckedchicken")
    if bird and bird.amount >= amount  then
        cb(true)
    else
        cb(false)
    end
end)


--processed chicken callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ProcessedChicken', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bird = Player.Functions.GetItemByName("processedchicken")
    local knife = Player.Functions.GetItemByName("butcherknife")
    if bird and bird.amount >= amount and knife and knife.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)


--chicken breast & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenBreast', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local breast = Player.Functions.GetItemByName("chickenbreast")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if breast and breast.amount >= amount and packaging and packaging.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)


--chicken thighs & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenThighs', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local thigh = Player.Functions.GetItemByName("chickenthighs")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if thigh and thigh.amount >= amount and packaging and packaging.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)


--chicken drumsticks & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenDrumSticks', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local drumsticks = Player.Functions.GetItemByName("chickendrumsticks")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if drumsticks and drumsticks.amount >= amount and packaging and packaging.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)


--chicken wings & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenWings', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local wings = Player.Functions.GetItemByName("chickenwings")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if wings and wings.amount >= amount and packaging and packaging.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)


--chicken legs & packaging callback
QBCore.Functions.CreateCallback('lusty94_butcher:get:ChickenLegs', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local legs = Player.Functions.GetItemByName("chickenlegs")
    local packaging = Player.Functions.GetItemByName("foodpackaging")
    if legs and legs.amount >= amount and packaging and packaging.amount >= amount then
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
    if Player then
        if args == 1 then
            addItem(src, 'butcherknife', 1)
        elseif args == 2 then
            addItem(src, 'foodpackaging', amount)
        end
    end
end)

--pluck chicken
RegisterNetEvent('lusty94_butcher:server:PluckChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        addItem(src, 'pluckedchicken', 1)
    end
end)



--process chicken
RegisterNetEvent('lusty94_butcher:server:ProcessChicken', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 1
    if Player then
        removeItem(src, 'pluckedchicken', requiredAmount * amount)
        Wait(250)
        addItem(src, 'processedchicken', returnAmount * amount)
    end
end)


--chicken breast
RegisterNetEvent('lusty94_butcher:server:ProcessChickenBreast', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 2
    if Player then
        removeItem(src, 'processedchicken', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickenbreast', returnAmount * amount)
    end
end)

--chicken thighs
RegisterNetEvent('lusty94_butcher:server:ProcessChickenThighs', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 2
    if Player then
        removeItem(src, 'processedchicken', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickenthighs', returnAmount * amount)
    end
end)

--chicken wings
RegisterNetEvent('lusty94_butcher:server:ProcessChickenWings', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 2
    if Player then
        removeItem(src, 'processedchicken', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickenwings', returnAmount * amount)
    end
end)

--chicken drumsticks
RegisterNetEvent('lusty94_butcher:server:ProcessChickenDrumSticks', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 2
    if Player then
        removeItem(src, 'processedchicken', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickendrumsticks', returnAmount * amount)
    end 
end)

--chicken legs
RegisterNetEvent('lusty94_butcher:server:ProcessChickenLegs', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 2
    if Player then
        removeItem(src, 'processedchicken', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickenlegs', returnAmount * amount)
    end 
end)




--chicken breast pack
RegisterNetEvent('lusty94_butcher:server:PackChickenBreast', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 1
    if Player then
        removeItem(src, 'chickenbreast', requiredAmount * amount)
        Wait(250)
        removeItem(src, 'foodpackaging', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickenbreastpack', returnAmount * amount)
    end 
end)

--chicken thighs pack
RegisterNetEvent('lusty94_butcher:server:PackChickenThighs', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 1
    if Player then
        removeItem(src, 'chickenthighs', requiredAmount * amount)
        Wait(250)
        removeItem(src, 'foodpackaging', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickenthighspack', returnAmount * amount)
    end 
end)

--chicken wings pack
RegisterNetEvent('lusty94_butcher:server:PackChickenWings', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 1
    if Player then
        removeItem(src, 'chickenwings', requiredAmount * amount)
        Wait(250)
        removeItem(src, 'foodpackaging', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickenwingspack', returnAmount * amount)
    end  
end)

--chicken drumsticks pack
RegisterNetEvent('lusty94_butcher:server:PackChickenDrumSticks', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 1
    if Player then
        removeItem(src, 'chickendrumsticks', requiredAmount * amount)
        Wait(250)
        removeItem(src, 'foodpackaging', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickendrumstickspack', returnAmount * amount)
    end 
end)

--chicken legs pack
RegisterNetEvent('lusty94_butcher:server:PackChickenLegs', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredAmount = 1
    local returnAmount = 1
    if Player then
        removeItem(src, 'chickenlegs', requiredAmount * amount)
        Wait(250)
        removeItem(src, 'foodpackaging', requiredAmount * amount)
        Wait(250)
        addItem(src, 'chickenlegspack', returnAmount * amount)
    end 
end)



---------------------------< SELLING >-------------------

--Sell chicken
RegisterNetEvent('lusty94_butcher:server:SellItems', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if item == 'chickenbreastpack' then
            local price = Config.Selling.Items.ChickenBreast.Price
            local itemName = Player.Functions.GetItemByName('chickenbreastpack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickenbreastpack', itemCount)
                addMoney(src, 'cash', price * itemCount)
                SendNotify(src, 'You earned £'.. price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        elseif item == 'chickenthighspack' then
            local price = Config.Selling.Items.ChickenThighs.Price
            local itemName = Player.Functions.GetItemByName('chickenthighspack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickenthighspack', itemCount)
                addMoney(src, 'cash', price * itemCount)
                SendNotify(src, 'You earned £'.. price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        elseif item == 'chickenwingspack' then
            local price = Config.Selling.Items.ChickenWings.Price
            local itemName = Player.Functions.GetItemByName('chickenwingspack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickenwingspack', itemCount)
                addMoney(src, 'cash', price * itemCount)
                SendNotify(src, 'You earned £'.. price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        elseif item == 'chickendrumstickspack' then
            local price = Config.Selling.Items.ChickenDrumsticks.Price
            local itemName = Player.Functions.GetItemByName('chickendrumstickspack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickendrumstickspack', itemCount)
                addMoney(src, 'cash', price * itemCount)
                SendNotify(src, 'You earned £'.. price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        elseif item == 'chickenlegspack' then
            local price = Config.Selling.Items.ChickenLegs.Price
            local itemName = Player.Functions.GetItemByName('chickenlegspack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickenlegspack', itemCount)
                addMoney(src, 'cash', price * itemCount)
                SendNotify(src, 'You earned £'.. price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        end
    end
end)



--[[ 
--Sell chicken
RegisterNetEvent('lusty94_butcher:server:SellItems', function(args)
    local args = tonumber(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if args == 1 then --chicken breast
            local price = Config.Selling.Items.ChickenBreast.Price
            local itemName = Player.Functions.GetItemByName('chickenbreastpack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickenbreastpack', itemCount)
                addMoney(src, 'cash' price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        elseif args == 2 then --chicken thighs
            local price = Config.Selling.Items.ChickenThighs.Price
            local itemName = Player.Functions.GetItemByName('chickenthighspack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickenthighspack', itemCount)
                addMoney(src, 'cash' price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        elseif args == 3 then --chicken wings
            local price = Config.Selling.Items.ChickenWings.Price
            local itemName = Player.Functions.GetItemByName('chickenwingspack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickenwingspack', itemCount)
                addMoney(src, 'cash' price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        elseif args == 4 then --chicken drumsticks
            local price = Config.Selling.Items.ChickenDrumsticks.Price
            local itemName = Player.Functions.GetItemByName('chickendrumstickspack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickendrumstickspack', itemCount)
                addMoney(src, 'cash' price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        elseif args == 5 then --chicken legs
            local price = Config.Selling.Items.ChickenLegs.Price
            local itemName = Player.Functions.GetItemByName('chickenlegspack')
            if itemName then
                local itemCount = itemName.amount
                removeItem(src, 'chickenlegspack', itemCount)
                addMoney(src, 'cash' price * itemCount)
            else
                SendNotify(src,Config.Language.Notifications.NothingToSell, 'error', 2000)
            end
        end
    end
end) ]]


--------------< VERSION CHECK >-------------

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Butcher/version.txt', function(err, newestVersion, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
        if not newestVersion then
            print('^1[Lusty94_Butcher]^7: Unable to fetch the latest version.')
            return
        end
        newestVersion = newestVersion:gsub('%s+', '')
        currentVersion = currentVersion and currentVersion:gsub('%s+', '') or "Unknown"
        if newestVersion == currentVersion then
            print(string.format('^2[Lusty94_Butcher]^7: ^6You are running the latest version.^7 (^2v%s^7)', currentVersion))
        else
            print(string.format('^2[Lusty94_Butcher]^7: ^3Your version: ^1v%s^7 | ^2Latest version: ^2v%s^7\n^1Please update to the latest version | Changelogs can be found in the support discord.^7', currentVersion, newestVersion))
        end
    end)
end

CheckVersion()