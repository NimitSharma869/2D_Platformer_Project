//receive damage

xspd = moveSpd * movedir;
yspd += grav;

move_script();

//turn around

if (place_meeting(x + movedir, y, wall)) {
	movedir = movedir*-1
}
	
if hp <= 0
{
	instance_destroy();
}