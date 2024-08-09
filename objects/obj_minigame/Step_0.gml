//porcentagemFisgada=(sin(current_time/900)/2)+0.5; //DEBUG
//show_debug_message(porcentagemFisgada);

switch (etapaFisgada) {
	case 0: {
		raioMinigameBarraFoco=0.5;
		movSpeedX/=1.5;
		movSpeedY/=1.5;
		if (keyboard_check(vk_left)) { movSpeedX+=2; }
		if (keyboard_check(vk_right)) { movSpeedX-=2; }
		if (keyboard_check(vk_up)) { movSpeedY+=2; }
		if (keyboard_check(vk_down)) { movSpeedY-=2; }
	} break;
	case 1: {
		raioMinigameBarraFoco=1;
		movSpeedX/=1.05;
		movSpeedY/=1.05;
		if (keyboard_check(vk_left)) { movSpeedX+=0.25; }
		if (keyboard_check(vk_right)) { movSpeedX-=0.25; }
		if (keyboard_check(vk_up)) { movSpeedY+=0.25; }
		if (keyboard_check(vk_down)) { movSpeedY-=0.25; }
		if (naArea) {
			porcentagemFisgada+=0.002;
			if (porcentagemFisgada>=1) {
				porcentagemFisgada=1;
				etapaFisgada=2;
				raioMinigame=1.05;
				raioMinigameBarra=1.05;
			}
		} else {
			porcentagemFisgada-=0.003;
			if (porcentagemFisgada<=0) {
				etapaFisgada=-1;
				raioMinigame=0.975;
				raioMinigameBarra=0.975;
			}
		}
	} break;
	default: {
		movSpeedX/=2;
		movSpeedY/=2;
	} break;
}
posMinigameX+=movSpeedX;
posMinigameY+=movSpeedY;

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