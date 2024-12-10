// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_hurt(_direction,_force,_damage){
	if (obj_player.invulnerable <= 0)
	{
		global.playerHealth = max(0, global.playerHealth - _damage);
		
		if global.playerHealth > 0
		{
			with obj_player
			{
				state = PlayerHurtState;
				direction = _direction - 180;
				moveDistance = _force/direction;
				flash = 0.7
				invulnerable = 60;  
				moveSpd = 1;
				stun = 30;
				//moveDir = -point_direction(obj_enemy_parent.x, obj_enemy_parent.y, obj_player.x, obj_player.y);
				//this last line is Not going to work Edit: i knew it!
	
			}
		}
		else
		{
			game_restart();
		}
	}

}