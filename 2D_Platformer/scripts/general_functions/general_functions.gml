function controlsSetup()
{
	bufferTime = 5;
	
	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;
}


function getControls()
{
	//direction inputs
	rightKey = keyboard_check(ord("D")) + gamepad_button_check( 0, gp_padr);
		rightKey = clamp( rightKey, 0, 1);
	
	leftKey = keyboard_check(ord("A")) + gamepad_button_check( 0, gp_padl);
		leftKey = clamp( leftKey, 0, 1);
	
	upKey = keyboard_check(ord("W")) + gamepad_button_check( 0, gp_padu);
		upKey = clamp(upKey, 0 ,1);
		
	downKey = keyboard_check(ord("S")) + gamepad_button_check( 0, gp_padd);
		downKey = clamp(downKey, 0, 1);
	
	
	//action inputs
	jumpkeypressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed( 0, gp_face1);
		jumpkeypressed = clamp( jumpkeypressed, 0, 1);
		
	jumpKey = keyboard_check(vk_space) + gamepad_button_check( 0, gp_face1);
		jumpKey = clamp( jumpKey, 0, 1);
		
	dashKey = keyboard_check_pressed(ord("E")) + gamepad_button_check_pressed( 0, gp_shoulderr);
		dashKey = clamp( dashKey, 0, 1);
		
	
		
	//jump key buffering
	if jumpkeypressed
	{
		jumpKeyBufferTimer = bufferTime;
	}
	if jumpKeyBufferTimer > 0
	{
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	} else {
		jumpKeyBuffered =0;
	}
	
}