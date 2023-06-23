local QBCore = exports['qb-core']:GetCoreObject()


----------------------------------------------------------------< PROCESS CHICKEN MENU START >---------------------------------------------------

local ProcessChickenMenu = {
    main_header = { -- Main menu header
        text = 'Process Fresh Chicken! <br><u>Don\'t Forget A Butcher Knife</u>', -- Header text
        icon = '<i class="fa-solid fa-box"></i>' -- Icon to display next to header text. Remove this to use no icon
    },
    menu_options = {
        {
            header = 'Get Butchers Knife', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Get A Sharp Butchers Knife",
            action_type = 'server_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:server:GiveButcherKnife',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Process Chicken Breast', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Process Fresh Chicken Breast",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:ProcessChickenBreast',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Process Chicken Thighs', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Process Fresh Chicken Thighs",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:ProcessChickenThighs',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Process Chicken Wings', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Process Fresh Chicken Wings",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:ProcessChickenWings',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Process Chicken Drumsticks', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Process Fresh Chicken Drumsticks",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:ProcessChickenDrumSticks',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Process Chicken Legs', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Process Fresh Chicken Legs",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:ProcessChickenLegs',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
    },
    menu_buttons = { -- Menu buttons mostly pointless since they work the same as any other options mainly just allows for more customisation over menu templates
        close = {
            use = true, -- Toggle the close button
            --action_type = '', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            --action = '', -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
        }
    },
}

lib.registerContext({
    id = 'ProcessChickenMenu',
    title = 'Process Fresh Chicken! Don\'t Forget A Butcher Knife',
    options = {
      {
        title = 'Get A Butchers Knife',
        description = 'Get A Sharp Butchers Knife',
        icon = 'box',
        onSelect = function()
            TriggerServerEvent('lusty94_butcher:server:GiveButcherKnife')
        end,
        arrow = true,
      },
      {
        title = 'Process Chicken Breast',
        description = 'Process Fresh Chicken Breast',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenBreast',
        arrow = true,
      },
      {
        title = 'Process Chicken Thighs',
        description = 'Process Fresh Chicken Thighs',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenThighs',
        arrow = true,
      },
      {
        title = 'Process Chicken Wings',
        description = 'Process Fresh Chicken Wings',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenWings',
        arrow = true,
      },
      {
        title = 'Process Chicken Drumsticks',
        description = 'Process Fresh Chicken Drumsticks',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenDrumSticks',
        arrow = true,
      },
      
      {
        title = 'Process Chicken Legs',
        description = 'Process Fresh Chicken Legs',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenLegs',
        arrow = true,
      },
      
    }
})


RegisterNetEvent('lusty94_butcher:client:ProcessChickenMenu', function()
    if Config.CoreSettings.Menu.Type == 'qb' then
        exports['qb-menu']:openMenu({
            {
                header = "Process Fresh Chicken <br> Don\'t Forget A Butcher Knife",
                isMenuHeader = true,
            },  
            {   
                header = "Get A Butchers Knife",
                txt = "Get A Sharp Butchers Knife",
                params = {
                    isServer = true,
                    event = "lusty94_butcher:server:GiveButcherKnife",
                }
            },          
            {   
                header = "Process Chicken Breast",
                txt = "Process Fresh Chicken Breast",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenBreast",
                }
            },          
            {   
                header = "Process Chicken Thighs",
                txt = "Process Fresh Chicken Thighs",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenThighs",
                }
            },          
            {   
                header = "Process Chicken Wings",
                txt = "Process Fresh Chicken Wings",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenWings",
                }
            },          
            {   
                header = "Process Chicken Drumsticks",
                txt = "Process Fresh Chicken Drumsticks",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenDrumSticks",
                }
            },          
            {   
                header = "Process Chicken Legs",
                txt = "Process Fresh Chicken Legs",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenLegs",
                }
            }, 
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'jixel' then
        exports['jixel-menu']:openMenu({
            {
                header = "Process Fresh Chicken <br> Don\'t Forget A Butcher Knife",
                isMenuHeader = true,
            }, 
            {   
                header = "Get A Butchers Knife",
                txt = "Get A Sharp Butchers Knife",
                params = {
                    isServer = true,
                    event = "lusty94_butcher:server:GiveButcherKnife",
                }
            },  
            {   
                header = "Process Chicken Breast",
                txt = "Process Fresh Chicken Breast",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenBreast",
                }
            },          
            {   
                header = "Process Chicken Thighs",
                txt = "Process Fresh Chicken Thighs",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenThighs",
                }
            },          
            {   
                header = "Process Chicken Wings",
                txt = "Process Fresh Chicken Wings",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenWings",
                }
            },          
            {   
                header = "Process Chicken Drumsticks",
                txt = "Process Fresh Chicken Drumsticks",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenDrumSticks",
                }
            },          
            {   
                header = "Process Chicken Legs",
                txt = "Process Fresh Chicken Legs",
                params = {
                    event = "lusty94_butcher:client:ProcessChickenLegs",
                }
            }, 
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'boii' then
        exports['boii_ui']:open_menu('default', ProcessChickenMenu)
    elseif Config.CoreSettings.Menu.Type == 'ox' then
        lib.showContext('ProcessChickenMenu')
    end
end)

----------------------------------------------------------------< PROCESS CHICKEN MENU END >---------------------------------------------------








----------------------------------------------------------------< PACK CHICKEN MENU START >---------------------------------------------------
local PackChickenMenu = {
    main_header = { -- Main menu header
        text = 'Pack Chicken Products Ready For Sale! <br> Don\'t Forget Packaging', -- Header text
        icon = '<i class="fa-solid fa-truck"></i>' -- Icon to display next to header text. Remove this to use no icon
    },
    menu_options = {
        {
            header = 'Get Food Packaging', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Get Clean Food Packaging For Use",
            action_type = 'server_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:GiveFoodPackaging',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Pack Chicken Breast', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Pack Fresh Chicken Breast Ready For Sale",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:PackChickenBreast',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Pack Chicken Thighs', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Pack Fresh Chicken Thighs Ready For Sale",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:PackChickenThighs',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Pack Chicken Wings', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Pack Fresh Chicken Wings Ready For Sale",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:PackChickenWings',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Pack Chicken Drumsticks', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Pack Fresh Chicken Drumsticks Ready For Sale",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:PackChickenDrumSticks',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Pack Chicken Legs', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-box"></i>', -- Menu header icon if using one this can be removed if not
            message = "Pack Fresh Chicken Legs Ready For Sale",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:PackChickenLegs',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
    },
    menu_buttons = { -- Menu buttons mostly pointless since they work the same as any other options mainly just allows for more customisation over menu templates
        close = {
            use = true, -- Toggle the close button
            --action_type = '', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            --action = '', -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
        }
    },
}

lib.registerContext({
    id = 'PackChickenMenu',
    title = 'Pack Chicken Products For Sale!  Don\'t Forget Packaging',
    options = {
      {
        title = 'Get Food Packaging',
        description = 'Get Clean Food Packaging For Use',
        icon = 'box',
        onSelect = function()
            TriggerServerEvent('lusty94_butcher:server:GiveFoodPackaging')
        end,
        arrow = true,
      },
      {
        title = 'Pack Chicken Breast',
        description = 'Pack Fresh Chicken Breast Ready For Sale',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenBreast',
        arrow = true,
      },
      {
        title = 'Pack Chicken Thighs',
        description = 'Pack Fresh Chicken Thighs Ready For Sale',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenThighs',
        arrow = true,
      },
      {
        title = 'Pack Chicken Wings',
        description = 'Pack Fresh Chicken Wings Ready For Sale',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenWings',
        arrow = true,
      },
      {
        title = 'Pack Chicken Drumsticks',
        description = 'Pack Fresh Chicken Drumsticks Ready For Sale',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenDrumSticks',
        arrow = true,
      },
      {
        title = 'Pack Chicken Legs',
        description = 'Pack Fresh Chicken Legs Ready For Sale',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenLegs',
        arrow = true,
      },
      
    }
})


RegisterNetEvent('lusty94_butcher:client:PackChickenMenu', function()
    if Config.CoreSettings.Menu.Type == 'qb' then
        exports['qb-menu']:openMenu({
            {
                header = "Pack Chicken Products Ready For Sale! <br> Don\'t Forget Packaging",
                isMenuHeader = true,
            },
            {   
                header = "Get Food Packaging",
                txt = "Get Clean Food Packaging For Use",
                params = {
                    isServer = true,
                    event = "lusty94_butcher:server:GiveFoodPackaging",
                }
            },  
            {   
                header = "Pack Chicken Breast",
                txt = "Pack Fresh Chicken Breast Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenBreast",
                }
            },          
            {   
                header = "Pack Chicken Thighs",
                txt = "Pack Fresh Chicken Thighs Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenThighs",
                }
            },          
            {   
                header = "Pack Chicken Wings",
                txt = "Pack Fresh Chicken Wings Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenWings",
                }
            },          
            {   
                header = "Pack Chicken Drumsticks",
                txt = "Pack Fresh Chicken Drumsticks Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenDrumSticks",
                }
            },          
            {   
                header = "Pack Chicken Legs",
                txt = "Pack Fresh Chicken Legs Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenLegs",
                }
            }, 
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'jixel' then
        exports['jixel-menu']:openMenu({
            {
                header = "Pack Chicken Products Ready For Sale! <br> Don\'t Forget Packaging",
                isMenuHeader = true,
            },  
            {   
                header = "Get Food Packaging",
                txt = "Get Clean Food Packaging For Use",
                params = {
                    isServer = true,
                    event = "lusty94_butcher:server:GiveFoodPackaging",
                }
            },          
            {   
                header = "Pack Chicken Breast",
                txt = "Pack Fresh Chicken Breast Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenBreast",
                }
            },          
            {   
                header = "Pack Chicken Thighs",
                txt = "Pack Fresh Chicken Thighs Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenThighs",
                }
            },          
            {   
                header = "Pack Chicken Wings",
                txt = "Pack Fresh Chicken Wings Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenWings",
                }
            },          
            {   
                header = "Pack Chicken Drumsticks",
                txt = "Pack Fresh Chicken Drumsticks Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenDrumSticks",
                }
            },          
            {   
                header = "Pack Chicken Legs",
                txt = "Pack Fresh Chicken Legs Ready For Sale",
                params = {
                    event = "lusty94_butcher:client:PackChickenLegs",
                }
            }, 
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'boii' then
        exports['boii_ui']:open_menu('default', PackChickenMenu)
    elseif Config.CoreSettings.Menu.Type == 'ox' then
        lib.showContext('PackChickenMenu')
    end
end)

--------------------------------------------------------------< PACK CHICKEN MENU END >-----------------------------------------------------------------



--------------------------------------------------------------< SELL CHICKEN MENU START >-----------------------------------------------------------------



local SellChickenMenu = {
    main_header = { -- Main menu header
        text = 'Sell Chicken Products', -- Header text
        icon = '<i class="fa-solid fa-truck"></i>' -- Icon to display next to header text. Remove this to use no icon
    },
    menu_options = {
        {
            header = 'Sell Chicken Breast', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-money-bill"></i>', -- Menu header icon if using one this can be removed if not
            message = "Sell Chicken Breast Pack",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:SellChickenBreast',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Sell Chicken Thighs', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-money-bill"></i>', -- Menu header icon if using one this can be removed if not
            message = "Sell Chicken Thighs Pack",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:SellChickenThighs',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Sell Chicken Wings', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-money-bill"></i>', -- Menu header icon if using one this can be removed if not
            message = "Sell Chicken Wings Pack",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:SellChickenWings',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Sell Chicken Drumsticks', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-money-bill"></i>', -- Menu header icon if using one this can be removed if not
            message = "Sell Chicken Drumsticks Pack",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:SellChickenDrumSticks',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
        {
            header = 'Sell Chicken Legs', -- Menu option header if header is being used
            header_icon = '<i class="fa-solid fa-money-bill"></i>', -- Menu header icon if using one this can be removed if not
            message = "Sell Chicken Legs Pack",
            action_type = 'client_event', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            action = 'lusty94_butcher:client:SellChickenLegs',  -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
            disabled = false -- Disable the onclick function of the option
        },
    },
    menu_buttons = { -- Menu buttons mostly pointless since they work the same as any other options mainly just allows for more customisation over menu templates
        close = {
            use = true, -- Toggle the close button
            --action_type = '', -- Type to trigger on click this can be removed. Actions: 'client_event', 'server_event'
            --action = '', -- Name of event to trigger
            params = {}, -- Event params
            should_close = true, -- Toggle whether event should close the menu ui
        }
    },
}

lib.registerContext({
    id = 'SellChickenMenu',
    title = 'Sell Chicken Products',
    options = {
      {
        title = 'Sell Chicken Breast',
        description = 'Sell Chicken Breast Pack',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenBreast',
        arrow = true,
      },
      {
        title = 'Sell Chicken Thighs',
        description = 'Sell Chicken Thighs Pack',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenThighs',
        arrow = true,
      },
      {
        title = 'Sell Chicken Wings',
        description = 'Sell Chicken Wings Pack',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenWings',
        arrow = true,
      },
      {
        title = 'Sell Chicken Drumsticks',
        description = 'Sell Chicken Drumsticks Pack',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenDrumSticks',
        arrow = true,
      },
      
      {
        title = 'Sell Chicken Legs',
        description = 'Sell Chicken Legs Pack',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenLegs',
        arrow = true,
      },
      
    }
})


RegisterNetEvent('lusty94_butcher:client:SellChickenMenu', function()
    if Config.CoreSettings.Menu.Type == 'qb' then
        exports['qb-menu']:openMenu({
            {
                header = "Sell Chicken Products",
                isMenuHeader = true,
            },  
            {   
                header = "Sell Chicken Breast",
                txt = "Sell Chicken Breast Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenBreast",
                }
            },          
            {   
                header = "Sell Chicken Thighs",
                txt = "Sell Chicken Thighs Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenThighs",
                }
            },          
            {   
                header = "Sell Chicken Wings",
                txt = "Sell Chicken Wings Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenWings",
                }
            },          
            {   
                header = "Sell Chicken Drumsticks",
                txt = "Sell Chicken Drumsticks Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenDrumSticks",
                }
            },          
            {   
                header = "Sell Chicken Legs",
                txt = "Sell Chicken Legs Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenLegs",
                }
            }, 
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'jixel' then
        exports['jixel-menu']:openMenu({
            {
                header = "Sell Chicken Products",
                isMenuHeader = true,
            },  
            {   
                header = "Sell Chicken Breast",
                txt = "Sell Chicken Breast Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenBreast",
                }
            },          
            {   
                header = "Sell Chicken Thighs",
                txt = "Sell Chicken Thighs Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenThighs",
                }
            },          
            {   
                header = "Sell Chicken Wings",
                txt = "Sell Chicken Wings Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenWings",
                }
            },          
            {   
                header = "Sell Chicken Drumsticks",
                txt = "Sell Chicken Drumsticks Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenDrumSticks",
                }
            },          
            {   
                header = "Sell Chicken Legs",
                txt = "Sell Chicken Legs Pack",
                params = {
                    event = "lusty94_butcher:client:SellChickenLegs",
                }
            }, 
            {
                header = "< Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            },
        })
    elseif Config.CoreSettings.Menu.Type == 'boii' then
        exports['boii_ui']:open_menu('default', SellChickenMenu)
    elseif Config.CoreSettings.Menu.Type == 'ox' then
        lib.showContext('SellChickenMenu')
    end
end)






--------------------------------------------------------------< SELL CHICKEN MENU END >-----------------------------------------------------------------