local QBCore = exports['qb-core']:GetCoreObject()
local MenuType = Config.CoreSettings.Menu.Type

----------------------------------------------------------------< PROCESS CHICKEN MENU START >---------------------------------------------------

local ProcessChickenMenu = {
    {
        header = "Process Fresh Chicken",
        isMenuHeader = true,
    },  
    {   
        header = "Get A Butchers Knife",
        params = {
            event = "lusty94_butcher:client:GiveItems",
            args = 1,
        }
    },          
    {   
        header = "Process Chicken Breast",
        params = {
            event = "lusty94_butcher:client:ProcessChickenBreast",
        }
    },          
    {   
        header = "Process Chicken Thighs",
        params = {
            event = "lusty94_butcher:client:ProcessChickenThighs",
        }
    },          
    {   
        header = "Process Chicken Wings",
        params = {
            event = "lusty94_butcher:client:ProcessChickenWings",
        }
    },          
    {   
        header = "Process Chicken Drumsticks",
        params = {
            event = "lusty94_butcher:client:ProcessChickenDrumSticks",
        }
    },          
    {   
        header = "Process Chicken Legs",
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
}

lib.registerContext({
    id = 'ProcessChickenMenu',
    title = 'Process Fresh Chicken!',
    options = {
      {
        title = 'Get A Butchers Knife',
        event = 'lusty94_butcher:client:GiveItems',
        args = 1,
        arrow = true,
      },
      {
        title = 'Process Chicken Breast',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenBreast',
        arrow = true,
      },
      {
        title = 'Process Chicken Thighs',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenThighs',
        arrow = true,
      },
      {
        title = 'Process Chicken Wings',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenWings',
        arrow = true,
      },
      {
        title = 'Process Chicken Drumsticks',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenDrumSticks',
        arrow = true,
      },
      
      {
        title = 'Process Chicken Legs',
        icon = 'box',
        event = 'lusty94_butcher:client:ProcessChickenLegs',
        arrow = true,
      },
      
    }
})


RegisterNetEvent('lusty94_butcher:client:ProcessChickenMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(ProcessChickenMenu)
    elseif MenuType == 'jixel' then
        exports['qb-menu']:openMenu(ProcessChickenMenu)
    elseif MenuType == 'ox' then
        lib.showContext('ProcessChickenMenu')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)

----------------------------------------------------------------< PROCESS CHICKEN MENU END >---------------------------------------------------








----------------------------------------------------------------< PACK CHICKEN MENU START >---------------------------------------------------
local PackChickenMenu = {
    {
        header = "Pack Chicken Products Ready For Sale",
        isMenuHeader = true,
    },
    {   
        header = "Get Food Packaging",
        params = {
            event = "lusty94_butcher:client:GiveItems",
            args = 2,
        }
    },  
    {   
        header = "Pack Chicken Breast",
        params = {
            event = "lusty94_butcher:client:PackChickenBreast",
        }
    },          
    {   
        header = "Pack Chicken Thighs",
        params = {
            event = "lusty94_butcher:client:PackChickenThighs",
        }
    },          
    {   
        header = "Pack Chicken Wings",
        params = {
            event = "lusty94_butcher:client:PackChickenWings",
        }
    },          
    {   
        header = "Pack Chicken Drumsticks",
        params = {
            event = "lusty94_butcher:client:PackChickenDrumSticks",
        }
    },          
    {   
        header = "Pack Chicken Legs",
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
}

lib.registerContext({
    id = 'PackChickenMenu',
    title = 'Pack Chicken Products Ready For Sale',
    options = {
      {
        title = 'Get Food Packaging',
        event = 'lusty94_butcher:client:GiveItems',
        args = 2,
        arrow = true,
      },
      {
        title = 'Pack Chicken Breast',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenBreast',
        arrow = true,
      },
      {
        title = 'Pack Chicken Thighs',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenThighs',
        arrow = true,
      },
      {
        title = 'Pack Chicken Wings',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenWings',
        arrow = true,
      },
      {
        title = 'Pack Chicken Drumsticks',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenDrumSticks',
        arrow = true,
      },
      {
        title = 'Pack Chicken Legs',
        icon = 'box',
        event = 'lusty94_butcher:client:PackChickenLegs',
        arrow = true,
      },
      
    }
})


RegisterNetEvent('lusty94_butcher:client:PackChickenMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(PackChickenMenu)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(PackChickenMenu)
    elseif MenuType == 'ox' then
        lib.showContext('PackChickenMenu')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)

--------------------------------------------------------------< PACK CHICKEN MENU END >-----------------------------------------------------------------



--------------------------------------------------------------< SELL CHICKEN MENU START >-----------------------------------------------------------------

local SellChickenMenu = {
    {
        header = "Sell Chicken Products",
        isMenuHeader = true,
    },  
    {   
        header = "Sell Chicken Breast Pack",
        txt = Config.Selling.CashSymbol..Config.Selling.Items.ChickenBreast.Price..' each',
        params = {
            event = "lusty94_butcher:client:SellItems",
            args = 1,
        }
    },          
    {   
        header = "Sell Chicken Thighs Pack",
        txt = Config.Selling.CashSymbol..Config.Selling.Items.ChickenThighs.Price..' each',
        params = {
            event = "lusty94_butcher:client:SellItems",
            args = 2,
        }
    },          
    {   
        header = "Sell Chicken Wings Pack",
        txt = Config.Selling.CashSymbol..Config.Selling.Items.ChickenWings.Price..' each',
        params = {
            event = "lusty94_butcher:client:SellItems",
            args = 3,
        }
    },          
    {   
        header = "Sell Chicken Drumsticks Pack",
        txt = Config.Selling.CashSymbol..Config.Selling.Items.ChickenDrumsticks.Price..' each',
        params = {
            event = "lusty94_butcher:client:SellItems",
            args = 4,
        }
    },          
    {   
        header = "Sell Chicken Legs Pack",
        txt = Config.Selling.CashSymbol..Config.Selling.Items.ChickenLegs.Price..' each',
        params = {
            event = "lusty94_butcher:client:SellItems",
            args = 5,
        }
    }, 
    {
        header = "< Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu",
        }
    },
}

lib.registerContext({
    id = 'SellChickenMenu',
    title = 'Sell Chicken Products',
    options = {
      {
        title = 'Sell Chicken Breast Pack',
        description = Config.Selling.CashSymbol..Config.Selling.Items.ChickenBreast.Price..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellItems',
        args = 1,
        arrow = true,
      },
      {
        title = 'Sell Chicken Thighs Pack',
        description = Config.Selling.CashSymbol..Config.Selling.Items.ChickenThighs.Price..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellItems',
        args = 2,
        arrow = true,
      },
      {
        title = 'Sell Chicken Wings Pack',
        description = Config.Selling.CashSymbol..Config.Selling.Items.ChickenWings.Price..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellItems',
        args = 3,
        arrow = true,
      },
      {
        title = 'Sell Chicken Drumsticks Pack',
        description = Config.Selling.CashSymbol..Config.Selling.Items.ChickenDrumsticks.Price..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellItems',
        args = 4,
        arrow = true,
      },
      
      {
        title = 'Sell Chicken Legs Pack',
        description = Config.Selling.CashSymbol..Config.Selling.Items.ChickenLegs.Price..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellItems',
        args = 5,
        arrow = true,
      },
      
    }
})


RegisterNetEvent('lusty94_butcher:client:SellChickenMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(SellChickenMenu)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(SellChickenMenu)
    elseif MenuType == 'ox' then
        lib.showContext('SellChickenMenu')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)

--------------------------------------------------------------< SELL CHICKEN MENU END >-----------------------------------------------------------------