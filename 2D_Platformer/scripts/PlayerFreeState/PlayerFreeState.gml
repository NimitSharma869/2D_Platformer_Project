// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerFreeState()
{
	moveDir = rightKey - leftKey;
	
		
	//get my face
	if moveDir !=0 {face = moveDir; };
	
	if rightKey != 0 && leftKey != 0 
	{
		//face = - face; //in hindsight, i should have seen this coming, but it was still hillarious
		
		moveDir = face; //if both left and right arrows are clicked, we continues going in the 
						//direction we previsouly were going in
	}
		
	//x speed	
	xspd = (moveDir * moveSpd);
	
	xspd = clamp(xspd, -15, 15)
	
	//dash
	if (candash) && (dashKey) && (dashcooldown) {
		candash = false;
		dashcooldown = false;
		coyoteHangTimer = 0;
		coyoteJumpTimer = 0;
		dashdirection = (rightKey -leftKey); //point_direction(0,0, rightKey -leftKey, downKey - upKey);
		dashspd = dashdistance/dashtime;
		dashenergy = dashdistance;
		state =  PlayerDashState; //DashState;
	} 

		
	//x collision
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
	
//y movement
	//grav
	if coyoteHangTimer > 0
	{
		coyoteHangTimer--;
	} else {
		//apply grav after a few frames  
		yspd = yspd + grav;
		setOnGround(false);
	}
	//reset/prepare jumping variables
	if onGround
	{
		jumpCount = 0;
		coyoteJumpTimer = coyoteJumpFrames;
	} else {
		//if in air, make sure they cant tripple jump
		coyoteJumpTimer--;
		if jumpCount == 0 && coyoteJumpTimer <= 0 { jumpCount = 1;};
	}
	
	
	
	//initiate the jump
	if jumpKeyBuffered == 1 && jumpCount < jumpMax
	{
		//reset the buffer
		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		//increase the number of performed jumps
		jumpCount ++;
		
		//set the jumphold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		//tell ourself we're no longer on the ground
		setOnGround(false);
		coyoteJumpTimer = 0;
		
	}
	//cut off the jump, release the button
	if !jumpKey
	{
		jumpHoldTimer = 0;	
	}
	// jump based on timer/holding
	if jumpHoldTimer > 0
	{
		//constanlty set yspd
		yspd = jspd[jumpCount-1];
		//count down
		jumpHoldTimer --;
		
	}
	

	//terminal speed
		if yspd > termVel { yspd = termVel; };
	
	
		//y collision
		if place_meeting(x, y + yspd, wall)
		{
			var _pixelCheck = _subPixel * sign(yspd);
			while !place_meeting( x , y + _pixelCheck, wall) {y += _pixelCheck;};
			
			//bonk code
			if yspd < 0
			{
				jumpHoldTimer = 0;
			}
			yspd = 0;
		} 
	
	//set if i am on the ground
	if yspd >= 0 and place_meeting( x, y+1, wall)
	{
		setOnGround(true);	
		candash = true;
		
	} 
		
		//move
		y += yspd;
	
	//sprite control
	//walking
	
	
	

		//skip draw
	
	
		if abs(xspd) > 0 { sprite_index = spr_player_walk; };
		//not moving
		if xspd == 0 { sprite_index = spr_player_idle; };
		//jumping sprite
		if !onGround
		{
			if yspd < 0 { sprite_index = spr_player_jumping ;}; 
			if yspd > 8.5 { sprite_index = spr_player_falling ;}; 
		}
	

		
	
		mask_index = maskSpr;
}