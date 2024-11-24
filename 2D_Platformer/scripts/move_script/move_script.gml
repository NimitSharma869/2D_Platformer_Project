// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_script() {
	
	if (place_meeting( x +xspd, y, wall)) {
		while (!place_meeting( x + sign(xspd), y, wall)) {
			x += sign(xspd);
		}
		xspd = 0;
	}
	x += xspd;
	
	
	if (place_meeting( x, y + yspd, wall)) {
		while (!place_meeting( x, y + sign(yspd), wall)) {
			y += sign(yspd);
		}
		yspd = 0;
	}
	y += yspd;
	
}