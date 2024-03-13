if (state == EnemyState.Idle) {
    state = EnemyState.Moving;
    // Set the enemy's target position to a random point within the room
    target_x = irandom(room_width);
    target_y = irandom(room_height);
    alarm[0] = room_speed * irandom_range(3, 5); // Move for 3 to 5 seconds
} else {
    state = EnemyState.Idle;
    speed = 0; // Stop moving
    alarm[0] = room_speed * irandom_range(2, 4); // Idle for 2 to 4 seconds
}





