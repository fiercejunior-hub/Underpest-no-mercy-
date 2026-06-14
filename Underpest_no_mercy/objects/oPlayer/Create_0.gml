// Inherit the parent event
event_inherited();

state			= state_normal;
state_name		= "normal";

// Movement
move_speed		= 2;			// This decides how fast this object moves

// Animation
states_sprites = {
	idle: {
		left:	spr_player_idle_left,
		right:	spr_player_idle_right,
		up:		spr_player_idle_up,
		down:	spr_player_idle_down,
	},
	walk: {
		left:	spr_player_walk_left,
		right:	spr_player_walk_right,
		up:		spr_player_walk_up,
		down:	spr_player_walk_down,
	},
}

state_sprite = states_sprites.idle;
last_dir = "down";