local QBCore = exports['qb-core']:GetCoreObject()
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local InvType = Config.CoreSettings.Inventory.Type
local ClothingType = Config.CoreSettings.Clothing.Type
local onDuty, busy = true, false
PlayerJob = {}




--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Butcher: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Butcher" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message.") return end
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(msg,type,time)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(title, msg, time, type, true)
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, msg)
    elseif NotifyType == 'ox' then
        lib.notify({ title = title, description = msg, type = type, duration = time})
    end
end


--blips
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)

--selling ped
CreateThread(function()
    lib.requestModel(Config.Selling.PedModel, 10000)
    butcherPed = CreatePed(0, Config.Selling.PedModel, Config.Selling.Location.x, Config.Selling.Location.y, Config.Selling.Location.z, true, false)
    SetEntityHeading(butcherPed, Config.Selling.Location.w)
    FreezeEntityPosition(butcherPed, true)
    SetEntityInvincible(butcherPed, true)
    SetBlockingOfNonTemporaryEvents(butcherPed, true)
    TaskStartScenarioInPlace(butcherPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    if TargetType == 'qb' then
        exports['qb-target']:AddTargetEntity(butcherPed, {  options = { 
            { 
                icon = 'fa-solid fa-bars', 
                label = 'Sell Chicken Products', 
                event = 'lusty94_butcher:client:SellItems', 
                job = Config.CoreSettings.Job.Name,
            } 
        }, distance = 2.0, })
    elseif TargetType == 'ox' then
        exports.ox_target:addLocalEntity(butcherPed, { 
            { 
                name = 'butcherPed', 
                icon = 'fa-solid fa-bars', 
                label = 'Sell Chicken Products', 
                event = 'lusty94_butcher:client:SellItems', 
                groups = Config.CoreSettings.Job.Name, 
                distance = 2.0,
            }
        })
    end
end)




-------------------------------------< PICK CHICKEN >----------------------------------

RegisterNetEvent('lusty94_butcher:client:PickChicken', function()
    if onDuty then
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            if IsEntityAttached(chickenPed) then
                SendNotify(Config.Language.Notifications.ChickenAlready, 'error', 2000)
            else
                busy = true
                LockInventory(true)
                if lib.progressCircle({ 
                    duration = Config.CoreSettings.Timers.Pick, 
                    label = 'Picking chicken', 
                    position = 'bottom', 
                    useWhileDead = false, 
                    canCancel = true, 
                    disable = { car = true, move = true, }, 
                    anim = { dict = Config.Animations.PickChicken.dict, clip = Config.Animations.PickChicken.anim,},
                }) then
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    local chickenModel = 'a_c_hen'
                    lib.requestModel(chickenModel, 5000)         
                    chickenPed = CreatePed(0, chickenModel, playerCoords.x, playerCoords.y, playerCoords.z, 0, true, true)
                    AttachEntityToEntity(chickenPed, playerPed, GetPedBoneIndex(playerPed, 57005), 0.12, 0.0, 0.0, 0.0, 255.0, 30.0, true, true, false, true, 1, true)
                    local dict = 'move_weapon@jerrycan@generic'
                    local anim = 'idle'
                    lib.requestAnimDict(dict, 10000)
                    TaskPlayAnim(playerPed, dict, anim, 1.0, -1.0, 1.0, 51, 11, 0, 0, 0)
                    busy = false
                    LockInventory(false)
                    SendNotify(Config.Language.Notifications.PickedChicken, 'success', 2000) 
                else 
                    busy = false
                    LockInventory(false)
                    ClearPedTasks(playerPed)
                    SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                end
                
            end
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

-----------------------------------------< PLUCK CHICKEN >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:PluckChicken', function()
    if onDuty then
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            if IsEntityAttached(chickenPed) then
                RemoveAnimDict('move_weapon@jerrycan@generic')
                busy = true
                LockInventory(true)
                if lib.progressCircle({ 
                    duration = Config.CoreSettings.Timers.Pluck, 
                    label = 'Plucking chicken', 
                    position = 'bottom', 
                    useWhileDead = false, 
                    canCancel = true, 
                    disable = { car = true, move = true, },
                    anim = { dict = Config.Animations.PluckChicken.dict, clip = Config.Animations.PluckChicken.anim,},
                }) then
                    TriggerServerEvent('lusty94_butcher:server:PluckChicken')
                    SendNotify(Config.Language.Notifications.PluckedChicken, 'success', 2000)
                    DeleteEntity(chickenPed)
                    busy = false
                    LockInventory(false)
                else 
                    busy = false
                    LockInventory(false)
                    SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                end
            else
                SendNotify(Config.Language.Notificiations.NoChicken, 'error', 2000)
            end
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)



----------------------------------------< PROCESS CHICKEN >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:ProcessChicken', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"pluckedchicken"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Process Chicken', {
                        { type = 'input', placeholder = 'How many do you want to process?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to process: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:PluckedChicken', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Processing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:ProcessChicken', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' plucked chicken to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end 
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenBreast', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"processedchicken"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Process Chicken', {
                        { type = 'input', placeholder = 'How many do you want to process?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to process: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Processing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenBreast', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' processed chicken to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenThighs', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"processedchicken"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Process Chicken', {
                        { type = 'input', placeholder = 'How many do you want to process?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to process: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Processing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenThighs', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' processed chicken to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    endotify(Config.Language.Notifications.Duty, 'error', 2000)
    end 
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenWings', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"processedchicken"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Process Chicken', {
                        { type = 'input', placeholder = 'How many do you want to process?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to process: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Processing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenWings', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' processed chicken to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end  
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenDrumSticks', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"processedchicken"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Process Chicken', {
                        { type = 'input', placeholder = 'How many do you want to process?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to process: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Processing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenDrumSticks', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' processed chicken to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenLegs', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"processedchicken"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Process Chicken', {
                        { type = 'input', placeholder = 'How many do you want to process?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to process: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Processing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenLegs', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' processed chicken to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end 
end)


-------------------------------------< PACK CHICKEN >-----------------------------------

RegisterNetEvent('lusty94_butcher:client:PackChickenBreast', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"chickenbreast", "foodpackaging"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Pack Chicken', {
                        { type = 'input', placeholder = 'How many do you want to pack?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to pack: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenBreast', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Packing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:PackChickenBreast', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' chicken breast & food packaging to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenThighs', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"chickenthighs", "foodpackaging"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Pack Chicken', {
                        { type = 'input', placeholder = 'How many do you want to pack?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to pack: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenThighs', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Packing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:PackChickenThighs', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' chicken thighs & food packaging to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenWings', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"chickenwings", "foodpackaging"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Pack Chicken', {
                        { type = 'input', placeholder = 'How many do you want to pack?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to pack: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenWings', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Packing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:PackChickenWings', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' chicken wings & food packaging to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end  
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenDrumSticks', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"chickendrumsticks", "foodpackaging"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Pack Chicken', {
                        { type = 'input', placeholder = 'How many do you want to pack?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to pack: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenDrumSticks', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Packing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:PackChickenDrumSticks', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' chicken drumsticks & food packaging to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end  
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenLegs', function()
    if onDuty then
        local playerPed = PlayerPedId()
        local requiredItems = {"chickenlegs", "foodpackaging"}
        local requiredAmount = 1 -- dont touch
        if busy then
            SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        else
            QBCore.Functions.TriggerCallback('lusty94_butcher:getPlayerItemAmount', function(amounts)
                if amounts then
                    local minAmount = math.min(math.floor(amounts[1] / requiredAmount))
                    local input = lib.inputDialog('Pack Chicken', {
                        { type = 'input', placeholder = 'How many do you want to pack?', icon = 'question', disabled = true },
                        { type = 'slider', required = true, default = 1, min = 1, max = minAmount },
                        { type = 'input', placeholder = 'You have enough to pack: ' .. amounts[1], icon = 'bars', disabled = true },
                    })
                    if input then
                        local amount = tonumber(input[2])
                        if amount and amount > 0 then
                            QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenLegs', function(HasItems)
                                if HasItems then
                                    busy = true
                                    LockInventory(true)
                                    if lib.progressCircle({
                                        duration = 3000 * amount, -- edit processing timer here
                                        label = 'Packing Chicken',
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { car = true, move = true },
                                        anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                                    }) then
                                        TriggerServerEvent('lusty94_butcher:server:PackChickenLegs', amount)
                                        busy = false
                                        LockInventory(false)
                                    else
                                        busy = false
                                        LockInventory(false)
                                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                                    end
                                else
                                    SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                                end
                            end, amount)
                        else
                            SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                    end
                else
                    SendNotify('You need at least ' .. requiredAmount .. ' chicken legs & food packaging to do that!', 'error', 3000)
                end
            end, requiredItems)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end  
end)




--give items
RegisterNetEvent('lusty94_butcher:client:GiveItems', function()
    if onDuty then
        local input = lib.inputDialog('Food Packaging', {
            {
                type = 'slider', 
                label = 'How many do you want?',
                icon = 'arrow-right',
                min = 1,
                max = 50,
                default = 1,
                },
            })
        if input then
            local amount = input[1]
            TriggerServerEvent('lusty94_butcher:server:GiveItems', 2, amount)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)



--function to display item images
function ItemImage(img)
	if InvType == 'ox' then
		return "nui://ox_inventory/web/images/".. img.. '.png'
	elseif InvType == 'qb' then
		return "nui://qb-inventory/html/images/".. QBCore.Shared.Items[img].image
	end
end


-- function to lock inventory to prevent exploits
function LockInventory(toggle)
	if toggle then
        LocalPlayer.state:set("inv_busy", true, true)
    else 
        LocalPlayer.state:set("inv_busy", false, true)
    end
end



--sell items
RegisterNetEvent('lusty94_butcher:client:SellItems', function()
    if onDuty then
        local input = lib.inputDialog('Seller', {
            {
                type = 'select',
                label = 'Sell Items',
                description = 'What do you want to sell?',
                icon = 'arrow-right', 
                options = { 
                    {value = 'chickenbreastpack',       label = 'Chicken Breast Pack', },
                    {value = 'chickenthighspack',       label = 'Chicken Thighs Pack', },
                    {value = 'chickenwingspack',        label = 'Chicken Wings Pack', },
                    {value = 'chickendrumstickspack',   label = 'Chicken Drum Sticks Pack', },
                    {value = 'chickenlegspack',         label = 'Chicken Legs Pack', },
                }, 
            },
        })
        if input then
            local item = tostring(input[1])
            local price
            if item == 'chickenbreastpack' then 
                price = Config.Selling.Items.ChickenBreast.Price 
            elseif item == 'chickenthighspack' then 
                price = Config.Selling.Items.ChickenThighs.Price 
            elseif item == 'chickenwingspack' then 
                price = Config.Selling.Items.ChickenWings.Price 
            elseif item == 'chickendrumstickspack' then 
                price = Config.Selling.Items.ChickenDrumsticks.Price 
            elseif item == 'chickenlegspack' then 
                price = Config.Selling.Items.ChickenLegs.Price
            end
            local alert = lib.alertDialog({
                header = 'Market Information',
                content = 'These sell for: '..Config.Selling.CashSymbol..price..' each',
                centered = true,
                cancel = false,
            })
            if alert then
                TriggerServerEvent('lusty94_butcher:server:SellItems', item)
            end
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)



-----------------------------------------< JOB & MANAGEMENT >-----------------------------------------
RegisterNetEvent("lusty94_butcher:client:ToggleDuty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerJob.type == Config.CoreSettings.Job.Name then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('lusty94_butcher:client:changeClothes', function()
    if ClothingType == 'qb' then
        TriggerEvent('qb-clothing:client:openOutfitMenu')
    elseif ClothingType == 'illenium' then
        TriggerEvent('qb-clothing:client:openOutfitMenu') -- illenium has backwards compat built in just make sure you have followed docs for illenium    
    elseif ClothingType == 'custom' then
        -- insert your own custom code for opening outfit menu in your clothing script
    end
end)


--dont touch
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        busy = false
        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(butcherPed, 'butcherPed') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(butcherPed, 'butcherPed') end
        DeletePed(butcherPed)
        for k, v in pairs(Config.InteractionLocations.JobAreas) do if TargetType == 'qb' then exports['qb-target']:RemoveZone(v.name) elseif TargetType == 'ox' then exports.ox_target:removeZone(v.name) end end
        if IsEntityAttached(chickenPed) then
            DeletePed(chickenPed)
            ClearPedTasks(PlayerPedId())
        end
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Butcher Job V2.1.0 Stopped Successfully ^5--<^3!^5>--^7')
    end
end)