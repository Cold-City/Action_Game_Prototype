if place_meeting(x,y,oSolidWall) {
	audio_play_sound(sdBulletHitWall,1,false)
	var effect_instance = instance_create_layer(x, y, "Effects", oShotgunHitEffect);
	instance_destroy()
}

if place_meeting(x,y, oEnemy) {
	audio_play_sound(sdBulletHitWall,1,false)
	var effect_instance = instance_create_layer(x, y, "Effects", oShotgunHitEffect);
	alarm[0] = 1
	
}

xspd = lengthdir_x(spd,dir)
yspd = lengthdir_y(spd,dir)

x+=xspd
y+=yspd

