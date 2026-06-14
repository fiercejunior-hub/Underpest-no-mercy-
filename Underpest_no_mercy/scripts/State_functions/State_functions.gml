function state_normal() {
	// Input
	var _ih = keyboard_check(ord("D")) - keyboard_check(ord("A"));		// Input horizontal
	var _iv = keyboard_check(ord("S")) - keyboard_check(ord("W"));		// Input vertical
	
	// Priotirize horizontal movements (Disable vertical movements if both inputs _ih and _iv are pressed)
	if (_ih != 0) _iv = 0;
	
	hspd = _ih * move_speed;
	vspd = _iv * move_speed;
	
	// Animation
	get_sprite_state();
	
	// Moving and colliding
	scr_move_and_collide();
}