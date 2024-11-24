//custom fun for player
function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	} else {
		onGround = false;
		coyoteHangTimer = 0;
	}
}


//controls setup
controlsSetup() //i get controls from "general_functions"

//
maskSpr = spr_player_idle; //this is the hitbox; it will be the same as the idle sprite. 
idleSpr = spr_player_idle;
walkSpr = spr_player_walk;
jumpSpr = spr_player_jumping;
risingSpr = spr_player_rising;
fallSpr = spr_player_falling;

//moving
face = 1; //used for sprites; -1 for left and 1 for right.
moveDir = 0;
moveSpd = 3.5;

xspd = 0;
yspd = 0;

//jumping
grav = 0.8;
termVel = 12;
jspd = [-12,-8];

jumpMax = 1;
jumpCount = 0;	
jumpHoldTimer = 0;
jumpHoldFrames = [6,8];

onGround = true;


//Dash
dashSpd = 15;
dashTimer = 0;
dashCoolDown = 10;



//grav timer
gravTimer = 0;
gravFrames = 3;




//coyote time


//Hang
coyoteHangFrames = 2;
coyoteHangTimer = 0;


//Jump
coyoteJumpFrames = 5;
coyoteJumpTimer = 0;


//normal state

StateFree = function()
{
	
//x movement
	//move direction
	moveDir = rightKey - leftKey;
	
//state machine for dash, on ground and mid air movement
	
			
	//get my face
	if moveDir !=0 {face = moveDir; };
	
	//x speed	
	
	
	//dash
	
	dashTimer = max(dashTimer - 1, 0);
	
	dashCoolDown = max(dashCoolDown - 1, 0);

 

	if (dashCoolDown <= 0) {
		if dashKey {
			dashTimer = 5;
			dashCoolDown = 30;
			xspd = moveDir * dashSpd;
		} else {
			xspd = moveDir * moveSpd;
		}
	} 
	
	if (dashTimer > 0) { yspd = 0;};
	

	if (onGround) {
		dashCoolDown = 0;
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
		
		dashTimer = 0; 
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
		
	} 

		
	
		//move
		y += yspd;
	
	//sprite control
	//walking
	if abs(xspd) > 0 { sprite_index = spr_player_walk; };
	//not moving
	if xspd == 0 { sprite_index = spr_player_idle; };
	//jumping sprite
	if !onGround
	{
		if yspd < 0 { sprite_index = spr_player_jumping ;}; 
		if yspd > 8.5 { sprite_index = spr_player_falling ;}; 
	}
	
	if dashTimer > 0 { sprite_index = spr_player_dash;};
	
	mask_index = maskSpr;

}


state = StateFree;