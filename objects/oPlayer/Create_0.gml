image_speed = 0;
yvelocity = 0;
xvelocity = 0;
walkSpeed = 2.0;

centerYOffset = -5
centerY = y + centerYOffset
inputDirection = 0
aimDir = 0
face = 3

gothit = false
hit_point = 15
knockback_speed = 0;
knockback_direction = 0;

//player_gun = instance_create_depth(x,y,depth,oGun)

if !(audio_play_sound(sdMusic,1,true)){
	audio_play_sound(sdMusic,1,true)
}


weaponOffsetDist = 4
shootTimer = 0



/*global.Weapons = {
	blueRifle : {
		sprite: sBlueRifle,
		length: 29,
		bulletObj: oRifleBullet,
		cooldown: 9
	},

	blueShotgun : {
		sprite: sBlueShotgun,
		length: 29,
		bulletObj: oRifleBullet,
		cooldown: 30
	}
}*/

array_push(global.Playerweapons, global.Weapons.blueRifle)
array_push(global.Playerweapons, global.Weapons.blueShotgun)
array_push(global.Playerweapons, global.Weapons.AssaultRifle)
selectedweapon = 0
weapon = global.Playerweapons[selectedweapon]