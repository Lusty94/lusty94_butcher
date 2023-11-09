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
}

lib.registerContext({
    id = 'ProcessChickenMenu',
    title = 'Process Fresh Chicken!',
    options = {
      {
        title = 'Get A Butchers Knife',
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
            event = "lusty94_butcher:client:GiveFoodPackaging",
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
}

lib.registerContext({
    id = 'PackChickenMenu',
    title = 'Pack Chicken Products Ready For Sale',
    options = {
      {
        title = 'Get Food Packaging',
        icon = 'box',
        event = 'lusty94_butcher:client:GiveFoodPackaging',
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
        txt = "Sell Chicken Breast Pack For: " ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickenbreastpack"]..' each',
        params = {
            event = "lusty94_butcher:client:SellChickenBreast",
        }
    },          
    {   
        header = "Sell Chicken Thighs Pack",
        txt = "Sell Chicken Thighs Pack For: " ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickenthighspack"]..' each',
        params = {
            event = "lusty94_butcher:client:SellChickenThighs",
        }
    },          
    {   
        header = "Sell Chicken Wings Pack",
        txt = "Sell Chicken Wings Pack For: " ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickenwingspack"]..' each',
        params = {
            event = "lusty94_butcher:client:SellChickenWings",
        }
    },          
    {   
        header = "Sell Chicken Drumsticks Pack",
        txt = "Sell Chicken Drumsticks Pack For: " ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickendrumstickspack"]..' each',
        params = {
            event = "lusty94_butcher:client:SellChickenDrumSticks",
        }
    },          
    {   
        header = "Sell Chicken Legs Pack",
        txt = "Sell Chicken Legs Pack For: " ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickenlegspack"]..' each',
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
}

lib.registerContext({
    id = 'SellChickenMenu',
    title = 'Sell Chicken Products',
    options = {
      {
        title = 'Sell Chicken Breast Pack',
        description = 'Sell Chicken Breast Pack For: ' ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickenbreastpack"]..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenBreast',
        arrow = true,
      },
      {
        title = 'Sell Chicken Thighs Pack',
        description = 'Sell Chicken Thighs Pack For: ' ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickenthighspack"]..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenThighs',
        arrow = true,
      },
      {
        title = 'Sell Chicken Wings Pack',
        description = 'Sell Chicken Wings Pack For: ' ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickenwingspack"]..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenWings',
        arrow = true,
      },
      {
        title = 'Sell Chicken Drumsticks Pack',
        description = 'Sell Chicken Drumsticks Pack For: ' ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickendrumstickspack"]..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenDrumSticks',
        arrow = true,
      },
      
      {
        title = 'Sell Chicken Legs Pack',
        description = 'Sell Chicken Legs Pack For: ' ..Config.ItemPrices.CashSymbol..Config.ItemPrices.SellItems["chickenlegspack"]..' each',
        icon = 'money-bill',
        event = 'lusty94_butcher:client:SellChickenLegs',
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