randomize()
x = oPlayer.x
y = oPlayer.y
var _angle = 0
_angle = point_direction(x,y,mouse_x,mouse_y)
image_angle = _angle
var player_x = x;
var player_y = y;
var cursor_x = mouse_x;
var cursor_y = mouse_y;
var angle_to_cursor = point_direction(player_x, player_y, cursor_x, cursor_y);
if mouse_check_button(mb_left) && allow_shoot {
	show_debug_message("shoot")
	screenshake(2,20)
	var effect_x = player_x + lengthdir_x(30, angle_to_cursor);
	var effect_y = player_y + lengthdir_y(irandom_range(20,30), angle_to_cursor);
	var bullet = instance_create_depth(effect_x, effect_y,depth,oBullet)
	var effect_instance = instance_create_layer(effect_x, effect_y, "Effects", oExplode);
	var decal = instance_create_depth(x, y, depth, oPlayerBulletDecal)
	with decal {
		direction = random(360)
		knockback_speed = 10
	}
	effect_instance.direction = angle_to_cursor;
	effect_instance.image_angle = angle_to_cursor;
	audio_play_sound(sdPlayerShoot,1,false)
	with bullet {
		direction = point_direction(x,y,mouse_x,mouse_y)
		speed = 5
		image_angle = direction
	}
	allow_shoot = false
}

if(!allow_shoot) { 
	shoot_timer++;
	if(shoot_timer > shoot_duration) {
		allow_shoot = true;
		shoot_timer = 0;
	}
}



