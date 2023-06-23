Config = {}


Config.DebugPoly = true
Config.PrintDebugInformation = true
Config.UseToggleDutyCommand = true -- used for debugging only as allows you to toggle duty anywhere



Config.CoreSettings = {
    Job = {
        Name = 'butcher', -- name of job in core/shared/jobs.lua
    },
    EventNames = {        
        BossMenu = 'qb-bossmenu:client:OpenMenu', -- NAME OF BOSS MENU EVENT TO OPEN MANAGEMENT MENU
        Clothing = 'qb-clothing:client:openOutfitMenu', -- clothing menu event to open outfit locker
    },
    Target = {
        Type = 'qb', -- target script name support for qb-target and ox_target 
        --EDIT TARGETS.LUA TO ADD YOUR OWN CUSTOM TARGET SCRIPT        
        --use 'qb' for qb-target
        --use 'ox' for ox_target
        --use 'custom' for custom target 
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, mythic_notify and boii_ui notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'boii' for boii_ui notify
        Sound = true, -- use sound for OKOK notifications ONLY
        Length = {
            Success = 5000,
            Error = 5000,
        },
    },    
    Menu = {
        Type = 'ox', -- menu script name, support for qb-menu, jixel-menu, boii_ui menu and ox_lib context menu
        --EDIT MENUS.LUA TO ADD YOUR OWN CUSTOM MENU SCRIPT 
        --use 'qb' for qb-menu
        --use 'jixel' for jixel-menu
        --use 'boii' for boii_ui-menu
        --use 'ox' for ox_lib context menu
        --use 'custom' for your own custom menu
    },
    ProgressBar = {
        Times = {
            TimeToPickChicken = 5000, -- time it takes to pick a chicken
            TimeToPluckChicken = 5000, -- time it takes to pluck a chicken
            TimeToProcessChicken = 5000, -- time it takes to process a chicken and process into packs also
            TimeToPackChicken = 5000, -- time it takes to pack chicken products
            TimeToSellChicken = 5000, -- time it takes to sell chicken
        },
    },
}




Config.InteractionLocations = {
    JobAreas = {
        Duty = {
            Location = {
                Location = vector3(-69.81, 6256.49, 31.09),
                Width = 2.0,
                Height = 1.0,
                Heading = 30.94,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Toggle Duty',
                Size = vec3(2.0,1.0,1), -- only used for ox_target
            },
        },
        BossMenu = {
            Location = {
                Location = vector3(-67.34, 6253.57, 31.09),
                Width = 2.0,
                Height = 1.0,
                Heading = 214.1,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Open Management Menu',
                Size = vec3(2.0,1.0,1), -- only used for ox_target
            },
        },
        ClothingLockers = {
            Location = {
                Location = vector3(-75.64, 6250.66, 31.09),
                Width = 5.0,
                Height = 1.0,
                Heading = 120.14,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Change Clothing',
                Size = vec3(5.0,1.0,1), -- only used for ox_target
            },
        },
    },
    Preparation = {
        PickChicken = {
            Location = {
                Location = vector3(-66.2, 6247.98, 31.33),
                Width = 1.5,
                Height = 1.5,
                Heading = 300.27,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Pick Fresh Chicken',
                Size = vec3(1.5,1.5,1), -- only used for ox_target
            },
        },
        PluckChicken = {
            Location = {
                Location = vector3(-89.33, 6234.58, 31.33),
                Width = 3.0,
                Height = 1.5,
                Heading = 120,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Pluck Fresh Chicken',
                Size = vec3(3.0,1.5,1), -- only used for ox_target
            },
        },
        PrepareChicken = {
            Location = {
                Location = vector3(-79.03, 6228.83, 31.08),
                Width = 2.5,
                Height = 2.0,
                Heading = 123.13,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Process Plucked Chicken',
                Size = vec3(2.5,2.0,1), -- only used for ox_target
            },
        },
        ProcessChicken = {
            Location = {
                Location = vector3(-99.79, 6210.99, 31.03),
                Width = 2.5,
                Height = 2.0,
                Heading = 43.63,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Prepare Processed Chicken',
                Size = vec3(2.5,2.0,1), -- only used for ox_target
            },
        },
        PackChicken = {
            Location = {
                Location = vector3(-103.98, 6206.8, 31.03),
                Width = 2.5,
                Height = 2.0,
                Heading = 43.63,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Pack Fresh Chicken Products',
                Size = vec3(2.5,2.0,1), -- only used for ox_target
            },
        },
        SellChicken = {
            Location = {
                Location = vector3(-111.57, 6195.84, 31.03),
                Width = 4.0,
                Height = 1.5,
                Heading = 136.02,
                MinZ = 30,
                MaxZ = 34,
                Icon = '',
                Label = 'Sell Fresh Chicken Products',
                Size = vec3(4.0,1.5,4), -- only used for ox_target
            },
        },
    },


}


Config.MiniGameSettings = {
    Type = 'progressbar', -- type of minigame
    --use 'progressbar' for default progressbar
    --use 'skillbar' for default qb-skillbar
    --use 'ps-ui' for ps-ui skillcircle
    -- use 'boii' for boii_ui keydrop

    SkillBarSettings = {
        Duration = math.random(2500,5000), -- duration of skillbar
        Position = math.random(10,30), -- position of skillbar to press E
        Width = math.random(20,30), -- width of skillbar to press E
    },

    SkillCircleSettings = {
        Circles = 3, -- number of circles required to pass
        MS = 20, -- length of time in MS to passs skill circle
    },

    KeyDropSettings = {
        ScoreLimit = 5, --the amount of correct keypresses for success
        MissLimit = 2, --the amount of incorrect keypresses for failure
        FallDelay = 3000, --amount of time taken for letters to fall in ms
        NewLetterDelay = 2000, --amount of time take for a new letter to begin to fall
    },
}



Config.ItemPrices = {

    CashSymbol = '£', -- cash symbol used   
    

    PaymentAccounts = {
        PaymentType = 'society', -- set to 'personal' to pay the player money or set to 'society' to pay the job society money when selling items
        AccountUsedToSell = 'cash', -- if set to 'personal' use either 'cash' or 'bank'
    },


    SellItems = {
        ["chickenbreast"] =  7, -- price of EACH item
        ["chickenthighs"] =  5, -- price of EACH item
        ["chickenwings"] =  3, -- price of EACH item
        ["chickendrumsticks"] =  5, -- price of EACH item
        ["chickenlegs"] =  5, -- price of EACH item
        ["chickenbreastpack"] =  14, -- price of EACH item
        ["chickenthighspack"] =  10, -- price of EACH item
        ["chickenwingspack"] =  8, -- price of EACH item
        ["chickendrumstickspack"] =  10, -- price of EACH item
        ["chickenlegspack"] =  10, -- price of EACH item
    },
}


Config.Animations = {
    PickChicken = {
        dict = "amb@prop_human_parking_meter@female@base",
        anim = "base_female",
    },
    PluckChicken = {
        dict = "amb@prop_human_parking_meter@female@base",
        anim = "base_female",
    },
    ProcessChicken = {
        dict = "amb@prop_human_parking_meter@female@base",
        anim = "base_female",
    },
    PackChicken = {
        dict = "amb@prop_human_parking_meter@female@base",
        anim = "base_female",
    },
    SellChicken = {
        dict = "amb@prop_human_parking_meter@female@base",
        anim = "base_female",
    },
}