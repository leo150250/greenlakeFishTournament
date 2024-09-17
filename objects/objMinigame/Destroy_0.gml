if (etapaFisgada==-1) {
	cJogo.estado=estadosJogo.moverJogador;
	obj_player.estado=estadosJogador.normal;
} else if (etapaFisgada==2) {
	cJogo.estado=estadosJogo.resultadoPesca;
	cJogo.resultadoPeixeFXFoco=6;
	cJogo.rotacaoPeixe=720;
	cJogo.escalaPeixe=0;
	obj_player.estado=estadosJogador.aguardando;
}
if (!audio_is_playing(musOverworld)) {
	executarMusica(musOverworld);
}
audio_stop_sound(sndLoopAgua);