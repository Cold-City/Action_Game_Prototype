x = owner.x
y = owner.y
var _angle = 0

image_angle = _angle

if(allow_shoot == true) && instance_exists(oPlayer){
	_angle = point_direction(x,y,oPlayer.x,oPlayer.y)
	var effect_x = x + lengthdir_x(30, _angle);
	var effect_y = y + lengthdir_y(30, _angle);
	var _enemy_bullet = instance_create_layer(effect_x, effect_y, "Instances", oEnemyBullet);
	var effect_instance = instance_create_layer(effect_x, effect_y, "Effects", oExplode);
	var decal = instance_create_depth(x, y, depth, oEnemyBulletDecal)
	with decal {
		direction = random(360)
		knockback_speed = 10
	}
	effect_instance.direction = _angle;
	effect_instance.image_angle = _angle;
	audio_play_sound(sdEnemyShoot,1,false)
	with(_enemy_bullet){
		speed = 1;
		direction = point_direction(x,y,oPlayer.x,oPlayer.y); 
		image_angle = direction
		}
	allow_shoot = false;
	alarm[0]= 60;
	
} else {
	
}



