if (etapaFisgada==-1) {
	cJogo.estado=estadosJogo.moverJogador;
	obj_player.estado=estadosJogador.normal;
} else if (etapaFisgada==2) {
	cJogo.estado=estadosJogo.resultadoPesca;
	cJogo.resultadoPeixeFXFoco=6;
	cJogo.rotacaoPeixe=720;
	cJogo.escalaPeixe=0;
}