local QBCore = exports['qb-core']:GetCoreObject()
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local InvType = Config.CoreSettings.Inventory.Type
local ClothingType = Config.CoreSettings.Clothing.Type
local onDuty, busy, selling = true, false, false
local playerPed = PlayerPedId()
PlayerJob = {}



------------------------------< BLIPS >-------------------------------------
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
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



--------------------------< FUNCTIONS >------------------------

--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Butcher: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Notification" end
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

function doAnims(args)
   local args = tonumber(args)   
   if args == 1 then
        RequestAnimDict(Config.Animations.PickChicken.dict)
        while not HasAnimDictLoaded(Config.Animations.PickChicken.dict) do
            Wait(100)
        end
        TaskPlayAnim(playerPed, Config.Animations.PickChicken.dict, Config.Animations.PickChicken.anim, 1.0, -1.0, 1.0, Config.Animations.PickChicken.flag, 0, 0, 0, 0)
   elseif args == 2 then
        RequestAnimDict(Config.Animations.PluckChicken.dict)
        while not HasAnimDictLoaded(Config.Animations.PluckChicken.dict) do
            Wait(100)
        end
        TaskPlayAnim(playerPed, Config.Animations.PluckChicken.dict, Config.Animations.PluckChicken.anim, 1.0, -1.0, 1.0, Config.Animations.PluckChicken.flag, 0, 0, 0, 0)
   elseif args == 3 then
        RequestAnimDict(Config.Animations.ProcessChicken.dict)
        while not HasAnimDictLoaded(Config.Animations.ProcessChicken.dict) do
            Wait(100)
        end
        TaskPlayAnim(playerPed, Config.Animations.ProcessChicken.dict, Config.Animations.ProcessChicken.anim, 1.0, -1.0, 1.0, Config.Animations.ProcessChicken.flag, 0, 0, 0, 0)
   elseif args == 4 then
        RequestAnimDict(Config.Animations.PackChicken.dict)
        while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
            Wait(100)
        end
        TaskPlayAnim(playerPed, Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, Config.Animations.PackChicken.flag, 0, 0, 0, 0)
   end
end






-------------------------------------< PICK CHICKEN >----------------------------------
RegisterNetEvent('lusty94_butcher:client:PickChicken', function()
    if onDuty then
        if busy then
            SendNotify("You Are Already Doing Something.", 'error', 2000)
        else
            if IsEntityAttached(chickenPed) then
                SendNotify("You Are Already Have A Chicken.", 'error', 2000)
            else
                FreezeEntityPosition(playerPed, true) 
                LockInventory(true)
                busy = true
                doAnims(1)
                Wait(Config.CoreSettings.Timers.Pick)
                ClearPedTasks(playerPed)
                SendNotify("You Picked A Chicken Now Go Pluck It.", 'success', 2000)
                local playerCoords = GetEntityCoords(playerPed)
                local chickenModel = 'a_c_hen'
                RequestModel(chickenModel)
                while not HasModelLoaded(chickenModel) do
                    Wait(500)
                end            
                chickenPed = CreatePed(0, chickenModel, playerCoords.x, playerCoords.y, playerCoords.z, 0, true, true)
                AttachEntityToEntity(chickenPed, playerPed, GetPedBoneIndex(playerPed, 57005), 0.12, 0.0, 0.0, 0.0, 255.0, 30.0, true, true, false, true, 1, true)
                local dict = 'move_weapon@jerrycan@generic'
                local anim = 'idle'
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Wait(10)
                end
                TaskPlayAnim(playerPed, dict, anim, 1.0, -1.0, 1.0, 51, 11, 0, 0, 0)
                busy = false
                LockInventory(false)
                FreezeEntityPosition(playerPed, false) 
            end
        end
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end
end)

-----------------------------------------< PLUCK CHICKEN >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:PluckChicken', function()
    if onDuty then
        if busy then
            SendNotify("You Are Already Doing Something.", 'error', 2000)
        else
            if IsEntityAttached(chickenPed) then
                FreezeEntityPosition(playerPed, true) 
                LockInventory(true)
                ClearPedTasks(playerPed)
                busy = true
                doAnims(2)
                Wait(Config.CoreSettings.Timers.Pluck)
                DeleteEntity(chickenPed)
                SendNotify("You Plucked A Chicken Now Go Process It.", 'success', 2000)
                TriggerServerEvent('lusty94_butcher:server:PluckChicken')
                ClearPedTasks(playerPed)
                busy = false
                LockInventory(false)
                FreezeEntityPosition(playerPed, false)
            else
                SendNotify("You Dont Have A Chicken.", 'error', 2000)
            end
        end
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end 
end)



----------------------------------------< PROCESS CHICKEN >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:ProcessChicken', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:PluckedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    LockInventory(true)
                    busy = true
                    doAnims(3)
                    Wait(Config.CoreSettings.Timers.Process)
                    SendNotify("You Processed A Chicken.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:ProcessChicken')
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Plucked Chicken.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end
end)

function attachKnife()
    local coords = GetEntityCoords(playerPed)
    knife = CreateObject('v_ind_cfknife', coords, true, false, false)
    AttachEntityToEntity(knife, playerPed, GetPedBoneIndex(PlayerPedId(), 57005), 0.2, 0.14, -0.01, 1.0, 4.0, 57.0, true, true, false, false, 1, true)
end

RegisterNetEvent('lusty94_butcher:client:ProcessChickenBreast', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    attachKnife()
                    LockInventory(true)
                    busy = true
                    doAnims(3)
                    Wait(Config.CoreSettings.Timers.Process)
                    SendNotify("You Processed A Chicken Into Breasts.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:ProcessChickenBreast')
                    DeleteObject(knife)
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Processed Chicken Or A Butchers Knife.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenThighs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    attachKnife()
                    LockInventory(true)
                    busy = true
                    doAnims(3)
                    Wait(Config.CoreSettings.Timers.Process)
                    SendNotify("You Processed A Chicken Into Thighs.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:ProcessChickenThighs')
                    DeleteObject(knife)
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Processed Chicken Or A Butchers Knife.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end 
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenWings', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    attachKnife()
                    LockInventory(true)
                    busy = true
                    doAnims(3)
                    Wait(Config.CoreSettings.Timers.Process)
                    SendNotify("You Processed A Chicken Into Wings.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:ProcessChickenWings')
                    DeleteObject(knife)
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Processed Chicken Or A Butchers Knife.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end   
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenDrumSticks', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    attachKnife()
                    LockInventory(true)
                    busy = true
                    doAnims(3)
                    Wait(Config.CoreSettings.Timers.Process)
                    SendNotify("You Processed A Chicken Into Drumsticks.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:ProcessChickenDrumsticks')
                    DeleteObject(knife)
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Processed Chicken Or A Butchers Knife.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenLegs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    attachKnife()
                    LockInventory(true)
                    busy = true
                    doAnims(3)
                    Wait(Config.CoreSettings.Timers.Process)
                    SendNotify("You Processed A Chicken Into Legs.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:ProcessChickenLegs')
                    DeleteObject(knife)
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Processed Chicken Or A Butchers Knife.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end   
end)


-------------------------------------< PACK CHICKEN >-----------------------------------

RegisterNetEvent('lusty94_butcher:client:PackChickenBreast', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenBreast', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    LockInventory(true)
                    busy = true
                    doAnims(4)
                    Wait(Config.CoreSettings.Timers.Pack)
                    SendNotify("You Packed Chicken Breast.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:PackChickenBreast')
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Chicken Breast Or Food Packaging.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end  
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenThighs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenThighs', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    LockInventory(true)
                    busy = true
                    doAnims(4)
                    Wait(Config.CoreSettings.Timers.Pack)
                    SendNotify("You Packed Chicken Thighs.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:PackChickenThighs')
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Chicken Thighs Or Food Packaging.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end   
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenWings', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenWings', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    LockInventory(true)
                    busy = true
                    doAnims(4)
                    Wait(Config.CoreSettings.Timers.Pack)
                    SendNotify("You Packed Chicken Wings.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:PackChickenWings')
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Chicken Wings Or Food Packaging.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end    
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenDrumSticks', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenDrumsticks', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    LockInventory(true)
                    busy = true
                    doAnims(4)
                    Wait(Config.CoreSettings.Timers.Pack)
                    SendNotify("You Packed Chicken Drumsticks.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:PackChickenDrumsticks')
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Chicken Drumsticks Or Food Packaging.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end  
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenLegs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenLegs', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something.", 'error', 2000)
                else
                    FreezeEntityPosition(playerPed, true)
                    LockInventory(true)
                    busy = true
                    doAnims(4)
                    Wait(Config.CoreSettings.Timers.Pack)
                    SendNotify("You Packed Chicken Legs.", 'success', 2000)
                    TriggerServerEvent('lusty94_butcher:server:PackChickenLegs')
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                end
            else
                SendNotify("You Are Missing A Chicken Legs Or Food Packaging.", 'error', 2000)
            end
        end) 
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end   
end)






--give items
RegisterNetEvent('lusty94_butcher:client:GiveItems', function(args)
    local args = tonumber(args)
    if onDuty then
        if args == 1 then
            TriggerServerEvent('lusty94_butcher:server:GiveItems', 1)
        elseif args == 2 then
            TriggerServerEvent('lusty94_butcher:server:GiveItems', 2)
        end
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
    end
end)

-----------------------------------< SELLING CROPS >--------------------------------


-- function to lock inventory to prevent exploits
function LockInventory(toggle) -- big up to jim for how to do this
	if toggle then
        if InvType == 'qb' then
            TriggerEvent('inventory:client:busy:status', true) TriggerEvent('canUseInventoryAndHotbar:toggle', false)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", true, true)
        end
    else 
        if InvType == 'qb' then
         TriggerEvent('inventory:client:busy:status', false) TriggerEvent('canUseInventoryAndHotbar:toggle', true)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", false, true)
        end
    end
end

--selling ped for butcher
CreateThread(function()
    RequestModel(GetHashKey(Config.Selling.PedModel))
    while not HasModelLoaded(GetHashKey(Config.Selling.PedModel)) do
        Wait(100)
    end
    local pedlocation = Config.Selling.Location
    sellingPed = CreatePed(0, Config.Selling.PedModel, pedlocation, false, false)
    FreezeEntityPosition(sellingPed, true)
    SetEntityInvincible(sellingPed, true)
    SetBlockingOfNonTemporaryEvents(sellingPed, true)
    TaskStartScenarioInPlace(sellingPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    if TargetType == 'qb' then
        exports['qb-target']:AddTargetEntity(sellingPed, {  options = { { icon = 'fa-solid fa-bars', label = 'Sell Chicken Products', event = 'lusty94_butcher:client:SellChickenMenu', } }, distance = 2.0, })
    elseif TargetType == 'ox' then
        exports.ox_target:addLocalEntity(sellingPed, { { name = 'sellingPed', icon = 'fa-solid fa-bars', label = 'Sell Chicken Products', event = 'lusty94_butcher:client:SellChickenMenu', distance = 2.0} })
    end
end)


--selling packaged chicken
RegisterNetEvent('lusty94_butcher:client:SellItems', function(args)
    local args = tonumber(args)
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:SellingItems', function(HasItems)  
        if HasItems then
                if selling then
                    SendNotify("You Are Already Doing Something!", 'error', 2000)
                else
                    selling = true
                    LockInventory(true)
                    if args == 1 then
                        TriggerServerEvent('lusty94_butcher:server:SellItems', 1)
                        LockInventory(false)
                        selling = false
                    elseif args == 2 then
                        TriggerServerEvent('lusty94_butcher:server:SellItems', 2)
                        LockInventory(false)
                        selling = false
                    elseif args == 3 then
                        TriggerServerEvent('lusty94_butcher:server:SellItems', 3)
                        LockInventory(false)
                        selling = false
                    elseif args == 4 then
                        TriggerServerEvent('lusty94_butcher:server:SellItems', 4)
                        LockInventory(false)
                        selling = false
                    elseif args == 5 then
                        TriggerServerEvent('lusty94_butcher:server:SellItems', 5)
                        LockInventory(false)
                        selling = false
                    end
                    LockInventory(false)
                end
            else
                SendNotify("You Are Missing Items!", 'error', 2000)
            end
        end)
    else
        SendNotify("You Must Be On Duty To Do That.", 'error', 2000)
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




AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        busy = false
        selling = false
        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(sellingPed, 'sellingPed') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(sellingPed, 'sellingPed') end print('sellingPed - Targets Deleted') 
        DeletePed(sellingPed) print('sellingPed - Ped Deleted')
        if TargetType == 'qb' then
            exports['qb-target']:RemoveZone("ToggleDuty")
            exports['qb-target']:RemoveZone("ClothingLocker")
            exports['qb-target']:RemoveZone("PickChicken")
            exports['qb-target']:RemoveZone("PluckChicken")
            exports['qb-target']:RemoveZone("PrepareChicken")
            exports['qb-target']:RemoveZone("ProcessChicken")
            exports['qb-target']:RemoveZone("PackChicken")
        elseif TargetType == 'ox' then
            exports.ox_target:removeZone(1)
            exports.ox_target:removeZone(2)
            exports.ox_target:removeZone(3)
            exports.ox_target:removeZone(4)
            exports.ox_target:removeZone(5)
            exports.ox_target:removeZone(6)
            exports.ox_target:removeZone(7)
        end
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Butcher V1.2.0 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)