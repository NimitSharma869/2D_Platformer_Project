state = PlayerFreeState;

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

//dash
candash = false;
dashdistance = 160;
dashtime = 12;
dashcooldown = true;

//health
invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;

//knockback
knockback_duration = 0;
knockback_step = 0;
knockback_direction = 0;
knockback_speed = 0;

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




