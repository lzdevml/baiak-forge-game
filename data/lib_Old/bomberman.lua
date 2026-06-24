bomberman = {
	inGameStorage = 722601,
	bombStorage = 722602,
	radiusStorage = 722603,
	imuneStorage = 722604,
	bombLimitStorage = 722605,
	bombDelayStorage = 722606,
	oldSpeedStorage = 722607,

	bombId = 12824,
	stoneId = 9419,
	blockId = 10755,

	bonuses = {12820, 12821, 12822, 12823},
	ips = {},
	tpPos = {x=151, y=43, z=7}
}

bomberman.arenas = {
	[1] = {
		storage = 722608,
		
		fromPosLeaver = {x=2154, y=93, z=7},
		toPosLeaver = {x=2156, y=94, z=7},

		fromPos = {x=2130, y=59, z=7},
		toPos = {x=2152, y=79, z=7},
		rightTopCorner = {x=2152, y=59, z=7},
		leftBottomCorner = {x=2130, y=79, z=7},

		exit = {x=2156, y=96, z=7}
	},

	[2] = {	
		storage = 722609,

		fromPosLeaver = {x=2159, y=93, z=7},
		toPosLeaver = {x=2161, y=94, z=7},

		fromPos = {x=2164, y=59, z=7},
		toPos = {x=2186, y=79, z=7},
		rightTopCorner = {x=2186, y=59, z=7},
		leftBottomCorner = {x=2164, y=79, z=7},

		exit = {x=2161, y=96, z=7}	
	},

	[3] = {
		storage = 722610,

		fromPosLeaver = {x=2154, y=101, z=7},
		toPosLeaver = {x=2156, y=102, z=7},

		fromPos = {x=2134, y=116, z=7},
		toPos = {x=2156, y=136, z=7},
		rightTopCorner = {x=2156, y=116, z=7},
		leftBottomCorner = {x=2134, y=136, z=7},

		exit = {x=2156, y=99, z=7}
	},

	[4] = {
		storage = 722611,

		fromPosLeaver = {x=2159, y=101, z=7},
		toPosLeaver = {x=2161, y=102, z=7},

		fromPos = {x=2168, y=116, z=7},
		toPos = {x=2190, y=136, z=7},
		rightTopCorner = {x=2190, y=116, z=7},
		leftBottomCorner = {x=2168, y=136, z=7},

		exit = {x=2161, y=99, z=7}
	}
}

bomberman.isArenaFree = function(arenaNumber)
	return getGlobalStorageValue(bomberman.arenas[arenaNumber].storage) == -1
end