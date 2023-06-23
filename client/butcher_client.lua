local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}
local onDuty = false
local player = PlayerPedId()





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


------------------------------------------------------------< PLUCK CHICKEN START >-----------------------------------


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


------------------------------------------------------------< CHICKEN PARTS START >-----------------------------------


RegisterNetEvent('lusty94_butcher:client:ChickenBreast', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_breast", "Preparing Chicken Breast", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
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
                                TriggerServerEvent('lusty94_butcher:server:ChickenBreast')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Prepared Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Breast!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenBreast')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Breast", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Breast', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Breast!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Breast', 'success', Config.CoreSettings.Notify.Length.Success)
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


RegisterNetEvent('lusty94_butcher:client:ChickenThighs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Thigh", "Preparing Chicken Thighs", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
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
                                TriggerServerEvent('lusty94_butcher:server:ChickenThighs')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Prepared Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Thighs!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenThighs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Thighs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Thighs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Thighs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Thighs', 'success', Config.CoreSettings.Notify.Length.Success)
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


RegisterNetEvent('lusty94_butcher:client:ChickenWings', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Wings", "Preparing Chicken Wings", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
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
                                TriggerServerEvent('lusty94_butcher:server:ChickenWings')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Prepared Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Wings!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenWings')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Wings", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Wings', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Wings!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Wings', 'success', Config.CoreSettings.Notify.Length.Success)
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


RegisterNetEvent('lusty94_butcher:client:ChickenDrumSticks', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_DrumSticks", "Preparing Chicken Drum Sticks", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Drum Sticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Drum Sticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Drum Sticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Drum Sticks', 'success', Config.CoreSettings.Notify.Length.Success)
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
                                TriggerServerEvent('lusty94_butcher:server:ChickenDrumSticks')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Prepared Chicken Drum Sticks", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Drum Sticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Drum Sticks!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Drum Sticks', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Drum Sticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Drum Sticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Drum Sticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Drum Sticks', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Drum Sticks", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Drum Sticks', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Drum Sticks!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Drum Sticks', 'success', Config.CoreSettings.Notify.Length.Success)
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


RegisterNetEvent('lusty94_butcher:client:ChickenLegs', function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_butcher:get:ProcessedChicken', function(HasItems)  
            if HasItems then
                RequestAnimDict(Config.Animations.PackChicken.dict)
                while not HasAnimDictLoaded(Config.Animations.PackChicken.dict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), Config.Animations.PackChicken.dict, Config.Animations.PackChicken.anim, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                if Config.MiniGameSettings.Type == 'progressbar' then
                    QBCore.Functions.Progressbar("chicken_Legs", "Preparing Chicken Legs", Config.CoreSettings.ProgressBar.Times.TimeToPackChicken, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function()
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_butcher:server:ChickenLegs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
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
                                TriggerServerEvent('lusty94_butcher:server:ChickenLegs')
                                if Config.CoreSettings.Notify.Type == 'qb' then
                                    QBCore.Functions.Notify("You Prepared Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                                elseif Config.CoreSettings.Notify.Type == 'okok' then
                                    exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                                elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                    exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Legs!') 
                                elseif Config.CoreSettings.Notify.Type == 'boii' then
                                    exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenLegs')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
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
                            TriggerServerEvent('lusty94_butcher:server:ChickenDrumSticks')
                            if Config.CoreSettings.Notify.Type == 'qb' then
                                QBCore.Functions.Notify("You Prepared Chicken Legs", "success", Config.CoreSettings.Notify.Length.Success)
                            elseif Config.CoreSettings.Notify.Type == 'okok' then
                                exports['okokNotify']:Alert('Prepared Item', 'You Prepared Chicken Legs', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                                exports['mythic_notify']:DoHudText('success', 'You Prepared Chicken Legs!') 
                            elseif Config.CoreSettings.Notify.Type == 'boii' then
                                exports['boii_ui']:notify('Prepared Item', 'You Prepared Chicken Legs', 'success', Config.CoreSettings.Notify.Length.Success)
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


------------------------------------------------------------< CHICKEN PARTS END >-----------------------------------






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
    exports['qb-target']:RemoveZone("LoadTruck")
end)