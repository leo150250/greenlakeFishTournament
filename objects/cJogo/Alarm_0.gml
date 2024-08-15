tempoMinutos++;
if (tempoMinutos%10==0) {
	numerosFX[3]=(0+(tempoMinutos%10))*offsetNumeros;
	numerosFXSuave[3]=(0+(tempoMinutos%10))*offsetNumeros;
}
if (tempoMinutos>=60) {
	tempoMinutos-=60;
	tempoHoras++;
}
if (tempoHoras>=24) {
	tempoHoras-=24;
}	
if (tempoMinutos==0) {
	numerosFX[2]=(0+(tempoMinutos div 10))*offsetNumeros;
	numerosFXSuave[2]=(0+(tempoMinutos div 10))*offsetNumeros;
	if (tempoHoras%10==0) {
		numerosFX[1]=(0+(tempoHoras%10))*offsetNumeros;
		numerosFXSuave[1]=(0+(tempoHoras%10))*offsetNumeros;
	}
	if (tempoHoras==0) {
		numerosFX[0]=(0+(tempoHoras div 10))*offsetNumeros;
		numerosFXSuave[0]=(0+(tempoHoras div 10))*offsetNumeros;
	}
}
alarm[0]=60;