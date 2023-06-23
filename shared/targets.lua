local QBCore = exports['qb-core']:GetCoreObject()


if Config.CoreSettings.Target.Type == 'qb' then
    --toggle duty
    exports['qb-target']:AddBoxZone("ToggleDuty", Config.InteractionLocations.JobAreas.Duty.Location.Location, Config.InteractionLocations.JobAreas.Duty.Location.Height, Config.InteractionLocations.JobAreas.Duty.Location.Width, {
        name = "ToggleDuty",
        heading = Config.InteractionLocations.JobAreas.Duty.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.JobAreas.Duty.Location.MinZ,
        maxZ = Config.InteractionLocations.JobAreas.Duty.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:ToggleDuty",
                label = Config.InteractionLocations.JobAreas.Duty.Location.Label,
                icon = Config.InteractionLocations.JobAreas.Duty.Location.Icon,
                --job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    
    --bossmenu
    exports['qb-target']:AddBoxZone("BossMenu", Config.InteractionLocations.JobAreas.BossMenu.Location.Location, Config.InteractionLocations.JobAreas.BossMenu.Location.Height, Config.InteractionLocations.JobAreas.BossMenu.Location.Width, {
        name = "BossMenu",
        heading = Config.InteractionLocations.JobAreas.BossMenu.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.JobAreas.BossMenu.Location.MinZ,
        maxZ = Config.InteractionLocations.JobAreas.BossMenu.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:OpenManagementMenu",
                label = Config.InteractionLocations.JobAreas.BossMenu.Location.Label,
                icon = Config.InteractionLocations.JobAreas.BossMenu.Location.Icon,
                job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    --clothing locker
    exports['qb-target']:AddBoxZone("ClothingLocker", Config.InteractionLocations.JobAreas.ClothingLockers.Location.Location, Config.InteractionLocations.JobAreas.ClothingLockers.Location.Height, Config.InteractionLocations.JobAreas.ClothingLockers.Location.Width, {
        name = "ClothingLocker",
        heading = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.JobAreas.ClothingLockers.Location.MinZ,
        maxZ = Config.InteractionLocations.JobAreas.ClothingLockers.Location.MaxZ,
    }, {
        options = {
            {
                
                event = Config.CoreSettings.EventNames.Clothing,
                label = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Label,
                icon = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Icon,
                --job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    --pick chicken
    exports['qb-target']:AddBoxZone("PickChicken", Config.InteractionLocations.Preparation.PickChicken.Location.Location, Config.InteractionLocations.Preparation.PickChicken.Location.Height, Config.InteractionLocations.Preparation.PickChicken.Location.Width, {
        name = "PickChicken",
        heading = Config.InteractionLocations.Preparation.PickChicken.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Preparation.PickChicken.Location.MinZ,
        maxZ = Config.InteractionLocations.Preparation.PickChicken.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:PickChicken",
                label = Config.InteractionLocations.Preparation.PickChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PickChicken.Location.Icon,
                --job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    --pluck chicken
    exports['qb-target']:AddBoxZone("PluckChicken", Config.InteractionLocations.Preparation.PluckChicken.Location.Location, Config.InteractionLocations.Preparation.PluckChicken.Location.Height, Config.InteractionLocations.Preparation.PluckChicken.Location.Width, {
        name = "PluckChicken",
        heading = Config.InteractionLocations.Preparation.PluckChicken.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Preparation.PluckChicken.Location.MinZ,
        maxZ = Config.InteractionLocations.Preparation.PluckChicken.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:PluckChicken",
                label = Config.InteractionLocations.Preparation.PluckChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PluckChicken.Location.Icon,
                --job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    --process chicken
    exports['qb-target']:AddBoxZone("ProcessChicken", Config.InteractionLocations.Preparation.ProcessChicken.Location.Location, Config.InteractionLocations.Preparation.ProcessChicken.Location.Height, Config.InteractionLocations.Preparation.ProcessChicken.Location.Width, {
        name = "ProcessChicken",
        heading = Config.InteractionLocations.Preparation.ProcessChicken.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Preparation.ProcessChicken.Location.MinZ,
        maxZ = Config.InteractionLocations.Preparation.ProcessChicken.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:ProcessChicken",
                label = Config.InteractionLocations.Preparation.ProcessChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.ProcessChicken.Location.Icon,
                --job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    --pack chicken
    exports['qb-target']:AddBoxZone("PackChicken", Config.InteractionLocations.Preparation.PackChicken.Location.Location, Config.InteractionLocations.Preparation.PackChicken.Location.Height, Config.InteractionLocations.Preparation.PackChicken.Location.Width, {
        name = "PackChicken",
        heading = Config.InteractionLocations.Preparation.PackChicken.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Preparation.PackChicken.Location.MinZ,
        maxZ = Config.InteractionLocations.Preparation.PackChicken.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:PackChicken",
                label = Config.InteractionLocations.Preparation.PackChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PackChicken.Location.Icon,
                --job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    --load delivery truck
    exports['qb-target']:AddBoxZone("LoadTruck", Config.InteractionLocations.Preparation.LoadChicken.Location.Location, Config.InteractionLocations.Preparation.LoadChicken.Location.Height, Config.InteractionLocations.Preparation.LoadChicken.Location.Width, {
        name = "LoadTruck",
        heading = Config.InteractionLocations.Preparation.LoadChicken.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Preparation.LoadChicken.Location.MinZ,
        maxZ = Config.InteractionLocations.Preparation.LoadChicken.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:LoadChicken",
                label = Config.InteractionLocations.Preparation.LoadChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.LoadChicken.Location.Icon,
                --job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
elseif Config.CoreSettings.Target.Type == 'ox' then
    --pick chicken
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Preparation.PickChicken.Location.Location,
        size = Config.InteractionLocations.Preparation.PickChicken.Location.Size,
        rotation = Config.InteractionLocations.Preparation.PickChicken.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'StrawberryRuntzZone',
                event = 'lusty94_butcher:client:PickChicken',
                label = Config.InteractionLocations.Preparation.PickChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PickChicken.Location.Icon,
            }
        }
    })
    --pluck chicken
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Preparation.PluckChicken.Location.Location,
        size = Config.InteractionLocations.Preparation.PluckChicken.Location.Size,
        rotation = Config.InteractionLocations.Preparation.PluckChicken.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'StrawberryRuntzZone',
                event = 'lusty94_butcher:client:PluckChicken',
                label = Config.InteractionLocations.Preparation.PluckChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PluckChicken.Location.Icon,
            }
        }
    })
    --Process chicken
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Preparation.ProcessChicken.Location.Location,
        size = Config.InteractionLocations.Preparation.ProcessChicken.Location.Size,
        rotation = Config.InteractionLocations.Preparation.ProcessChicken.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'StrawberryRuntzZone',
                event = 'lusty94_butcher:client:ProcessChicken',
                label = Config.InteractionLocations.Preparation.ProcessChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.ProcessChicken.Location.Icon,
            }
        }
    })
    --Pack chicken
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Preparation.PackChicken.Location.Location,
        size = Config.InteractionLocations.Preparation.PackChicken.Location.Size,
        rotation = Config.InteractionLocations.Preparation.PackChicken.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'StrawberryRuntzZone',
                event = 'lusty94_butcher:client:PackChicken',
                label = Config.InteractionLocations.Preparation.PackChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PackChicken.Location.Icon,
            }
        }
    })
    --load delivery truck
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Preparation.LoadChicken.Location.Location,
        size = Config.InteractionLocations.Preparation.LoadChicken.Location.Size,
        rotation = Config.InteractionLocations.Preparation.LoadChicken.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'StrawberryRuntzZone',
                event = 'lusty94_butcher:client:LoadChicken',
                label = Config.InteractionLocations.Preparation.LoadChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.LoadChicken.Location.Icon,
            }
        }
    })
elseif Config.CoreSettings.Target.Type == 'custom' then
    --insert your custom target code here
end