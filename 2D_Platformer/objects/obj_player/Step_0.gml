//input
getControls();

state();	


//taking damage	
	invulnerable = max(invulnerable-1,0);
	flash = max(flash - 0.5, 0);
		
	if (attackCooldown > 0)
	{
		attackCooldown --;
	}
	
//dash cooldown	
if alarm[0] <= 0 {dashcooldown = true;} //bugfix
	
if alarm[1] <= 0 {attackCooldown = true;} 