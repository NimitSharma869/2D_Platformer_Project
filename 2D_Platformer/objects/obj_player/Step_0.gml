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
	
	
	
	
