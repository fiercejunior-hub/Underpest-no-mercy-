function scr_move_and_collide(){
	// Horizontal
	if (place_meeting(x + hspd, y, par_solid))
	{
		var _step = sign(hspd);
		repeat(abs(hspd))
		{
			if (place_meeting(x + _step, y, par_solid)) break;
			x += _step;
		}
		hspd = 0;
	}
	x += hspd;
	
	// Vertical
	if (place_meeting(x, y + vspd, par_solid))
	{
		var _step = sign(vspd);
		repeat(abs(vspd))
		{
			if (place_meeting(x, y + _step, par_solid)) break;
			y += _step;
		}
		vspd = 0;
	}
	y += vspd;
}