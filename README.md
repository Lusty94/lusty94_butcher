
```
------README------
```



LUSTY94_BUTCHER - A SIMPLE BUTCHER JOB SCRIPT FOR QB-CORE BASED AT THE CLUCKIN' BELL FACTORY IN PALETO BAY

PICK FRESH CHICKEN, PLUCK THEM, PROCESS THEM AND THEN PREPARE THEM FOR DELIVERY INTO VARIOUS PACKS

SELL WHAT YOU HAVE MADE FOR CASH OR BANK OR EVEN BACK TO THE SOCIETY ACCOUNT YOU ARE EMPLOYED BY!










```
-----Dependencies------
```

``qb-core: https://github.com/qbcore-framework/qb-core``
``qb-target: https://github.com/qbcore-framework/qb-target``
``qb-menu: https://github.com/qbcore-framework/qb-menu``
``qb-input: https://github.com/qbcore-framework/qb-input``
``qb-inventory: https://github.com/qbcore-framework/qb-inventory``
``progressbar: https://github.com/qbcore-framework/progressbar``
``ox_lib: https://github.com/overextended/ox_lib/releases/``






```
------INSTALLATION------
```


## MAKE SURE TO INSTALL ALL NECCESSARY DEPENDENCIES AND ENSURE THEY START BEFORE LUSTY94_BUTCHER IN YOUR SERVER.CFG FILE

	
## Insert [images] into inventory/html/images - ox_inventory users is inventory/web/images



## Insert items into qb-core/shared/items.lua

## Adjust weights of items to suit your server


```
['butcherknife'] 						 	= {['name'] = 'butcherknife', 			 	  	  		['label'] = 'Butcher Knife', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'butcherknife.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Sharp Knife Used By Butchers'},
	['foodpackaging'] 						 	= {['name'] = 'foodpackaging', 			 	  	  		['label'] = 'Food Packaging', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'foodpackaging.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Packaging Used For Raw Foods'},

	['freshchicken'] 						 	= {['name'] = 'freshchicken', 			 	  	  		['label'] = 'Fresh Chicken', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'freshchicken.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Ready For Plucking'},
	['pluckedchicken'] 						 	= {['name'] = 'pluckedchicken', 			 	  	  	['label'] = 'Plucked Chicken', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'pluckedchicken.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Plucked Chicken Ready For Processing'},
	['processedchicken'] 						= {['name'] = 'processedchicken', 			 	  	  	['label'] = 'Processed Chicken', 			['weight'] = 200, 		['type'] = 'item', 					['image'] = 'processedchicken.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Processed Chicken Ready For Packing'},
    
	['chickenbreast'] 						 	= {['name'] = 'chickenbreast', 			 	  	  		['label'] = 'Chicken Breast', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickenbreast.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Breast Ready For Packing'},
	['chickenthighs'] 						 	= {['name'] = 'chickenthighs', 			 	  	  		['label'] = 'Chicken Thighs', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickenthighs.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Thighs Ready For Packing'},
	['chickenwings'] 						 	= {['name'] = 'chickenwings', 			 	  	  		['label'] = 'Chicken wings', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickenwings.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Wings Ready For Packing'},
	['chickendrumsticks'] 						= {['name'] = 'chickendrumsticks', 			 	  	  	['label'] = 'Chicken Drumsticks', 			['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickendrumsticks.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Drumsticks Ready For Packing'},
	['chickenlegs'] 						    = {['name'] = 'chickenlegs', 			 	  	  	    ['label'] = 'Chicken Legs', 			    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickenlegs.png', 				        ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Legs Ready For Packing'},
    
	['chickenbreastpack'] 						= {['name'] = 'chickenbreastpack', 			 	  	    ['label'] = 'Chicken Breast Pack', 			['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickenbreastpack.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Breast Pack Ready For Delivery'},
	['chickenthighspack'] 						= {['name'] = 'chickenthighspack', 			 	  	  	['label'] = 'Chicken Thighs Pack', 			['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickenthighspack.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Thighs Pack Ready For Delivery'},
	['chickenwingspack'] 						= {['name'] = 'chickenwingspack', 			 	  	  	['label'] = 'Chicken wings Pack', 			['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickenwingspack.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken wings Pack Ready For Delivery'},
	['chickendrumstickspack'] 					= {['name'] = 'chickendrumstickspack', 			 	  	['label'] = 'Chicken Drumsticks Pack', 		['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickendrumstickspack.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Drumsticks Pack Ready For Delivery'},
	['chickenlegspack'] 					    = {['name'] = 'chickenlegspack', 			 	  	    ['label'] = 'Chicken Legs Pack', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chickenlegspack.png', 			        ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chicken Legs Pack Ready For Delivery'},

```




``make sure to add the required job to your core/shared/job.lua EDIT PAYMENTS AND NAMES FOR JOB TITLES TO SUIT YOUR SERVER``


```

['butcher'] = {
        label = 'Clucking Bell Butcher',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Apprentice Butcher',
                payment = 50
            },
            ['1'] = {
                name = 'Novice Butcher',
                payment = 50
            },
            ['2'] = {
                name = 'Professional Butcher',
                payment = 50
            },
            ['3'] = {
                name = 'Senior Butcher',
                payment = 50
            },
            ['4'] = {
                name = 'Butchery Owner',
                isboss = true,
                payment = 50
            },
        },
    },

```