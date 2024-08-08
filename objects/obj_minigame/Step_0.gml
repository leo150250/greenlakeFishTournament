//porcentagemFisgada=(sin(current_time/900)/2)+0.5; //DEBUG
//show_debug_message(porcentagemFisgada);

switch (etapaFisgada) {
	case 0: {
		raioMinigameBarraFoco=0.5;
	} break;
	case 1: {
		raioMinigameBarraFoco=1;
		if (naArea) {
			porcentagemFisgada+=0.002;
		} else {
			porcentagemFisgada-=0.003;
		}
	} break;
}

//DEBUG
if (keyboard_check_pressed(ord("E"))) {
	etapaFisgada=(etapaFisgada+1)%2;
}
if (keyboard_check(ord("R"))) {
	naArea=true;
} else {
	naArea=false;
}

#region Suavização da exibição
raioMinigameFX += (raioMinigameFoco - raioMinigame) / 6;
raioMinigame += (raioMinigameFX - raioMinigame) / 3;
raioMinigameBarraFX += (raioMinigameBarraFoco - raioMinigameBarra) / 8;
raioMinigameBarra += (raioMinigameBarraFX - raioMinigameBarra) / 16;
#endregion