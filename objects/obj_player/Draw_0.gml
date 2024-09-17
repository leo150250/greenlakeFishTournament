draw_self();
if (estado==estadosJogador.carregandoIsca) {
	draw_sprite_ext(sprBarraMinigame,0,x-32,y-32,8,1,0,c_olive,1);
	draw_sprite_ext(sprBarraMinigame,0,x-32,y-32,(1-abs((frac(potenciaIsca)*2)-1))*8,1,0,c_lime,1);
}
if (estado==estadosJogador.lancandoIsca || estado==estadosJogador.aguardando) {
	draw_set_alpha(1);
	draw_set_color(c_red);
	draw_circle(iscaX,iscaY+iscaZ,3,false);
	var origemLinha={x:0,y:0};
	switch (sprite_index) {
		case sprJogadorF_pescandoBaixo:
		case sprJogadorM_pescandoBaixo: {
			origemLinha.x = 0;
			switch (image_index) {
				case 1: origemLinha.y = -42; break;
				case 2: origemLinha.y = 8; break;
			}
		} break;
		case sprJogadorF_pescandoCima:
		case sprJogadorM_pescandoCima: {
			origemLinha.x = 0;
			switch (image_index) {
				case 1: origemLinha.y = -56; break;
				case 2: origemLinha.y = -53; break;
			}
		} break;
		case sprJogadorF_pescandoLado:
		case sprJogadorM_pescandoLado: {
			origemLinha.x = 23 * image_xscale;
			switch (image_index) {
				case 1: origemLinha.y = -55; break;
				case 2: origemLinha.y = -42; break;
			}
		} break;
	}
	draw_set_color(c_white);
	draw_line(x+origemLinha.x,y+origemLinha.y,iscaX,iscaY+iscaZ);
}