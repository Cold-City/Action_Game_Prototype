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
hit_point = 5
knockback_speed = 0;
knockback_direction = 0;

player_gun = instance_create_depth(x,y,depth,oGun)

if !audio_group_is_loaded(audiogroup_default) {
	audio_group_load(audiogroup_default)
}
