// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerDashState(){


	coyoteHangTimer = 0;
	coyoteJumpTimer = 0;
	//this stops player from jumping after dashing; unless double jump is enabled that is :/
	
	
	if(rightKey -leftKey == 0)
	{ 
		dashdirection = face;	//if no directional input/both keys are pressed,dash in the direction we are facing 
	} else{
		dashdirection = (rightKey -leftKey)
	}
	
	xspd = lengthdir_x(dashspd, dashdirection)*dashdirection; 
	yspd = 0;
	
	sprite_index = spr_player_dash;
	
	
	
	//dash cooldown
	alarm[0] = game_get_speed(gamespeed_fps);


	var _subPixel = 0.5;
	if place_meeting(x + xspd, y, wall)
	{
		var _pixelCheck = _subPixel * sign(xspd);
		while !place_meeting( x + _pixelCheck, y, wall)
		{
			x += _pixelCheck;
		}
		xspd = 0;
		
	}
	//move
	
	x += xspd;

	if place_meeting(x, y + yspd, wall)
	{
		//var _pixelCheck = _subPixel * sign(yspd);
		//while !place_meeting( x , y + _pixelCheck, wall) {y += _pixelCheck;};
		//this was causing me to get so very long dashesw	
		//bonk code
		if yspd < 0
		{
			jumpHoldTimer = 0;
		}
		yspd = 0;
		
	}
		
		
	//move
	y += yspd;
	
	//ending dash state
	dashenergy -= dashspd;
	if (dashenergy <= 0){
		xspd = 0;
		yspd = 0;
		state = PlayerFreeState; //NormalState;
	}
	
	
	mask_index = maskSpr;
	

}