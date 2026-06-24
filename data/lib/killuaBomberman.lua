bomberman = {
	
	inGameStorage = 722601,
	bombStorage = 722602,
	radiusStorage = 722603,
	imuneStorage = 722604,
	bombLimitStorage = 722605,
	bombDelayStorage = 722606,
	oldSpeedStorage = 722607,

	bombId = 12639,
	stoneId = 3737,
	blockId = 10755,

	bonuses = {12641, 12643, 12644,12642},

	ips = {},

	tpPos = {x = 168, y = 48, z = 7}
}

bomberman.arenas = {
		
	[1] = {

		storage = 722608,
		
		fromPosLeaver = {x = 1168, y = 275, z = 7},
		toPosLeaver = {x = 1168, y = 275, z = 7},

		fromPos = {x = 1168, y = 275, z = 7},
		toPos = {x = 1168, y = 275, z = 7},
		rightTopCorner = {x = 1168, y = 275, z = 7},
		leftBottomCorner = {x = 1168, y = 275, z = 7},

		exit = {x = 1168, y = 275, z = 7}

	},

	[2] = {
		
		storage = 722609,

		fromPosLeaver = {x = 2929, y = 227, z = 7},
		toPosLeaver = {x = 2931, y = 228, z = 7},

		fromPos = {x = 2990, y = 223, z = 7},
		toPos = {x = 3012, y = 241, z = 7},
		rightTopCorner = {x = 3012, y = 223, z = 7},
		leftBottomCorner = {x = 2990, y = 241, z = 7},

		exit = {x = 2930, y = 231, z = 7}
		
	},

	[3] = {
		
		storage = 722610,

		fromPosLeaver = {x = 2936, y = 227, z = 7},
		toPosLeaver = {x = 2938, y = 228, z = 7},

		fromPos = {x = 2992, y = 186, z = 7},
		toPos = {x = 3014, y = 204, z = 7},
		rightTopCorner = {x = 3014, y = 186, z = 7},
		leftBottomCorner = {x = 2992, y = 204, z = 7},

		exit = {x = 2937, y = 231, z = 7}
		
	},

	[4] = {
		
		storage = 722611,

		fromPosLeaver = {x = 2942, y = 227, z = 7},
		toPosLeaver = {x = 2944, y = 228, z = 7},

		fromPos = {x = 2955, y = 193, z = 7},
		toPos = {x = 2977, y = 211, z = 7},
		rightTopCorner = {x = 2977, y = 193, z = 7},
		leftBottomCorner = {x = 2955, y = 211, z = 7},

		exit = {x = 2943, y = 231, z = 7}
		
	},

	[5] = {
		
		storage = 722612,

		fromPosLeaver = {x = 2921, y = 237, z = 7},
		toPosLeaver = {x = 2923, y = 238, z = 7},

		fromPos = {x = 2917, y = 191, z = 7},
		toPos = {x = 2939, y = 209, z = 7},
		rightTopCorner = {x = 2939, y = 191, z = 7},
		leftBottomCorner = {x = 2917, y = 209, z = 7},

		exit = {x = 2922, y = 234, z = 7}
		
	},

	[6] = {
		
		storage = 722613,

		fromPosLeaver = {x = 2929, y = 237, z = 7},
		toPosLeaver = {x = 2931, y = 238, z = 7},

		fromPos = {x = 2879, y = 218, z = 7},
		toPos = {x = 2901, y = 236, z = 7},
		rightTopCorner = {x = 2901, y = 218, z = 7},
		leftBottomCorner = {x = 2879, y = 236, z = 7},

		exit = {x = 2930, y = 234, z = 7}
		
	},

	[7] = {
		
		storage = 722614,

		fromPosLeaver = {x = 2936, y = 237, z = 7},
		toPosLeaver = {x = 2938, y = 238, z = 7},

		fromPos = {x = 2879, y = 256, z = 7},
		toPos = {x = 2901, y = 274, z = 7},
		rightTopCorner = {x = 2901, y = 256, z = 7},
		leftBottomCorner = {x = 2879, y = 274, z = 7},

		exit = {x = 2937, y = 234, z = 7}
		
	},

	[8] = {
		
		storage = 722615,

		fromPosLeaver = {x = 2942, y = 237, z = 7},
		toPosLeaver = {x = 2944, y = 238, z = 7},

		fromPos = {x = 2916, y = 254, z = 7},
		toPos = {x = 2938, y = 272, z = 7},
		rightTopCorner = {x = 2938, y = 254, z = 7},
		leftBottomCorner = {x = 2916, y = 272, z = 7},

		exit = {x = 2943, y = 234, z = 7}
		
	},

}

bomberman.isArenaFree = function(arenaNumber)
	return getGlobalStorageValue(bomberman.arenas[arenaNumber].storage) == -1
end
