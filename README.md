
```
------README------
```

```Lusty94_Fishing - A fishing script for QB-Core with 21 different types of fish to be caught.```

```Multiple changes can be made to the script via the config.lua file such as sale prices, tackle shop locations and much more```

```Choose between progressbar, skillbar and ps-ui when fishing```












```
-----Dependencies------
```

``qb-core: https://github.com/qbcore-framework/qb-core``

``qb-target: https://github.com/qbcore-framework/qb-target``

``progressbar: https://github.com/qbcore-framework/progressbar``

``LegacyFuel: https://github.com/InZidiuZ/LegacyFuel``


```
-----REQUIRED IF USING PS-UI FOR MINIGAME-----
```

``PS-UI: https://github.com/Project-Sloth/ps-ui``

```
-----REQUIRED IF USING SKILLBAR FOR MINIGAME-----
```

``skillbar: https://github.com/qbcore-framework/qb-skillbar``












```
------INSTALLATION------
```


``MAKE SURE TO INSTALL ALL NECCESSARY DEPENDENCIES AND ENSURE THEY START BEFORE LUSTY94_FISHING IN YOUR SERVER.CFG FILE``

	
``Insert [images] into inventory/html/images``



``Insert items into qb-core/shared/items.lua``

``Adjust weights of items to suit your server``


```
--fishing tackle
	['fishingrod'] 						 = {['name'] = 'fishingrod', 			 	  	['label'] = 'Fishing Rod', 	    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'fishingrod.png', 				    ['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Fishing Rod'},
	['bait'] 							 = {['name'] = 'bait', 			 	  	  	    ['label'] = 'Bait', 		    ['weight'] = 200, 		['type'] = 'item', 		['image'] = 'bait.png', 					    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fishing Bait Used To Catch Fish'},
	['anchor'] 							 = {['name'] = 'anchor', 			 	  	  	['label'] = 'Anchor', 		    ['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'anchor.png', 					    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'An Anchor For A Fishing Boat'},

	
	--fish
	['shad'] 						 = {['name'] = 'shad', 			 	  	  			['label'] = 'Shad', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'shad.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Small Shad'},
	['gizzardshad'] 				 = {['name'] = 'gizzardshad', 			 	  	  	['label'] = 'Gizzard Shad', 	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'gizzardshad.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Small Gizzard Shad'},
	['smallmouthbass'] 				 = {['name'] = 'smallmouthbass', 			 	  	['label'] = 'Smallmouth Bass', 	['weight'] = 400, 		['type'] = 'item', 		['image'] = 'smallmouthbass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Small Mouth Bass'},
	['largemouthbass'] 				 = {['name'] = 'largemouthbass', 			 	  	['label'] = 'Largemouth Bass', 	['weight'] = 400, 		['type'] = 'item', 		['image'] = 'largemouthbass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Large Mouth Bass'},
	['bluegill'] 				 	 = {['name'] = 'bluegill', 			 	  	  		['label'] = 'Blue Gill', 		['weight'] = 200, 		['type'] = 'item', 		['image'] = 'bluegill.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Blue Gill'},
	['spottedsunfish'] 				 = {['name'] = 'spottedsunfish', 			 	  	['label'] = 'Spotted Sunfish', 	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'spottedsunfish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Spotted Sunfish'},
	['blackcrappie'] 				 = {['name'] = 'blackcrappie', 			 	  	  	['label'] = 'Black Crappie', 	['weight'] = 300, 		['type'] = 'item', 		['image'] = 'blackcrappie.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Black Crappie'},
	['stripedbass'] 				 = {['name'] = 'stripedbass', 			 	  	  	['label'] = 'Striped Bass', 	['weight'] = 400, 		['type'] = 'item', 		['image'] = 'stripedbass.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Striped Bass'},
	['bluecatfish'] 				 = {['name'] = 'bluecatfish', 			 	  	  	['label'] = 'Blue Catfish', 	['weight'] = 400, 		['type'] = 'item', 		['image'] = 'bluecatfish.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Blue Catfish'},
	['flatheadcatfish'] 			 = {['name'] = 'flatheadcatfish', 			 	  	['label'] = 'Flathead Catfish', ['weight'] = 400, 		['type'] = 'item', 		['image'] = 'flatheadcatfish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Flathead Catfish'},
	['channelcatfish'] 				 = {['name'] = 'channelcatfish', 			 	  	['label'] = 'channel Catfish', 	['weight'] = 400, 		['type'] = 'item', 		['image'] = 'channelcatfish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Channel Catfish'},
	['yellowbullhead'] 				 = {['name'] = 'yellowbullhead', 			 	  	['label'] = 'Yellow Bullhead', 	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'yellowbullhead.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Yellow Bullhead'},
	['rainbowtrout'] 				 = {['name'] = 'rainbowtrout', 			 	  	  	['label'] = 'Rainbow Trout', 	['weight'] = 400, 		['type'] = 'item', 		['image'] = 'rainbowtrout.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Rainbow Trout'},
	['browntrout'] 				 	 = {['name'] = 'browntrout', 			 	  	  	['label'] = 'Brown Trout', 		['weight'] = 400, 		['type'] = 'item', 		['image'] = 'browntrout.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Brown Trout'},
	['chainpickerel'] 				 = {['name'] = 'chainpickerel', 			 	  	['label'] = 'Chain Pickerel', 	['weight'] = 800, 		['type'] = 'item', 		['image'] = 'chainpickerel.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Chain Pickerel'},
	['redfinpickerel'] 				 = {['name'] = 'redfinpickerel', 			 	  	['label'] = 'Redfin Pickerel', 	['weight'] = 800, 		['type'] = 'item', 		['image'] = 'redfinpickerel.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Redfin Pickerel'},
	['bowfin'] 				 		 = {['name'] = 'bowfin', 			 	  	  		['label'] = 'Bowfin', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'bowfin.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Bowfin'},
	['longnosegar'] 				 = {['name'] = 'longnosegar', 			 	  	  	['label'] = 'LongNose Gar', 	['weight'] = 800, 		['type'] = 'item', 		['image'] = 'longnosegar.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Long Nose Gar'},
	['walleye'] 				     = {['name'] = 'walleye', 			 	  	  		['label'] = 'Walleye', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'walleye.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Walleye'},
	['sturgeon'] 				 	 = {['name'] = 'sturgeon', 			 	  	  		['label'] = 'Sturgeon', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'sturgeon.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Sturgeon'},
	['bullshark'] 				 	 = {['name'] = 'bullshark', 			 	  	  	['label'] = 'Bull Shark', 		['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'bullshark.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Bull Shark'},
	['greatwhiteshark'] 			 = {['name'] = 'greatwhiteshark', 			 	  	['label'] = 'Great white Shark',['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'greatwhite.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Great White Shark'},

