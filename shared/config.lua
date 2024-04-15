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
        Sound = true, -- use sound for OKOK notifications ONLY
        Length = { Success = 5000, Error = 5000, },
    }, 
    Clothing = {
        Type = 'qb' -- clothing type, support for qb-clothing and illenium-appearance
        --use 'qb' for qb-clothing
        --use 'illenium' for illenium-appearance
        --use 'custom' for your own clothing script - edit the following event: 'lusty94_butcher:client:changeClothes' and add your own methods
    }, 
    Menu = {
        Type = 'qb', -- menu script name, support for qb-menu, jixel-menu and ox_lib context menu
        --EDIT MENUS.LUA TO ADD YOUR OWN CUSTOM MENU SCRIPT 
        --use 'qb' for qb-menu
        --use 'jixel' for jixel-menu
        --use 'ox' for ox_lib context menu
        --use 'custom' for your own custom menu
    },
    Timers = {
        Pick = 3000, -- time to pick chicken
        Pluck = 3000, -- time to pluck chicken
        Process = 3000, -- time to process chicken
        Pack = 3000, -- time to pack chicken
    },
}




Config.InteractionLocations = {
    JobAreas = {
        Duty = {            Location = { Location = vector3(-70.16, 6256.38, 31.2),     Width = 0.5, Height = 0.5, Heading = 30.94,     MinZ = 31, MaxZ = 31.5, Icon = 'fa-solid fa-clipboard',       Label = 'Toggle Duty',     Size = vec3(0.5,0.5,0.5), }, },
        ClothingLockers = { Location = { Location = vector3(-75.64, 6250.66, 31.09),    Width = 5.0, Height = 1.0, Heading = 120.14,    MinZ = 30, MaxZ = 32,   Icon = 'fa-solid fa-shirt',           Label = 'Change Clothing', Size = vec3(5.0,1.0,2), }, },
    },
    Preparation = {
        PickChicken = {     Location = { Location = vector3(-69.06, 6249.45, 30.92),    Width = 2.0, Height = 2.0, Heading = 300.27,    MinZ = 30, MaxZ = 32,   Icon = 'fa-solid fa-hand-point-up',   Label = 'Pick Fresh Chicken',           Size = vec3(2,2,2), }, },
        PluckChicken = {    Location = { Location = vector3(-89.33, 6234.58, 31.33),    Width = 3.0, Height = 1.5, Heading = 120,       MinZ = 30, MaxZ = 32,   Icon = 'fa-solid fa-hand',            Label = 'Pluck Fresh Chicken',          Size = vec3(3.0,1.5,1), }, },
        PrepareChicken = {  Location = { Location = vector3(-79.03, 6228.83, 31.08),    Width = 2.5, Height = 2.0, Heading = 123.13,    MinZ = 30, MaxZ = 32,   Icon = 'fa-solid fa-hand',            Label = 'Process Plucked Chicken',      Size = vec3(2.5,2.0,1), }, },
        ProcessChicken = {  Location = { Location = vector3(-99.79, 6210.99, 31.03),    Width = 2.5, Height = 2.0, Heading = 43.63,     MinZ = 30, MaxZ = 32,   Icon = 'fa-solid fa-hand',            Label = 'Prepare Processed Chicken',    Size = vec3(2.5,2.0,1), }, },
        PackChicken = {     Location = { Location = vector3(-103.98, 6206.8, 31.03),    Width = 2.5, Height = 2.0, Heading = 43.63,     MinZ = 30, MaxZ = 32,   Icon = 'fa-solid fa-box',             Label = 'Pack Fresh Chicken Products',  Size = vec3(2.5,2.0,1), }, },
    },
}





Config.Selling = {
    CashSymbol = '£', -- cash symbol used in your server
    Location = vector4(-111.69, 6195.82, 30.03, 310.19), -- location to spawn factory worker ped 
    PedModel =  's_m_y_factory_01', -- name of ped model
    Items = { -- price is sell price for EACH UNIT of that particular item - requiredItemName is the item name in your items.lua
        ChickenBreast =      { Price = 14,    RequiredItemName = 'chickenbreastpack', },
        ChickenThighs =      { Price = 10,    RequiredItemName = 'chickenthighspack', },
        ChickenWings =       { Price = 8,     RequiredItemName = 'chickenwingspack', },
        ChickenDrumsticks =  { Price = 8,     RequiredItemName = 'chickendrumstickspack', },
        ChickenLegs =        { Price = 5,     RequiredItemName = 'chickenlegspack', },
    },
}


Config.Animations = {
    PickChicken = {     dict = "mini@repair", anim = "fixing_a_player", flag = 11, },
    PluckChicken = {    dict = "mini@repair", anim = "fixing_a_player", flag = 11,  },
    ProcessChicken = {  dict = "amb@prop_human_bbq@male@idle_a", anim = "idle_b", flag = 41,  },
    PackChicken = {     dict = "mini@repair", anim = "fixing_a_player", flag = 11,  },
}