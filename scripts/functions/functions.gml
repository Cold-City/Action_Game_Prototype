function screenshake(_magnitude,_frame){
	
	with oCamera {
		
		if _magnitude>shake_remain {
			show_debug_message("shaking")
			shake_magnitude = _magnitude
			shake_remain = _magnitude
			shake_length = _frame
		}
	}
}

function draw_my_weapon() {
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir)
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir)
	
	var _weaponYsc1 = 1
	if aimDir > 90 && aimDir < 270 {
		_weaponYsc1 = -1
	}
	var _sprite = asset_get_index(weapon.sprite)
	draw_sprite_ext(_sprite, 0, x+_xOffset, centerY + _yOffset, 1, _weaponYsc1, aimDir, c_white,1)
}