/// @description player sprite

if (invulnerable != 0) && ((invulnerable mod 12 < 2) == 0) && (flash == 0) {
	//skip draw
	
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha);

}