/// @description Insert description here
// You can write your code in this editor

switch (state) {
	
	case "WAITING": {
		
		image_index  = 0;
		
		enemyDamage = 0.5;
		
		if alarm[0] == -1 {
			alarm[0] = room_speed * 3;
		}
		
		break;
		
	}
		
	case "FALLING": {
		
		
		
		enemyDamage = 1;
		yspd += grav;
		
		if !place_meeting(x, y + 1, wall)
		{
			enemyDamage = 1; 
			image_index = 1;
			
			} else { 
				
			enemyDamage = 0.5;
			image_index = 0;}
		
		if alarm[1] == -1 {
			if place_meeting(x, y + 1, wall) {
				alarm[1] = room_speed;
			}
		}
		
		break;
	}
		
		
	case "RISING": {
		
		image_index = 0;
		
		enemyDamage = 0.5;
		yspd += -grav;
		yspd = clamp(yspd, -2, 0);
		
		if place_meeting( x, y + 1, wall) state = "WAITING";
		
		break;
		
	}
				
}

move_script();