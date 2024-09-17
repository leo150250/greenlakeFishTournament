global.musicaExecutando = -1;

function executarMusica(argMusica) {
	if (global.musicaExecutando!=-1) {
		audio_stop_sound(global.musicaExecutando);
	}
	global.musicaExecutando = audio_play_sound(argMusica,1,true);
	return global.musicaExecutando;
}
function executarSom(argSom,argLoop=false) {
	return audio_play_sound(argSom,0,argLoop,1,0,0.9+random(0.2));
}