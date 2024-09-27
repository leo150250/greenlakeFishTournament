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
alarm[0]=1;
//show_debug_message(fx_get_parameter_names(layerFXDia));
show_debug_message(fx_get_parameters(layerFXDia));
corDia = make_color_hsv(tempoHoras*10,192,255);
fx_set_parameter(layerFXDia,"g_TintCol",[
	color_get_red(corDia)/255,
	color_get_green(corDia)/255,
	color_get_blue(corDia)/255,
	1,
	]);