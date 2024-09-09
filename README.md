## Lusty94_Butcher


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



======================================
SCRIPT SUPPORT VIA DISCORD: https://discord.gg/BJGFrThmA8
======================================


## FEATURES

- Pick and process fresh chicken into various products
- Sell your items for cash
- Extensive config file to make multiple changes
- Secure events to prevent exploits and abuse
- Change core settings to suit your server
- Support for ANY MLO or building - moveable target locations




## DEPENDENCIES


- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [ox_lib](https://github.com/overextended/ox_lib/releases/)



## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file - ox_inventory users place the snippet in inventory/data/items.lua
- Add the ##JOB snippet below to your core/shared/jobs.lua
- Add all .png images inside [images] folder into your inventory/html/images folder - ox_inventory users place images inside inventory/web/images
- Add your own methods of obtaining the butcher job - perhaps city hall?

## JOB


```

    butcher = { label = 'Butcher', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Factory Worker', payment = 50 } } },

```


## QB-CORE ITEMS


```
    --butcher

    butcherknife 						 	= {name = 'butcherknife', 			 	  	  		label = 'Butcher Knife', 				weight = 200, 		type = 'item', 					image = 'butcherknife.png', 					unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'A Sharp Knife Used By Butchers'},
	foodpackaging 						 	= {name = 'foodpackaging', 			 	  	  		label = 'Food Packaging', 				weight = 200, 		type = 'item', 					image = 'foodpackaging.png', 					unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Packaging Used For Raw Foods'},

	freshchicken 						 	= {name = 'freshchicken', 			 	  	  		label = 'Fresh Chicken', 				weight = 200, 		type = 'item', 					image = 'freshchicken.png', 					unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Ready For Plucking'},
	pluckedchicken 						 	= {name = 'pluckedchicken', 			 	  	  	label = 'Plucked Chicken', 				weight = 200, 		type = 'item', 					image = 'pluckedchicken.png', 					unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Plucked Chicken Ready For Processing'},
	processedchicken 						= {name = 'processedchicken', 			 	  	  	label = 'Processed Chicken', 			weight = 200, 		type = 'item', 					image = 'processedchicken.png', 				unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Processed Chicken Ready For Packing'},
    
	chickenbreast 						 	= {name = 'chickenbreast', 			 	  	  		label = 'Chicken Breast', 				weight = 200, 		type = 'item', 					image = 'chickenbreast.png', 					unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Breast Ready For Packing'},
	chickenthighs 						 	= {name = 'chickenthighs', 			 	  	  		label = 'Chicken Thighs', 				weight = 200, 		type = 'item', 					image = 'chickenthighs.png', 					unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Thighs Ready For Packing'},
	chickenwings 						 	= {name = 'chickenwings', 			 	  	  		label = 'Chicken wings', 				weight = 200, 		type = 'item', 					image = 'chickenwings.png', 					unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Wings Ready For Packing'},
	chickendrumsticks 						= {name = 'chickendrumsticks', 			 	  	  	label = 'Chicken Drumsticks', 			weight = 200, 		type = 'item', 					image = 'chickendrumsticks.png', 				unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Drumsticks Ready For Packing'},
	chickenlegs 						    = {name = 'chickenlegs', 			 	  	  	    label = 'Chicken Legs', 			    weight = 200, 		type = 'item', 					image = 'chickenlegs.png', 				        unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Legs Ready For Packing'},
    
	chickenbreastpack 						= {name = 'chickenbreastpack', 			 	  	    label = 'Chicken Breast Pack', 			weight = 200, 		type = 'item', 					image = 'chickenbreastpack.png', 				unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Breast Pack Ready For Delivery'},
	chickenthighspack 						= {name = 'chickenthighspack', 			 	  	  	label = 'Chicken Thighs Pack', 			weight = 200, 		type = 'item', 					image = 'chickenthighspack.png', 				unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Thighs Pack Ready For Delivery'},
	chickenwingspack 						= {name = 'chickenwingspack', 			 	  	  	label = 'Chicken wings Pack', 			weight = 200, 		type = 'item', 					image = 'chickenwingspack.png', 				unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken wings Pack Ready For Delivery'},
	chickendrumstickspack 					= {name = 'chickendrumstickspack', 			 	  	label = 'Chicken Drumsticks Pack', 		weight = 200, 		type = 'item', 					image = 'chickendrumstickspack.png', 			unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Drumsticks Pack Ready For Delivery'},
	chickenlegspack 					    = {name = 'chickenlegspack', 			 	  	    label = 'Chicken Legs Pack', 		    weight = 200, 		type = 'item', 					image = 'chickenlegspack.png', 			        unique = false, 	useable = false, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chicken Legs Pack Ready For Delivery'},

```

## OX_INVEOTRY ITEMS

```

	["freshchicken"] = {
		label = "Fresh Chicken",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Ready For Plucking",
		client = {
			image = "freshchicken.png",
		}
	},

	["butcherknife"] = {
		label = "Butcher Knife",
		weight = 200,
		stack = true,
		close = true,
		description = "A Sharp Knife Used By Butchers",
		client = {
			image = "butcherknife.png",
		}
	},

	["processedchicken"] = {
		label = "Processed Chicken",
		weight = 200,
		stack = true,
		close = true,
		description = "Processed Chicken Ready For Packing",
		client = {
			image = "processedchicken.png",
		}
	},

	["chickenwings"] = {
		label = "Chicken wings",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Wings Ready For Packing",
		client = {
			image = "chickenwings.png",
		}
	},

	["chickenlegs"] = {
		label = "Chicken Legs",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Legs Ready For Packing",
		client = {
			image = "chickenlegs.png",
		}
	},

	["chickendrumstickspack"] = {
		label = "Chicken Drumsticks Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Drumsticks Pack Ready For Delivery",
		client = {
			image = "chickendrumstickspack.png",
		}
	},

	["chickenthighs"] = {
		label = "Chicken Thighs",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Thighs Ready For Packing",
		client = {
			image = "chickenthighs.png",
		}
	},

	["chickendrumsticks"] = {
		label = "Chicken Drumsticks",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Drumsticks Ready For Packing",
		client = {
			image = "chickendrumsticks.png",
		}
	},

	["chickenthighspack"] = {
		label = "Chicken Thighs Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Thighs Pack Ready For Delivery",
		client = {
			image = "chickenthighspack.png",
		}
	},

	["chickenwingspack"] = {
		label = "Chicken wings Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken wings Pack Ready For Delivery",
		client = {
			image = "chickenwingspack.png",
		}
	},

	["chickenbreastpack"] = {
		label = "Chicken Breast Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Breast Pack Ready For Delivery",
		client = {
			image = "chickenbreastpack.png",
		}
	},

	["chickenlegspack"] = {
		label = "Chicken Legs Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Legs Pack Ready For Delivery",
		client = {
			image = "chickenlegspack.png",
		}
	},

	["pluckedchicken"] = {
		label = "Plucked Chicken",
		weight = 200,
		stack = true,
		close = true,
		description = "Plucked Chicken Ready For Processing",
		client = {
			image = "pluckedchicken.png",
		}
	},

	["foodpackaging"] = {
		label = "Food Packaging",
		weight = 200,
		stack = true,
		close = true,
		description = "Packaging Used For Raw Foods",
		client = {
			image = "foodpackaging.png",
		}
	},

	["chickenbreast"] = {
		label = "Chicken Breast",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chicken Breast Ready For Packing",
		client = {
			image = "chickenbreast.png",
		}
	},

```


