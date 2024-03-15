

var _camW = camera_get_view_width(cam)
var _camH = camera_get_view_height(cam)

if instance_exists(oPlayer) {
	x = oPlayer.x - _camW/2
	y = oPlayer.centerY - _camH/2
}

x = clamp(x,0,room_width-_camW)
y = clamp(y,0, room_height - _camH)

x += random_range(-shake_remain, shake_remain)
y += random_range(-shake_remain, shake_remain)
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude))
camera_set_view_pos(cam, x, y)
if instance_exists(oPlayer) {
	//camera_set_view_pos(cam, oPlayer.x-view_w_half-(oPlayer.x-mouse_x)/4,oPlayer.y-view_h_half-(oPlayer.y-mouse_y)/4)
}else {
	
}





