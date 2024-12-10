// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerHurtState(){
	
	xspd = (moveDir * moveSpd);
	
	moveSpd = 1;
	
	moveDir = rightKey - leftKey;
	
	
	//x speed	
	xspd = (moveDir * moveSpd);
	
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
	
	
	if (stun > 0)
	{
		stun --;
	} else {
		moveSpd = 3.5;
		state = PlayerFreeState;
	}
	
	
	
	
} 