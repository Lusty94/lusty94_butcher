local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}
local onDuty = false
local player = PlayerPedId()


-----------------------------------------< BLIPS START >-------------------------------------
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
-----------------------------------------< BLIPS START >-------------------------------------


------------------------------------------------------------< PICK CHICKEN START >----------------------------------
RegisterNetEvent('lusty94_butcher:client:PickChicken', function()
    if onDuty then
        RequestAnimDict(Config.Animations.PickChicken.dict)
        while not HasAnimDictLoaded(Config.Animations.PickChicken.dict) do
            Wait(0)
        end
        TaskPlayAnim(PlayerPedId(), Config.Animations.PickChicken.dict, Config.Animations.PickChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
        if Config.MiniGameSettings.Type == 'progressbar' then
            QBCore.Functions.Progressbar("pick_chicken", "Picking Fresh Chicken", Config.CoreSettings.ProgressBar.Times.TimeToPickChicken, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
            }, {}, {}, function()
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent('lusty94_butcher:server:PickChicken')
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Picked A Fresh Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Picked Bird', 'You Picked A Fresh Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('success', 'You Picked A Fresh Chicken!') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Picked Bird', 'You Picked A Fresh Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                    end
            end, function()
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end)
        elseif Config.MiniGameSettings.Type == 'skillbar' then
                    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                    Skillbar.Start({
                        duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                        pos = Config.MiniGameSettings.SkillBarSettings.Position,
                        width = Config.MiniGameSettings.SkillBarSettings.Width,
                    }, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:PickChicken')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Picked A Fresh Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Picked Bird', 'You Picked A Fresh Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Picked A Fresh Chicken!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Picked Bird', 'You Picked A Fresh Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
        elseif Config.MiniGameSettings.Type == 'ps-ui' then
            exports['ps-ui']:Circle(function(success)
                if success then
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_butcher:server:PickChicken')
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Picked A Fresh Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Picked Bird', 'You Picked A Fresh Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('success', 'You Picked A Fresh Chicken!') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Picked Bird', 'You Picked A Fresh Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                    end
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
        elseif Config.MiniGameSettings.Type == 'boii' then
            exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                if success then
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_butcher:server:PickChicken')
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Picked A Fresh Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Picked Bird', 'You Picked A Fresh Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('success', 'You Picked A Fresh Chicken!') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Picked Bird', 'You Picked A Fresh Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                    end
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
        end
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end)
------------------------------------------------------------< PICK CHICKEN END >-----------------------------------




-----------------------------------------------------------< PLUCK CHICKEN START >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:PluckChicken', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:FreshChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PluckChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PluckChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PluckChicken.dict, Config.Animations.PluckChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("pluck_chicken", "Plucking Chicken", Config.CoreSettings.ProgressBar.Times.TimeToPluckChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:PluckChicken')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Plucked A Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Plucked Bird', 'You Plucked A Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Plucked A Chicken!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Plucked Bird', 'You Plucked A Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:PluckChicken')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Plucked A Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Plucked Bird', 'You Plucked A Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Plucked A Chicken!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Plucked Bird', 'You Plucked A Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PluckChicken')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Plucked A Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Plucked Bird', 'You Plucked A Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Plucked A Chicken!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Plucked Bird', 'You Plucked A Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PluckChicken')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Plucked A Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Plucked Bird', 'You Plucked A Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Plucked A Chicken!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Plucked Bird', 'You Plucked A Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)

    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end  
end)
------------------------------------------------------------< PLUCK CHICKEN END >-----------------------------------


------------------------------------------------------------< PROCESS CHICKEN START >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:ProcessChicken', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:PluckedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.ProcessChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.ProcessChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.ProcessChicken.dict, Config.Animations.ProcessChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("pluck_chicken", "Processing Chicken", Config.CoreSettings.ProgressBar.Times.TimeToProcessChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ProcessChicken')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed A Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Bird', 'You Processed A Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed A Chicken!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Bird', 'You Processed A Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:ProcessChicken')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Processed A Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Processed Bird', 'You Processed A Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Processed A Chicken!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Processed Bird', 'You Processed A Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChicken')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed A Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Bird', 'You Processed A Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed A Chicken!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Bird', 'You Processed A Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChicken')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed A Chicken", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Bird', 'You Processed A Chicken', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed A Chicken!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Bird', 'You Processed A Chicken', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end) 
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end 
end)
------------------------------------------------------------< PROCESS CHICKEN END >-----------------------------------




------------------------------------------------------------< PROCESS CHICKEN START START >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:ProcessChickenBreast', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_breast", "Processing Chicken Breast", Config.CoreSettings.ProgressBar.Times.TimeToProcessChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:ProcessChickenBreast')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Processed Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Breast!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end) 
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end 
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenThighs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Thigh", "Processing Chicken Thighs", Config.CoreSettings.ProgressBar.Times.TimeToProcessChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:ProcessChickenThighs')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Processed Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Thighs!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)  
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end  
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenWings', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Wings", "Processing Chicken Wings", Config.CoreSettings.ProgressBar.Times.TimeToProcessChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:ProcessChickenWings')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Processed Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Wings!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)
     else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end   
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenDrumSticks', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_DrumSticks", "Processing Chicken Drumsticks", Config.CoreSettings.ProgressBar.Times.TimeToProcessChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Drumsticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Drumsticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Drumsticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Drumsticks', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:ProcessChickenDrumSticks')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Processed Chicken Drumsticks", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Drumsticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Drumsticks!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Drumsticks', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Drumsticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Drumsticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Drumsticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Drumsticks', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Drumsticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Drumsticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Drumsticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Drumsticks', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)  
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end 
end)


RegisterNetEvent('lusty94_butcher:client:ProcessChickenLegs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Legs", "Processing Chicken Legs", Config.CoreSettings.ProgressBar.Times.TimeToProcessChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ProcessChickenLegs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:ProcessChickenLegs')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Processed Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Legs!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenLegs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:ProcessChickenLegs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Processed Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Processed Item', 'You Processed Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Processed Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Processed Item', 'You Processed Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end   
end)
------------------------------------------------------------< PROCESS CHICKEN START END >-----------------------------------



------------------------------------------------------------< PACK CHICKEN START >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:PackChickenBreast', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenBreast', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_breast", "Packing Chicken Breast", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:PackChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:PackChickenBreast')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Packed Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Breast!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end) 
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end 
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenThighs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenThighs', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Thigh", "Packing Chicken Thighs", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:PackChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:PackChickenThighs')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Packed Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Thighs!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)  
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end  
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenWings', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenWings', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Wings", "Packing Chicken Wings", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:PackChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:PackChickenWings')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Packed Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Wings!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)
     else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end   
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenDrumSticks', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenDrumsticks', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_DrumSticks", "Packing Chicken Drumsticks", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:PackChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Drumsticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Drumsticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Drumsticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Drumsticks', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:PackChickenDrumSticks')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Packed Chicken Drumsticks", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Drumsticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Drumsticks!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Drumsticks', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Drumsticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Drumsticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Drumsticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Drumsticks', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Drumsticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Drumsticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Drumsticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Drumsticks', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)  
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end 
end)


RegisterNetEvent('lusty94_butcher:client:PackChickenLegs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenLegs', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Legs", "Packing Chicken Legs", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:PackChickenLegs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                elseif Config.MiniGameSettings.Type == 'skillbar' then
                            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                            Skillbar.Start({
                                duration = Config.MiniGameSettings.SkillBarSettings.Duration,
                                pos = Config.MiniGameSettings.SkillBarSettings.Position,
                                width = Config.MiniGameSettings.SkillBarSettings.Width,
                            }, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('lusty94_butcher:server:PackChickenLegs')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Packed Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Legs!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                                end
                            end, function()
                                ClearPedTasks(PlayerPedId())
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                                end
                            end)
                elseif Config.MiniGameSettings.Type == 'ps-ui' then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenLegs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end, Config.MiniGameSettings.SkillCircleSettings.Circles, Config.MiniGameSettings.SkillCircleSettings.MS) -- NumberOfCircles, MS
                elseif Config.MiniGameSettings.Type == 'boii' then
                    exports['boii_ui']:keydrop(Config.MiniGameSettings.KeyDropSettings.ScoreLimit, Config.MiniGameSettings.KeyDropSettings.MissLimit, Config.MiniGameSettings.KeyDropSettings.FallDelay, Config.MiniGameSettings.KeyDropSettings.NewLetterDelay, function(success)
                        if success then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_butcher:server:PackChickenLegs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Packed Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Packed Item', 'You Packed Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Packed Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Packed Item', 'You Packed Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                        else
                            ClearPedTasks(PlayerPedId())
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                            end
                        end
                    end)
                end
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end   
end)
------------------------------------------------------------< PROCESS CHICKEN START END >-----------------------------------



------------------------------------------------------------< PACK CHICKEN START >-----------------------------------
RegisterNetEvent('lusty94_butcher:client:SellChickenBreast', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenBreastPack', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.SellChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.SellChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.SellChicken.dict, Config.Animations.SellChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                    QBCore.Functions.Progressbar("chicken_breast", "Checking Quality of Products", Config.CoreSettings.ProgressBar.Times.TimeToSellChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:SellChickenBreastPack')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Sold Some Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Sold Item', 'You Sold Some Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Sold Some Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Sold Item', 'You Sold Some Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end) 
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end 
end)


RegisterNetEvent('lusty94_butcher:client:SellChickenThighs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenThighsPack', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.SellChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.SellChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.SellChicken.dict, Config.Animations.SellChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                    QBCore.Functions.Progressbar("chicken_Thigh", "Checking Quality of Products", Config.CoreSettings.ProgressBar.Times.TimeToSellChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:SellChickenThighsPack')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Sold Some Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Sold Item', 'You Sold Some Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Sold Some Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Sold Item', 'You Sold Some Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)  
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end  
end)


RegisterNetEvent('lusty94_butcher:client:SellChickenWings', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenWingsPack', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.SellChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.SellChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.SellChicken.dict, Config.Animations.SellChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                    QBCore.Functions.Progressbar("chicken_Wings", "Checking Quality of Products", Config.CoreSettings.ProgressBar.Times.TimeToSellChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:SellChickenWingsPack')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Sold Some Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Sold Item', 'You Sold Some Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Sold Some Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Sold Item', 'You Sold Some Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
                
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)
     else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end   
end)


RegisterNetEvent('lusty94_butcher:client:SellChickenDrumSticks', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenDrumSticksPack', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.SellChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.SellChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.SellChicken.dict, Config.Animations.SellChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                    QBCore.Functions.Progressbar("chicken_DrumSticks", "Checking Quality of Products", Config.CoreSettings.ProgressBar.Times.TimeToSellChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:SellChickenDrumSticksPack')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Sold Some Chicken Drum Sticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Sold Item', 'You Sold Some Chicken Drum Sticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Sold Some Chicken Drum Sticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Sold Item', 'You Sold Some Chicken Drum Sticks', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)  
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end 
end)


RegisterNetEvent('lusty94_butcher:client:SellChickenLegs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ChickenLegsPack', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.SellChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.SellChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.SellChicken.dict, Config.Animations.SellChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                    QBCore.Functions.Progressbar("chicken_Legs", "Checking quality of Products", Config.CoreSettings.ProgressBar.Times.TimeToSellChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:SellChickenLegsPack')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Sold Some Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Sold Item', 'You Sold Some Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Sold Some Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Sold Item', 'You Sold Some Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
                            end
                    end, function()
                        ClearPedTasks(PlayerPedId())
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('error', 'Cancelled!') 
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                        end
                    end)
            else
                ClearPedTasks(PlayerPedId())
                if Config.CoreSettings.Notify.Type == 'qb' then
                    QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                elseif Config.CoreSettings.Notify.Type == 'okok' then
                    exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                elseif Config.CoreSettings.Notify.Type == 'boii' then
                    exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                end
            end
        end)
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Need To Be Clocked In To Do This", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not On Duty','You Need To Be Clocked In To Do This', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Need To Be Clocked In To Do This!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not On Duty', 'You Need To Be Clocked In To Do This', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end   
end)
------------------------------------------------------------< PROCESS CHICKEN START END >-----------------------------------




-----------------------------------------< JOB & MANAGEMENT SECTION START >-----------------------------------------
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
-------------------------------------< JOB & MANAGEMENT SECTION END >----------------------------------------------


RegisterCommand('toggleduty', function()
    if Config.UseToggleDutyCommand then
        TriggerServerEvent("QBCore:ToggleDuty")
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("Config.UseToggleDutyCommand = false, Change to true to use this command.", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('No Permission','Config.UseToggleDutyCommand = false, Change to true to use this command.', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'Config.UseToggleDutyCommand = false, Change to true to use this command.!') 
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('No Permission', 'Config.UseToggleDutyCommand = false, Change to true to use this command.', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end)



AddEventHandler('onResourceStop', function(resourceName) if resourceName ~= GetCurrentResourceName() then return end
if (GetCurrentResourceName() ~= resourceName) then
end
    print('^5--<^3!^5>-- ^7Lusty94 ^5| ^5--<^3!^5>--^5Butcher V1.0.0 Stopped Successfully^5--<^3!^5>--^7')
    exports['qb-target']:RemoveZone("PickChicken")
    exports['qb-target']:RemoveZone("PluckChicken")
    exports['qb-target']:RemoveZone("ProcessChicken")
    exports['qb-target']:RemoveZone("PackChicken")
    exports['qb-target']:RemoveZone("ToggleDuty")
    exports['qb-target']:RemoveZone("BossMenu")
    exports['qb-target']:RemoveZone("ClothingLocker")
    exports['qb-target']:RemoveZone("SellChicken")
end)