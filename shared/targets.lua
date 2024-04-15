local TargetType = Config.CoreSettings.Target.Type

if TargetType == 'qb' then
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
                
                event = 'lusty94_butcher:client:changeClothes',
                label = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Label,
                icon = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Icon,
                job = Config.CoreSettings.Job.Name
            }
        },
        distance = 2.5,
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
                job = Config.CoreSettings.Job.Name
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
                job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    --Prepare chicken
    exports['qb-target']:AddBoxZone("PrepareChicken", Config.InteractionLocations.Preparation.PrepareChicken.Location.Location, Config.InteractionLocations.Preparation.PrepareChicken.Location.Height, Config.InteractionLocations.Preparation.PrepareChicken.Location.Width, {
        name = "PrepareChicken",
        heading = Config.InteractionLocations.Preparation.PrepareChicken.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Preparation.PrepareChicken.Location.MinZ,
        maxZ = Config.InteractionLocations.Preparation.PrepareChicken.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:ProcessChicken",
                label = Config.InteractionLocations.Preparation.PrepareChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PrepareChicken.Location.Icon,
                job = Config.CoreSettings.Job.Name
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
                
                event = "lusty94_butcher:client:ProcessChickenMenu",
                label = Config.InteractionLocations.Preparation.ProcessChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.ProcessChicken.Location.Icon,
                job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
    --pack chicken menu
    exports['qb-target']:AddBoxZone("PackChicken", Config.InteractionLocations.Preparation.PackChicken.Location.Location, Config.InteractionLocations.Preparation.PackChicken.Location.Height, Config.InteractionLocations.Preparation.PackChicken.Location.Width, {
        name = "PackChicken",
        heading = Config.InteractionLocations.Preparation.PackChicken.Location.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Preparation.PackChicken.Location.MinZ,
        maxZ = Config.InteractionLocations.Preparation.PackChicken.Location.MaxZ,
    }, {
        options = {
            {
                
                event = "lusty94_butcher:client:PackChickenMenu",
                label = Config.InteractionLocations.Preparation.PackChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PackChicken.Location.Icon,
                job = Config.CoreSettings.Job.Name
            }
        },
        distance = 1.5,
    })
elseif TargetType == 'ox' then
    --toggle duty
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.JobAreas.Duty.Location.Location,
        size = Config.InteractionLocations.JobAreas.Duty.Location.Size,
        rotation = Config.InteractionLocations.JobAreas.Duty.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 1,
                name = 'ToggleDuty',
                event = 'lusty94_butcher:client:ToggleDuty',
                label = Config.InteractionLocations.JobAreas.Duty.Location.Label,
                icon = Config.InteractionLocations.JobAreas.Duty.Location.Icon,
                groups = Config.CoreSettings.Job.Name,
            }
        }
    })
    --clothing locker
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Location,
        size = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Size,
        rotation = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 2,
                name = 'ClothingLockers',
                event = 'lusty94_butcher:client:changeClothes',
                label = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Label,
                icon = Config.InteractionLocations.JobAreas.ClothingLockers.Location.Icon,
                groups = Config.CoreSettings.Job.Name,
            }
        }
    })
    --pick chicken
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Preparation.PickChicken.Location.Location,
        size = Config.InteractionLocations.Preparation.PickChicken.Location.Size,
        rotation = Config.InteractionLocations.Preparation.PickChicken.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 3,
                name = 'PickChicken',
                event = 'lusty94_butcher:client:PickChicken',
                label = Config.InteractionLocations.Preparation.PickChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PickChicken.Location.Icon,
                groups = Config.CoreSettings.Job.Name,
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
                id = 4,
                name = 'PluckChicken',
                event = 'lusty94_butcher:client:PluckChicken',
                label = Config.InteractionLocations.Preparation.PluckChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PluckChicken.Location.Icon,
                groups = Config.CoreSettings.Job.Name,
            }
        }
    })
    --Prepare chicken
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Preparation.PrepareChicken.Location.Location,
        size = Config.InteractionLocations.Preparation.PrepareChicken.Location.Size,
        rotation = Config.InteractionLocations.Preparation.PrepareChicken.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 5,
                name = 'PrepareChicken',
                event = 'lusty94_butcher:client:ProcessChicken',
                label = Config.InteractionLocations.Preparation.PrepareChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PrepareChicken.Location.Icon,
                groups = Config.CoreSettings.Job.Name,
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
                id = 6,
                name = 'ProcessChicken',
                event = 'lusty94_butcher:client:ProcessChickenMenu',
                label = Config.InteractionLocations.Preparation.ProcessChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.ProcessChicken.Location.Icon,
                groups = Config.CoreSettings.Job.Name,
            }
        }
    })
    --Pack chicken menu
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Preparation.PackChicken.Location.Location,
        size = Config.InteractionLocations.Preparation.PackChicken.Location.Size,
        rotation = Config.InteractionLocations.Preparation.PackChicken.Location.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 7,
                name = 'PackChicken',
                event = 'lusty94_butcher:client:PackChickenMenu',
                label = Config.InteractionLocations.Preparation.PackChicken.Location.Label,
                icon = Config.InteractionLocations.Preparation.PackChicken.Location.Icon,
                groups = Config.CoreSettings.Job.Name,
            }
        }
    })
elseif TargetType == 'custom' then
    --insert your custom target code here
end