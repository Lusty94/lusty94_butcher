lib.registerContext({
    id = 'ProcessMenuButcher',
    title = 'Cluckin\' Bell Butchers',
    options = {
      {
        title = 'Get A Butchers Knife',
        onSelect = function()
            TriggerServerEvent('lusty94_butcher:server:GiveItems', 1)
        end,
        icon = ItemImage('butcherknife'),
        image = ItemImage('butcherknife'),
        arrow = true,
      },
      {
        title = 'Process Chicken Breast',
        event = 'lusty94_butcher:client:ProcessChickenBreast',
        icon = ItemImage('chickenbreast'),
        image = ItemImage('chickenbreast'),
        arrow = true,
      },
      {
        title = 'Process Chicken Thighs',
        icon = ItemImage('chickenthighs'),
        image = ItemImage('chickenthighs'),
        event = 'lusty94_butcher:client:ProcessChickenThighs',
        arrow = true,
      },
      {
        title = 'Process Chicken Wings',
        icon = ItemImage('chickenwings'),
        image = ItemImage('chickenwings'),
        event = 'lusty94_butcher:client:ProcessChickenWings',
        arrow = true,
      },
      {
        title = 'Process Chicken Drumsticks',
        icon = ItemImage('chickendrumsticks'),
        image = ItemImage('chickendrumsticks'),
        event = 'lusty94_butcher:client:ProcessChickenDrumSticks',
        arrow = true,
      },
      
      {
        title = 'Process Chicken Legs',
        icon = ItemImage('chickenlegs'),
        image = ItemImage('chickenlegs'),
        event = 'lusty94_butcher:client:ProcessChickenLegs',
        arrow = true,
      },
      
    }
})



lib.registerContext({
    id = 'PackMenuButcher',
    title = 'Cluckin\' Bell Butchers',
    options = {
      {
        title = 'Get Food Packaging',
        icon = ItemImage('foodpackaging'),
        image = ItemImage('foodpackaging'),
        event = 'lusty94_butcher:client:GiveItems',
        arrow = true,
      },
      {
        title = 'Pack Chicken Breast',
        icon = ItemImage('chickenbreastpack'),
        image = ItemImage('chickenbreastpack'),
        event = 'lusty94_butcher:client:PackChickenBreast',
        arrow = true,
      },
      {
        title = 'Pack Chicken Thighs',
        icon = ItemImage('chickenthighspack'),
        image = ItemImage('chickenthighspack'),
        event = 'lusty94_butcher:client:PackChickenThighs',
        arrow = true,
      },
      {
        title = 'Pack Chicken Wings',
        icon = ItemImage('chickenwingspack'),
        image = ItemImage('chickenwingspack'),
        event = 'lusty94_butcher:client:PackChickenWings',
        arrow = true,
      },
      {
        title = 'Pack Chicken Drumsticks',
        icon = ItemImage('chickendrumstickspack'),
        image = ItemImage('chickendrumstickspack'),
        event = 'lusty94_butcher:client:PackChickenDrumSticks',
        arrow = true,
      },
      {
        title = 'Pack Chicken Legs',
        icon = ItemImage('chickenlegspack'),
        image = ItemImage('chickenlegspack'),
        event = 'lusty94_butcher:client:PackChickenLegs',
        arrow = true,
      },
      
    }
})


local cashSymbol = Config.Selling.CashSymbol

lib.registerContext({
    id = 'SellMenuButcher',
    title = 'Butcher Sales',
    options = {
      {
        title = 'Sell Chicken Breast Pack',
        description = cashSymbol..Config.Selling.Items.ChickenBreast.Price..' each',
        icon = ItemImage('chickenbreastpack'),
        image = ItemImage('chickenbreastpack'),
        event = 'lusty94_butcher:client:SellItems',
        args = 1,
        arrow = true,
      },
      {
        title = 'Sell Chicken Thighs Pack',
        description = cashSymbol..Config.Selling.Items.ChickenThighs.Price..' each',
        icon = ItemImage('chickenthighspack'),
        image = ItemImage('chickenthighspack'),
        event = 'lusty94_butcher:client:SellItems',
        args = 2,
        arrow = true,
      },
      {
        title = 'Sell Chicken Wings Pack',
        description = cashSymbol..Config.Selling.Items.ChickenWings.Price..' each',
        icon = ItemImage('chickenwingspack'),
        image = ItemImage('chickenwingspack'),
        event = 'lusty94_butcher:client:SellItems',
        args = 3,
        arrow = true,
      },
      {
        title = 'Sell Chicken Drumsticks Pack',
        description = cashSymbol..Config.Selling.Items.ChickenDrumsticks.Price..' each',
        icon = ItemImage('chickendrumstickspack'),
        image = ItemImage('chickendrumstickspack'),
        event = 'lusty94_butcher:client:SellItems',
        args = 4,
        arrow = true,
      },
      
      {
        title = 'Sell Chicken Legs Pack',
        description = cashSymbol..Config.Selling.Items.ChickenLegs.Price..' each',
        icon = ItemImage('chickenlegspack'),
        image = ItemImage('chickenlegspack'),
        event = 'lusty94_butcher:client:SellItems',
        args = 5,
        arrow = true,
      },
      
    }
})




--------------------------< EVENTS >----------------------

RegisterNetEvent('lusty94_butcher:client:ProcessChickenMenu', function()
    lib.showContext('ProcessMenuButcher')
end)

RegisterNetEvent('lusty94_butcher:client:PackChickenMenu', function()
    lib.showContext('PackMenuButcher')
end)

RegisterNetEvent('lusty94_butcher:client:SellChickenMenu', function()
    lib.showContext('SellMenuButcher')
end)