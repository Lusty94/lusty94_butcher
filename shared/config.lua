Config = {}

--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


--Thank you for downloading this script!

--Below you can change multiple options to suit your server needs.


Config.DebugPoly = false -- displays polyzone locations


--Blip Settings
Config.Blips = {
    {title = 'Cluckin Bell Butchers', colour = 5, id = 310, coords = vector3(-73.59, 6267.08, 31.32), scale = 0.7, useblip = true}, -- BLIP FOR CHICKEN FACTORY
}

Config.CoreSettings = {
    Job = {
        Name = 'butcher', -- name of job in core/shared/jobs.lua
    },
    Target = {
        Type = 'qb', -- target script name support for qb-target and ox_target 
        --EDIT TARGETS.LUA TO ADD YOUR OWN CUSTOM TARGET SCRIPT        
        --use 'qb' for qb-target
        --use 'ox' for ox_target
        --use 'custom' for custom target 
    },
    Inventory = {
        Type = 'qb', -- support for qb-inventory and ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, mythic_notify, boii_ui notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'boii' for boii_ui notify
        --use 'ox' for ox_lib notify
    }, 
    Clothing = {
        Type = 'qb' -- clothing type, support for qb-clothing and illenium-appearance
        --use 'qb' for qb-clothing
        --use 'illenium' for illenium-appearance
        --use 'custom' for your own clothing script - edit the following event: 'lusty94_butcher:client:changeClothes' and add your own methods
    }, 
    Timers = {
        Pick = 5000, -- time to pick chicken
        Pluck = 10000, -- time to pluck chicken
        Process = 10000, -- time to process chicken
        Pack = 10000, -- time to pack chicken
    },
}


Config.InteractionLocations = {
    --name must be unique, size is for ox_target only, job must match job in core and in Cofig.CoreSettings.Job.Name
    JobAreas = {
        { name = 'butcherduty',                 coords = vector3(-70.16, 6256.38, 31.2),    size =  vec3(0.5,0.5,0.5), width = 0.5, height = 0.5, heading = 31.0,   minz = 31.0, maxz = 31.5, icon = 'fa-solid fa-clipboard',           label = 'Toggle Duty',               event = 'lusty94_butcher:client:ToggleDuty',           job = 'butcher', distance = 1.5, },
        { name = 'butcherclothing',             coords = vector3(-75.64, 6250.66, 31.09),   size =  vec3(5.0,1.0,2.0), width = 1.0, height = 5.0, heading = 120.14, minz = 30.0, maxz = 32.0, icon = 'fa-solid fa-shirt',               label = 'Change Clothing',           event = 'lusty94_butcher:client:changeClothes',        job = 'butcher', distance = 1.5, },
        { name = 'butcherpickchicken',          coords = vector3(-69.06, 6249.45, 30.92),   size =  vec3(2.0,2.0,2.0), width = 2.0, height = 2.0, heading = 300.27, minz = 30.0, maxz = 32.0, icon = 'fa-solid fa-hand-point-up',       label = 'Pick Fresh Chicken',        event = 'lusty94_butcher:client:PickChicken',          job = 'butcher', distance = 1.5, },
        { name = 'butcherpluckchicken',         coords = vector3(-89.33, 6234.58, 31.33),   size =  vec3(3.0,1.5,1.0), width = 1.5, height = 3.0, heading = 120.0,  minz = 30.0, maxz = 32.0, icon = 'fa-solid fa-hand-point-up',       label = 'Pluck Fresh Chicken',       event = 'lusty94_butcher:client:PluckChicken',         job = 'butcher', distance = 1.5, },
        { name = 'butcherpreparechicken',       coords = vector3(-79.03, 6228.83, 31.08),   size =  vec3(2.5,2.0,1.0), width = 2.5, height = 2.0, heading = 123.13, minz = 30.0, maxz = 32.0, icon = 'fa-solid fa-hand-point-up',       label = 'Process Plucked Chicken',   event = 'lusty94_butcher:client:ProcessChicken',       job = 'butcher', distance = 1.5, },
        { name = 'butcherprocesschicken',       coords = vector3(-99.79, 6210.99, 31.03),   size =  vec3(2.5,2.0,1.0), width = 2.5, height = 2.0, heading = 43.63,  minz = 30.0, maxz = 32.0, icon = 'fa-solid fa-hand-point-up',       label = 'Prepare Processed Chicken', event = 'lusty94_butcher:client:ProcessChickenMenu',   job = 'butcher', distance = 1.5, },
        { name = 'butcherpackchicken',          coords = vector3(-103.98, 6206.8, 31.03),   size =  vec3(2.5,2.0,1.0), width = 2.5, height = 2.0, heading = 43.63,  minz = 30.0, maxz = 32.0, icon = 'fa-solid fa-hand-point-up',       label = 'Pack Chicken Products',     event = 'lusty94_butcher:client:PackChickenMenu',      job = 'butcher', distance = 1.5, },
    },
}



Config.Selling = {
    CashSymbol = '£', -- cash symbol used in your server
    Location = vector4(-111.69, 6195.82, 30.03, 310.19), -- location to spawn factory worker ped 
    PedModel =  's_m_y_factory_01', -- name of ped model
    Items = { -- price is sell price for EACH UNIT of that particular item
        ChickenBreast =      { Price = 14,},
        ChickenThighs =      { Price = 10,},
        ChickenWings =       { Price = 8,},
        ChickenDrumsticks =  { Price = 8,},
        ChickenLegs =        { Price = 5,},
    },
}


Config.Animations = {
    PickChicken = {
        dict = "mini@repair",
        anim = "fixing_a_player",
    },
    PluckChicken = {
        dict = "mini@repair",
        anim = "fixing_a_player",
    },
    ProcessChicken = {
        dict = "amb@prop_human_bbq@male@idle_a",
        anim = "idle_b",
    },
    PackChicken = {
        dict = "mini@repair",
        anim = "fixing_a_player",
    },
}