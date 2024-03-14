keyLeft = keyboard_check(ord("A"))
keyRight = keyboard_check(ord("D"))
keyUp = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))
shootkey = mouse_check_button(mb_left)
swapKeyPressed = keyboard_check_pressed(ord("Q"))

//Player Movement
#region
//Input
inputDirection = point_direction(0,0, keyRight - keyLeft, keyDown - keyUp)
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0)
var lastInputDirection = 0

//Movement
xvelocity = lengthdir_x(inputMagnitude * walkSpeed, inputDirection)
yvelocity = lengthdir_y(inputMagnitude * walkSpeed, inputDirection)

if place_meeting(x + xvelocity, y, oSolidWall) {
	xvelocity = 0
}
if place_meeting(x, y + yvelocity, oSolidWall) {
	yvelocity = 0
}

x += xvelocity
y += yvelocity

#endregion

if (inputMagnitude) {
    lastInputDirection = inputDirection;
}
centerY = y + centerYOffset
aimDir = point_direction(x, centerY, mouse_x, mouse_y)

//1

var _playerweapons = global.Playerweapons

if swapKeyPressed {
	selectedweapon++
	if selectedweapon >= array_length(_playerweapons) { selectedweapon = 0}
	weapon = _playerweapons[selectedweapon]
}

if shootTimer > 0 {
	shootTimer--
}
if shootkey && shootTimer <= 0{
	
	shootTimer = weapon.cooldown
	screenshake(2,20)
	audio_play_sound(sdPlayerShoot,1,false)
	var _xOffset = lengthdir_x(weapon.length + weaponOffsetDist, aimDir)
	var _yOffset = lengthdir_y(weapon.length + weaponOffsetDist, aimDir)
	
	var _spread = weapon.spread
	var _spreadDiv = _spread / weapon.bulletNum;
	for( var i = 0; i < weapon.bulletNum; i++) {
		var _bulletInst = instance_create_depth(x + _xOffset + i, centerY + _yOffset, depth-100, weapon.bulletObj)
		with _bulletInst {
			dir = other.aimDir - _spread/2 + _spreadDiv * i
			image_angle = dir
		}
	}
}


//Sprite Control
#region
image_speed = 1
if xvelocity !=0 image_xscale = sign(xvelocity)
if xvelocity != 0 && gothit = false {
		sprite_index = sPlayerWalk
		/*if !audio_is_playing(sdStep) {
			audio_play_sound(sdStep,1,false)
		}*/
	} else if gothit != true {
		sprite_index = sPlayerIdle
	}

#endregion

//Collison
if place_meeting(x,y,oEnemyBullet) {
	gothit = true
	hit_point-=1
	show_debug_message(hit_point)
	sprite_index = sPlayerGotHit
	var bullet = instance_place(x, y, oEnemyBullet);
	if (bullet != noone) {
		    // Collision detected, now apply knockback
			knockback_speed = 5;
		    knockback_direction = point_direction(bullet.x, bullet.y, x, y);

		}
	instance_destroy(bullet)
	alarm[0] = 20	
}
if (knockback_speed > 0) {
    // Apply movement in the knockback direction
    if !place_meeting(x,y, oSolidWall){
		x += lengthdir_x(knockback_speed, knockback_direction);
		y += lengthdir_y(knockback_speed, knockback_direction);
	}else if place_meeting(x,y,oSolidWall) {
		x -= lengthdir_x(knockback_speed, knockback_direction);
		y -= lengthdir_y(knockback_speed, knockback_direction);
	}

    // Gradually reduce the knockback speed to simulate friction or resistance
    knockback_speed -= 1; 

    // Prevent knockback speed from becoming negative
    if (knockback_speed < 0) {
        knockback_speed = 0;
		
    }
}

if !audio_group_is_loaded(audiogroup_default) {
	audio_group_load(audiogroup_default)
}
if hit_point < 1 {
	instance_create_layer(x,y,"Instances",oPlayerCorpse)
	instance_create_layer(x,y,"Instances",oDeathScreen)
	instance_destroy()
	instance_destroy(player_gun)
	
}