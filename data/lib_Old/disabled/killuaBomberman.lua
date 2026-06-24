bomberman = {
	
	inGameStorage = 722601,
	bombStorage = 722602,
	radiusStorage = 722603,
	imuneStorage = 722604,
	bombLimitStorage = 722605,
	bombDelayStorage = 722606,
	oldSpeedStorage = 722607,

	bombId = 12729,
	stoneId = 3737,
	blockId = 10755,

	bonuses = {12725, 12726, 12727,12728},

	ips = {},

	tpPos = {x = 166, y = 53, z = 7}
}

bomberman.arenas = {
		
	[1] = {

		storage = 722608,
		
		fromPosLeaver = {x = 761, y = 31950, z = 7},--- Superior esquerdo (lavanca)
		toPosLeaver = {x = 764, y = 31952, z = 7}, --- inferior direito (lavanca)

		fromPos = {x = 794, y = 31971, z = 7}, --top esquerda
		toPos = {x = 816, y = 31989, z = 7},  --baixo direita

		rightTopCorner = {x = 794, y = 31989, z = 7}, --- baixo esquerda
		leftBottomCorner = {x = 816, y = 31971, z = 7}, --- topo direita

		exit = {x = 160, y = 51, z = 7} --KICK do evento

	},

	[2] = {
		
		storage = 722609,

		fromPosLeaver = {x = 769, y = 31950, z = 7},
		toPosLeaver = {x = 772, y = 31952, z = 7},

		fromPos = {x = 830, y = 31946, z = 7},
		toPos = {x = 852, y = 31964, z = 7},
		rightTopCorner = {x = 852, y = 31946, z = 7}, 
		leftBottomCorner = {x = 830, y = 31964, z = 7}, 

		exit = {x = 160, y = 51, z = 7}
		
	},

	[3] = {
		
		storage = 722610,

		fromPosLeaver = {x = 776, y = 31950, z = 7},
		toPosLeaver = {x = 779, y = 31952, z = 7},

		fromPos = {x = 832, y = 31909, z = 7},
		toPos = {x = 854, y = 31927, z = 7},
		rightTopCorner = {x = 854, y = 31909, z = 7},
		leftBottomCorner = {x = 832, y = 31927, z = 7},

		exit = {x = 160, y = 51, z = 7}
		
	},

	[4] = {
		
		storage = 722611,

		fromPosLeaver = {x = 782, y = 31950, z = 7},
		toPosLeaver = {x = 785, y = 31952, z = 7},

		fromPos = {x = 795, y = 31916, z = 7},
		toPos = {x = 817, y = 31934, z = 7},
		rightTopCorner = {x = 817, y = 31916, z = 7},
		leftBottomCorner = {x = 795, y = 31934, z = 7},

		exit = {x = 160, y = 51, z = 7}
		
	},

	[5] = {
		
		storage = 722612,

		fromPosLeaver = {x = 782, y = 31959, z = 7},
		toPosLeaver = {x = 784, y = 31961, z = 7},

		fromPos = {x = 757, y = 31914, z = 7},
		toPos = {x = 779, y = 31932, z = 7},
		rightTopCorner = {x = 779, y = 31914, z = 7},
		leftBottomCorner = {x = 757, y = 31932, z = 7},

		exit = {x = 160, y = 51, z = 7}
		
	},

	[6] = {
		
		storage = 722613,

		fromPosLeaver = {x = 776, y = 31959, z = 7},
		toPosLeaver = {x = 778, y = 31961, z = 7},

		fromPos = {x = 719, y = 31941, z = 7},
		toPos = {x = 741, y = 31959, z = 7},
		rightTopCorner = {x = 741, y = 31941, z = 7},
		leftBottomCorner = {x = 719, y = 31959, z = 7},

		exit = {x = 160, y = 51, z = 7}
		
	},

	[7] = {
		
		storage = 722614,

		fromPosLeaver = {x = 769, y = 31959, z = 7},
		toPosLeaver = {x = 771, y = 31961, z = 7},

		fromPos = {x = 719, y = 31979, z = 7},
		toPos = {x = 741, y = 31997, z = 7},
		rightTopCorner = {x = 741, y = 31979, z = 7},
		leftBottomCorner = {x = 719, y = 31997, z = 7},

		exit = {x = 160, y = 51, z = 7}
		
	},

	[8] = {
		
		storage = 722615,

		fromPosLeaver = {x = 761, y = 31959, z = 7},
		toPosLeaver = {x = 763, y = 31961, z = 7},

		fromPos = {x = 756, y = 31977, z = 7},
		toPos = {x = 778, y = 31995, z = 7},
		rightTopCorner = {x = 778, y = 31977, z = 7},
		leftBottomCorner = {x = 756, y = 31995, z = 7},
		exit = {x = 160, y = 51, z = 7}
		
	},

}

bomberman.isArenaFree = function(arenaNumber)
	return getGlobalStorageValue(bomberman.arenas[arenaNumber].storage) == -1
end
