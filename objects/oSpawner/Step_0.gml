timer++

if timer > spawntime {
	
	var _inst = instance_create_depth(x,y,depth-1, oEnemy)
	with _inst {
		image_alpha = 0
		state = EnemyState.Spawn
	}
	
	timer = 0
}


if dead == true && image_alpha>0 {
	image_alpha-=0.1
}

if image_alpha<=0 instance_destroy()

if place_meeting(x,y,oDamageEnemy) takeDamage()