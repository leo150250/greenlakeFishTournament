draw_self();
if (estado==estadosJogador.carregandoIsca) {
	draw_sprite_ext(sprBarraMinigame,0,x-32,y-32,8,1,0,c_olive,1);
	draw_sprite_ext(sprBarraMinigame,0,x-32,y-32,(1-abs((frac(potenciaIsca)*2)-1))*8,1,0,c_lime,1);
}
if (estado==estadosJogador.lancandoIsca || estado==estadosJogador.aguardando) {
	draw_set_alpha(1);
	draw_set_color(c_red);
	draw_circle(iscaX,iscaY+iscaZ,4,false);
}