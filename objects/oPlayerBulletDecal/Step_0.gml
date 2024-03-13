


if (knockback_speed > 0) {
    // Apply movement in the knockback direction
    x += lengthdir_x(knockback_speed, knockback_direction);
    y += lengthdir_y(knockback_speed, knockback_direction);
	image_angle += angle
    // Gradually reduce the knockback speed to simulate friction or resistance
    knockback_speed -= 1; 

    // Prevent knockback speed from becoming negative
    if (knockback_speed < 0) {
        knockback_speed = 0;
		angle = 0
    }
}





