depth = -bbox_top

timer = 0
spawntime = 6*60
hit_point = 300
dead = false

function takeDamage() {
	if hit_point>1 {
		
		show_debug_message(hit_point)
		var bullet = instance_place(x, y, oDamageEnemy);
		hit_point-= bullet.damage
	
	}
	else {
		var bullet = instance_place(x, y, oRifleBullet);
		if (bullet != noone) {
		    // Collision detected, now apply knockback
			knockback_speed = 10;
		    knockback_direction = point_direction(bullet.x, bullet.y, x, y);
		    var hit_by_bullet_id = bullet.bullet_id; 

		}
		
		dead = true
	}
}