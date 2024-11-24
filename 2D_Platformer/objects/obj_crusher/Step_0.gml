/// @description Insert description here
// You can write your code in this editor

switch (state) {
	
	case "WAITING": {
		
		if alarm[0] == -1 {
			alarm[0] = room_speed * 3;
		}
		
		break;
		
	}
		
	case "FALLING": {
		
		yspd += grav;
		
		if alarm[1] == -1 {
			if place_meeting(x, y + 1, wall) {
				alarm[1] = room_speed;
			}
		}
		
		break;
	}
		
		
	case "RISING": {
		
		yspd += -grav;
		yspd = clamp(yspd, -2, 0);
		
		if place_meeting( x, y + 1, wall) state = "WAITING";
		
		break;
		
	}
				
}

move_script();