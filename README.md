## Lusty94_Ammunation  (Edit by Procastinator)


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



## IMPORTANT INFORMATION
- The latest version of qb-inventory 2.0 is NOT supported, you will need to downgrade to a previous version or use ox_inventory


## DEPENDENCIES


- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)/[ox_target](https://github.com/overextended/ox_target)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [ox_lib](https://github.com/overextended/ox_lib/releases/)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)/[ox_inventory](https://github.com/overextended/ox_inventory)/[codem-inventory](https://forum.cfx.re/t/codem-minventory-advanced-inventory-system/5167702)



## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file
- Add the ##JOB snippet below to your core/shared/jobs.lua
- Add all .png images inside [images] folder into your inventory/html/images folder - ox_inventory users place images inside inventory/web/images
- Add your own methods of obtaining the butcher job - perhaps city hall?

## Only follow the below step if you are using codem-inventory
Add the items to both qb-core/shared/item.lua and codem-inventory/config/itemlist.lua.

## JOB


```

    butcher = { label = 'Butcher', defaultDuty = false, offDutyPay = false, grades = { ['0'] = { name = 'Factory Worker', payment = 50 } } },

```



## ITEMS


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






