/// @description Parent object for all objects that move in non-combat scenarios.
move_speed		= 2;
hspd			= 0;
vspd			= 0;

// State machine
state			= function() {};		// Children assign real states
state_name		= "noone";				// To help us debug