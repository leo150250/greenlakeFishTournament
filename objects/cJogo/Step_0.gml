numerosFXFoco[0]=(1+(tempoHoras div 10))*offsetNumeros;
numerosFXFoco[1]=(1+(tempoHoras%10))*offsetNumeros;
numerosFXFoco[2]=(1+(tempoMinutos div 10))*offsetNumeros;
numerosFXFoco[3]=(1+(tempoMinutos%10))*offsetNumeros;
for (var i = 0; i<4; i++) {
	numerosFXSuave[i] += (numerosFXFoco[i] - numerosFX[i]) / 2;
	numerosFX[i] += (numerosFXSuave[i] - numerosFX[i]) / 2;
}

//Debug
if (keyboard_check(vk_escape)) {
	game_end();
}