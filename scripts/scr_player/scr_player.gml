function move_direction() {
	if (ControleEsquerda()) {
		direcao=180;
	} else if (ControleDireita()) {
		direcao=0;
	} else if (ControleAcima()) {
		direcao=90;
	} else if (ControleAbaixo()) {
		direcao=270;
	}
	return {
		x: ControleDireita() - ControleEsquerda(),
		y: ControleAbaixo() - ControleAcima(),
		speed: ControleDireita() + ControleEsquerda() + ControleAcima() + ControleAbaixo()
	};
}

function stay_inside_room() {
	x = clamp(x, 0 + sprite_xoffset, room_width - sprite_xoffset);
	y = clamp(y, 0 + sprite_yoffset, room_height - sprite_yoffset);	
}
