// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function weapon_creation(_sprite, _weaponLength, _bulletObj, _coolDown, _bulletnum, _spread) constructor {
	sprite = _sprite
	length = _weaponLength
	bulletObj = _bulletObj
	cooldown = _coolDown
	bulletNum = _bulletnum
	spread = _spread
}

function import_json(_file_name, _func) {
	if file_exists(_file_name) {
		var _file, _json_string
		_file = file_text_open_read(_file_name)
		_json_string = ""
		while !file_text_eof(_file) {
			_json_string += file_text_read_string(_file)
			file_text_readln(_file)
		}
		file_text_close(_file)
		return script_execute(_func,_json_string)
	}
	return undefined
}



global.Weapons = import_json("weapons.json",json_parse)

global.Playerweapons = array_create(0)
/*
global.Weapons = {
	blueRifle : new weapon_creation(
		sBlueRifle,
		29,
		oRifleBullet,
		9,
		1,
		0
		),
	blueShotgun : new weapon_creation(
		sBlueShotgun,
		29,
		oShotgunBullet,
		30,
		7,
		45
		),
	AssaultRifle : new weapon_creation(
		sAssaultRifle,
		34,
		oAssaultRifleBullet,
		3,
		3,
		20
		),
}