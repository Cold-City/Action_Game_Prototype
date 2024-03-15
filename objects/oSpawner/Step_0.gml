timer++

if timer > spawntime {
	
	var _inst = instance_create_depth(x,y,depth-1, oEnemy)
	with _inst {
		image_alpha = 0
		state = EnemyState.Spawn
	}
	
	timer = 0
}