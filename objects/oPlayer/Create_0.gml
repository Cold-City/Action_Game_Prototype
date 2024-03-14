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

//player_gun = instance_create_depth(x,y,depth,oGun)

if !audio_group_is_loaded(audiogroup_default) {
	audio_group_load(audiogroup_default)
}

weaponOffsetDist = 4
shootTimer = 0


		
/*var json_string = file_text_open_read("weapons.json"); // Load the JSON string from a file
var weapon_data = json_decode(json_string); // Parse the JSON string into a DS map
global.Weapons = ds_map_create(); // Initialize the global Weapons variable as a DS map

var weapons = weapon_data[? "Weapons"]; // Access the "Weapons" part of the DS map
var key = ds_map_find_first(weapons);
while (!is_undefined(key)) {
    var weaponDetails = weapons[? key]; // Access the individual weapon's details
    
    // Now, replicate your desired structure
    var weaponStruct = {
        sprite: asset_get(weaponDetails[? "sprite"]), // Replace with the correct method to fetch assets by name if necessary
        length: weaponDetails[? "length"],
        bulletObj: asset_get(weaponDetails[? "bulletObj"]), // As above, adjust for actual asset fetching
        cooldown: weaponDetails[? "cooldown"]
    };
    
    // Store this struct in the global.Weapons DS map
    global.Weapons[? key] = weaponStruct;
    
    key = ds_map_find_next(weapons, key); // Move to the next key
}
*/
/*global.Weapons = {
	blueRifle : {
		sprite: sBlueRifle,
		length: 29,
		bulletObj: oRifleBullet,
		cooldown: 9
	},

	blueShotgun : {
		sprite: sBlueShotgun,
		length: 29,
		bulletObj: oRifleBullet,
		cooldown: 30
	}
}*/

array_push(global.Playerweapons, global.Weapons.blueRifle)
array_push(global.Playerweapons, global.Weapons.blueShotgun)
array_push(global.Playerweapons, global.Weapons.AssaultRifle)
selectedweapon = 0
weapon = global.Playerweapons[selectedweapon]