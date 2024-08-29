function move_direction() {
	if (ControleAcima()) {
		direcao=90;
	}
	if (ControleAbaixo()) {
		direcao=270;
	}
	if (ControleEsquerda()) {
		direcao=180;
	}
	if (ControleDireita()) {
		direcao=0;
	}
	return {
		x: ControleDireita() - ControleEsquerda(),
		y: ControleAbaixo() - ControleAcima()
	};
}

function stay_inside_room() {
	x = clamp(x, 0 + sprite_xoffset, room_width - sprite_xoffset);
	y = clamp(y, 0 + sprite_yoffset, room_height - sprite_yoffset);	
}
