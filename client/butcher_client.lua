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
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(title, msg, type, time)
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
    lib.requestModel(Config.Selling.PedModel, 5000)
    butcherPed = CreatePed(0, Config.Selling.PedModel, Config.Selling.Location.x, Config.Selling.Location.y, Config.Selling.Location.z, false, false)
    SetEntityHeading(butcherPed, Config.Selling.Location.w)
    FreezeEntityPosition(butcherPed, true)
    SetEntityInvincible(butcherPed, true)
    SetBlockingOfNonTemporaryEvents(butcherPed, true)
    TaskStartScenarioInPlace(butcherPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    if TargetType == 'qb' then
        exports['qb-target']:AddTargetEntity(butcherPed, {  options = { { icon = 'fa-solid fa-bars', label = 'Sell Chicken Products', event = 'lusty94_butcher:client:SellChickenMenu', job = Config.CoreSettings.Job.Name,} }, distance = 1.0, })
    elseif TargetType == 'ox' then
        exports.ox_target:addLocalEntity(butcherPed, { { name = 'butcherPed', icon = 'fa-solid fa-bars', label = 'Sell Chicken Products', event = 'lusty94_butcher:client:SellChickenMenu', groups = Config.CoreSettings.Job.Name, distance = 1.0} })
    end
end)




-------------------------------------< PICK CHICKEN >----------------------------------

RegisterNetEvent('lusty94_butcher:client:PickChicken', function()
    local playerPed = PlayerPedId()
    if onDuty then
        if busy then
            SendNotify("You are already doing something.", 'error', 2000)
        else
            if IsEntityAttached(chickenPed) then
                SendNotify("You have a chicken already.", 'error', 2000)
            else
                busy = true
                LockInventory(true)
                if lib.progressCircle({ 
                    duration = Config.CoreSettings.Timers.Pick, 
                    label = 'Picking chicken...', 
                    position = 'bottom', 
                    useWhileDead = false, 
                    canCancel = true, 
                    disable = { car = true, move = true, }, 
                    anim = { dict = Config.Animations.PickChicken.dict, clip = Config.Animations.PickChicken.anim,},
                }) then
                    local playerCoords = GetEntityCoords(playerPed)
                    local chickenModel = 'a_c_hen'
                    lib.requestModel(chickenModel, 5000)         
                    chickenPed = CreatePed(0, chickenModel, playerCoords.x, playerCoords.y, playerCoords.z, 0, true, true)
                    AttachEntityToEntity(chickenPed, playerPed, GetPedBoneIndex(playerPed, 57005), 0.12, 0.0, 0.0, 0.0, 255.0, 30.0, true, true, false, true, 1, true)
                    local dict = 'move_weapon@jerrycan@generic'
                    local anim = 'idle'
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do
                        Wait(1000)
                    end
                    TaskPlayAnim(playerPed, dict, anim, 1.0, -1.0, 1.0, 51, 11, 0, 0, 0)
                    busy = false
                    LockInventory(false)
                    SendNotify("You picked a chicken, now go and pluck it.", 'success', 2000) 
                else 
                    busy = false
                    LockInventory(false)
                    ClearPedTasks(playerPed)
                    SendNotify('Action cancelled.', 'error', 2000)
                end
                
            end
        end
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

-----------------------------------------< PLUCK CHICKEN >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:PluckChicken', function()
    if onDuty then
        if busy then
            SendNotify("You are already doing something.", 'error', 2000)
        else
            if IsEntityAttached(chickenPed) then
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ 
                        duration = Config.CoreSettings.Timers.Pluck, 
                        label = 'Plucking chicken...', 
                        position = 'bottom', 
                        useWhileDead = false, 
                        canCancel = true, 
                        disable = { car = true, move = true, },
                        anim = { dict = Config.Animations.PluckChicken.dict, clip = Config.Animations.PluckChicken.anim,},
                    }) then
                        busy = false
                        LockInventory(false)
                        DeleteEntity(chickenPed)
                        TriggerServerEvent('lusty94_butcher:server:PluckChicken')
                        SendNotify("You plucked a chicken now go process it.", 'success', 2000)
                    else 
                        busy = false
                        LockInventory(false)
                        SendNotify('Action cancelled.', 'error', 2000)
                    end
                else
                    SendNotify("Action failed.", 'error', 2000)
                end
            else
                SendNotify("You dont have a chicken.", 'error', 2000)
            end
        end
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)



----------------------------------------< PROCESS CHICKEN >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:ProcessChicken', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:PluckedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Process, 
                            label = 'Processing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, }, 
                            anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:ProcessChicken')
                            SendNotify("You processed a chicken.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing a plucked chicken.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenBreast', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Process, 
                            label = 'Processing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,}, 
                            prop = { model = 'v_ind_cfknife', bone = 57005, pos = vec3(0.2, 0.14, -0.01), rot = vec3(1.0, 4.0, 57.0),},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenBreast')
                            SendNotify("You processed a chicken into breasts.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenThighs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Process, 
                            label = 'Processing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,}, 
                            prop = { model = 'v_ind_cfknife', bone = 57005, pos = vec3(0.2, 0.14, -0.01), rot = vec3(1.0, 4.0, 57.0),},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenThighs')
                            SendNotify("You processed a chicken into thighs.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end 
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenWings', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Process, 
                            label = 'Processing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,}, 
                            prop = { model = 'v_ind_cfknife', bone = 57005, pos = vec3(0.2, 0.14, -0.01), rot = vec3(1.0, 4.0, 57.0),},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenWings')
                            SendNotify("You processed a chicken into wings.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end   
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenDrumSticks', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Process, 
                            label = 'Processing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,}, 
                            prop = { model = 'v_ind_cfknife', bone = 57005, pos = vec3(0.2, 0.14, -0.01), rot = vec3(1.0, 4.0, 57.0),},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenDrumSticks')
                            SendNotify("You processed a chicken into drum sticks.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenLegs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true) 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Process, 
                            label = 'Processing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.ProcessChicken.dict, clip = Config.Animations.ProcessChicken.anim,}, 
                            prop = { model = 'v_ind_cfknife', bone = 57005, pos = vec3(0.2, 0.14, -0.01), rot = vec3(1.0, 4.0, 57.0),},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenLegs')
                            SendNotify("You processed a chicken into legs.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end   
end)


-------------------------------------< PACK CHICKEN >-----------------------------------

RegisterNetEvent('lusty94_butcher:client:PackChickenBreast', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenBreast', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Pack, 
                            label = 'Packing chicken...', 
                            position = 'bottom',
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:PackChickenBreast')
                            SendNotify("You packed chicken breast.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end  
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenThighs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenThighs', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Pack, 
                            label = 'Packing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:PackChickenThighs')
                            SendNotify("You packed chicken thighs.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end   
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenWings', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenWings', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Pack, 
                            label = 'Packing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:PackChickenWings')
                            SendNotify("You packed chicken wings.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end    
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenDrumSticks', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenDrumsticks', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Pack, 
                            label = 'Packing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:PackChickenDrumSticks')
                            SendNotify("You packed chicken drum sticks.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end  
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenLegs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenLegs', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.Pack, 
                            label = 'Packing chicken...', 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PackChicken.dict, clip = Config.Animations.PackChicken.anim,},
                        }) then
                            busy = false
                            LockInventory(false)
                            TriggerServerEvent('lusty94_butcher:server:PackChickenLegs')
                            SendNotify("You packed chicken legs.", 'success', 2000)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify('Action cancelled.', 'error', 2000)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end   
end)




--give items
RegisterNetEvent('lusty94_butcher:client:GiveItems', function()
    if onDuty then
        local input = lib.inputDialog('Butcher Supplies', {
            {type = 'number', label = 'Food Packaging', description = 'How much do you need?', icon = 'arrow-right'},
            })
        if input then
            TriggerServerEvent('lusty94_butcher:server:GiveItems', 2, tonumber(input[1]))
        end
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
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
function LockInventory(toggle) -- big up to jim for how to do this
	if toggle then
        LocalPlayer.state:set("inv_busy", true, true) -- used by qb, ps and ox
        --this is the old method below
        --[[ 
        if InvType == 'qb' then
            this is for the old method if using old qb and ox
            TriggerEvent('inventory:client:busy:status', true) TriggerEvent('canUseInventoryAndHotbar:toggle', false)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", true, true)
        end         
        ]]
    else 
        LocalPlayer.state:set("inv_busy", false, true) -- used by qb, ps and ox
        --this is the old method below
        --[[        
        if InvType == 'qb' then
            this is for the old method if using old qb and ox
         TriggerEvent('inventory:client:busy:status', false) TriggerEvent('canUseInventoryAndHotbar:toggle', true)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", false, true)
        end        
        ]]
    end
end




--selling packaged chicken
RegisterNetEvent('lusty94_butcher:client:SellItems', function(args)
    local args = tonumber(args)
    if onDuty then
        if busy then
            SendNotify("You Are Already Doing Something!", 'error', 2000)
        else
            busy = true
            LockInventory(true)
            if args == 1 then
                TriggerServerEvent('lusty94_butcher:server:SellItems', 1)
                LockInventory(false)
                busy = false
            elseif args == 2 then
                TriggerServerEvent('lusty94_butcher:server:SellItems', 2)
                LockInventory(false)
                busy = false
            elseif args == 3 then
                TriggerServerEvent('lusty94_butcher:server:SellItems', 3)
                LockInventory(false)
                busy = false
            elseif args == 4 then
                TriggerServerEvent('lusty94_butcher:server:SellItems', 4)
                LockInventory(false)
                busy = false
            elseif args == 5 then
                TriggerServerEvent('lusty94_butcher:server:SellItems', 5)
                LockInventory(false)
                busy = false
            end
            LockInventory(false)
        end
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
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
        end
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Butcher Job V2.0.1 Stopped Successfully ^5--<^3!^5>--^7')
    end
end)