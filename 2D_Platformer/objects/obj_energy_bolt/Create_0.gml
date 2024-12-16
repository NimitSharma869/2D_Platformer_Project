/// @description Insert description here
// You can write your code in this editor

boltDamage = 3;
boltRange = 10;
boltKnockback = 5;

function bolt_die()
{
	speed = 0;
	instance_change(obj_energy_explosion, false);
}