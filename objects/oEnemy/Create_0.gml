enum EnemyState{
	Idle,
	Moving
}

state = EnemyState.Idle	

close = 150
far = 300
next_time_I_think = 5

hit_point = 2
knockback_speed = 0;
knockback_direction = 0;

gun = instance_create_layer(x,y,"Instances",oEnemyGun)
gun.owner = id
function takeDamage() {
	if hit_point>1 {
		hit_point-=1
		show_debug_message(hit_point)
		var bullet = instance_place(x, y, oBullet);
		if (bullet != noone) {
		    // Collision detected, now apply knockback
			knockback_speed = 10;
		    knockback_direction = point_direction(bullet.x, bullet.y, x, y);
		    var hit_by_bullet_id = bullet.bullet_id; 

		}
	}
	else {
		var bullet = instance_place(x, y, oBullet);
		if (bullet != noone) {
		    // Collision detected, now apply knockback
			knockback_speed = 10;
		    knockback_direction = point_direction(bullet.x, bullet.y, x, y);
		    var hit_by_bullet_id = bullet.bullet_id; 

		}
		instance_create_layer(x,y,"Instances",oEnemyCorpse)
		instance_destroy()
		instance_destroy(gun)
	}
}
alarm[0] = room_speed * 3;
invicible = false;
invicible_timer = 0;
invicible_duration = 20;
gothit = false