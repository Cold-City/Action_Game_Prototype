if place_meeting(x,y,oSolidWall) {
	audio_play_sound(sdBulletHitWall,1,false)
	instance_destroy()
}

if place_meeting(x,y, oEnemy) {
	audio_play_sound(sdBulletHitWall,1,false)
	alarm[0] = 1
	
}



