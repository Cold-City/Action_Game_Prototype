

var _camW = camera_get_view_width(view_camera[0])
var _camH = camera_get_view_height(view_camera[0])

if instance_exists(oPlayer) {
	x = oPlayer.x - _camW/2
	y = oPlayer.centerY - _camH/2
}

x = clamp(x,0,room_width-_camW)
y = clamp(y,0, room_height - _camH)

x+= random_range(-shake_remain, shake_remain)
y += random_range(-shake_remain, shake_remain)
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude))

if instance_exists(oPlayer) {
	camera_set_view_pos(view_camera[0],oPlayer.x-camera_get_view_width(view_camera[0])/2-(oPlayer.x-mouse_x)/4,oPlayer.y-camera_get_view_height(view_camera[0])/2-(oPlayer.y-mouse_y)/4)
}else {
	camera_set_view_pos(view_camera[0], x, y)
}

if keyboard_check(vk_space) && !(audio_play_sound(sdMusic,1,true)){
	audio_play_sound(sdMusic,1,true)
	room_goto_next()
}



