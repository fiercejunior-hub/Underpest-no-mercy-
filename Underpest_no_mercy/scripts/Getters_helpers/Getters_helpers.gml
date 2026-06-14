function get_sprite_state() {
	if (hspd != 0 || vspd != 0) 
	{
	    state_sprite = states_sprites.walk;
	    if (hspd > 0)       last_dir = "right";
	    else if (hspd < 0)  last_dir = "left";
	    else if (vspd > 0)  last_dir = "down";
	    else if (vspd < 0)  last_dir = "up";
	} 
	else 
	{
	    state_sprite = states_sprites.idle;
	}
	sprite_index = state_sprite[$ last_dir];
}