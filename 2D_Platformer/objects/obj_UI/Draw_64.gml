//drawing Health

var _playerHealth = global.playerHealth;

var _playerHealthMax = global.playerHealthMax;

var _playerHealthFrac = frac(_playerHealth);

_playerHealth -= _playerHealthFrac;

for (var i = 1; i <= _playerHealthMax; i ++)
{
	var _imageIndex = (i > _playerHealth);
	if (i == _playerHealth + 1)
	{
		_imageIndex +=  (_playerHealthFrac > 0);
		
	}
	draw_sprite(spr_health, _imageIndex, 16 + ((i-1)* 32), 16);
}