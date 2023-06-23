Config = {}


Config.DebugPoly = true
Config.PrintDebugInformation = true



Config.CoreSettings = {
    Job = {
        Name = 'butcher', -- name of job in core/shared/jobs.lua
    },
    EventNames = {        
        BossMenu = 'qb-bossmenu:client:OpenMenu', -- NAME OF BOSS MENU EVENT TO OPEN MANAGEMENT MENU
        Fuel = 'LegacyFuel', -- NAME OF HUD EVENT TO RELIEVE STRESS
        Keys = 'vehiclekeys:client:SetOwner', -- NAME OF HUD EVENT TO RELIEVE STRESS
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
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify and boii_ui notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'boii' for boii_ui notify
        Sound = true, -- use sound for OKOK notifications ONLY
        Length = {
            Success = 5000,
            Error = 5000,
        },
    },    
    Menu = {
        Type = 'qb', -- menu script name, support for qb-menu, jixel-menu, boii_ui menu and ox_lib context menu
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
            TimeToProcessChicken = 5000, -- time it takes to process a chicken
            TimeToPackChicken = 5000, -- time it takes to pack a chicken
            TimeToLoadTruck = 5000, -- time it takes to load delivery truck
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
                Size = vec3(1.5,1.5,1), -- only used for ox_target
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
                Size = vec3(1.5,1.5,1), -- only used for ox_target
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
                Size = vec3(1.5,1.5,1), -- only used for ox_target
            },
            Clothing = {
                ['male'] = {
                    outfitData ={
                        ['t-shirt'] = {item = 15, texture = 0},
                        ['torso2'] = {item = 345, texture = 0},
                        ['arms'] = {item = 19, texture = 0},
                        ['pants'] = {item = 3, texture = 7},
                        ['shoes'] = {item = 1, texture = 0},
                    }
                },
                ['female'] = {
                    outfitData ={
                        ['t-shirt'] = {item = 14, texture = 0},
                        ['torso2'] = {item = 370, texture = 0},
                        ['arms'] = {item = 0, texture = 0},
                        ['pants'] = {item = 0, texture = 12},
                        ['shoes'] = {item = 1, texture = 0},
                    }
                },
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
                Label = 'Pluck Chicken',
                Size = vec3(1.5,1.5,1), -- only used for ox_target
            },
        },
        ProcessChicken = {
            Location = {
                Location = vector3(-78.83, 6228.78, 31.33),
                Width = 2.5,
                Height = 2.0,
                Heading = 123.13,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Process Chicken',
                Size = vec3(1.5,1.5,1), -- only used for ox_target
            },
        },
        PackChicken = {
            Location = {
                Location = vector3(-102.0, 6208.79, 31.33),
                Width = 5.0,
                Height = 1.5,
                Heading = 43.63,
                MinZ = 30,
                MaxZ = 32,
                Icon = '',
                Label = 'Pack Chicken',
                Size = vec3(1.5,1.5,1), -- only used for ox_target
            },
        },
        LoadChicken = {
            Location = {
                Location = vector3(-173.7, 6175.17, 31.27),
                Width = 5.0,
                Height = 1.5,
                Heading = 43.63,
                MinZ = 30,
                MaxZ = 34,
                Icon = '',
                Label = 'Load Delivery Truck',
                Size = vec3(1.5,1.5,1), -- only used for ox_target
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
        PaymentType = 'personal', -- set to 'personal' to pay the player money or set to 'society' to pay the job society money when selling items
        AccountUsedToSell = 'bank', -- if set to 'personal' use either 'cash' or 'bank'
    },

    SellItems = {
        ["chickenbreast"] =  7, -- price of EACH fish
        ["chickenthighs"] =  5, -- price of EACH fish
        ["chickenwings"] =  3, -- price of EACH fish
        ["chickendrumsticks"] =  5, -- price of EACH fish
        ["chickenlegs"] =  5, -- price of EACH fish
        ["chickenbreastpack"] =  5, -- price of EACH fish
        ["chickenthighpack"] =  5, -- price of EACH fish
        ["chickenwingpack"] =  5, -- price of EACH fish
        ["chickendrumstickpack"] =  5, -- price of EACH fish
        ["chickenlegspack"] =  5, -- price of EACH fish
    },
}


Config.Animations = {
    PickChicken = {
        dict = "amb@prop_human_parking_meter@female@base",
        anim = "base_female",
    },
    PluckChicken = {
        dict = "",
        anim = "",
    },
    ProcessChicken = {
        dict = "",
        anim = "",
    },
    PackChicken = {
        dict = "",
        anim = "",
    },
    LoadTruck = {
        dict = "",
        anim = "",
    },
}