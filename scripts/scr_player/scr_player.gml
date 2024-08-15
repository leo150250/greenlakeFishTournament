function move_direction() {
	return {
		x: ControleDireita() - ControleEsquerda(),
		y: ControleAbaixo() - ControleAcima()
	};
}

function stay_inside_room() {
	x = clamp(x, 0 + sprite_xoffset, room_width - sprite_xoffset);
	y = clamp(y, 0 + sprite_yoffset, room_height - sprite_yoffset);	
}
